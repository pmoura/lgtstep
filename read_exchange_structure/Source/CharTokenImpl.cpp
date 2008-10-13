/*
Copyright (C) 2006  Vincent Marchetti

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA

For author Vincent Marchetti: email vmarchetti@kshell.com
*/
/*
Copyright ©  2004 Vincent Marchetti All rights reserved

Purpose:
Implement the hidden (working) classes behind CharToken functionality

History:
9 Nov 2004: used as a functional compilable file in Token Parsing subproject

Documentation:

*/
#include "CharToken.h"


namespace KShellSTEP{



}	// close namespace

/* A compile time switch
Allow use of custom allocator
or standard new/delete
*/

#define CustomCharTokenImplAllocator 1


#if CustomCharTokenImplAllocator
/*
This code defines an allocator for the CharTokenImpl - derived instances;
LiteralTokenImpl, WordTokenImpl, and DelimiterTokenImpl.

The allocation is based on allocating space for multiple instances within a block, the
block being obtained from a standard ::new call. Memory space for an instance is encapsulated
within a "node", each node also contains a pointer to its own block, as well as a node *
for use in implementing linked lists.

Nodes are organized into two disjoint linked lists, a list of nodes in use (those containing
an instance) and a list of empty, not-in-use nodes.

For the list of unused nodes -- nodes are added and removed from the "head" of the list.
For the used nodes -- nodes are added at the "tail" of the list. When it is time to
search for a node to remove it from use, the search starts at the head. The idea is that
these instances tend to be created/removed in a first-in first-out fashion.
*/





namespace KShellSTEP{
namespace CharTokenAllocator{

void * AllocateCharTokenImpl();
void   DeAllocateCharTokenImpl(void *);

const unsigned int NodesPerBlock(32);

union CombinedUnion{	// for purposes of calculating size
	char a[sizeof(LiteralTokenImpl)];
	char b[sizeof(WordTokenImpl)];
	char c[sizeof(DelimiterTokenImpl)];
};

class AllocNode;
typedef AllocNode* AllocNodePtr;

class AllocBlock;

class AllocNode{
	public:
	char         buffer[sizeof(CombinedUnion)];
	AllocBlock * itsBlock;
	AllocNodePtr nextNode;
};



class AllocBlock{
	public:
	static unsigned int NumberOfBlocks;
	unsigned int NodesInUse;
	AllocNode   itsNodes[NodesPerBlock];
	public:
	AllocBlock();
	~AllocBlock();
};

unsigned int AllocBlock::NumberOfBlocks(0);

AllocBlock::AllocBlock():
	NodesInUse(0){
	++NumberOfBlocks;
	// link up each node to the next, the last node is linked to 0
	// also set the itsBlock member
	AllocNodePtr ix(itsNodes);
	for (unsigned int i = 0; i< (NodesPerBlock-1); ++i,++ix){
		ix->nextNode = ix+1;
		ix->itsBlock = this;
	}
	ix->nextNode = 0;
	ix->itsBlock = this;
};

AllocBlock::~AllocBlock(){
	--NumberOfBlocks;
	};
/*
	These pointers and ensuing routines define two linked-lists of nodes
	The UnusedNodeList is a standard linked lists, with insertions defined only at the
	beginning of the list
*/
AllocNodePtr UnusedNodeList(0);

inline void insertUnusedNode(AllocNodePtr& p){
	// p should point to the node you wish to insert
	assert( p != NULL);
	p->nextNode = UnusedNodeList;
	UnusedNodeList = p;
};

inline void removeUnusedNode(AllocNodePtr& p){
	// p is a reference to the preceding nodes 'nextNode' member or to unusedNodeList
	assert( p != NULL);
	p = p->nextNode;
};

/*
	The UsedNodeList is a linked list with the extra feature of an
	additional pointer to the "last" node of the list, for efficiency in
	dealing with instances that tend to be allocated in a FIFO pattern
*/
AllocNodePtr UsedNodeList(0);
AllocNodePtr EndUsedNodeList(0);

inline void insertUsedNode(AllocNodePtr& p){
	// p points to the node to insert
	// all nodes get inserted at head of list
	assert( p != 0);
	if (UsedNodeList == 0){
		assert(EndUsedNodeList == 0);	// consistency check
		EndUsedNodeList = p;			// this is the new "end of list"
	}
	p->nextNode = UsedNodeList;
	UsedNodeList = p;
}

/* Because of the need to maintain the EndUsedNodeList pointer, the
removal procedure must be broken into two cases: removal from head, and removal from
with the list
*/
inline void removeUsedNodeFromHead(){
	assert(UsedNodeList != 0);
	assert(EndUsedNodeList != 0);
	if (EndUsedNodeList == UsedNodeList)	// i.e. there is only one node, and it is removed
		EndUsedNodeList = 0;

	UsedNodeList = UsedNodeList -> nextNode;
}

inline void removeUsedNode(AllocNodePtr& p){
	// p must point to the preceding node (NOT to the preceding nodes nextNode member,
	// as is the case in the analogous removal from UnusedNodeList
	assert( p != 0);
	assert( p->nextNode != 0);

	// maintain the "End" pointer
	if (EndUsedNodeList == p->nextNode){
		assert( (p->nextNode)->nextNode == 0);	// consistency check
		EndUsedNodeList = p;
	}

	p->nextNode = (p->nextNode)->nextNode;
};


inline void addBlock(){
	assert(UnusedNodeList == 0);
	AllocBlock * newBlock = new AllocBlock();
	UnusedNodeList = newBlock -> itsNodes;
};


inline void removeBlock(AllocBlock * ab){
	assert(ab != NULL);
	assert(ab -> NodesInUse == 0);
	assert(UnusedNodeList != 0);

	// go through the unused nodes and remove any that are in this block
	AllocNodePtr * iix = &UnusedNodeList;

	while (*iix != 0){
		if ( (*iix)->itsBlock == ab)
			removeUnusedNode(*iix);
		else
			iix = &( (*iix)->nextNode);
	}

	//deallocate
	delete ab;
};


inline int countNodes(AllocNodePtr p){
	int retVal(0);
	while (p != 0){
		++retVal;
		p= p->nextNode;
	}
	return retVal;
}

#if TokenDebugging
inline int checkCount(){
	// triggers an assertion if failed
	long countInUse = countNodes(UsedNodeList);
	long countNotInUse = countNodes(UnusedNodeList);
	long countBlocks   = AllocBlock::NumberOfBlocks;
	return (countInUse+countNotInUse) == countBlocks * NodesPerBlock;
}
#else
inline int checkCount(){return 1;}
#endif

void * AllocateCharTokenImpl(){
	if (UnusedNodeList == 0)
		addBlock();
	assert(UnusedNodeList != 0);

	void * retVal = (void *) (UnusedNodeList -> buffer);
	AllocNodePtr theNode = UnusedNodeList;
	removeUnusedNode(UnusedNodeList);
	insertUsedNode(theNode);
	++(theNode->itsBlock->NodesInUse);

	assert(checkCount());	// checkCount does nothing unless TokenDebugging macro is set

	return retVal;
};

void   DeAllocateCharTokenImpl(void *p){
	// search through list
	AllocNodePtr theNode(0);
	if (UsedNodeList->buffer == p){
		theNode = UsedNodeList;
		removeUsedNodeFromHead();
	}
	else{
		AllocNodePtr ix = UsedNodeList;
		while (ix->nextNode != NULL){
			if (ix->nextNode->buffer == p){
				theNode = ix->nextNode;
				removeUsedNode(ix);
				break;
			}
			else
				ix = ix->nextNode;
		}
	}
	assert(theNode != 0);
	insertUnusedNode(theNode);

	if ( (--(theNode->itsBlock->NodesInUse)) == 0 && AllocBlock::NumberOfBlocks > 1)
		removeBlock(theNode->itsBlock);


	assert(checkCount());	// checkCount does nothing unless TokenDebugging macro is set

}



}		  // close CharTokenImpl namespace

using CharTokenAllocator::AllocateCharTokenImpl;
using CharTokenAllocator::DeAllocateCharTokenImpl;



void * 	LiteralTokenImpl::operator new(std::size_t){
	return AllocateCharTokenImpl();
}

void    LiteralTokenImpl::operator delete(void *p){
	DeAllocateCharTokenImpl(p);
}


void    WordTokenImpl::operator delete(void *p){
	DeAllocateCharTokenImpl(p);
}

void * 	WordTokenImpl::operator new(std::size_t){
	return AllocateCharTokenImpl();
}

void    DelimiterTokenImpl::operator delete(void *p){
	DeAllocateCharTokenImpl(p);
}

void * 	DelimiterTokenImpl::operator new(std::size_t){
	return AllocateCharTokenImpl();
}




}		  // close KShellSTEP namespace

#else
namespace KShellSTEP{

void * 	LiteralTokenImpl::operator new(std::size_t sz){
	return ::operator new(sz);
}

void    LiteralTokenImpl::operator delete(void *p){
	return ::operator delete(p);
}

}	// close namespace

#endif

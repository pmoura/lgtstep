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
implemements the CharTokenList istream-like container of CharTokens

History:
9 Nov 2004: used as a functional compilable file in Token Parsing subproject

Documentation:
Implementation of the CharTokenList container.
-
Assertions and invariants:
1. The nodes (CharTokenNode) form a linked, circular list
2. CharTokenList maintains head and tail pointers, both of which point to
valid nodes containing CharToken data. Advancing from head to tail goes through CharTokens
in the same order in which they are read.
3. TokenIterators point to nodes. The nodes maintain a count of how many iterators point to
them. There is always at least one iterator pointing to head
-
The macro TokenDebugging, if set, invokes a functions which counts the number
of used and unused nodes; it should be set in a prefix file

*/
#include "CharTokenList.h"






namespace KShellSTEP{

// an element of a linked list, declared here to allow inlining below of iterator basic funcs
class CharTokenNode{
	private:
	mutable unsigned int _RefCount;

	public:
	CharTokenNode* nextNode;
	CharToken value;

	CharTokenNode():_RefCount(0){};
	void 									addReference() 		const{++ _RefCount;}
	unsigned int  				removeReference() const{ return -- _RefCount;}
	const unsigned int&   RefCount() 				const{return _RefCount;}
};



class CharTokenListPrivate{
	private:
	static const unsigned int NodesPerBlock;

	private:
	vector<CharTokenNode*>	itsBlocks;		// is actually a list of arrays
	CharTokenNode* _tail;		// points to the last  (latest)   node which has been read
	CharTokenNode* _head;		// points to the first (earliest) node which is referenced

	InputSource<CharToken>& itsSource;

	public:
	CharTokenListPrivate(InputSource<CharToken>&);
	~CharTokenListPrivate();

	CharTokenNode* initialize();
	void advance_head();	// this function removes unreferenced nodes
	CharTokenNode* make_new_block();
	void advance_tail();	// this function adds a new node and token at the tail

	CharTokenNode* head(){return _head;}
	CharTokenNode* tail(){return _tail;}


	private:
	// allocation/deallocation routines
	CharTokenNode* 	  allocate_blocks();
	void						deallocate_blocks(CharTokenNode*);

	// private debuggging functions
	int UsedNodesCount();
	int UnusedNodesCount();

	public:
	#if TokenDebugging
	int checkNodeCount();
	#else
	int checkNodeCount(){return 1;}
	#endif


};


CharTokenList::CharTokenList(InputSource<CharToken>& src):
	itsPrivatePtr(new CharTokenListPrivate(src)){};


CharTokenList::~CharTokenList(){};			// auto ptr on private implementation will delete

CharTokenListIterator
CharTokenList::begin(){
	return 	CharTokenListIterator(
		itsPrivatePtr->initialize(),
		itsPrivatePtr.get());
}

CharTokenListIterator
CharTokenList::end(){
	return 	CharTokenListIterator(
		NULL,
		itsPrivatePtr.get());
}


#pragma mark -
/************************************
CharTokenList implementation
************************************/

const unsigned int CharTokenListPrivate::NodesPerBlock(32);

CharTokenListPrivate::CharTokenListPrivate(InputSource<CharToken>& a):
        _tail(NULL),
	_head(NULL),
        itsSource(a)
{
};

CharTokenListPrivate::~CharTokenListPrivate(){
	vector<CharTokenNode*>::iterator ip = itsBlocks.begin();
	for (; ip != itsBlocks.end(); ++ip)
		deallocate_blocks(*ip);
}

CharTokenNode*
CharTokenListPrivate::initialize(){
	// check, we're only allowed to do this once
	assert(_tail == NULL);
	assert(_head == NULL);

	if (_tail || _head)
		throw std::logic_error("re initializing a CharTokenList");

	CharToken tmp;
	if (!itsSource.getOne(tmp))
		return NULL;

	_head = make_new_block();
	_tail = _head;
	_head->value = tmp;

	assert(checkNodeCount());
	return _head;
};

void
CharTokenListPrivate::advance_head(){
	// advance the _head pointer until reach a node that has a non-zero RefCount.
	// If the tail is reached, and it has no RefCount, then no iterators are present
	// and the list can be deleted
	while (_head->RefCount() == 0){
		_head->value = CharToken();
		if (_head == _tail){
			break;
		}
		_head = _head->nextNode;
	}
};

CharTokenNode*
CharTokenListPrivate::make_new_block(){
	// makes a new block, initialized the contained nodes pointers (note, links back
	// of block to the front;
	// on successful make, add the address to the itsBlocks vector, and return the
	// 0th node pointer
		CharTokenNode * retVal = allocate_blocks();
		assert(retVal != 0);

		itsBlocks.push_back(retVal);

		CharTokenNode * ix   (retVal);
		CharTokenNode * iend (retVal+NodesPerBlock-1);
		for (; ix != iend; ++ix)
			ix->nextNode = ix+1;
		ix->nextNode = retVal;

		return retVal;
}

void
CharTokenListPrivate::advance_tail(){
	CharToken tmp;
	if (itsSource.getOne(tmp)){
		// move the tail pointer forward, reading in new values as go along
		if (_tail->nextNode == _head){
			CharTokenNode * newBlock(make_new_block());

			// and insert it into the list
			(newBlock+NodesPerBlock-1)->nextNode = _head;
			_tail->nextNode = newBlock;
		}
		_tail = _tail->nextNode;
		_tail -> value = tmp;
	}

	assert(checkNodeCount());
};

// allocation routines
CharTokenNode*
CharTokenListPrivate::allocate_blocks(){
	return new CharTokenNode[NodesPerBlock];
};

void
CharTokenListPrivate::deallocate_blocks(CharTokenNode *p){
	assert(p != NULL);
	delete[] p;
};



// debugging functions
int
CharTokenListPrivate::UsedNodesCount(){
	CharTokenNode*  j(_head);
	int retVal(1);
	while (j != _tail){
		++retVal;
		j=j->nextNode;
	}
	return retVal;
};

int CharTokenListPrivate::UnusedNodesCount(){
	CharTokenNode* j(_tail->nextNode);
	int retVal(0);
	while (j != _head){
		++retVal;
		j=j->nextNode;
	}
	return retVal;
};

#if TokenDebugging
int CharTokenListPrivate::checkNodeCount(){
	int inUse(UsedNodesCount());
	int not_inUse(UnusedNodesCount());
	long nodes_allocated = itsBlocks.size() * NodesPerBlock;
	return (inUse + not_inUse == nodes_allocated);
};
#endif


#pragma mark -
/*************************************
CharTokenListIterator implementation
**************************************/

CharTokenListIterator::CharTokenListIterator(CharTokenNode* np, CharTokenListPrivate* cp):
		myPtr(np),
		myList(cp){
		if (myPtr) myPtr->addReference();
};

CharTokenListIterator::CharTokenListIterator(const CharTokenListIterator& a):
		myPtr (a.myPtr),
		myList(a.myList){
			if (myPtr) myPtr->addReference();
};

CharTokenListIterator::~CharTokenListIterator(){
	assert( myPtr==0 || myPtr->RefCount()>0);
	if (myPtr){
		myPtr->removeReference();
		myList->advance_head();
	}
};

CharTokenListIterator& CharTokenListIterator::operator = (const CharTokenListIterator& a){
	assert( a.myPtr==0 || a.myPtr->RefCount()>0);
	assert( myPtr==0   || myPtr->RefCount()>0);

	if (a.myPtr != myPtr){
		if (a.myPtr) a.myPtr->addReference();
		if (myPtr){
			myPtr->removeReference();
			myList->advance_head();
		}
		myList = a.myList;
		myPtr = a.myPtr;
	}
	return *this;
}

CharToken& CharTokenListIterator::operator*(){
	//assert(myPtr != 0);
	assert(myPtr->value != CharToken());

	if (myPtr == 0) throw std::logic_error("invalid CharTokenListIterator");
	return myPtr->value;
}

CharToken* CharTokenListIterator::operator->(){
	//assert(myPtr != 0);
	assert(myPtr->value != CharToken());

	if (myPtr == 0) throw std::logic_error("invalid CharTokenListIterator");
	return &(myPtr->value);
}


CharTokenListIterator& CharTokenListIterator::operator++(){
	//assert(myPtr != 0);
	assert(myList!= 0);
	assert(myPtr->RefCount() > 0);

	if (!myPtr) throw std::logic_error("invalid CharTokenListIterator");
	// first, read forward if necessary
	if (myPtr == myList->tail())
		myList->advance_tail();

	CharTokenNode * tmp = myPtr;
	if (myPtr == myList->tail()){
			myPtr=0;
	}
	else{
		myPtr = myPtr->nextNode;
		myPtr ->addReference();
	}

	tmp->removeReference();
	myList->advance_head();
	return *this;
	assert(myList->checkNodeCount());
}








}		// close namespace


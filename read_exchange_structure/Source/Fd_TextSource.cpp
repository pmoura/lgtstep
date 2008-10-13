#include "TextSource.h"

#include <boost/iostreams/operations.hpp> 
#include <boost/iostreams/filter/newline.hpp>
#include <boost/iostreams/device/file_descriptor.hpp>
#include <boost/iostreams/filtering_stream.hpp>

namespace KShellSTEP{

int 
open_file_descriptor(const char* fp){
  int input_fd = open(fp, O_RDONLY, 0);
  if (input_fd == -1){
    string err("open_file_descriptor: unable to open file ");
    err += string(fp);
    throw logic_error(err);
  }
  return input_fd;
}

class Fd_TextSource: public TextSource{
    private:
    boost::iostreams::filtering_istream src;
    
    PositionType pos;
    public:
    Fd_TextSource(int fd):pos(0){
        src.push( boost::iostreams::newline_filter(boost::iostreams::newline::posix) );
        src.push( boost::iostreams::file_descriptor_source(fd, false) );
    };
    
    PositionType getPosition() const {return pos;}
    
    bool getOne(char& c){
        int res = boost::iostreams::get(src);
        c= (char) res;
        return  res != EOF;
    }
};
    
auto_ptr<TextSource> 
makeFileDescriptorTextSource(int fd){
    auto_ptr<Fd_TextSource> tmp(
        new Fd_TextSource(fd)
    );
    return auto_ptr<TextSource>(tmp);
}
    
    
}
require 'socket'
ip = Socket::getaddrinfo(Socket.gethostname,"echo",Socket::AF_INET)[1][3]
puts ip

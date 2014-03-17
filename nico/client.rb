require 'socket'      # Sockets are in standard library

hostname = '192.168.1.107'
port = 28561

puts 'Conectando...'
s = TCPSocket.open(hostname, port)
puts 'Conexion establecida.'

loop {
th = Thread.new do
  message = ''
  while message != 'exit'
    message = s.gets
    puts "Server: #{message}"
  end
end
}
puts 'end'

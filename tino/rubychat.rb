require 'socket'      # Sockets are in standard library
puts 'local?'
self_connect=gets.chomp
if self_connect=='no' then
  other_hostname = '192.168.1.100'
  other_port = 28561
  my_hostname = "192.168.1.116"
  my_port = 28561
else 
  other_hostname = '192.168.1.116'
  other_port = 28561
  my_hostname = "192.168.1.116"
  my_port = 28561
end


th_client = Thread.new do
  ##contra quien nos vamos a conectar
  puts 'Conectando...'
  s = TCPSocket.open(other_hostname, other_port)
  puts 'Conexion establecida.'

  message = ''
  while message != 'exit'
    message = s.gets
    puts "#{message}"
  end
  puts 'cliente terminado' 
end


th_server = Thread.new do
  ##nuestro server
  server = TCPServer.new(my_hostname, my_port)
  puts 'Esperando conexion...'
  client = server.accept
  puts 'Conectado. Escribi tu mensaje y apreta enter.'
  puts 'Roberto::'
  message = gets.chomp
  while message != 'exit' 
    client.puts "Roberto:: #{message}"
    message = gets.chomp
  end
  client.puts 'servidor terminado'
  client.close
  
end


th_client.join
th_server.join

puts 'la disfrutaste toda'
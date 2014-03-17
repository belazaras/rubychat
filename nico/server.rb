require 'socket'


server = TCPServer.new("192.168.1.100", 28561)

puts 'Esperando conexion...'
client = server.accept
puts 'Conectado. Escribi tu mensaje y apreta enter.'

message = gets.chomp
while message != 'exit'   
  client.puts(message)
  message = gets.chomp
end

client.puts "terminated"
client.close
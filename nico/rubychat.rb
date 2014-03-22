require 'socket'

def get_data
  info = {}

  puts 'Enter your name:'
  print 'Name: '
  info['name'] = gets.chomp

  puts 'Your IP address:'
  print 'IP: '
  temp = gets.chomp 
  info['my_ip'] = temp != '' ? temp : '192.168.1.3' # Default values...

  puts 'Client IP address:'
  print 'IP: '
  temp = gets.chomp 
  info['client_ip'] = temp != '' ? temp : '192.168.1.4' # Default values...

  puts 'TCP port:'
  print 'Port: '
  temp = gets.chomp 
  info['port'] = temp != '' ? temp : '7777' # Default values...

  info
end

data = get_data()

th_ser = Thread.new {server(data)}
th_cli = Thread.new {client(data)}

def server(data)
  server = TCPServer.new(data['my_ip'], data['port'])
  puts 'Esperando conexion...'
  client = server.accept
  puts 'Conectado. Escribi tu mensaje y apreta enter.'
  message = gets.chomp
  while message != 'exit'   
    client.puts("#{data['name']}: #{message}")
    print 'Mensaje: '
    message = gets.chomp
  end

  client.puts "terminated"
  client.close
end

def client(data)
  puts 'Conectando...'
  s = TCPSocket.open(data['client_ip'], data['port'])
  puts 'Conexion establecida.'

  loop {
    message = ''
    while message != 'exit'
      message = s.gets
      #system "clear" or system "cls"
      #print "#{message} \r";
      puts "#{message}"
    end
  }
  puts 'end'
end

th_ser.join
th_cli.join

require 'socket'

def get_data
  arr = {}

  puts 'Ingrese su nombre:'
  print 'Nombre: '
  arr['name'] = gets.chomp

  puts 'Ingrese su ip:'
  print 'IP: '
  temp = gets.chomp 
  arr['my_ip'] = temp != '' ? temp : '192.168.1.100'

  puts 'Ingrese el ip del cliente:'
  print 'IP: '
  temp = gets.chomp 
  arr['client_ip'] = temp != '' ? temp : '192.168.1.116'

  puts 'Ingrese puerto de conexion:'
  print 'Port: '
  temp = gets.chomp 
  arr['port'] = temp != '' ? temp : '28561'

  arr
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

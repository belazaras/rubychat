require 'socket'
ips = Socket::getaddrinfo(Socket.gethostname,"echo",Socket::AF_INET)

puts 'Choose one interface from below:'
ips.each_with_index do |one, index|
	puts "(#{index+1}) #{one[3]}"
end

print "Option: "
option = gets.chomp
num_option = option.to_i - 1 # Of course, this input needs
# to be validated against a valid position in the array.

chosen_ip = ips[num_option][3]
puts chosen_ip
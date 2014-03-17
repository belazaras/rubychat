i = 1
threads = []

5.times do |i| 
  threads[i] = Thread.new {
    #sleep(rand(0)/10.0)
    puts i
  }
  i += 1   
end

threads.each {|t| t.join}
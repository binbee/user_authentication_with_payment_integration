class Sorting
def self.array
list=ARGV[0]
puts"==========#{list}"
return list if list.size == 1
a1=true
  while a1 do
    a1=false
    0.upto(list.size-2).each do |i|
      if list[i] > list[i+1]
         list[i],list[i+1] = list[i+1],list[i]
         a1=true
      end
    end
  end
end
end

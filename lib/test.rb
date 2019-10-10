def removefirstchar(string)
  array = []
  string.split(//).each do |char|
    array << char
  end
  array.delete_at(0)
  array.join
end





def remove(array)
  array.each do |mot|
    newarray = []
    mot.split(//).each do |char|
      newarray << char
    end
    newarray.delete_at(0)
    newarray.join
  end
end

def perform
array = ["hello", "bonjour"]
puts remove(array)
end

perform
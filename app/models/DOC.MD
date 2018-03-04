1. what is difference between each and map 

each simply iterates over the given enumerable, running the block for each value. It discards the return value of the block, and each simply returns the original object it was called on:

[1, 2, 3].each do |i|
  i + 1
end  # => [1, 2, 3]
This is simply a nicer, more universal way of doing a traditional iterating for loop, and each is much preferred over for loops in Ruby (in fact, I don't think I've ever used a for loop in Ruby).

map, however, iterates over each element, using the return value of the block to populate a new array at each respective index and return that new array:

[1, 2, 3].map do |i|
  i + 1
end  # => [2, 3, 4]
So it "maps" each element to a new one using the block given, hence the name "map". Note that neither each nor map themselves modify the original collection.

2. what is difference between symboll and string in rails


The main difference is that multiple symbols representing a single value are identical whereas this is not true with strings. For example:

irb(main):007:0> :test.object_id
=> 83618
irb(main):008:0> :test.object_id
=> 83618
irb(main):009:0> :test.object_id
=> 83618
3 references to the symbol :test, all the same object.

irb(main):010:0> "test".object_id
=> -605770378
irb(main):011:0> "test".object_id
=> -605779298
irb(main):012:0> "test".object_id
=> -605784948
3 references to the string "test", all different objects.

This means that using symbols can potentially save a good bit of memory depending on the application. It is also faster to compare symbols for equality since they are the same object, comparing identical strings is much slower since the string values need to be compared instead of just the object ids.

As far as when to use which, I usually use strings for almost everything except things like hash keys where I really want a unique identifier, not a string.

3.how to Delete a branch from server

ans: git push origin :developement(which branch you want to delete)


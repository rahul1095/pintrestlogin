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




what is module 


Modules are a way of grouping together methods, classes, and constants. Modules give you two major benefits.

Modules provide a namespace and prevent name clashes.

Modules implement the mixin facility.

Modules define a namespace, a sandbox in which your methods and constants can play without having to worry about being stepped on by other methods and constants.

example:  

Consider the following module written in support.rb file.

module Week
   FIRST_DAY = "Sunday"
   def Week.weeks_in_month
      puts "You have four weeks in a month"
   end
   def Week.weeks_in_year
      puts "You have 52 weeks in a year"
   end
end
Now, you can include this module in a class as follows −

#!/usr/bin/ruby
$LOAD_PATH << '.'
require "support"

class Decade
include Week
   no_of_yrs = 10
   def no_of_months
      puts Week::FIRST_DAY
      number = 10*12
      puts number
   end
end
d1 = Decade.new
puts Week::FIRST_DAY
Week.weeks_in_month
Week.weeks_in_year
d1.no_of_months
This will produce the following result −

Sunday
You have four weeks in a month
You have 52 weeks in a year
Sunday
120

question: what is mixin how to use it

Before going through this section, we assume you have the knowledge of Object Oriented Concepts.

When a class can inherit features from more than one parent class, the class is supposed to show multiple inheritance.

Ruby does not support multiple inheritance directly but Ruby Modules have another wonderful use. At a stroke, they pretty much eliminate the need for multiple inheritance, providing a facility called a mixin.

Mixins give you a wonderfully controlled way of adding functionality to classes. However, their true power comes out when the code in the mixin starts to interact with code in the class that uses it.

Let us examine the following sample code to gain an understand of mixin −

module A
   def a1
   end
   def a2
   end
end
module B
   def b1
   end
   def b2
   end
end

class Sample
include A
include B
   def s1
   end
end

samp = Sample.new
samp.a1
samp.a2
samp.b1
samp.b2
samp.s1


question: differenc between Procs and lambdas in rails

ans:

1.Lambdas check the number of arguments, while procs do not

lam = lambda { |x| puts x }    # creates a lambda that takes 1 argument
lam.call(2)                    # prints out 2
lam.call                       # ArgumentError: wrong number of arguments (0 for 1)
lam.call(1,2,3)                # ArgumentError: wrong number of arguments (3 for 1)
In contrast, procs don’t care if they are passed the wrong number of arguments.


proc = Proc.new { |x| puts x } # creates a proc that takes 1 argument
proc.call(2)                   # prints out 2
proc.call                      # returns nil
proc.call(1,2,3)               # prints out 1 and forgets about the extra arguments


2. Lambdas and procs treat the ‘return’ keyword differently

return’ inside of a lambda triggers the code right outside of the lambda code

def lambda_test
  lam = lambda { return }
  lam.call
  puts "Hello world"
end

lambda_test                 # calling lambda_test prints 'Hello World'
‘return’ inside of a proc triggers the code outside of the method where the proc is being executed

def proc_test
  proc = Proc.new { return }
  proc.call
  puts "Hello world"
end

proc_test                 # calling proc_test prints nothing






Difference between destroy and delete in rails

Basically destroy runs any callbacks on the model while delete doesn't.

From the Rails API:

ActiveRecord::Persistance.delete
Deletes the record in the database and freezes this instance to reflect that no changes should be made (since they can't be persisted). Returns the frozen instance.

The row is simply removed with an SQL DELETE statement on the record's primary key, and no callbacks are executed.

To enforce the object's before_destroy and after_destroy callbacks or any :dependent association options, use #destroy.
ActiveRecord::Persistance.destroy
Deletes the record in the database and freezes this instance to reflect that no changes should be made (since they can't be persisted).

There's a series of callbacks associated with destroy. If the before_destroy callback return false the action is cancelled and destroy returns false. See ActiveRecord::Callbacks for further details.
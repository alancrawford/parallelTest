

# to be run on all nodes
using Distributed, LinearAlgebra, Statistics

function sayhello()
   println("hi I am worker number $(myid()), I live on $(gethostname())")
end

function domath(i::Integer)
	if i < 2
		error("need i>2")
	end
	println("Hi, I am worker number $(myid()) doing some math")
	x = rand(i,i)
	mean(x)
end

function doBIGmath(n=30000,m=10000)
	println("allocating a $n by $m matrix ")
	x = rand(n,m);
	r = round.(sizeof(x) /  1.074e+9 , digits=2)
	println("my matrix has $r GB")
	mean(x)
end


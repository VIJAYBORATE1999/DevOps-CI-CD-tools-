



<pre>
cASE 1) when your Redis in default VPC (Public Subnet )

USer request <--> INternert gateway <--> redis
<img src="Approach 1.png">

  
</pre>

<pre>
CAse 2) When your Redis in  VPC (Private Subnet) 

Incoming Req : 

USer request --> INternert gateway --> BAstian Host --> REdis 

OUtgoing request :

Redis --> NAT gateway --> INternet gateway --> User 

  <img src="Approach 2.png">
</pre>
  
<pre>
Internet Gateway enables resources (like EC2 instances) in public subnets to connect to the internet.
Similarly, resources on the internet can initiate a connection to resources in your subnet using the public.
If a VPC does not have an Internet Gateway, then the resources in the VPC cannot be accessed from the Internet. 
For a vpc we have single iNTERNET GATEWAY .
</pre>

<pre>
NAT Gateway does something similar to Internet Gateway (IGW), but it only works one way: Instances in a private 
  subnet can connect to services outside your VPC but external services cannot initiate a connection with those
  instances. NAT gatway is creaed in availability zones
</pre>

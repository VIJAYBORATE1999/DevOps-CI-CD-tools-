
<pre>
<h1>VIRTUAL PRIVATE CLOUD (VPC)</h1>
Devops ENGINEER  CREATRE A VPC TO ALLOCATE SPECIFIC IP ADDRESS RANGE TO OUR PROJECTS
FOR SECURITY PURPOSES. So FOR VPC size - AWS asks for IP Address Ranges.

 Now you big projects may have subprojects (Dev ,Test,Other etc): so we will split 
 ip address ranges again called – Subnets.The subnets can be public and private.

 Devops ENGINER WILL CREATE A GATEWAY .As without gateway we wont be able to
 access the VPC. 

 In VPC we have free space (cOMMON SUBNET )called Public Subnet . And internet gateway 
provide access to it .

As we create VPC , By Deafult aws creates
 
    • <B>INTERNET Gateway </B>: An internet gateway is created and attached to the VPC. This allows 
      instances in the default public subnet to communicate with the internet(Outgoing Requests) and 
      allows incoming request to VPC into Public subnet via internet. 
      
    • <B>NACL (Network Access Control List )</B>with default configuration provides security a subnet level 
 
    • <B>Route Table </B>:A main route table is created for the VPC, and all subnets are 
      associated with this route table by default. 
 
    • <B>Default Security Group</B>: A default security group is created and associated with the VPC. 
      This security group allows all outbound traffic and denies all inbound traffic by default. 
 
    • <B>Network ACL (Access Control List)</B>: A default network ACL is created and associated 
      with the VPC. This ACL allows all inbound and outbound traffic by default. 
 
    • <B>Default Subnet </B>: One default subnet is created in each Availability Zone within the VPC.
      These subnets are public by default
    
    <h4></h4>
</pre>



<pre>
<h1></h1>
    <h4></h4>
</pre>



<pre>
<h1></h1>
    <h4></h4>
</pre>

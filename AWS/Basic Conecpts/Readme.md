<pre> 
<h1>Concept of Users </h1> 
    • Root (Have all persmisson) It has complete administrative access to all AWS services and resources 
      within the account. 
    • IAM(have custom permissions )are separate identities with customizable permissions within an AWS 
      account using IAM policies.IAM users can be granted permissions that allow them to perform some
      actions that are typically associated with the root account, but they do not inherently have the
      same level of control and access as the root account.IAM users cannot access certain sensitive 
      account information or perform actions that are exclusive to the root account.
</pre>


<pre> 
<h1>Concept of Group</h1>  
So we will just create a group and then latter we Can add n no of users to group . As adding policies to users 
is time taking . Also adding users to particluar groups make the provcess fast and organized manner.

 suppose we have Groups such as 
    • Develpoers 
    • Testers 
    • Others 

Then we will attach  Policies (pi)into each group 
    • Develpoers   - p1 , p2, p3 
    • Testers  - p4 , p5 , p6
    • Others – p7 

Then Suppose if we add any user in the Develpoers group then User will by deafult have P1, p2 p3 Policies added to it . Thus Now Process has become organized and reduced manual efffort.
 
    • Note ) We dont create all this things From root user . For this we have IAM user account for Devops , developers, testers , etc .   And only Devops  have right to this services  such as creating user , deleting user etc .
    
</pre>

<pre>

<h1>Concept of Roles</h1>  
   
Roles : used for services running outside AWS/ Interacting with AWS aacounts.
Such as JENKINS , TERAFORM .
Roles are used to provide permissions to both users and services.
groups are specifically used for providing permissions to users within the AWS environment.
groups in AWS are primarily used for managing permissions collectively for multiple users. 
These users can inherit the permissions associated with the group. 
Groups make it easier to manage permissions for a set of users who share the same job function
or require similar access permissions.
</pre>




    <pre> </pre>
    <pre> </pre>
    



    

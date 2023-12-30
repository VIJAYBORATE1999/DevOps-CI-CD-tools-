s<pre> 
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

Groups are specifically used for providing permissions to users within the AWS environment.

Groups in AWS are primarily used for managing permissions collectively for multiple users. 
These users can inherit the permissions associated with the group. 
Groups make it easier to manage permissions for a set of users who share the same job function
or require similar access permissions.
</pre>









    <pre> 
    
<H1> Summary of IAM – Roles , Users and all componets </H1> 

1) **Users:**
   - **Root:** Has all permissions by default.
   - **IAM User:** Custom permissions can be assigned individually.Permanent access unless credentials are revoked or rotated.

2) **IAM Policy:** IAM policies in AWS are entity-specific, defining permissions for AWS identities such as users, groups, and roles.
   - Can be attached:
      - Individually to an IAM User.
      - To an IAM Group.
      - To Role

3) **IAM Role:**
   - Used to provide permissions to both IAM users and services.Temporary access with a specified duration.
   - Used for services running outside AWS or interacting with AWS accounts (e.g., Jenkins, Terraform).
   - Roles are assumed by entities to obtain temporary security credentials.

4) **Group:**
   - Contains one or more IAM policies.
   - IAM users can be added to groups.
   - Groups are specifically used for providing permissions to users within the AWS environment.
   - Users in a group inherit the permissions associated with that group.
   - Useful for managing permissions collectively for multiple users.

In AWS, an IAM Role: (Identity and Access Management) is entity-specific, not application-specific.IAM roles are a way to grant temporary permissions to entities which are inside in  AWS, and they are not directly tied to a specific application.IAM roles are typically assumed by AWS services, EC2 instances, Lambda functions,IAM users, or other entities to obtain temporary security credentials for accessing AWS resources. example ) ExternalDNS talking to Route 53, an IAM role would be created to provide ExternalDNS with the necessary permissions to update Route 53 DNS records.  EX)Amazon EKS -Use AWS IAM roles 

IN AWS , IAM User: are often application-specific or tied to specific individuals.It represents a person or an application that requires long-term(Access Key ID and Secret Access Key).For outside applications or services that are not running on AWS infrastructure, the typical way to interact with AWS resources securely is : Create an IAM user with the necessary permissions by Attaching  IAM policies or IAM Role or Group permission . EX) create a specific/dedicated IAM user with the necessary permissions to interact with AWS services.

In summary, IAM Users can have custom permissions, IAM Policies define those permissions, Roles are for users and services, and Groups provide a way to collectively manage permissions for multiple users within the AWS environment.
    
</pre> 




    


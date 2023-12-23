Aim : Create a ASP.NET Core MVC project & DEploy on docker.Also make a custom html css page to view it on docker .


******************************Part 1 Deploying Locally  ***********************************************************

sudo apt update
sudo apt install snapd

sudo snap install dotnet-sdk --classic
sudo snap install core


*)dotnet new mvc -n MyWebsite
dotnet new mvc -n <Project-Name>
This will create following structure --> 
MyWebsite/
|-- Controllers/
|   |-- HomeController.cs
|
|-- Views/
|   |-- Home/
|       |-- Index.cshtml
|       |-- About.cshtml
|       |-- Contact.cshtml
|
|-- Models/
|
|-- wwwroot/
|   |-- css/
|   |   |-- site.css
|   |
|   |-- js/
|   |   |-- site.js
|   |
|   |-- lib/
|       |-- (various third-party libraries)
|
|-- appsettings.json
|-- Program.cs
|-- Startup.cs
|-- MyWebsite.csproj
|-- launchSettings.json

Aim : make a custom page so we will need to create - controller and view
*) go to MyWebsite  Folder --> Controllers 
we will make Page - Custom so add this code


public IActionResult Custom()
        {
            return View();
        }

*) go to MyWebsite  Folder -> Views --> Home --> Custom.cshtml . Write here any html code

@{
    Layout = null;
}
<!DOCTYPE html>
<html lang="en">
<head>
....
...
..
.
.
</body>
</html>


*) go to MyWebsite  Folder -> Program.cs  to add route 

app.MapControllerRoute(
    name: "custom",
    pattern: "{controller=Home}/{action=Custom}/{id?}");


*)dotnet build
This command will Create following files ==>
a)dotnet build  in Root folder 
b)MyWebsite.dll in Root folder path ==> bin/Debug/net8.0/MyWebsite.dll

*)dotnet run
This will run aplication on local host 
URL to acces our custom page ==> 
http://localhost:8080/Home/Custom


***************************Part 2  DEPLOYING ON Docker**************************************************************
                          
WE NEED FOLLOWING INFORMATION BEFORE MAKING DOCKER FILE ----
dotnet --version           ==> DOT NET VERSION 

Check .NET Runtime Version: - dotnet --list-runtimes ===> WILL LIST DEPNDENCIES OF PROJECT 

dotnet publish -c Release -o ./bin/app.publish   ==> WILL MAKE A BUILD FILE(MyWebsite.dll) IN ./bin/app.publish 
CReate a Docker file in Root Folder (MyWebsite) ==> 

Also in docker file ==> ENTRYPOINT ["dotnet", "MyWebsite.dll"]

so Copy the  MyWebsite.dll files in Root folder (MyWebsite)

docker build -t mydocker_image .       

docker run -p 8080:8080 bbb2


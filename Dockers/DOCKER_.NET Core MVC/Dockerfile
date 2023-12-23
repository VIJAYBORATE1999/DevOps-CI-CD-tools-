# Use the official .NET SDK image as the base image
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
ARG source  
WORKDIR /app
COPY ${source:-bin/app.publish} .

FROM mcr.microsoft.com/dotnet/aspnet:8.0
WORKDIR /app
COPY --from=build /app .
EXPOSE 8080 
ENTRYPOINT ["dotnet", "MyWebsite.dll"]


# Copy the project files to the container
# COPY . ./

# Build the application
# RUN dotnet restore
# # RUN dotnet build -c Release -o out
# RUN dotnet publish -c Release -o out

# Build the runtime image
# FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS runtime
# WORKDIR /app
# COPY --from=build /app/out ./   
# # COPY --from=build /app/out ./

# EXPOSE 8080 

# # Set the entry point for the application
# ENTRYPOINT ["dotnet", "MyWebsite.dll"]

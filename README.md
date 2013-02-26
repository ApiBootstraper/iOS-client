# ApiBootstraper/iOS-client

This is an iOS client that use ApiBootstraper/Rails-server.

There are many branches, one branch by Api version :

- **v1.0**  
It's a simple Todo list with user account

- **v1.1**  
This version add geolocation
This version add attachments

- **v1.1 + CoreData**  
This version use Api version 1.1 and CoreData to save data also in local


### Libraries used

Libraries used into this project are into the [submodules](./submodules) directory.

### Routes

It's possible to open the application to a specific location.  
`apibootstraper://todo?uuid={uuid}` : open the detail view of a todo


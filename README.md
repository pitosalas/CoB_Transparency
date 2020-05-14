# CoB Transparency Project
Student Project for <br>
COSI 97A Senior Field Study<br>
Brandeis University<br>
Spring 2020<br>
<br>
This project is a collaboration between a group of Brandeis students and City of Boston department of New Urban Mechanics. The purpose of our project is to generate more general awareness and transparency about the data use, privacy, and security concerns that technology in the public realm may raise among users. Here we built an app giving more information about the sensors collecting data around the city of Boston, where user can browse relavant information through their mobile app to see the location, type and data being collected by the sensors, and the purpose of data collection and usage, or leave their feedbacks or concerns through the app. We also enable authorized site administration and provide easy-to-use interface for the City of Boston staff to manage the data records. 

## Contact Information
**Team**<br>
Belle Scott, bellemscott@gmail.com<br>
Youbin Ahn, ybin.ahn@gmail.com<br>
Rhosung Park, rhosungpark@gmail.com<br>
Anyan Xie, anyanxie@gmail.com<br>
**Project Leader**<br>
Pito Salas, pitosalas@brandeis.edu<br>
**Project Manager**<br>
Nayeli Rodriguez, nayeli.rodriguez@boston.gov<br>
**Partner**<br>
[The office of New Urban Mechanics](https://www.boston.gov/departments/new-urban-mechanics), 	
NEWURBANMECHANICS@BOSTON.GOV

## Relavant Links
[CoB Transparency website](https://cobtransparency.herokuapp.com/)<br>
[Github Repo](https://github.com/youbinaa/CoB_Transparency)<br>
[Gitbook Documentation](https://app.gitbook.com/@cob-transparency/s/cob-transparency/)<br>
[Admin guide](https://docs.google.com/document/d/1iNIg7Y_DgYdD4Bx8kHg7FSPFDEayc_ynuW4JF4oQ0GE/edit)<br>
[seed sensor data](https://docs.google.com/spreadsheets/d/1I0PSo4PdN-8wFFn1vcPod5JvlXPhhZhyePiRVPIcHzI/edit?usp=sharing)

## How to Run
Clone or download this github repo to your local repo<br>
Bundle install all dependencies through `$ bundle install`<br>
Run `$ rails db:setup` to create local PostgresQL database, run pending migration and seed the database<br>
Run `$ rails server` to start a local server<br>
Go to `localhost:3000` to view the app

## App Functionality
### User side
To achieve the main goal of showing the sensor information as transparently possible, the map functionality of the application is purposely built to have a very simple view. Users of the application can click on each “sensor” (represented as dots of different colors) or “neighborhood area” to either read the information related to each element or leave feedback about them. When the users click on the sensor of their interest, an information container will pop up from the bottom of the application to reveal its data including the Sensor label , sensor type , sensor location , sensor owner , and sensor explanation . When the neighborhood area is clicked, the same information container will slide up, but this time with different information comprising the name of the clicked boston neighborhood, and the list of the sensors within the neighborhood (Each row of the sensor list contains the sensor label, and the type of that sensor). The users can achieve the same behavior by using the “search” function of the application as well. For example, when the “sensor 11” is searched, the map will automatically move its view to contain that sensor in its center, and slide up the information container to show users the information about the searched sensor. Some minor functionalities of the map include toggling of each type of sensor, zooming in and out with responsive sensor size, converting the map into satellite view, and locating the current view to the user’s location (geolocation).<br>
The above features and explanation on how to use the app is also included in the app itself, and can be seen by clicking on the information button on the top right side. The expanded page for explaining how to use the app is shown in the below figures.
### Admin side
In order to help future administrators of the app navigate the rails admin tool, we built a comprehensive [manual](https://docs.google.com/document/d/1iNIg7Y_DgYdD4Bx8kHg7FSPFDEayc_ynuW4JF4oQ0GE/edit) that contains all the necessary information administrators need to use the tool, including tutorials to import, export, add, delete, and edit sensors.

## App Architecture
We used Ruby on Rails (RoR) as our app framework, which utilizes a model-view-controller pattern that separates the app work into three subsystems, and each subsystem is responsible for a different set of actions. In the RoR framework, when a user sends a request to the app server, the controllers will receive the request for the application and then works with the model to prepare any data needed by the view, and the controllers will also interact with external APIs like Mapbox to complete certain requests. The technical details of these APIs will be explained in the following sections. The database is implemented with PostgreSQL, an open-source relational database management system which has native support for using SSL connections to encrypt client/server communication, thus ensuring data security. Our app is deployed on Heroku, a cloud service provider which offers free to low-cost infrastructure setup and convenient add-ons. It allows the developer to focus on code instead of infrastructure and it enables scaling both horizontally and vertically in case the app needs more performance.<br>
![alt text](https://lh3.googleusercontent.com/2LA0zHRvzjw32Vm9T56FQBwU6zFtgIjyNIJVQ3__MSTQkCVZdHFjulV2XLdYfrSymkB97C-NVt-bA0dThdrJgH3TTdtdoJahCA3W5teEpTuBQvEySoINITOr5P9JWnVeyRyjTZGK20RNWmNynqaw_0fee4wmO_zDOkxAD6AW8vCcabPzk5VnFS5uqXbqs5WuXHlOKNpiyGwS1vZ-lmC4v8gmJXIuth3gCtsWJStI2qYl1VczVwP4_tD4Q9ox4sbGsoDopBXJEVP_pCznVUPOLPuuN6EaiJ4gfe3GV72kUJNrl5bCcObuM-mQxFKbKh5d2VyxdH_I3OPYiamyrZQzdY6ro_VqmPGWSroW41rzfk9PxvxM4B-TgxvQasXTTUEHJVJvABUQo6Ab3OvTF4LOzsPX0ooS5GvUh5XWwlpI0jAMc_T3z59YOxpcT0v68kslHlGq41M9834pWozIedJiMnoiQP4SVAGErjN75ckPoju5IPD1EyVBox2bRwnPo7H5c16FfoOnw63UjEnbC4G7ycdr271bv6K8phPSRjzsHBPvbNCkQ1EvbguN0Ru1hP5cNN_DOh6a2VUM9nDWrPgyQsdB_CcCOWkeCSIxP-H5l71VdSv9KKWbQinhAH9A83QmkqjWqn0YDkCfzodkp9uK1GvdxagfMIEFlLILC9Bndb-xqhFqcPjhFAAR2_brJg=w741-h441-no?authuser=0 "Transparency app architecture")

## Database and Schema
PostgreSQL is the most popular and advanced open source object-relational database, which is considered superior to others when it comes to out-of-the-box security. The database security for PostgreSQL is addressed at several levels:
1. All files stored within the database are protected from reading by any account other than the Postgres superuser account.
2. Connections from a client to the database server are, by default, allowed only via a local Unix socket, not via TCP/IP sockets. 
3. Client connections can be restricted by IP address and/or user name.
4. Each user in Postgres is assigned a username and (optionally) a password. By default, users do not have write access to databases they did not create.
5. Users may be assigned to groups, and table access may be restricted based on group privileges.

In our case, data is securely stored in the database and is only accessible by authorized administrators via the local Unix socket. There are three tables in the PostgreSQL database which are responsible for storing information about the administrators, users feedback and sensors

In the administrator table, name is the name of the admin. Email is the unique email for admin login and activation receival. Access code is the required secret code during account creation and only authorized personnel with correct access code can register for an admin account. Admin’s raw password is encrypted and securely stored in the database, and user validation is done by computing its password digest and comparing the result to password_digest stored in the database.
||name|email|access_code|password_digest|
| -------------- | ----- | ----- | ----- | ----------- |
|data type|string|string|string|string|
|example|John Smith|js@gmail.com|pororo|$2a$12$WgjER5o|

For the Feedback table, the issue is the content that the user reports to the backend. Once a user submits a feedback for a sensor, its sensor id will automatically be filled in by the system under the topic column. Therefore, issues and sensors are associated with each other and the admin can search for a sensor id in the admin’s page to list all the issues submitted by users for that sensor.
||issue|topic|
|---|---|---|
|data type|string|string|
|example|Camera is facing my window|sensor 2319|

For the Sensor table, sensor_type is the type of sensor in the database, which for now includes antenna, air quality, camera, counter and other. Owner indicates who owns the sensor, i.e., City of Boston or 3rd party vendors. Description is an optional text to describe the sensor. Location is the full address where the sensor is located. Longitude and latitude are the geographic coordinates of the sensor. The hidden field decides if the sensor will show up in the app and is set to false by default. This is especially useful when some sensor is under maintenance but we still want to keep its information in the database. 
||sensor_type|owner|description|location|longitude|latitude|hidden|
|Data type|string|string|string|string|float|foat|boolean|
|Example|camera|Verizon|...|2 Oak st|-71.0657|42.34867|false|

## Future Works
Upon presenting the application to Nayeli and a few of her colleges that also work in the Boston government, the application received a very positive response. Many of the questions concerned the future of the application: possible additional functions that we could implement, and how the application would/could continue after the semester ends. Because of the current coronavirus situation, it would be impossible to implement this app into Boston and get it into the hands of citizens at this moment. However, the Boston team did seem to be extremely interested in deploying this application into the real world eventually, once there was an opportunity. 
	
We have many ideas on what we’d do if given more time on this application. As we were working, there were many issues that we ended up solving and some that we knew had to be solved/addressed if we were given more time and energy. Below we’ve compiled a list of specific features and measures we would like to add into the application in the future. 
1. Loader.io scalability test
2. RabbitMQ for queueing when bulk importing sensors to database
3. Database tuning and indexing
4. Redis for database caching during map rendering
5. Heroku scheduler to daily check database records (maybe move geocoding & reverse geocoding there)
6. Change monolithic app structure to Service Oriented Architecture (SOA)
7. Implement load balancer to send traffic to different server and separate request for static and dynamic content
8. Action Mailer to send super admin email notification about database change/new comments and other relevant information
9. Add map functionality that allows a user to see first person view, which would require more specific information about the sensors, such as above ground/underground/height (requested by CoB)

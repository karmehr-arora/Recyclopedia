# Recyclopedia
Recyclopedia is a mobile application that helps users recycle smarter. Using a database, users can scan their product and determine if that product should be recycled or thrown away in waste. If a product requires a special disposal program, users will be informed of what steps they need to follow in order to dispose of their waste

# Installation
You should have mysql workbench 8.0 installed
You should have java 17 installed

# Set Up Database
Open up mysql set the username and password to root
create a recyclopedia database once you have accessed the server
If you would like to have test data in your mysql database, you can open up the sql folder and run that file in your mysql database

# How to Run
First, open up the application in Android Studio IDE (Other IDE's haven't been tested)

Next, open the terminal and change directory to the backend folder.
In this directory, run the following commands:
echo $env:JAVA_HOME
./mvnw spring-boot:run

Note that JAVA_HOME should return the location of your java jdk. If this isn't set, you can install java 17 and add JAVA_HOME to your environment variables
The second command should start the backend system
You can test that the backend system is running by opening up the following page:
http://localhost:8080/api/reminders

Next, you can run the application by clicking the play button at the top of the screen.
Now you should have a running application
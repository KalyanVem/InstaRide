# Instructions:
Fallow the instructions given below to get the app running

## IDE
You can choose any IDE and configure it for web project. One that I recommend is [Eclipse IDE Enterprise Edition](https://www.eclipse.org/downloads/packages/release/kepler/sr2/eclipse-ide-java-ee-developers). Download and install it if you want.
## Requirements
1. [Tomcat Server](https://tomcat.apache.org/download-80.cgi). Download and extract zip and add it to your project.
2. For Database, I used PostgreSql. for that, we have to download and configure [JDBC connector](https://jdbc.postgresql.org/download.html).
3. After configuring your local Database, set the url, username, password fields in respective Java files(Login.java, Register.java, AddAgent.java)
4. You are good to go.
## To Enable Map:
1. Get an API key from [mapmyindia](https://www.mapmyindia.com/api/dashboard)
2. copy your Interactive Map API Key for Web/Android/iOS and replace it with YOUR_API_KEY in 25th line of home.jsp file

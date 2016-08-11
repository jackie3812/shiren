# What is this for?
Just practice to write Perl code without using WAF.
The output will be a web browser game inspired by japanese game 'fuurai no shiren'.
I'm wellcomimg any of your comment to my code!


### Class Discription
#### app.psgi file
* connect URL with Dispathcer

#### Dispathcer Class
* Create page ongejct to collect variables with DB operations. Output is PSGI format response form View class.

#### Page Class
* It aims to work with Func Class to collect variables to pass View Class. Page Class should not have "Logic".

#### Func Class
* This class has two role. FIrstly it creates an object(s) which wraps Model Class. Secondly it operates objects passed by some other Func Class to pass variables to Page Class.

#### Model Class
* Only this class operates database. However this class doesn't do any job beside database access.

#### View Class
* This class handles the instances and variables passed by Page Class and create PSGI format output.

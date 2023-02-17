# DogFacts CLI Application
This CLI Ruby application fetches 5 random dog facts from the DogFacts API and allows the user to save any of these facts as their favourites for later reading.
Here is a link where I explain the various steps of my development process and how I created this application: https://medium.com/@mark.zapas1/how-to-create-ruby-cli-application-cec525391baf

## Features
* Greets the user and asks them to log in (without a password)
* Recognizes if the user already exists in the system and loads their saved facts
* Creates a new user if one does not exist and saves their favourite facts for future reference
* Fetches 5 random dog facts from the DogFacts API
* Allows users to save their favourite dog facts for later reading

## Getting Started
To get started, you need to have Ruby installed on your system. Clone this repository and navigate to the project directory. Run the following command in your terminal to install the required dependencies:

`bundle install`

To start the application, run the following command in your terminal:

`ruby bin/console`

## Usage
When you start the application, you will be asked to enter your name. If you have used the application before, your previously saved facts will be loaded. If you are a new user, the application will create a new user profile for you.

You will then be presented with the option to "Browse for some facts? (y/n)". If you select "y", the application will display 5 random dog facts. To save any of these facts as your favorite, simply enter the number of the fact you want to save when prompted.

To view your favorite facts, select "y" when prompted with the option "Do you want to see your favorite facts? (y/n)" from the main menu. From there, you can view, edit, or delete your saved facts.

To exit the application, select "y" when prompted with the option "Do you want to exit? (y/n)" from the main menu.


## Contributing
If you would like to contribute to the development of this application, feel free to fork the repository and create a pull request.

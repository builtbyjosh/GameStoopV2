# GameStoopV2

GameStoopV2 is a simple online store developed with Ruby On Rails. It implements a carts system that is tied to a user. And uses sessions to create new carts. It also utilizes 3rd party authentication using Omniauth-github.

Active admin has also been used for the creation of new game objects. You will need to navigate to localhost:3000/admin to login. There is a default admin user created in the seeds file.  

## Installation

Use the terminal to install GameStoopV2.

```bash
bundle install
```
To use the Omniauth-github gem, make sure to create your own .env file and store the Github key and secret in there. 


## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License
[MIT](https://choosealicense.com/licenses/mit/)

# 📚 Hero Trainer

Hobby marketplace app built around booking classes with fitness role models.
<img width="1512" alt="Screenshot 2025-03-14 at 2 38 40 PM" src="https://github.com/user-attachments/assets/0f48a4bd-44f2-4eef-a0c3-c2fa1fc8c116" />
![ht browse](https://github.com/user-attachments/assets/42df8ff9-5797-48d9-9307-feeab112e889)
![ht bookingpage](https://github.com/user-attachments/assets/99727eb0-14be-4061-8288-d88adcdd8d74)

<br>
App home: https://hero-trainer-7fa0c2e5c903.herokuapp.com/
   

## Getting Started
### Setup

Install gems
```
bundle install
```

### ENV Variables
Create `.env` file
```
touch .env
```
Inside `.env`, set these variables. For any APIs, see group Slack channel.
```
CLOUDINARY_URL=your_own_cloudinary_url_key
```

### DB Setup
```
rails db:create
rails db:migrate
rails db:seed
```

### Run a server
```
rails s
```

## Built With
- [Rails 7](https://guides.rubyonrails.org/) - Backend / Front-end
- [Stimulus JS](https://stimulus.hotwired.dev/) - Front-end JS
- [Heroku](https://heroku.com/) - Deployment
- [PostgreSQL](https://www.postgresql.org/) - Database
- [Bootstrap](https://getbootstrap.com/) — Styling
- [Figma](https://www.figma.com) — Prototyping

## Acknowledgements
Inspired by Jason and Chris's interest in fitness and specifically my appreciation of recreational fitness activities outside of weightlifting.

## Team Members
- Jason R. Rocha(https://www.linkedin.com/in/jason-rocha-37188a150/)
- Aditya Karkera
- Rafaela Yazawa
- Christopher Diaz

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

## License
This project is licensed under the MIT License

# 📚 Hero Trainer

In this project, I created a web app registration and management system for a Training partners. The system should allow users to create accounts and register for classes. They are able to find classes of different types taught by different people. Instructors should be able to create classes of a certain type then manage those classes by changing their time, type, adding teachers, and removing/adding clientele. Finally they are able to propose new class types. The owner is able to reject or approve different class types as well as alter classes the same as an instructor. The owner is also able to manage qualities of the gym such as class length capacity.


Hobby marketplace app built around booking classes with fitness role models.
<img width="1512" alt="Screenshot 2025-03-14 at 2 38 40 PM" src="https://github.com/user-attachments/assets/0f48a4bd-44f2-4eef-a0c3-c2fa1fc8c116" />
<img width="1512" alt="Screenshot 2025-03-14 at 3 07 45 PM" src="https://github.com/user-attachments/assets/b3c5a065-0506-4c96-aa54-3693ecaed97b" />
<img width="1512" alt="Screenshot 2025-03-14 at 3 09 45 PM" src="https://github.com/user-attachments/assets/961900ee-c8f0-44b4-81de-071c4c1a6235" />

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

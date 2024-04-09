## Local installation
In order to use the project from a local computer you need to follow the next steps:

### Step 1
Clone the repo on your computer and open the folder in the terminal

### Step 2
```
  bundle install
```

### Step 3
```
  rails db:create db:migrate
```

### Step 4
```
  rails s
```

And the app will be available on localhost:3000

## Deploy
The project is deployed on Render and this is the link: https://nexutest.onrender.com

### Routes

### List brands
```
  GET /api/brands
```

### List models
```
  GET /api/models
```

### List models by brand
```
  GET /api/brands/1/models
```

### New brand
```
  POST /api/brands
```

#### Example body
```
  { "name": "ferrari" }
```

### New model
```
  POST /api/brands/1/models
```

#### Example body
```
  { "name": "model 2", average_price: 320000 }
```

### Update model
```
  PUT /api/models/2
```

#### Example body
```
{ "average_price": 100000 }
```


## Notes
I enjoyed the challenge because it reminded me of the first time I used Ruby on Rails and tried to create an API.
I had multiple setbacks with the deployment, the internet, updates from my PC, and trying to execute the ```rails db:migrate``` from the deployment, but it was fun and I had a great time. I hope to hear from you very soon!
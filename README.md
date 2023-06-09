<a name="readme-top"></a>

[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]




<br />
<div align="center">
  <a href="https://github.com/pantry-wizard/pantry_wizard_be">
    <img src="https://user-images.githubusercontent.com/117066950/231888243-b836b725-b848-4151-a449-6564fd7d4e5e.png" alt="Logo" width="582" height="404">
  </a>

<h3 align="center">Pantry Wizard</h3>

  <p align="center">
    An application that allows a user to create meal plans based on their Dietary Restrictions, Intolerances, and Cusine Preferences. 
    <br>
    This is the backend service of the application.
    <br />
    <!-- <a href="https://github.com/github_username/repo_name"><strong>Explore the docs »</strong></a> -->
    <!-- <br /> -->
    <!-- <br /> -->
    <!-- <a href="https://github.com/github_username/repo_name">View Demo</a> -->
    <!-- · -->
    <a href="https://github.com/pantry-wizard/pantry_wizard_be/issues">Report Bug</a>
    ·
    <a href="https://github.com/pantry-wizard/pantry_wizard_be/issues">Request Feature</a>
    ·
    <a href="https://github.com/pantry-wizard/pantry_wizard_fe">Front End Repo</a>
  </p>
</div>



<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#installation">Installation</a></li>
        <li><a href="#api-key-setup">API Key Setup</a></li>
        <li><a href="#testing-with-rspec">Testing With RSpec</a></li>
        <li><a href="#local-server-setup">Local Server Setup</a></li>
      </ul>
    </li>
    <li><a href="#how-to-use-walkthrough">How to Use (Walkthrough)</a></li>
    <ul>
        <li><a href="#login">Login</a></li>
        <li><a href="#user-preferences">User Preferences</a></li>
        <li><a href="#Day Plans">Day Plans</a></li>
        <li><a href="#recipes">Recipes</a></li>
      </ul>
    <li><a href="#goals">Goals</a></li>
    <li><a href="#contributors">Contributors</a></li>
  </ol>
</details>

<br>

<!-- ABOUT THE PROJECT -->
## About The Project
<br>

At Pantry Wizard, we believe that everyone deserves access to healthy, delicious food. We're on a mission to reduce food waste and alleviate food insecurity by providing personalized meal planning that simplifies the decision-making process and empowers individuals to take control of their nutrition. Our app is designed to meet the needs of neurodivergent individuals, picky eaters, and anyone facing time or resource constraints, so they can focus on what really matters in their lives. Join us in making a positive impact on our communities, one meal at a time.

<p align="right">(<a href="#readme-top">back to top</a>)</p>



### Built With:

* [![Ruby]][Ruby-url] **3.1.1**
* [![Rails]][Rails-url] **7.0.4**
* [![Postgresql]][Postgresql-url]
* [![Heroku]][Heroku-url]

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- GETTING STARTED -->
## Getting Started

This is a Ruby on Rails application that's used together with the <a href="https://github.com/pantry-wizard/pantry_wizard_be"> `pantry_wizard_be` </a> repository. To run the application locally, both front-end and back-end repositories will need to be cloned and set up fully with required gems and environment variables.

<br>

### Installation

1. Clone the repo:
```bash
   git clone git@github.com:pantry-wizard/pantry_wizard_fe.git
```

1. Install gems:
```bash
   bundle install
```

<!-- 1. ==ADD SPECIFIC INSTRUCTIONS TO INSTALL FIGARO== -->

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<br>

### API Key Setup
In order to use this application you will API keys from both <a href="https://rapidapi.com/spoonacular/api/recipe-food-nutrition/"> `RapidAPI` </a> and <a href="https://cloud.google.com/"> `Google Cloud Platform` </a>. You will have to enable the google places API and the google maps javascript API.

Once you have these keys, they will be stored in files that you create.

1. Create a `.env` file within the app. This file should appear next to the .gitattributes foler and should not be nested. Add your `GOOGLE_CLIENT_ID` and `GOOGLE_CLIENT_SECRET` to this file. You will also need to add a `HOST_URL`.

```bash
    GOOGLE_CLIENT_ID=xxxxxxxxxxxxxxx-xxxxxxxxxxxxxxx.apps.googleusercontent.com
    GOOGLE_CLIENT_SECRET=xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
    GOOGLE_MAPS_API_KEY=xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
    HOST_URL=http://localhost:4000
```

1. Run `bundle exec figaro install`, then open the `application.yml` file. Here you'll add your `X-RapidAPI-Key`.
```bash
    X-RapidAPI-Key: xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
```

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<br>

### Testing with RSpec

Once `pantry_wizard_fe` is correctly installed, run tests locally to ensure the repository works as intended.

<br>

  To test the entire RSpec suite, run:
```bash
   bundle exec rspec
```

   <p align="right">(<a href="#readme-top">back to top</a>)</p>

<br>

All tests should be passing if the installation was successful. 

If any tests are not passing, please report which tests are not passing <a href="https://github.com/pantry-wizard/pantry_wizard_be/issues">Here</a>. We will issue an update/fix as soon as possible!


<p align="right">(<a href="#readme-top">back to top</a>)</p>

<br>


### Local Server Setup
Since this application is deployed to heroku, if you want to use PantryWizard locally you'll need to make some changes in the `services` folder. In each service file you'll need to change the url in the following method.

Current URL for heroku deployment:

```bash
    def self.conn 
      Faraday.new(url: "https://pantrywizardbe.herokuapp.com")
    end
```

Change to:

```bash
    def self.conn 
      Faraday.new(url: "http://localhost:4000")
    end
```

 run `rails s` on both `pantry_wizard_be` and `pantry_wizard_fe`. The backend will be hosted on `localhost:4000` while the front end will use `localhost:3000`


<p align="right">(<a href="#readme-top">back to top</a>)</p>

<br>

## How to Use (Walkthrough)
<!-- INSERT DAWSONS WONDERFUL OATMEAL GIF(T)S -->

### Login
- Using your preferred internet browser (chrome), visit `localhost:3000`.
  - You'll be asked to sign-in using Google OAuth, so a Google account is required.
  - Once logged in, you'll be redirected to the `/dashboard`

    <br>


  ![Screen Recording Gif](https://user-images.githubusercontent.com/116330317/233482176-4f34e94e-71d0-4f52-9fed-ada7ab9b6b03.gif)

  <br>

### User Preferences
- Select all food `Intolerances` you have from the avaliable list.
- Select up to one `Dietary Restriction` if you have one.
- Next to each cuisine type there is a drop down menu, which you can select your `Likes and Dislikes`
- When the form looks right to you, press submit at the bottom of the page. You can change these preferences later if you want.

  <br>

  ![Screen Recording Gif](https://user-images.githubusercontent.com/116330317/233484509-0ec523c1-ddd4-4855-919e-226169b030a3.gif)

  <br>


### Meal Plans
1. Select `Create Meal Plan`
    - Select the date you would like to create a plan for and select `Create New Meal Plan`.
    - 3 random meals will be assigned (1 breakfast and 2 main courses) based on your preferences.
    - You'll be routed to `/dashboard` where you'll see today's meal plan, and a button to edit it (if you've created one).
    - Below that you'll see the plans for the upcoming 7 days (if you've created them).

  <br>

  ![Screen Recording Gif](https://user-images.githubusercontent.com/116330317/233492056-7375e897-f452-4703-b620-253c370eff3f.gif)

  <br>


2. View a Recipe
    - From the `/dashboard` select an upcomming meal plan, or select the name of a recipe.
    - On that recipes show page you'll see the meals `ingredients`, `instructions`, and a picture of the dish.
    - If you would like a different meal, then select either `Generate New Breakfast Recipe`, `Generate New Lunch Recipe`, or `Generate New Dinner Recipe`. That will replace the existing meal with another that adheres to your preferences.

  <br>

  ![Screen Recording Gif](https://user-images.githubusercontent.com/116330317/233493591-9430e039-aa4c-4866-a662-033d91e2d071.gif)

  <br>

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<br>

## Goals

Pantry Wizard was crafted to satisfy the requirements for The Turing Back-End Mod 3 group project, **Consultancy**. 

See the official project requirements [here](https://backend.turing.edu/module3/projects/consultancy/).

<br>

### Learning Goals
- Impliment Google OAuth so users can log in easily.
- Impliment CircleCI for continuous integration.
- Utilize Service Oriented Architecture by creating an API with Rails.
- Interact with two unique external API's.
- Deploy both the frontend and backend on Heroku.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

### Future Goals
- Add google calendar so meals can be scheduled in advance.
- Integrating Swagger.
- Integrating HoneyBadger for observability of backend queries.
- Integrating Swagger to make endpoint testing easier.
- `/preferences` rendering the form with the users current preferences (currently they're just stored on the backend).
- New user directed to `/preferences` instead of `/dashboard`.
- The ability to generate a new meal directly from the `/dashboard` instead of going into that meals show page.

### Known Issues
- Needs more sad path testing and refactoring.
- The spoonacular API only allows a total of 50 requests a day, and it's primary search endpoint counts as 3 requests.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<br>


## Contributors
<table>
  <tr>
    <td><img src="https://avatars.githubusercontent.com/u/116330317?s=120&v=4"></td>
    <td><img src="https://avatars.githubusercontent.com/u/88596340?s=120&v=4"></td>
    <td><img src="https://avatars.githubusercontent.com/u/104170346?s=120&v=4"></td>
    <td><img src="https://avatars.githubusercontent.com/u/71752551?s=120&v=4"></td>
    <td><img src="https://avatars.githubusercontent.com/u/117066950?s=120&v=4"></td>
  </tr>
  <tr>
    <td>Chris Crane</td>
    <td>Conner Van Loan</td>
    <td>Caleb Thomas</td>
    <td>Brian Hayes</td>
    <td>Dawson Timmons</td>
  </tr>
  <tr>
    <td>
      <a href="https://github.com/GreenGogh47">GitHub</a><br>
      <a href="https://www.linkedin.com/in/chris-crane-16106814/">LinkedIn</a>
    </td>
    <td>
      <a href="https://github.com/C-V-L">GitHub</a><br>
      <a href="https://www.linkedin.com/in/conner-van-loan/">LinkedIn</a>
    </td>
    <td>
      <a href="https://github.com/cjthomas00">GitHub</a><br>
      <a href="https://www.linkedin.com/in/calebjthomas/">LinkedIn</a>
    </td>
    <td>
      <a href="https://github.com/Bphayes1200">GitHub</a><br>
      <a href="https://www.linkedin.com/in/brian-hayes-363812204/">LinkedIn</a>
    </td>
    <td>
      <a href="https://github.com/DMTimmons1">GitHub</a><br>
      <a href="https://www.linkedin.com/in/dawson-timmons/">LinkedIn</a>
    </td>
  </tr>
</table>


<!-- MARKDOWN LINKS & IMAGES -->
[contributors-shield]: https://img.shields.io/github/contributors/pantry-wizard/pantry_wizard_be.svg?style=for-the-badge
[contributors-url]: https://github.com/pantry-wizard/pantry_wizard_be/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/pantry-wizard/pantry_wizard_be.svg?style=for-the-badge
[forks-url]: https://github.com/pantry-wizard/pantry_wizard_be/network/members
[stars-shield]: https://img.shields.io/github/stars/pantry-wizard/pantry_wizard_be.svg?style=for-the-badge
[stars-url]: https://github.com/pantry-wizard/pantry_wizard_be/stargazers
[issues-shield]: https://img.shields.io/github/issues/pantry-wizard/pantry_wizard_be.svg?style=for-the-badge
[issues-url]: https://github.com/pantry-wizard/pantry_wizard_be/issues
[license-shield]: https://img.shields.io/github/license/pantry-wizard/pantry_wizard_be.svg?style=for-the-badge
[license-url]: https://github.com/pantry-wizard/pantry_wizard_be/blob/master/LICENSE.txt
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://linkedin.com/in/linkedin_username
[product-screenshot]: images/screenshot.png
[Ruby]: https://img.shields.io/badge/ruby-000000?style=for-the-badge&logo=ruby&logoColor=red
[Ruby-url]: https://www.ruby-lang.org/en/
[Rails]: https://img.shields.io/badge/rails-red?style=for-the-badge&logo=rubyonrails&logoColor=white&color=red
[Rails-url]: https://rubyonrails.org/
[Postgresql]: https://img.shields.io/badge/postgresql-3386FF?style=for-the-badge&logo=postgresql&logoColor=FFFFFF
[Postgresql-url]: https://www.postgresql.org/
[Heroku]: https://img.shields.io/badge/Heroku-430098?style=for-the-badge&logo=heroku&logoColor=white
[Heroku-url]: https://www.heroku.com/
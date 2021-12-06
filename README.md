# CareGiver App

An application where parents/guardians and babysitters can connect and view each others profiles to help those in need of childcare. There are two user types: parent/guardian and caregivers. Parents can post jobs, caregivers can request jobs from parents, and parents can accept their job request. 

## Forms: 
1. Sign Up Form
2. Log In Form
3. Post Job Form (for parents only)

## User Stories:
* Users can sign up as parent or caregiver 
* Users can browse a list of parents/caregivers
* Parents can post a job
* Caregivers can view jobs posted by parents and request/apply
* Parents can accept job requests by caregivers
* Caregivers can see if job request was accepted.

## Tech Used:
### FRONTEND:
* <a href="https://reactjs.org/" target="_blank">React JavaScript</a>
* <a href="https://react-redux.js.org/" target="_blank">React Redux</a>
* <a href="https://v5.reactrouter.com/web/guides/quick-start" target="_blank">React Router</a>
* <a href="https://axios-http.com/docs/intro" target="_blank">Axios</a>
* <a href="https://mui.com/getting-started/usage/" target="_blank">MUI</a>
### BACKEND:
* <a href="https://guides.rubyonrails.org/" target="_blank">Ruby on Rails</a> API-only backend framework [Ruby 2.7.4 & Rails 6.1.4]
* <a href="https://jwt.io/" target="_blank">Json Web Tokens (JWT)</a> for user authorization and authentication.
* <a href="https://www.npmjs.com/package/bcrypt" target="_blank">BCrypt</a> gem for password/encryption/security
* <a href="https://www.postgresql.org/" target="_blank">Postgresql</a> database

## Deployment 
#### This application has been deployed to Heroku using <a href="https://create-react-app.dev/docs/getting-started/" target="_blank">Create-React-App</a> buildpack for the frontend. 
### <a href="https://caregiver-frontend-react.herokuapp.com/" target="_blank">Frontend</a>
### <a href="https://caregiver-backend-rails.herokuapp.com/" target="_blank">Backend</a>

## Instructions to Install and Use the application
### BACKEND Installation:
1. Clone this repository to your local environment `git clone <this-repo-url>`
2. Navigate to root folder of this repo
3. Run `bundle install` to install required gems
4. Run `rails db:create` to create database locally
5. Run `rails db:migrate` to create tables into the database
6. Run `rails db:seed` to create seed data
7. Run `rails s` or `rails server` to start server

### FRONTEND Installation:
1. Clone frontend repository to your local environment `git clone <frontend-repo-url>`
2. Navigate to root folder of the frontend repo
3. Run `npm install` to install all dependencies
4. Run `npm start` to start server

#### | <a href="https://github.com/csjeon28/caregiver-frontend-react" target="_blank">Frontend Repo</a> |
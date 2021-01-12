#! /bin/bash

cd frontend
#run test to execute unit tests
ng test

#builds and serve the app
ng serve
#runs end-to-end tests
ng e2e
# TestAssignmentAPC
automate api for jsonplaceholder

Before you get started, ensure you have the following installed on your machine:

## Prerequisites

- Python installed on your machine (version 3.x recommended).
- git clone https://github.com/your-repo/api-testing-robot-framework.git
- cd api-testing-robot-framework


## Installation

1. **Install Robot Framework:**

   Open a terminal and run the following command to install Robot Framework using pip:

   ```bash
   pip install robotframework

2. Install project dependencies:

   ```bash
   pip install -r requirements.txt


## Running the Tests
Run the test suite using the following command:
     
      robot tests/

### About the Framework structure

This framework is created using Robot framework and python

## Test Scenarios
The tests are organized by HTTP methods (GET, POST, PUT, DELETE). Below is an overview of the tests covered in each file.

#GET Requests
Tests in get_tests.robot:

Retrieve All Posts: Verifies that all posts are retrieved successfully.
Retrieve Post By Valid ID: Fetches a specific post by its ID and verifies the response.
Retrieve Invalid Post: Attempts to retrieve a post with an invalid ID and expects a 404 Not Found.
Retrieve Comments for Specific Post: Retrieves comments for a specific post ID.
Retrieve User By Valid ID: Retrieves a user by a valid ID.

#POST Requests
Tests in post_tests.robot:

Create New Post Successfully: Creates a new post and verifies that it is created with the correct 201 Created response.
Create Post Without Required Fields: Attempts to create a post without required fields and expects a 201 Created status code (due to JSONPlaceholder's behavior; see notes below).

#PUT Requests
Tests in put_tests.robot:

Update Existing Post: Updates an existing post and verifies that the post is updated with a 200 OK response.
Attempt to Update Non-Existing Post: Attempts to update a post that does not exist. Expected behavior is a 404 Not Found, but JSONPlaceholder returns a 500 Internal Server Error.Beacuse of this, test case is failing.

#DELETE Requests
Tests in delete_tests.robot:

Delete Existing Post: Deletes an existing post and verifies the 200 OK status code.
Attempt to Delete Non-Existing Post: Attempts to delete a non-existing post. Expected behavior is 404 Not Found, but JSONPlaceholder always returns 200 OK.

##Note: As JSONPlaceholder is a mock API which does not persist actual data, it returns 200 OK in my test case.This can not be correct in real world.

# Evidences:
Video recorded for execution.
      

# Docker:
Docker file added in the repo.
Below Command needs to be executed to run in Docker:

1. To Build: 

   ```bash
   docker build -t robot-framework-tests .

2. To Execute 

   ```bash
   docker run --rm -v $(pwd):/usr/src/app robot-framework-tests
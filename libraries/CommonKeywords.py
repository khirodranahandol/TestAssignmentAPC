import requests
from hamcrest import assert_that, equal_to, greater_than

class CommonKeywords:
    BASE_URL = "https://jsonplaceholder.typicode.com"

    def create_api_session(self):
        """Creates an API session."""
        session = requests.Session()
        return session

    def check_status_code(self, response, expected_status_code):
        """Verifies the status code of a response."""
        actual_status_code = response.status_code
        assert_that(actual_status_code, equal_to(int(expected_status_code)))

    def check_response_not_empty(self, response):
        """Asserts that the response is not empty."""
        assert response.json(), "The response is empty"
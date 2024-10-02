import requests
from hamcrest import assert_that, equal_to, has_entries, greater_than

class APIKeywords:
    BASE_URL = "https://jsonplaceholder.typicode.com"

    def retrieve_all_posts(self, session):
        """Retrieves all posts."""
        response = session.get(f'{self.BASE_URL}/posts')
        return response

    def retrieve_post_by_id(self, session, post_id):
        """Retrieves a post by ID."""
        response = session.get(f'{self.BASE_URL}/posts/{post_id}')
        return response

    def retrieve_invalid_post(self, session, post_id):
        """Retrieves a post with an invalid ID."""
        response = session.get(f'{self.BASE_URL}/posts/{post_id}')
        return response

    def retrieve_comments_for_post(self, session, post_id):
        """Retrieves comments for a specific post."""
        response = session.get(f'{self.BASE_URL}/posts/{post_id}/comments')
        return response

    def create_post(self, session, title, body, user_id):
        """Creates a new post."""
        payload = {
            "title": title,
            "body": body,
            "userId": user_id
        }
        response = session.post(f'{self.BASE_URL}/posts', json=payload)
        return response

    def update_post(self, session, post_id, title, body):
        """Updates a post."""
        payload = {
            "title": title,
            "body": body,
            "userId": 1
        }
        response = session.put(f'{self.BASE_URL}/posts/{post_id}', json=payload)
        return response

    def delete_post(self, session, post_id):
        """Deletes a post."""
        response = session.delete(f'{self.BASE_URL}/posts/{post_id}')
        return response
    
    def retrieve_user_by_id(self, session, user_id):
        """Retrieves a user by ID."""
        response = session.get(f'{self.BASE_URL}/users/{user_id}')
        return response

    def check_post_contains(self, response, title, body):
        """Verifies that the post contains the correct title and body."""
        response_json = response.json()
        assert_that(response_json, has_entries({
            "title": title,
            "body": body
        }))

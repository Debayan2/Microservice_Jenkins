import unittest
from src.main import app

class APITestCase(unittest.TestCase):
    def setUp(self):
        self.app = app.test_client()

    def test_health_check(self):
        response = self.app.get("/health")
        self.assertEqual(response.status_code, 200)
        self.assertIn("ok", response.json["status"])

if __name__ == "__main__":
    unittest.main()

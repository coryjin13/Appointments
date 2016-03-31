from system.core.model import Model
import re

EMAIL_REGEX = re.compile(r'^[a-zA-Z0-9\.\+_-]+@[a-zA-Z0-9\._-]+\.[a-zA-Z]*$')

class User(Model):
    def __init__(self):
        super(User, self).__init__()

    def register(self, user):
        errors = []
        password = user['password']
        query = "SELECT * FROM users WHERE email = '{}'".format(user['email'])
        user_exists = self.db.query_db(query)

        if user_exists:
            errors.append('User exists')
        if len(user['name']) == 0 or len(user['email']) == 0 or len(user['password']) == 0:
            errors.append('Please fill out all forms!')
        if len(user['name']) < 2:
            errors.append('Name must be at least 2 characters!')
        if not EMAIL_REGEX.match(user['email']):
            errors.append('Not valid email')
        if len(user['password']) < 8 :
            errors.append('Password must be at least 8 characters')
        if not user['password'] == user['cpassword']:
            errors.append('Passwords must match')
        if not user['dob']:
            errors.append('Please fill out dob')
        if errors:
            return {"status": False, "errors": errors}
        else:
            pw_hash = self.bcrypt.generate_password_hash(password)
            query = "INSERT INTO users (name, email, password, dob, created_at, updated_at) VALUES ('{}', '{}', '{}', '{}', NOW(), NOW())".format(user['name'],user['email'],pw_hash, user['dob'])
            self.db.query_db(query)
        return {"status": True}

    def logged(self, info): 
        query = "SELECT * FROM users WHERE email = '{}'".format(info['email'])
        return self.db.query_db(query)

    def login(self, user):
        errors = []
        password = user['password']
        query = "SELECT * FROM users WHERE email = '{}'".format(user['email'])
        user_exists = self.db.query_db(query)

        if user_exists:
            if self.bcrypt.check_password_hash(user_exists[0]['password'], password):
                return {'status': True}
            else:
                errors.append('Incorrect password')
                return {"status": False, "errors": errors}
        else:
            errors.append('User not registered')
            return {"status": False, "errors": errors}
   

from system.core.controller import *

class Users(Controller):
    def __init__(self, action):
        super(Users, self).__init__(action)
        self.load_model('User')
        self.load_model('Apppointment')
        
    def index(self):
        return self.load_view('users/index.html')

    def register(self):
        session['name'] = request.form['name']
        user = {
            "name" : request.form['name'],
            "email" : request.form['email'],
            "password" : request.form['password'],
            "cpassword" : request.form['cpassword'],
            "dob" : request.form['dob']
        }
        session['name'] = user['name']
        users = self.models['User'].register(user)

        logged_user = self.models['User'].logged(user)

        if users['status'] == True:
            session['id'] = logged_user[0]['id']
            session['name'] = logged_user[0]['name'] 
            return redirect('/appointments')
        else:
            for error_message in users['errors']:
                flash(error_message, "errors")
            return redirect('/')

    def login(self):
        user = {
            "email" : request.form['email'],
            "password" : request.form['password']
        }
        users = self.models['User'].login(user)
        # logged model stuff!!!
        logged_user = self.models['User'].logged(user)

        if users['status'] == True:
            session['id'] = logged_user[0]['id']
            session['name'] = logged_user[0]['name']
            return redirect('/appointments')
        else:
            for error_message in users['errors']:
                flash(error_message, "errors")
            return redirect('/')

    def logout(self):
        session.clear()
        return redirect('/')
        
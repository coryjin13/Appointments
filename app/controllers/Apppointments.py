from system.core.controller import *

class Apppointments(Controller):
    def __init__(self, action):
        super(Apppointments, self).__init__(action)
        self.load_model('Apppointment')

    def index(self):
        todays_appts = self.models['Apppointment'].select_todays_appts(session['id'])
        other_appts = self.models['Apppointment'].select_other_appts(session['id'])
        return self.load_view('appts/index.html', todays_appts=todays_appts, other_appts=other_appts)

    def create(self):
        create_appt = {
            'date' : request.form['date'],
            'time' : request.form['time'],
            'tasks' : request.form['tasks']
        }
        logged_user_id = session['id']

        appt_valid = self.models['Apppointment'].validate_appt(create_appt)

        if appt_valid['status'] == True:
            self.models['Apppointment'].create(create_appt, logged_user_id)
            return redirect ('/appointments')
        else:
            for error_message in appt_valid['errors']:
                flash(error_message, "errors")
            return redirect('/appointments')

    def edit(self, id):
        appointment = self.models['Apppointment'].get_one(id)
        session['appt_id'] = id
        return self.load_view('appts/update.html', appointment=appointment)

    def update(self):
        update_appt = {
            'id' : session['appt_id'],
            'tasks' : request.form['tasks'],
            'status' : request.form['status'],
            'date' : request.form['date'],
            'time' : request.form['time']
        }
        print update_appt
        self.models['Apppointment'].update(update_appt)
        return redirect('/appointments')

    def destroy(self, id):
        self.models['Apppointment'].destroy(id)
        return redirect('/appointments')


 
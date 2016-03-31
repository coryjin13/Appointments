from system.core.model import Model
import time

class Apppointment(Model):
    def __init__(self):
        super(Apppointment, self).__init__()

    def create(self, info, logged_user_id):
        query = "INSERT INTO appointments(tasks, date, time, status, created_at, updated_at, user_id) VALUES('{}', '{}', '{}', 'Pending', NOW(), NOW(),'{}')".format(info['tasks'], info['date'], info['time'], logged_user_id)
        return self.db.query_db(query)

    def select_todays_appts(self, logged_user_id):
        now_time = time.strftime('%Y-%m-%d')
        print now_time
        query = "SELECT id, tasks, time, status FROM appointments WHERE user_id = '{}' AND date = '{}'".format(logged_user_id, now_time)
        return self.db.query_db(query)

    def select_other_appts(self, logged_user_id):
        now_time = time.strftime('%Y-%m-%d')
        print now_time
        query = "SELECT tasks, date, time FROM appointments WHERE user_id = '{}' AND date != '{}'".format(logged_user_id, now_time)
        return self.db.query_db(query)

    def get_one(self, id):
        return self.db.query_db("SELECT * FROM appointments WHERE id = '{}'".format(id))[0]

    def update(self, info):
        query = "UPDATE appointments SET tasks='{}', status='{}', date='{}', time='{}', updated_at = NOW() WHERE id = '{}'".format(info['tasks'], info['status'], info['date'], info['time'], str(info['id']))
        return self.db.query_db(query)

    def validate_appt(self, info):
        errors = []
        now_time = time.strftime('%Y-%m-%d')
        if len(info['date']) == 0 or len(info['time']) == 0 or len(info['tasks']) == 0:
          errors.append('Nothing can be blank!')
        elif not info['date'] >= now_time:
            errors.append('Appoint can only be today or in the future!')
        if errors:
            return {'status': False,'errors': errors}
        else:
            return {'status': True}

    def destroy(self, id):
        return self.db.query_db("DELETE FROM appointments WHERE id='{}'".format(id))

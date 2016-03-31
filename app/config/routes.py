from system.core.router import routes

routes['default_controller'] = 'Users'
routes['GET']['/users'] = 'Users#index'
routes['POST']['/users/register'] = 'Users#register'
routes['POST']['/users/login'] = 'Users#login'
routes['GET']['/users/logout'] = 'Users#logout'
routes['GET']['/appointments'] = 'Apppointments#index'
routes['POST']['/appointments/create'] = 'Apppointments#create'
routes['GET']['/appointments/update/<id>'] = 'Apppointments#edit'
routes['POST']['/appointments/update'] = 'Apppointments#update'
routes['GET']['/appointments/delete/<id>'] = 'Apppointments#destroy'

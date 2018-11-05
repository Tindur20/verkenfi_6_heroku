from bottle import *
from beaker.middleware import SessionMiddleware
import os

session_opts = {
    'session.type': 'file',
    'session.cookie_expires': 300,
    'session.data_dir': './data',
    'session.auto': True
}
app = SessionMiddleware(app(), session_opts)

vara =[{'name':'poster1','price':'24684'},
       {'name':'poster2','price':'28096'},
       {'name':'poster3','price':'37157'},
       {'name':'poster4','price':'39195'},
       {'name':'poster5','price':'41693'},
       {'name':'poster6','price':'45594'}]



@route('/')
def index():
       return template("index.tpl", vara = vara)

@route('/chart/<id>')
def add(id):
    bs = request.environ.get('beaker.session')
    bs[id] = 'check'
    bs.save()
    redirect('/')

@route('/chart')
def chart():
    bs = request.environ.get('beaker.session')
    return template('chart', val = vara )

@route('/del/<id>')
def eyda(id):
    bs = request.environ.get('beaker.session')
    bs[id] = None
    redirect('/chart')

@route('/delall')
def eyda():
    bs = request.environ.get('beaker.session')
    bs.delete()
    bs.save()
    redirect('/chart')



@route('/static/<filename>')
def server_static(filename):
    return static_file(filename, root='./static')

try:
    run(host='localhost', port=os.environ.get('PORT'), app = app)
except:
    run(debug=True, app=app)




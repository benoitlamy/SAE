# -*- coding: utf-8 -*-
from flask import Flask, render_template, request
import os

app = Flask(__name__, template_folder=os.path.join(os.getcwd(), 'tamplates'))

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/newuser', methods=['GET', 'POST'])
def new_user():
    if request.method == 'POST':
        # Traitez les données du formulaire ici
        username = request.form['username']
        password = request.form['password']
        email = request.form['email']
        
        # Enregistrez les données dans la base de données
        # (Note: Vous devrez utiliser SQLAlchemy ou un autre ORM pour cela)

        return "Formulaire soumis avec succès. Merci {}!".format(username)
    else:
        return render_template('newuser.html')

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True)

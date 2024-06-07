from flask import render_template, redirect, url_for, flash
from app import app, db, bcrypt
from app.forms import RegistrationForm
from app.models import User

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/newuser', methods=['GET', 'POST'])
def newuser():
    form = RegistrationForm()
    if form.validate_on_submit():
        hashed_password = bcrypt.generate_password_hash(form.password.data).decode('utf-8')
        user = User(username=form.username.data, email=form.email.data, password=hashed_password)
        db.session.add(user)
        db.session.commit()
        flash('Votre compte a été créé avec succès!', 'success')
        return redirect(url_for('index'))
    return render_template('newuser.html', form=form)

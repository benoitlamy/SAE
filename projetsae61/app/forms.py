from flask_wtf import FlaskForm
from wtforms import StringField, PasswordField, SubmitField
from wtforms.validators import DataRequired, Length, Email, EqualTo, ValidationError
import re
from app.models import User

class RegistrationForm(FlaskForm):
    username = StringField('Username', validators=[DataRequired(), Length(min=6, max=10)])
    email = StringField('Email', validators=[DataRequired(), Email()])
    password = PasswordField('Password', validators=[DataRequired(), Length(min=6, max=15)])
    confirm_password = PasswordField('Confirm Password', validators=[DataRequired(), EqualTo('password')])
    submit = SubmitField('Sign Up')

    def validate_username(self, username):
        if not re.match(r'^[a-z0-9]{6,10}$', username.data):
            raise ValidationError('Le nom d\'utilisateur doit contenir entre 6 et 10 caractères minuscules et alphanumériques.')
        
        user = User.query.filter_by(username=username.data).first()
        if user:
            raise ValidationError('Ce nom d\'utilisateur est déjà pris. Veuillez choisir un autre.')

    def validate_email(self, email):
        user = User.query.filter_by(email=email.data).first()
        if user:
            raise ValidationError('Cet email est déjà utilisé. Veuillez choisir un autre.')

    def validate_password(self, password):
        if not re.match(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[#%{}@]).{6,15}$', password.data):
            raise ValidationError('Le mot de passe doit contenir entre 6 et 15 caractères, au moins 1 chiffre, 1 majuscule, 1 minuscule, et un caractère parmi les suivants : #%{}@.')

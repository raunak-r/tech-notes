1. INSTALL PYTHON FROM PYTHON.ORG WEBSITE
2. INSTALL VIRTUALENV TO SUPPORT MULTIPLE PROJECTS
> pip install virtualenv

GO TO THE FOLDER WHERE YOUR CURRENT PROJECT IS SAVED:
> cd C:\Users\Sanjeev\Dev\proj1
> virtualenv .
> C:\Users\Sanjeev\Dev\proj1>.\Scripts\activate (WINDOWS)
> source bin\activate
(proj1) C:\Users\Sanjeev\Dev\proj1>

TO DEACTIVATE:
> deactivate

3. INSTALL DJANGO.
> pip INSTALL django==1.9

******************************

5. TO START A PROJECT IN DJANGO //WRITE django-admin INSTEAD OF django-admin.py IN WINDOWS
> django-admin startproject proj1

6. NEW FOLDER WILL BE CREATED BY THE NAME proj1.
GO TO THAT FOLDER WHICH CONTAINS manage.py

> cd C:\Users\Sanjeev\Dev\proj1\Scripts\proj1

7. RUN SERVER
> python manage.py runserver

8. SERVER IS UP AND RUNNING AT
http://127.0.0.1:8000/
9. TO CHANGE THE PORT FOR EXAMPLE TO 8888
> python manage.py runserver 8888

******************************

10. YOU WILL GET AN ERROR TO PERFORM MIGRATION
> python manage.py migrate

11. CREATE SUPERUSER
> python manage.py createsuperuser
USERNAME = raunak
email id leave blank
PASSWORD = trydjango19

12. RUN THE SERVER AGAIN
13. GO TO ADMIN SITE
http://127.0.0.1:8000/admin
Log in using id p/w in 11

******************************
14. CREATING AN APP
(A PROJECT CAN CONTAIN MULTIPLE APPS)
> python manage.py startapp posts

15. ADD THE NEW APP TO LIST OF INSTALLED APPS IN settings.py

16. CHANGE models.py
RUN MIGRATIONS TO SEE IF THE CODE WORKS PERFECTLY. IT ONLY SAYS THE CHANGES THAT ARE BEING MADE
> python manage.py makemigrations

RUN CODE TO REFLECT THAT IN PROJECT
> python manage.py migrate

*********************************************
***********LINUX*********LINUX*************************
*********************************************
************LINUX*********************************
**************************LINUX*******************
*****************LINUX****************************
************************LINUX***************
Change default python
> alias python='/usr/bin/python3'


1. install pip from python
> sudo apt install python-pip

2. CREATE VENV

raunak@raunak-HP-Pavilion-15-Notebook-PC:~/Documents/Dev$ 
virtualenv --python=python3 DjangoProj

TO ACTIVATE
> cd DjangoProj
> source bin/activate

TO DEACTIVATE
> deactivate

START PROJECT
> pip install django
> django-admin.py startproject DjangoProj
> cd DjangoProj
~/Documents/Dev/DjangoProj/DjangoProj$


CREATE APP1
> python manage.py startapp App1

*********************************************
***********DATABASE*********DATABASE*************************
*********************************************
*********************************************
*********************************************

****CHANGE DATABASE IN DJANGO TO SOMETHING ELSE ex. POSTGRESQL
> Install postgres app
> pip install postgres //will also install psycopg2
> pip install psycopg2-binary
> brew install postgres //for psql

2. make changes in settings.py file
	>DATABASES = {
    'default': {
        # 'ENGINE': 'django.db.backends.sqlite3',
        # 'NAME': os.path.join(BASE_DIR, 'db.sqlite3'),
        'ENGINE': 'django.db.backends.postgresql_psycopg2',
        'NAME': 'raunakritesh',
        'USER': 'raunakritesh',
        'PASSWORD': '',
        'HOST': 'localhost',
        'PORT': '5432',
    }
}
3. Run it simply


> > \dt =to see tables in psql
> \d+ tablename //to see the schema
> .schema tablename //sqlite3
> \q =to quit

*********************************************
*********************************************
*********************************************
> How to Add a new Foreign Key on already present attribute.
https://stackoverflow.com/questions/35999186/change-type-of-django-model-field-from-charfield-to-foreignkey

>
from Notes.models import Task, User
for task in Task.objects.all():
    user, created = User.objects.get_or_create(username=task.createdBy)
    task.user = user
    task.save()

from Notes.models import Comment, User
for comment in Comment.objects.all():
    user, created = User.objects.get_or_create(username=comment.createdBy)
    comment.user = user
    comment.save()

        migrations.RemoveField(
            model_name='comment',
            name='createdBy',
        ),
        migrations.RenameField(
            model_name='comment',
            old_name='user',
            new_name='createdBy',
        ),
> ./manage.py migrate Notes 0012


*********************************************
*********************************************
*********************************************

**VALIDATE DOESNT WORK
> python manage.py check

**sqlall doesnt work
AFTER UPDATING THE MODEL DATABASE
> python manage.py makemigrations
get the 0001_initial
> python manage.py sqlmigrate App1 0001_initial

SEE THE TABLES IN DATABASE
> python manage.py dbshell


*********************************************
***************DJANGO ORM********************************DJANGO ORM*******************************************
*********************************************
***********DJANGO ORM***************************DJANGO ORM*******
*****************DJANGO ORM***************************

DJANGO ORM COMMANDS
1. >>> queryset = Event.objects.all()
>>> str(queryset.query)

2. queryset =   User.objects.filter(first_name__startswith='R')
                | 
                User.objects.filter(last_name__startswith='D')

OR Set
> queryset_1 | queryset_2
> filter(Q(<condition_1>)|Q(<condition_2>)

3. 
AND Queries
> filter(<condition_1>, <condition_2>)
> queryset_1 & queryset_2
> filter(Q(<condition_1>) & Q(<condition_2>))

4.
$ python manage.py inspectdb > models.py

5. 
> User.objects.filter(first_name__startswith='R').values('first_name', 'last_name')
> queryset = User.objects.filter(first_name__startswith='R').only("first_name", "last_name")
The only difference between only and values is only also fetches the id.

6.
from django.db.models import Subquery
>>> users = User.objects.all()
>>> UserParent.objects.filter(user_id__in=Subquery(users.values('id')))

7. FileField
no_files_objects = MyModel.objects.filter( Q(file='') | Q(file=None) )
ADD VALUES IN DATABASE
> python manage.py shell
from App1.models import Publisher
p1 = Publisher(name='Raunak', address='C-24', city='Sgrl', state_province='MP', country='India', website='sanjeevncl68@gmail.com')
p1.save()
p2 = Publisher(name='Saunak', address='28', city='Sgrl', state_province='MP', country='US', website='raunak@gmail.com')
p3 = Publisher(name='Mummy', address='30', city='Ngh', state_province='MP', country='US', website='mummy@gmail.com')
p2.save()
p3.save()
publisher_list = Publisher.objects.all()
publisher_list

from App1.models import Author
a1 = Author(salutation='Mr.', first_name='J.K.', last_name='Rowling', email='jkrowling@gmail.com')
a1.save()
author_list = Author.objects.all()

from App1.models import Book
b1 = Book(title='Harry Potter', publication_date='31-JULY-2005', authors=1, publisher=1)
b1.save()
book_list = Book.objects.all()

FILTERING DATA
Publisher.objects.filter(name='Raunak')
Publisher.objects.order_by("name")
Publisher.objects.filter(name__lte=='')
name__gte, name__gt, name__lt
Publisher.objects.exclude(name = '')
Publisher.objects.exclude(name = '').values_list('name', 'id')
Publisher.objects.values('name', 'id') 
# values_list WILL GIVE A TUPLE OF VALUES



SHOWING TABLES IN THE ADMIN SITE
	1. ADD THESE IN EACH OF THE MODELS IN THE APP
	class Admin:
		pass

	2. ADD THESE IN THE admin.py in the app folder
	from App1.models import Publisher
	from App1.models import Author
	admin.site.register(Publisher)
	admin.site.register(Author)


CHANGE THE HTML TEMPLATE OF ADMIN SITE
i.e. http://127.0.0.1:8000/admin/

Go to DjangoProj/lib/python3.6/site-packages/django/contrib/admin/templates/admin$ 

Change list admin/change_list.html
Add/edit form admin/change_form.html
Delete confirmation admin/delete_confirmation.html
Object history admin/object_history.html

*********
For example, the add/edit form view for a Book model in the books application looks for
templates in this order:
• admin/books/book/change_form.html
• admin/books/change_form.html
• admin/change_form.html

FORM PROCESSING
1. Create View in App1.Views
> Point it to "App1/publisherSearch.html"
2. Add url in DjangoProj.urls
 > from App1.views import search
 > re_path(r'^search/$', search),
 It will not take argument as DjangoProj.App1.views
3. Create html in the templates folder
4. Make folder App1
5. Create searchBase.html in templates/App1 folder
6. Create publisherSearch.html in templates/App1 folder

MAKING THE urls.py MORE READABLE
1. from DjangoProj import views as DjangoProj_views
2. Change re_path(r'^time/$', current_datetime),
TO re_path(r'^time/$', DjangoProj_views.current_datetime),

*********************************************
**************URL REPOSITORY*******************************
**************URL REPOSITORY******************URL REPOSITORY**********************************************************
*****URL REPOSITORY*******************************URL REPOSITORY*********
*********************************************
url(r'^calculator/$', firstDay.as_view()),
re_path(r'^time/$', DjangoProj_views.current_datetime),
re_path(r'^time/plus/(\d{1,2})/$', DjangoProj_views.hours_ahead),



1xx: Informational
These response codes are used only in negotiations between an HTTP client and
server.

2xx: Successful
Whatever state transition the client asked for has happened.

3xx: Redirection
The state transition the client asked for has not happened. But if the client is willing
to make a slightly different HTTP request, that request should do what the client
is asking for.

4xx: Client Error
The state transition the client has asked for has not happened, due to a problem
with the HTTP request. The request was malformed, incoherent, self-contradictory,
or one that the server cannot accept.

5xx: Server Error
The state transition the client has asked for has not happened, due to a problem on
the server side. There’s probably nothing the client can do but wait for the problem
to be fixed.


********EXECUTABLE PYTHON*************************************
*********************************************
*********************************************
pip install pyinstaller
> pyi-makespec filename.py #change the datas key if you 
# want some folder to be directly present in the executable version
> pyinstaller filename.spec || pyinstaller filename.py 
	 
	
	 
***************contrib.auth.models User*************
***************contrib.auth.models User*************
***************contrib.auth.models User*************
***************contrib.auth.models User*************
When should I use a Proxy Model?
You should use a Proxy Model to extend the existing User model when you don’t need to store extra information in the database, 
but simply add extra methods or change the model’s query Manager
	 
You should use a One-To-One Link when you need to store extra information about the existing 
User Model that’s not related to the authentication process. We usually call it a User Profile.

When should I use a Custom User Model Extending AbstractBaseUser?
You should use a Custom User Model when your application have specific requirements in relation to the authentication process. 
For example, in some cases it makes more sense to use an email address as your identification token instead of a username.
	 
When should I use a Custom User Model Extending AbstractUser?
You should use it when you are perfectly happy with how Django handles the authentication process 
and you wouldn’t change anything on it. Yet, you want to add some extra information directly in the 
User model, without having to create an extra class (like in the Option 2).

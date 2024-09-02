from django.urls import path
from .views import index

urlpatterns = [
    path('', index, name='index'),  # Route for the index page
]


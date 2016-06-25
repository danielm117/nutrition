from django.shortcuts import render

# Create your views here.
from django.shortcuts import render
from django.template import loader, Context, RequestContext
#from nutricionApp.models import Profile
from django.http import HttpResponse

import os


# Create your views here.

def home(request):
    template = loader.get_template("home.html")
    context = RequestContext(request)
    return HttpResponse({template.render(context)})

from django.http import HttpResponse

# Create your views here.
def index(request):
    return HttpResponse('Hi, Angie! I love you and this is where you website starts.')

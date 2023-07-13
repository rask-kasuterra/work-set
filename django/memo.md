HttpResponseRedirect の args の 13
= urlpatterns の <int:question_id2>
= results view の引数 question_id2

- view.py
```
def results(request, question_id, question_id2):

def vote(request, question_id):
return HttpResponseRedirect(reverse("polls:results", args=(question.id,13,)))
```

- urls.py
```
urlpatterns = [
    path("<int:question_id>/<int:question_id2>/results/", views.results, name="results"),
]
```

# debug_toolbar の設定

- urls.py
```
import debug_toolbar

if settings.DEBUG:
    urlpatterns += [path('__debug__/', include(debug_toolbar.urls))]
```
-settings.py
```
if DEBUG:
    INSTALLED_APPS += ['debug_toolbar']
    MIDDLEWARE = ['debug_toolbar.middleware.DebugToolbarMiddleware'] + MIDDLEWARE
    INTERNAL_IPS = ['127.0.0.1']

DEBUG_TOOLBAR_CONFIG = {
    "SHOW_TOOLBAR_CALLBACK" : lambda request: True,
}
```
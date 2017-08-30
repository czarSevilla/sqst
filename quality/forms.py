from django import forms

class UploadCsvForm(forms.Form):
    origen = forms.CharField(max_length=50)
    file = forms.FileField()
from django import forms

class MetricsForm(forms.Form):
    project_id = forms.IntegerField(required=True)
    bugs = forms.IntegerField(required=True)
    size = forms.IntegerField(required=True)
    complexity = forms.IntegerField(required=True)
    dup_blocks = forms.IntegerField(required=True)
    vulnerabilities = forms.IntegerField(required=True)
    smells = forms.IntegerField(required=True)
    time = forms.CharField(required=True)
    date = forms.CharField(required=True)
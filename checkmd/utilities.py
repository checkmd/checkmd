import os

def project_path(*args):
    path = os.path.join(os.path.dirname(__file__), ".")
    file_path = os.path.realpath(path)
    return os.path.join(file_path, *args)
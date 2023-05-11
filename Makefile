setup:
	# Create python virtualenv & source it
	python3 -m venv ~/.capstone

install:
	pip install --upgrade pip &&\
		pip install -r requirements.txt

test:
	#test commands can come here
	#python -m pytest -vv --cov=myrepolib tests/*.py
	#python -m pytest --nbval notebook.ipynb
	
lint:
	./hadolint Dockerfile
	pylint --disable=R,C,W1203 app.py

all: install lint test
setup:
	# Create python virtualenv & source it
	python3 -m venv ~/.capstone

install:
	pip install --upgrade pip &&\
		pip install -r requirements.txt
		
validate-circleci:
	# See https://circleci.com/docs/2.0/local-cli/#processing-a-config
	circleci config process .circleci/config.yml
	
run-circleci-local:
	# See https://circleci.com/docs/2.0/local-cli/#running-a-job
	circleci local execute

test:
	#test commands can come here
	#python -m pytest -vv --cov=myrepolib tests/*.py
	#python -m pytest --nbval notebook.ipynb
	
lint:
	hadolint Dockerfile
	pylint --disable=R,C,W1203 **.py
	
start-api:
	python app.py

all: install lint test
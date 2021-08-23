## Runtime image 
FROM rh-registry.gazprom-neft.local:5000/v2/ubi8/python-36:latest
WORKDIR /app
## Install Python requirements
COPY --chown=2001:0 ./requirements.txt requirements.txt
RUN pip install --index=http://nexus.dso.techpark.local/repository/pypi-pypi-external-dso/simple --trusted-host nexus.dso.techpark.local -r ./requirements.txt

# Setting entrypoint for containers
CMD ["python", "/app/app1/appl/test_app.py"]
# Network properties
EXPOSE 8080
# User
USER ROOT

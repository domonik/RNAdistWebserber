# Second image, extends your runtime
FROM domonik95/rnadist:nightly
USER root
# Install gunicorn and celery[redis] into the same conda env
RUN micromamba install -y -n myenv -c conda-forge gunicorn psycopg2 && \
    micromamba run -n myenv pip install --no-cache-dir "celery[redis]"
WORKDIR /app
COPY . .


ENV PATH=/opt/conda/envs/myenv/bin:$PATH
ENV LD_LIBRARY_PATH=/opt/conda/envs/myenv/lib:$LD_LIBRARY_PATH

CMD ["gunicorn", "-b", "0.0.0.0:8050", "app:server"]
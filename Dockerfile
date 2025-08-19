# Second image, extends your runtime
FROM domonik95/rnadist:latest
USER root
# Install gunicorn and celery[redis] into the same conda env
RUN micromamba run -n myenv pip install --no-cache-dir --prefix /opt/conda/envs/myenv gunicorn "celery[redis]"

WORKDIR /app
COPY . .


ENV PATH=/opt/conda/envs/myenv/bin:$PATH
ENV LD_LIBRARY_PATH=/opt/conda/envs/myenv/lib:$LD_LIBRARY_PATH

CMD ["gunicorn", "-b", "0.0.0.0:8050", "app:server"]
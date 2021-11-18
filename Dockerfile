FROM python:3.10.0-alpine AS deps
COPY requirements.txt requirements.txt
RUN apk --update --no-cache add gcc build-base libffi-dev openssl-dev && \
    pip install --no-cache-dir -r requirements.txt

FROM python:3.10.0-alpine AS install
ADD . .
COPY --from=deps /usr/local/lib/python3.8/site-packages /usr/local/lib/python3.8/site-packages
RUN python setup.py install

FROM python:3.10.0-alpine
COPY --from=install /usr/local/lib/python3.8/site-packages /usr/local/lib/python3.8/site-packages
ENTRYPOINT ["/usr/local/bin/python3.8", "-m", "openshift_csr_approver"]

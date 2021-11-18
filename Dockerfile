FROM python:3.8-alpine AS deps
# hadolint ignore=DL3045
COPY requirements.txt requirements.txt
# hadolint ignore=DL3018
RUN apk --update --no-cache add gcc build-base libffi-dev openssl-dev rust cargo && \
    pip install --no-cache-dir -r requirements.txt

FROM python:3.8-alpine AS install
# hadolint ignore=DL3045
COPY . .
COPY --from=deps /usr/local/lib/python3.8/site-packages /usr/local/lib/python3.8/site-packages
RUN apk --update --no-cache add libgcc && \
    python setup.py install

FROM python:3.8-alpine
COPY --from=install /usr/local/lib/python3.8/site-packages /usr/local/lib/python3.8/site-packages
ENTRYPOINT ["/usr/local/bin/python3.8", "-m", "openshift_csr_approver"]

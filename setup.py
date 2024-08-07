#!/usr/bin/env python3
from setuptools import setup, find_packages

from openshift_csr_approver import __version__

setup(
    name='openshift_csr_approver',
    version=__version__,
    author='Adfinis SyGroup AG',
    author_email='support@adfinis-sygroup.ch',
    description='',
    license='GPL3',
    keywords='openshift,csr',
    url='https://github.com/adfinis-sygroup/openshift-csr-approver',
    packages=find_packages(exclude=['*.test']),
    long_description='',
    python_requires='>=3.6',
    install_requires=[
        'pyyaml==6.0.2',
        'kubernetes==30.1.0',
        'pyopenssl==24.2.1'
    ],
    entry_points={
        'console_scripts': [
            'openshift-csr-approver = openshift_csr_approver:main'
        ]
    },
    classifiers=[
        'Development Status :: 3 - Alpha'
    ],
)

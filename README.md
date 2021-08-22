# Arch Linux distro

## Setup

Set up virtual environment

``` bash
python3.9 -m venv venv
```

Activate virtual environment

``` bash
. venv/bin/activate
```

Download required packages

``` bash
pip3 install --upgrade --requirement requirements.txt
```

## Running

Dry run playbook.yml

``` bash
ansible-playbook arch-linux.yml --check
```

Actually run the playbook

``` bast
ansible-playbook arch-linux.yml
```

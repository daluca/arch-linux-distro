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

## Lenovo ThinkPad X1 Carbon (Gen 8)

Arch Linux specifics for [Lenovo ThinkPad X1 Carbon (Gen 8)](https://wiki.archlinux.org/title/Lenovo_ThinkPad_X1_Carbon_(Gen_8)) can be found on the Arch Wiki
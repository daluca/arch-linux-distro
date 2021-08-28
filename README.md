# Arch Linux distro

## Make

Using `make` to run `ansible-playbook`

``` bash
make run
```

Passing `ansible-playbook` flags to `make`

``` bash
make run PLAYBOOK_ARGS="--tags pacman"
```

## Command-line

Using the actual command-line tools to run `ansible-playbook`
### Setup

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

### Running

Dry run distro.yml

``` bash
ansible-playbook distro.yml --check
```

Actually run the playbook

``` bash
ansible-playbook distro.yml
```

Include variables file

``` bash
ansible-playbook distro.yml --extra-vars "@variables.yml"
```

## Lenovo ThinkPad X1 Carbon (Gen 8)

Arch Linux specifics for [Lenovo ThinkPad X1 Carbon (Gen 8)](https://wiki.archlinux.org/title/Lenovo_ThinkPad_X1_Carbon_(Gen_8)) can be found on the Arch Wiki
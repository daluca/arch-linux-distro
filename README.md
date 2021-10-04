# Arch Linux distro

## Command-line

Using `make` to run `ansible-playbook`

```bash
make run
```

Passing `ansible-playbook` flags to `make`

```bash
make run ARGS="--tags pacman"
```

Dry run playbook

```bash
make dry-run
```

### Setup

Set up virtual environment, dev dependencies

```bash
make install
```

### Linting

Lint playbook with `ansible-lint`

```bash
make lint
```

### Formatting

Format playbook with `prettier`

```bash
make format
```

Check file that will be formatted with `prettier`

```bash
make check
```

## Lenovo ThinkPad X1 Carbon (Gen 8)

Arch Linux specifics for [Lenovo ThinkPad X1 Carbon (Gen 8)](<https://wiki.archlinux.org/title/Lenovo_ThinkPad_X1_Carbon_(Gen_8)>) can be found on the Arch Wiki

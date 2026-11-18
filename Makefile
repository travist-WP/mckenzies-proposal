# The first of python, py -3 and python3 that runs as Python 3 (on Windows, python3 is often the Microsoft Store stub).
ENCRYPT_PYTHON ?= $(or $(shell for p in python 'py -3' python3; do $$p -c 'import sys; sys.exit(sys.version_info[0] != 3)' >/dev/null 2>&1 && { echo "$$p"; break; }; done),python3)

encrypt:
	$(ENCRYPT_PYTHON) scripts/encrypt/encrypt_public.py

encrypt-changed:
	$(ENCRYPT_PYTHON) scripts/encrypt/encrypt_public.py --skip-unchanged

encrypt-show:
	$(ENCRYPT_PYTHON) scripts/encrypt/encrypt_public.py --show

release-check:
	$(ENCRYPT_PYTHON) .github/scripts/check-release.py --root public --manifest release-manifest.json

release-plan:
	$(ENCRYPT_PYTHON) .github/scripts/check-release.py --root public --manifest release-manifest.json --plan

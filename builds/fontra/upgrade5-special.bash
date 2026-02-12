rm -rf venv
python3 -m venv venv --prompt=fontra
source venv/bin/activate
pip install -r requirements.txt
pip install -e .
pip install -r requirements-dev.txt
pre-commit install --install-hooks
pytest
npm test

# python3 setup.py develop --user

# sudo python3 setup.py develop

# python3 setup.py build
# sudo python3 setup.py install

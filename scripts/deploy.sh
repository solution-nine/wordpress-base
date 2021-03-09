echo '[Update SSH Agent]================='
ssh-add -K ~/.ssh/example_com_deploy.pem

echo '[Deploy Environment]==============='
export ANSIBLE_VAULT_PASSWORD_FILE=".vault_pass"
trellis deploy $1
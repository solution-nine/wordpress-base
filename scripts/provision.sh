echo '[Update SSH Agent]================='
ssh-add -K ~/.ssh/example_com_deploy.pem

echo '[Provision Environment]============'
export ANSIBLE_VAULT_PASSWORD_FILE=".vault_pass"
trellis provision $1
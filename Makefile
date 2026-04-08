install:
	ansible-galaxy install -r requirements.yml

prepare: install
	ansible-playbook playbook.yml

deploy:
	ansible-playbook -i inventory.ini deploy-redmine.yml --tags deploy --ask-vault-pass
	
monitoring:
	ansible-playbook -i inventory.ini deploy-monitoring.yml --tags monitoring

vault-edit:
	ansible-vault edit group_vars/webservers/vault.yml

vault-view:
	ansible-vault view group_vars/webservers/vault.yml

test:
	@echo "Running tests..."

clean:
	@echo "Clean task"
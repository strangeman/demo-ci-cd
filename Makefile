build-dev:
	docker build -t strangeman/pelican-blog:dev .

push-dev:
	docker push strangeman/pelican-blog:dev

local-dev:
	docker run --rm -ti -p 8000:8000 -w /app -v `pwd`/pelican_configs/:/app -v `pwd`/pelican_content:/app/content python:3 bash -c 'pip3 install -r requirements.txt && pelican -e BIND=0.0.0.0 --autoreload --listen content'

deploy:
	cd .ansible && ansible-galaxy install -r roles/requirements.yml -p roles && \
	ansible-playbook -i inventory/inventory.ini -t deploy --extra-vars blog_commit_hash=$(tag) playbook.yml
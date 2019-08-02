
gen:
	./images/gen_contexts.sh

build: gen build-10 build-11 build-12 build-maste

build-10:
	docker build --tag "xoelabs/dockery-odoo:edge-10.0" "./images/v-10.0/out/base"
	docker build --tag "xoelabs/dockery-odoo:edge-10.0-devops" "./images/v-10.0/out/devops"

build-11:
	docker build --tag "xoelabs/dockery-odoo:edge-11.0" "./images/v-11.0/out/base"
	docker build --tag "xoelabs/dockery-odoo:edge-11.0-devops" "./images/v-11.0/out/devops"

build-12:
	docker build --tag "xoelabs/dockery-odoo:edge-12.0" "./images/v-12.0/out/base"
	docker build --tag "xoelabs/dockery-odoo:edge-12.0-devops" "./images/v-12.0/out/devops"

build-master:
	docker build --tag "xoelabs/dockery-odoo:edge-master" "./images/v-master/out/base"
	docker build --tag "xoelabs/dockery-odoo:edge-master-devops" "./images/v-master/out/devops"

ecsf:
	docker run --rm -v ${PWD}:/app ghcr.io/tinect/shopware-easy-coding-standard:8.1 check --fix \
	--config /tmp/ecs.php \
	${TARGET}

install-step:
	docker run \
		--rm -v "/Users/sergei/projects/bitrix_demo:/app" \
		-w /app php:8.1-cli php bitrix/modules/main/install/wizard/wizard.php
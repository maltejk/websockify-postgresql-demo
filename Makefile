prepare:
	helm repo add maltejk https://maltejk.github.io/helm-charts

run:
	helm upgrade --install --values values-websockify.yaml websockify maltejk/websockify
	helm upgrade --install --values values-unwebsockify.yaml unwebsockify maltejk/unwebsockify
	helm upgrade --install --values values-postgresql.yaml postgresql bitnami/postgresql

clean:
	helm uninstall postgresql || true
	helm uninstall unwebsockify || true
	helm uninstall websockify || true

run-clean: clean run


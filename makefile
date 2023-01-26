run-installation:
	helm --debug upgrade -n ar-helm-crds --install --create-namespace installation-test ./approaches/installation

remove-installation:
	helm --debug uninstall -n ar-helm-crds installation-test

clean-installation:
	-$(MAKE) remove-installation
	kubectl delete crds research-objects.research.arlon.dev

run-templates-combined:
	helm --debug upgrade -n ar-helm-crds --install --create-namespace templates-combined-test ./approaches/templates-combined

remove-templates-combined:
	echo "Installation should not be possible, deletion should not be needed. Message me if it is."

clean-templates-combined:
	echo "Nothing to clean"

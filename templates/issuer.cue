package templates

import (
	issuerv1 "cert-manager.io/issuer/v1"
	timoniv1 "timoni.sh/core/v1alpha1"
)


#Issuer: issuerv1.#Issuer & {
	#Meta: timoniv1.#Metadata
	metadata: {
		name:      #Meta.name
		namespace: #Meta.namespace
		labels:    #Meta.labels
		if #Meta.annotations != _|_ {
			annotations: #Meta.annotations
		}
	}
}

#LetsEncrypt: #Issuer & {
	#config: #Config
	#Meta: #config.metadata
	spec: {
		acme: {
			if #config.production {
				server: "https://acme-v02.api.letsencrypt.org/directory"
			}
			if !#config.production {
				server: "https://acme-staging-v02.api.letsencrypt.org/directory"
			}
			privateKeySecretRef: {
				name: #Meta.name
			}
		}
	}
}



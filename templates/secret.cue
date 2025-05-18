package templates

import (
	timoniv1 "timoni.sh/core/v1alpha1"
)

#Secret: timoniv1.#ImmutableConfig & {
	#config: #Config
	#Meta: #config.metadata
	#Kind: timoniv1.#SecretKind
	#Data: {}
}

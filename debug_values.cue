@if(debug)

package main

values: {
	production: false
	email: "debug@example.com"
	solvers: [{
		dns01: {
			cloudDNS: {
				project: ""
				serviceAccountSecretRef: {
					name: ""
					key: ""
				}
			}
		}
	}]
}

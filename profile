
eval "$(/opt/homebrew/bin/brew shellenv)"

alias ssh=$HOME/sssh/sssh

set_root_cert () {
	# configuration settings for OCI CLI
	# export no_proxy=".skt-pca-9.au.oracle.com,$no_proxy"
	CA_ROOT_CERT="$HOME/.oci/pcax9.cert"
	echo "Checking for ${CA_ROOT_CERT}"
	[ -f $CA_ROOT_CERT ] && export OCI_CLI_CERT_BUNDLER=$CA_ROOT_CERT && export REQUESTS_CA_BUNDLE=$CA_ROOT_CERT && echo "... found."
}
set_root_cert


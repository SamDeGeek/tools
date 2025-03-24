# Add this line to your profile
# [ -f $HOME/tools/profile ] && source $HOME/tools/profile


# configure SSH wrapper
alias ssh=$HOME/tools/bin/sssh
export PATH=$HOME/tools/bin:$PATH


# check and configure proxy server
check_proxy () {
	proxy_host=www-proxy.au.oracle.com
	proxy_port=80
	proxy_protocol=http

	proxy_url="${proxy_protocol}://${proxy_host}:${proxy_port}"
	echo "Looking for $proxy_host"
	ping -c 3 $proxy_host 1> /dev/null 2>&1
	if [ $? -eq 0 ]; then
		echo "Setting proxy $proxy_url"
		export http_proxy=$proxy_url
		export https_proxy=$proxy_url
		export no_proxy=localhost,127.0.0.1,signon.oracle.com,identity.oraclecloud.com
	else
		echo "No proxy found."
		unset http_proxy
		unset https_proxy
		unset no_proxy
	fi
}
check_proxy


# check and configure root certificates for local PCA X9
set_root_cert () {
	# configuration settings for OCI CLI
	# export no_proxy=".skt-pca-9.au.oracle.com,$no_proxy"
	CA_ROOT_CERT="$HOME/.oci/pcax9.cert"
	echo "Checking for ${CA_ROOT_CERT}"
	[ -f $CA_ROOT_CERT ] && export OCI_CLI_CERT_BUNDLER=$CA_ROOT_CERT && export REQUESTS_CA_BUNDLE=$CA_ROOT_CERT && echo "... found."
}
# set_root_cert

set_git () {
	git config --global name samktan
	git config --global email samktan@gmail.com
	git config --global credential.helper store
}
set_git


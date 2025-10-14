# Add this line to your profile
# [ -f $HOME/tools/profile ] && source $HOME/tools/profile


# configure SSH wrapper
alias ssh=$HOME/tools/sssh
export PATH=$HOME/tools:$PATH


# check and configure proxy server
set_proxy () {
	proxy_host=www-proxy.us.oracle.com
	proxy_port=80
	proxy_protocol=http
	[ $# -ge 1 ] && proxy_host="$1"

	proxy_url="${proxy_protocol}://${proxy_host}:${proxy_port}"
	echo "Looking for ${proxy_host}"
	ping -c 3 ${proxy_host} 1> /dev/null 2>&1
	if [ $? -eq 0 ]; then
		echo "Setting proxy ${proxy_url}"
		export http_proxy=${proxy_url}
		export https_proxy=${proxy_url}
		export no_proxy="localhost,127.0.0.1,signon.oracle.com,identity.oraclecloud.com"
	else
		echo "No proxy found."
		unset all_proxy
		unset http_proxy
		unset https_proxy
		unset no_proxy
	fi
}
set_proxy


# check and configure root certificates for local PCA X9
set_root_cert () {
	CA_ROOT_CERT="${HOME}/.oci/pcax9.cert"
	echo "Checking for ${CA_ROOT_CERT}"
	if [ -f ${CA_ROOT_CERT} ]; then
		echo "... found."
		export OCI_CLI_CERT_BUNDLER=${CA_ROOT_CERT}
		export REQUESTS_CA_BUNDLE=${CA_ROOT_CERT}
		export no_proxy=".skt-pca-9.au.oracle.com,${no_proxy}"
	fi
}
# set_root_cert


# set git user information
set_git () {
	git config --global user.name samktan
	git config --global user.email samktan@gmail.com
	git config --global credential.helper store
}
# set_git


# check for tmux and if not already in a tmux session
set_tmux () {
	TMUXCMD="$(which tmux)"
	[ -z "${TMUX}" ] && [ -x "${TMUXCMD}" ] && ${TMUXCMD} new -A -s default
}
set_tmux


# check for odacli command and set completions
set_odacli () {
	ODACLI="$(which odacli)"
	[ -x "${ODACLI}" ] && source ./odacli
}
set_odacli

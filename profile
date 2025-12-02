
# sam.k.tan@oracle.com

# Add this line to your profile
# [ -f $HOME/tools/profile ] && source $HOME/tools/profile


# configure SSH wrapper
alias ssh=$HOME/tools/sssh
export PATH=$HOME/tools:$PATH


# check and configure proxy server
 proxy_ () {
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
 proxy_


# check and configure root certificates for local PCA X9
rootcert_ () {
	CA_ROOT_CERT="${HOME}/.oci/pcax9.cert"
	echo "Checking for ${CA_ROOT_CERT}"
	if [ -f ${CA_ROOT_CERT} ]; then
		echo "... found."
		export OCI_CLI_CERT_BUNDLER=${CA_ROOT_CERT}
		export REQUESTS_CA_BUNDLE=${CA_ROOT_CERT}
		export no_proxy=".skt-pca-9.au.oracle.com,${no_proxy}"
	fi
}
rootcert_


# set git user information
git_ () {
	git config --global user.name samktan
	git config --global user.email samktan@gmail.com
	git config --global credential.helper store
	git config --global push.default simple
}
git_


# check for tmux and if not already in a tmux session
tmux_ () {
	TMUXCMD="$(which tmux)"
	if [ -z "${TMUX}" ] && [ -x "${TMUXCMD}" ]; then
		${TMUXCMD} -V
		${TMUXCMD} ls
		echo "To connect to default session, use ${TMUXCMD} new -A -s default"
	fi
}
tmux_


# check for odacli command and set completions
odacli_ () {
	ODACLI="$(which odacli)"
	[ -x "${ODACLI}" ] && source ./odacli-completions
}
odacli_

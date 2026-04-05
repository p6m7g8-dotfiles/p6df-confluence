# shellcheck shell=bash
######################################################################
p6df::modules::confluence::deps() {
  ModuleDeps=(
    p6m7g8-dotfiles/p6df-atlassian
    p6m7g8-dotfiles/p6df-js
  )
}

######################################################################
p6df::modules::confluence::aliases::init() {

  local _module="$1"
  local _dir="$2"
  p6_alias "ccli" "confluence"

  p6_return_void
}

######################################################################
p6df::modules::confluence::langs() {

  p6_js_npm_global_install "confluence-cli"

  p6_return_void
}

######################################################################
p6df::modules::confluence::mcp() {

  p6_js_npm_global_install "confluence-mcp-server"

  p6df::modules::anthropic::mcp::server::add "confluence" "npx" "-y" "confluence-mcp-server"
  p6df::modules::openai::mcp::server::add "confluence" "npx" "-y" "confluence-mcp-server"

  p6_return_void
}

######################################################################
p6df::modules::confluence::profile::mod() {

  p6_return_words 'confluence' '$CONFLUENCE_DOMAIN' '$CONFLUENCE_EMAIL' '$CONFLUENCE_API_TOKEN'
}
######################################################################
#<
#
# Function: p6df::modules::confluence::deps()
#
#>
######################################################################
#<
#
# Function: p6df::modules::confluence::langs()
#
#>
######################################################################
#<
#
# Function: p6df::modules::confluence::aliases::init()
#
#>
######################################################################
#<
#
# Function: p6df::modules::confluence::mcp()
#
#>
######################################################################
#<
#
# Function: words confluence $CONFLUENCE_DOMAIN $CONFLUENCE_EMAIL $CONFLUENCE_API_TOKEN = p6df::modules::confluence::profile::mod()
#
#  Returns:
#	words - confluence $CONFLUENCE_DOMAIN $CONFLUENCE_EMAIL $CONFLUENCE_API_TOKEN
#
#  Environment:	 CONFLUENCE_DOMAIN CONFLUENCE_EMAIL CONFLUENCE_API_TOKEN
#>

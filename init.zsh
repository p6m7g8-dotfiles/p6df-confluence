# shellcheck shell=bash
######################################################################
#<
#
# Function: p6df::modules::confluence::deps()
#
#>
######################################################################
p6df::modules::confluence::deps() {
  ModuleDeps=(
    p6m7g8-dotfiles/p6df-atlassian
    p6m7g8-dotfiles/p6df-js
  )
}

######################################################################
#<
#
# Function: p6df::modules::confluence::langs()
#
#>
######################################################################
p6df::modules::confluence::langs() {

  p6_js_npm_global_install "confluence-cli"

  p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::confluence::aliases::init()
#
#>
######################################################################
p6df::modules::confluence::aliases::init() {

  local _module="$1"
  local _dir="$2"
  p6_alias "ccli" "confluence"

  p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::confluence::mcp()
#
#>
######################################################################
p6df::modules::confluence::mcp() {

  p6_js_npm_global_install "confluence-mcp-server"

  p6df::modules::anthropic::mcp::server::add "confluence" "npx" "-y" "confluence-mcp-server"
  p6df::modules::openai::mcp::server::add "confluence" "npx" "-y" "confluence-mcp-server"

  p6_return_void
}

######################################################################
#<
#
# Function: words confluence $CONFLUENCE_API_TOKEN = p6df::modules::confluence::profile::mod()
#
#  Returns:
#	words - confluence $CONFLUENCE_API_TOKEN
#
#  Environment:	 CONFLUENCE_API_TOKEN
#>
######################################################################
p6df::modules::confluence::profile::mod() {

  p6_return_words 'confluence' "$"
}

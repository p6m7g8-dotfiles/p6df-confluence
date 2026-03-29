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

  p6_alias "ccli" "confluence"

  p6_return_void
}

######################################################################
#<
#
# Function: str str = p6df::modules::confluence::prompt::mod()
#
#  Returns:
#	str - str
#
#  Environment:	 CONFLUENCE_API_TOKEN CONFLUENCE_DOMAIN CONFLUENCE_EMAIL P6_DFZ_PROFILE_CONFLUENCE
#>
######################################################################
p6df::modules::confluence::prompt::mod() {
  local str=""
  local profile="$P6_DFZ_PROFILE_CONFLUENCE"
  local domain="$CONFLUENCE_DOMAIN"
  local email="$CONFLUENCE_EMAIL"
  local token="$CONFLUENCE_API_TOKEN"

  if p6_string_blank_NOT "$profile"; then
    str="confluence:\t  ${profile}:"
    if p6_string_blank_NOT "$domain"; then
      str=$(p6_string_append "$str" "$domain" " ")
    fi
    if p6_string_blank_NOT "$email"; then
      str=$(p6_string_append "$str" "$email" "/")
    fi
    if p6_string_blank_NOT "$token"; then
      str=$(p6_string_append "$str" "api" "/")
    fi
  fi

  p6_return_str "$str"
}

######################################################################
#<
#
# Function: p6df::modules::confluence::profile::on(profile, code)
#
#  Args:
#	profile -
#	code - shell code block (export CONFLUENCE_DOMAIN=... CONFLUENCE_EMAIL=... CONFLUENCE_API_TOKEN=...)
#
#  Environment:	 CONFLUENCE_API_TOKEN CONFLUENCE_DOMAIN CONFLUENCE_EMAIL P6_DFZ_PROFILE_CONFLUENCE
#>
######################################################################
p6df::modules::confluence::profile::on() {
  local profile="$1"
  local code="$2"

  p6_run_code "$code"

  p6_env_export "P6_DFZ_PROFILE_CONFLUENCE" "$profile"

  p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::confluence::profile::off(code)
#
#  Args:
#	code - shell code block previously passed to profile::on
#
#  Environment:	 CONFLUENCE_API_TOKEN CONFLUENCE_DOMAIN CONFLUENCE_EMAIL P6_DFZ_PROFILE_CONFLUENCE
#>
######################################################################
p6df::modules::confluence::profile::off() {
  local code="$1"

  p6_env_unset_from_code "$code"
  p6_env_export_un P6_DFZ_PROFILE_CONFLUENCE

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

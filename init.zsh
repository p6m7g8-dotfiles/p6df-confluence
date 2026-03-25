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
    p6m7g8-dotfiles/p6df-js
    langpingxue/atlassian-skills
  )
}

######################################################################
#<
#
# Function: p6df::modules::confluence::home::symlinks()
#
#  Environment:	 HOME P6_DFZ_SRC_DIR
#>
######################################################################
p6df::modules::confluence::home::symlinks() {

  p6_file_symlink "$P6_DFZ_SRC_DIR/langpingxue/atlassian-skills"  "$HOME/.claude/skills/atlassian-skills"

  p6_return_void
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
#  Environment:	 ATLASSIAN_API_TOKEN ATLASSIAN_EMAIL ATLASSIAN_SITE CONFLUENCE_API_TOKEN CONFLUENCE_DOMAIN CONFLUENCE_EMAIL P6_DFZ_PROFILE_CONFLUENCE
#>
######################################################################
p6df::modules::confluence::prompt::mod() {
  local str=""
  local profile="${P6_DFZ_PROFILE_CONFLUENCE:-}"
  local site="${CONFLUENCE_DOMAIN:-${ATLASSIAN_SITE:-}}"
  local email="${CONFLUENCE_EMAIL:-${ATLASSIAN_EMAIL:-}}"
  local token="${CONFLUENCE_API_TOKEN:-${ATLASSIAN_API_TOKEN:-}}"

  if p6_string_blank_NOT "$profile"; then
    str="confluence:\t  ${profile}:"
    if p6_string_blank_NOT "$site"; then
      str=$(p6_string_append "$str" "$site" " ")
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
#	code -
#
#  Environment:	 ATLASSIAN_API_TOKEN ATLASSIAN_EMAIL ATLASSIAN_SITE CONFLUENCE_API_TOKEN CONFLUENCE_DOMAIN CONFLUENCE_EMAIL P6_DFZ_PROFILE_CONFLUENCE
#>
######################################################################
p6df::modules::confluence::profile::on() {
  local profile="$1"
  local code="$2"

  p6_run_code "$code"

  local site="${CONFLUENCE_DOMAIN:-${ATLASSIAN_SITE:-}}"
  local email="${CONFLUENCE_EMAIL:-${ATLASSIAN_EMAIL:-}}"
  local token="${CONFLUENCE_API_TOKEN:-${ATLASSIAN_API_TOKEN:-}}"

  # confluence-cli expects a bare host for domain values.
  local domain="$site"
  domain="${domain#http://}"
  domain="${domain#https://}"
  domain="${domain%%/*}"

  p6_env_export "P6_DFZ_PROFILE_CONFLUENCE" "$profile"

  p6_env_export "ATLASSIAN_SITE" "$site"
  p6_env_export "ATLASSIAN_EMAIL" "$email"
  p6_env_export "ATLASSIAN_API_TOKEN" "$token"

  p6_env_export "CONFLUENCE_DOMAIN" "$domain"
  p6_env_export "CONFLUENCE_EMAIL" "$email"
  p6_env_export "CONFLUENCE_API_TOKEN" "$token"

  p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::confluence::profile::off()
#
#  Environment:	 ATLASSIAN_API_TOKEN ATLASSIAN_EMAIL ATLASSIAN_SITE CONFLUENCE_API_TOKEN CONFLUENCE_DOMAIN CONFLUENCE_EMAIL P6_DFZ_PROFILE_CONFLUENCE
#>
######################################################################
p6df::modules::confluence::profile::off() {

  p6_env_export_un P6_DFZ_PROFILE_CONFLUENCE

  p6_env_export_un ATLASSIAN_SITE
  p6_env_export_un ATLASSIAN_EMAIL
  p6_env_export_un ATLASSIAN_API_TOKEN

  p6_env_export_un CONFLUENCE_DOMAIN
  p6_env_export_un CONFLUENCE_EMAIL
  p6_env_export_un CONFLUENCE_API_TOKEN

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

  p6_return_void
}

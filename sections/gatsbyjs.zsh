#
# Gatsby.js
#
# Build blazing fast, modern apps and websites with React
# Link: https://github.com/gatsbyjs/gatsby

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_GATSBYJS_SHOW="${SPACESHIP_GATSBYJS_SHOW=true}"
SPACESHIP_GATSBYJS_PREFIX="${SPACESHIP_GATSBYJS_PREFIX="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
SPACESHIP_GATSBYJS_SUFFIX="${SPACESHIP_GATSBYJS_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_GATSBYJS_SYMBOL="${SPACESHIP_GATSBYJS_SYMBOL="Gatsby.js v"}"
SPACESHIP_GATSBYJS_COLOR="${SPACESHIP_GATSBYJS_COLOR="055"}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

# Show current version of GATSBYJS Python, including system.
spaceship_gatsbyjs() {
  [[ $SPACESHIP_GATSBYJS_SHOW == false ]] && return

  # Show Gatsby.js version only for Gatsby.js-specific folders
  [[ -f gatsby-browser.js || -f gatsby-node.js || -f gatsby-ssr.js || -f node_modules/gatsby/package.json ]] || return

  local gatsbyjs_version=$(grep '"version":' ./node_modules/gatsby/package.json | cut -d\" -f4)
  [[ $gatsbyjs_version == "system" || $gatsbyjs_version == "gatsby" ]] && return

  spaceship::section \
    "$SPACESHIP_GATSBYJS_COLOR" \
    "$SPACESHIP_GATSBYJS_PREFIX" \
    "${SPACESHIP_GATSBYJS_SYMBOL}${gatsbyjs_version}" \
    "$SPACESHIP_GATSBYJS_SUFFIX"
}

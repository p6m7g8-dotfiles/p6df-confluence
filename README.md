# P6's POSIX.2: p6df-confluence

## Table of Contents

- [Badges](#badges)
- [Summary](#summary)
- [Contributing](#contributing)
- [Code of Conduct](#code-of-conduct)
- [Usage](#usage)
  - [Aliases](#aliases)
  - [Functions](#functions)
- [Hierarchy](#hierarchy)
- [Author](#author)

## Badges

[![License](https://img.shields.io/badge/License-Apache%202.0-yellowgreen.svg)](https://opensource.org/licenses/Apache-2.0)

## Summary

p6df module for Confluence: CLI tools (`confluence-cli`), profile switching
(`CONF_USERNAME`, `CONF_PASSWORD`, `CONF_URL`), and MCP server
(`mcp-atlassian` via brew) for AI-driven wiki page management.

## Contributing

- [How to Contribute](<https://github.com/p6m7g8-dotfiles/.github/blob/main/CONTRIBUTING.md>)

## Code of Conduct

- [Code of Conduct](<https://github.com/p6m7g8-dotfiles/.github/blob/main/CODE_OF_CONDUCT.md>)

## Usage

### Aliases

- `ccli` -> `confluence`

### Functions

#### p6df-confluence

##### p6df-confluence/init.zsh

- `p6df::modules::confluence::aliases::init()`
- `p6df::modules::confluence::deps()`
- `p6df::modules::confluence::langs()`
- `p6df::modules::confluence::mcp()`
- `p6df::modules::confluence::profile::off()`
- `p6df::modules::confluence::profile::on(profile, env_or_site, [email=], [token=])`
  - Args:
    - profile
    - env_or_site
    - OPTIONAL email - []
    - OPTIONAL token - []
- `str str = p6df::modules::confluence::prompt::mod()`

## Hierarchy

```text
.
├── init.zsh
└── README.md

1 directory, 2 files
```

## Author

Philip M. Gollucci <pgollucci@p6m7g8.com>

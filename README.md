# aurora

A comptime terminal string styling library for zig.

> [!NOTE]
> This repository is heavily inspired by [tr1ckydev/chameleon](https://github.com/tr1ckydev/chameleon).

## Installation

## Usage

Aurora is a **Runtime** string styler.

## Documentation

Check out the full documentation [here](https://github.com/gandalf-le-dev/aurora/blob/main/DOCUMENTATION.md).

## `NO_COLOR` support

> According to [no-color.org](https://no-color.org/), *"Command-line software which adds ANSI color to its output by default should check for a `NO_COLOR` environment variable that, when present and not an empty string (regardless of its value), prevents the addition of ANSI color."*
>

Aurora supports this standard only in it's **Runtime API** by detecting the presence of the *NO_COLOR* environment variable (regardless of it's value), if present disables any ANSI colors or styles, and can also be configured to not do so if you want to implement a different way of detection, although highly not recommended.

## License

This repository uses the MIT License. Check [LICENSE](https://github.com/gandalf-le-dev/aurora/blob/main/LICENSE) for full license text.

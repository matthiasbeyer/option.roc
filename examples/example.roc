app "example"
    packages {
        cli: "https://github.com/roc-lang/basic-cli/releases/download/0.8.1/x8URkvfyi9I0QhmVG98roKBUs_AZRkLFwFJVJ3942YA.tar.br",
        option: "../package/main.roc",
    }
    imports [
        cli.Stdout,
        cli.Stderr,
        option.Option
    ]
    provides [main] to cli


main =
    optional_one = Some 1

    is_something = isSome optional_one

    Stdout.line "This is something: \(is_something)

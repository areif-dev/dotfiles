# Principles

- Write type-safe code at all times. Leverage the type system of the given language to its fullest. Prefer creating custom types for parsing and validating inputs.
- Write meaningful unit tests for your functions.
    - Design tests adversarially: assume the function under test is poorly designed and try to break it.
    - Do not write tests that are simply intended to pass a test run.
- Minimize the number of project dependencies.
    - Exceptions may be made for dependencies that provide substantial functionality while also being cumbersome to maintain within the scope of the current project. For example, the Rust `serde` crate provides significantly useful features, but an equivalent would not make sense to maintain by hand for most projects.
- Verify before finishing.
    - Run the program's type checker and tests before reporting work as complete.

# Comments

- Document functions using the language's standard documentation format (e.g. rustdoc for Rust, JSDoc for JavaScript).
- Document function arguments, return types, and error states.
- Provide examples of how to use the functions.
- The only exception to these rules is for very simple functions whose use is obvious (e.g. getters and setters).
    - In these cases, stick to a one-line comment adding a bit of additional context or guidance. 
- Avoid using in-line comments. If the code you write needs explaining in-line, then rewrite the code so it is more understandable. 

# Git

- Never commit to git unless explicitly asked to do so.
- You may use readonly git commands at any time. 

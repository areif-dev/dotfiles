# Principles 

- Make sure you are writing type safe code at all times. 
    - In service to the previous principle, leverage the type system of the given language to the best of your ability. Prefer creating custom types for parsing and validating inputs. 
- Write meaningful unit tests for your functions. 
    - Unit tests should be designed in an adversarial way. You should assume that the functions you are testing were poorly designed, and your tests should attempt to break them. 
    - Do no design unit tests that are simply intended to pass a test run
- Prefer limiting the number of dependencies of the project
    - Exceptions may be made for dependencies that provide substantial functionality while also being cumbersome to maintain within the scope of the current project. Eg. the serde rust crate provides significantly useful features, but would not make sense to maintain for most of my projects.

# Comments

- Functions should be documented with the languages standard documentation format. Eg. Rust functions should be documented with rustdoc. Javascript should be documented with jsdoc. Etc. 
- Document the functions arguments, returns types, error states
- Provide examples of how to use the functions 
- The only exceptions for these rules should be for very simple functions whose use should be very obvious. Eg. getter and setter functions 

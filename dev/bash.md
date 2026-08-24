# Bash Cheat Sheet

## Quotes and Variables

- Single quotes ('') do NOT expand variables: ' $var ' will not replace $var with its value.
- Double quotes ("") DO expand variables: "$var" will be replaced by its value.
- "$var" and "${var}" are the same; use braces when appending text directly after a variable (e.g. `${var}ing`) so the `}` separates the variable name from the appended text.

## Shebang and if example

```
#!/bin/bash
if [[ "${UID}" -eq 0 ]]; then
  echo "You are root."
else
  echo "You are not"
fi
```

- Numeric comparison operators (inside [[ ]]):
  - -eq : equal
  - -ne : not equal
  - -lt : less than
  - -le : less or equal
  - -gt : greater than
  - -ge : greater or equal

## Exit codes

- `exit 1` — return code 1 (non-zero usually indicates failure)
- `?` (e.g. `${?}`) — last command return code

Example:
```
if [[ "${?}" -ne 0 ]]; then
  echo "Last command failed"
fi
```

## String comparison

- `=` and `==` can be used for string comparison inside [[ ]]. Note: `=` is also used for assignment in other contexts, but inside [[ ]] it's a comparison operator.

Example:
```
if [[ "${USER}" = "ABC" ]]; then
  echo "User is ABC"
fi
```

## Read input

```
read -p 'Enter username: ' USER_NAME
# Shows the prompt and stores typed text in USER_NAME
```

## Useful commands

- `which head` — show the path of the `head` executable
- `basename ~/abc/file.txt` — prints `file.txt`
- Command substitution: `echo "You used $(dirname "~/abc/file.txt")"`
  - The `dirname` output is substituted into the command
- `$0` — name of the script
- `$1`, `$2`, ... — first, second, ... positional parameters passed to the script
- `$@` — list of all positional parameters starting from $1

## Loops

For loop example:
```
for param in "${@}"; do
  echo "${param}"
done
```

While loop example:
```
X=1
while [[ "${X}" -eq 1 ]]; do
  echo "${X}"
  # modify X to eventually break the loop
  X=0
done
```

## Command substitution and examples

- `$(command)` or backticks `` `command` `` — substitute command output into a string
- Example: `echo "Files: $(ls -1)"`

## Tips

- Prefer `[[ ... ]]` over `[ ... ]` for safer tests and fewer quoting pitfalls.
- Quote variable expansions (e.g., `"${var}"`) to avoid word-splitting and globbing issues.
- Use braces `${var}` when concatenating text after a variable.


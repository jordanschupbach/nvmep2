
default:
  cmake -S ./playground/cpp/ -B build/ && cmake --build build/ && ./build/hello


jq:
    nix develop . --command bash -c "find ./build -name 'compile_commands.json' -exec cat {} + | jq -s add > compile_commands.json"

run:
  nix run .

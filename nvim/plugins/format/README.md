## What Is This?
Executables go in `executables/`, and languages go in the folder itself. This is so a language can "inherit" from a executable rather than copy/paste code everywhere. This way, multiple formatters can be used at once (e.g. using isort with black).

## Getting an executable
For example, see isort. isort is simple, it wants:
`isort <filepath>` and it'll write your files. However, some formatters won't lint them unless you explicitly tell them to, like prettier. So to make prettier work, you need to pass `--write` to it.

### To STDIN or not to STDIN
If you do, provide the path via `util.get_current_buffer_file_path()`. If not, it should automatically read the file content from the buffer and swap out the changes

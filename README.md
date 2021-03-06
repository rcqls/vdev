## vdev.sh script: a development v version

Bash script behaving like a development `v` version running/compiling `v` files using imported modules in official version or development version

### Installation and configuration

1. Clone this directory or donwload the [vdev.sh](https://raw.githubusercontent.com/rcqls/vdev/master/vdev.sh) `vdev.sh` bash script
1. Create a directory `~/vdevmodules` similar to `~/.vmodules` but for testing development repo.
1. Update `VDEVMODULES` and `VEXE` (default: `~/vlang/v/v`) environment variables inside `vdev.sh` if necessary
1. `chmod u+x vdev.sh`
1. Link `vdev.sh` script as you wish. It could also serve of symlinking version of the `v` binary (ex: `ln -s vdev.sh ~/bin/vv` to have both `v` binary and `vv` development version)

### Feature

1. A development mode to test modules in development is provided: 
    * **normal mode**: `vdev.v` (or the corresponding `~/bin/vv` symlink if created) behaves the same as the `v` binary except the following completion about the `v` file path to run when starting with `%`.
    * **development mode**: `vdev.sh -dev` ( or `vv -dev`) allows us to run/compile v file by importing modules installed inside `~/vdevmodules` skipping the modules usually installed inside `~/.vmodules`.
1. Path of a `v` file to run when starting with `%`, such as `%<v_fullpath_file>.v`, is prepended with the folder containing the `v` modules:

* `~/.vmodules/` in normal mode
* `~/vdevmodules/` in devel mode, i.e. with `-dev` option 
### Use case

Here it is supposed that `~/bin/vv` is the symlink of `vdev.sh` and `~/bin` part of `$PATH` such that `type vv` is `~/bin/vv`. After installing official version `ui` (`v install ui`) and a development version of `ui` inside `~/vdevmodules` (`cd ~/vdevmodules;git clone -b devel17 https://github.com/rcqls/ui`). You can then run `ui/examples/users_resizable.v` in the two modes: 

1. **normal mode**: `vv run %ui/examples/users_resizable.v` (equivalent to `vv run ~/.vmodules/ui/examples/users_resizable.v`) using the official `ui` module inside `~/.vmodules`
1. **development mode**: `vv -dev run %ui/examples/users_resizable.v` (equivalent to `vv -dev run ~/vdevmodules/ui/examples/users_resizable.v`) using the development module `~/vdevmodules`.


**Remark**: tested on macOS, linux and Windows10 (using GitBash)

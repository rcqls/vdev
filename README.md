## First protoype to execute v with devel version of packages

### Config

1. clone this directory or donwload the [vdev.sh](https://raw.githubusercontent.com/rcqls/vdev/master/vdev.sh) `vdev.sh` bash script
1. Create a directory `~/vdevmodules` similar to `~/.vmodules` but for testing development repo.
1. Update `VDEVMODULES` and `VEXE` (default: `~/vlang/v/v`) environment variables inside `vdev.sh` if necessary
1. `chmod u+x vdev.sh`
1. Link `vdev.sh` script as you wish. It could also serve of symlink (ex: `ln -s vdev.sh ~/bin/v`)

### Feature

1. A development mode to test module in development is provided: 
    * in normal mode, `vdev.v` (or the corresponding `~/bin/v` symlink if created) behaves the same as the `v` binary except the following completion about the `v` file path to run when starting with `%`.
    * in development mode, the modules installed inside `~/vdevmodules` are choosen before modules usually installed inside `~/.vmodules`.
1. Path of a `v` file to run when starting with `%`, such as `%<v_fullpath_file>.v`, is prepended with the folder containing the `v` modules:

* `~/.vmodules/` in normal mode
* `~/vdevmodules/` in devel mode, i.e. with `-dev` option 
### Use case

1. `v install ui` # official v ui module installed inside `~/.vmodules/ui`
1. `cd ~/vdevmodules;git clone -b devel12 https://github.com/rcqls/ui` # rcqls/devel12 branch of v ui installed inside `~/vdevmodules/ui`.
1. `v run %ui/examples/users_resizable.v`
1. `v -dev run %ui/examples/users_resizable.v`
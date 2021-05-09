## First protoype to execute v with devel version of packages

### Config

1. clone this directory or donwload the [vdev.sh](https://raw.githubusercontent.com/rcqls/vdev/master/vdev.sh) `vdev.sh` bash script
1. Create a directory `~/vdevmodules` similar to `~/.vmodules` but for testing development repo.
1. Update `VDEVMODULES` and `VEXE` (default: `~/vlang/v/v`) environment variables inside `vdev.sh` if necessary
1. `chmod u+x vdev.sh`
1. Link `vdev.sh` script as you wish. It could also serve of symlink (ex: `ln -s vdev.sh ~/bin/v`)

### Example

1. `v install ui` # official v ui module
1. `cd ~/vdevmodules;git clone -b devel12 https://github.com/rcqls/ui` # rcqls/devel12 branch of v ui.
1. `v run %ui/examples/users_resizable.v`
1. `v -dev run %ui/examples/users_resizable.v`
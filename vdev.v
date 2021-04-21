import os

fn path_dev() string {
	paths_dev_file := os.join_path(os.vmodules_dir(),".paths_dev")
	mut paths_dev := "|"
	if os.exists(paths_dev_file) {
		content := os.read_file(paths_dev_file) or {panic(err.msg)}
		if content != "" {
			paths_dev += content.trim_space()
			paths_dev += "|"
		}
	} else {
		os.create(paths_dev_file) or {panic(err.msg)}
	}
	return '-path "@vlib${paths_dev}@vmodules"'
}

fn main() {
	mut args := os.args.clone()
	if args.len == 2 && args[1] == "paths" {
		// TODO: possibly a ui interface to manage .paths_dev file
		println("paths_dev....")
	} else {
		vexe := os.find_abs_path_of_executable("v") or {panic(err.msg)}
		cmd := "$vexe ${path_dev()} ${args[1..].join(' ')}"
		$if cmd ? {
			println(cmd)
		}
		os.execute_or_panic(cmd)
	}
}
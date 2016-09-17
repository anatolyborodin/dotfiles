#!/bin/sh

set -e

set_dir_vars()
{
	readonly REPO="$(dirname "$(realpath "${0}")")"
	readonly DESTDIR="${HOME?}"
}

install_file()
{
	local SRC DST
	SRC="${REPO?}/${1?}"
	DST="${DESTDIR?}/${2?}"
	echo "${SRC} -> ${DST}"
	mkdir -p "$(dirname "${DST}")"
	rm -rf "${DST}"
	cp "${SRC}" "${DST}"
}

main()
{
	set_dir_vars
	install_file "git/config" ".config/git/config"
}

main

#!/bin/sh

set -e

set_globals()
{
	readonly REPO="$(dirname "$(realpath "${0}")")"
	readonly DESTDIR="${HOME?}"
	case $(uname) in
		Linux)
			sed_inplace()
			{
				sed -i "${@}"
			}
			;;
		*)
			sed_inplace()
			{
				sed -i '' "${@}"
			}
			;;
	esac
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
	set_globals
	install_file "git/config" ".config/git/config"
}

main

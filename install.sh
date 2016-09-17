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

fix_bash_shebang()
{
	echo "fix bash shebang in ${@}"
	sed_inplace 's|#!/bin/bash|#!/usr/bin/env bash|g' "${@}"
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
	if [ "${3}" != "" ]
	then
		eval "${3?}" "${DST}"
	fi
}

main()
{
	set_globals
	install_file \
		"git/config" \
		".config/git/config"
	install_file \
		"git/git-identity/git-identity" \
		"bin/git-identity" \
		fix_bash_shebang
	install_file \
		"mc/ini" \
		".config/mc/ini"
	install_file \
		"mc/panels.ini" \
		".config/mc/panels.ini"
}

main

#!/bin/sh

set -e

set_dir_vars()
{
	REPO="$(dirname "$(realpath "${0}")")"
	DESTDIR="${HOME?}"
}

main()
{
	set_dir_vars
}

main

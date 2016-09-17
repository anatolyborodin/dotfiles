#!/bin/sh

set -e

set_dir_vars()
{
	readonly REPO="$(dirname "$(realpath "${0}")")"
	readonly DESTDIR="${HOME?}"
}

main()
{
	set_dir_vars
}

main

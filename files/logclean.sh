#!/bin/sh
# Returncode: (0) ok, (1) found non critical error, (*) found critical error"
#

config=$1

for file in `cat ${config}`; do
	log=$(printf "${file}" | cut -f1 -d";")
	logfolder=$(dirname "${log}")
	logfile=$(basename "${log}")
	retention=$(printf "${file}" | cut -f2 -d";")

	find "${logfolder}" -name "${logfile}" -mtime +${retention} -exec rm -f {} \;
	returncode=$?

	if [ ${returncode} -eq 1 ]; then
		exitcode=${returncode}
	elif [ ${returncode} -gt 1 ]; then
		exitcode=2
	fi
done

exit ${exitcode}

#!/bin/bash -eu

cd $OUTPUT_DIR
for fpath in `ls *.pdf`; do
	curl \
		-F file=@$fpath \
		-F channels=$SLACK_CHANNELS \
		-F token=$SLACK_TOKEN \
		-F initial_comment='' \
		-F title='' \
		https://slack.com/api/files.upload
done

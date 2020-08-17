go get -u github.com/MacroPower/prometheus_ascii

# Set PROMETHEUS_ASCII_SERVER_ENDPOINT

GRAPH=$(prometheus_ascii \
	--query.selector="wakatime_cumulative_seconds_total" \
	--graph.width="100" \
	--graph.height="12" \
	--query.duration="168h")

echo -e "\n\`\`\`\n$GRAPH\n\`\`\`\n" >insert_file

COMMENT_START="<!--START_SECTION:ascii_graph-->"
COMMENT_END="<!--END_SECTION:ascii_graph-->"

NEW_README=$(sed -e "/$COMMENT_START/,/$COMMENT_END/{ /$COMMENT_START/{p; r insert_file
        }; /$COMMENT_END/p; d }" README.md)

rm insert_file

echo "$NEW_README" >README.md

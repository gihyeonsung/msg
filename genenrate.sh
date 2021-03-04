#!/bin/sh
cd "$(dirname "$0")" || exit 1
echo "<!DOCTYPE html>"
echo "<html lang="ko">"
echo "<head>"
echo "<meta charset=\"utf-8\">"
echo "<title>$1</title>"
echo "<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">"
echo "<link rel=\"stylesheet\" href=\"index.css\" type=\"text/css\">"
echo "</head>"
echo "<body><pre>"
echo "$( \
	cat "$1" \
		| sed -E 's/\[\[([^]]*)\]\]/<a href="\1">[[\1]]<\/a>/g' \
		| sed -E 's/(\*\*[^\*]*\*\*)/<b>\1<\/b>/g' \
		| sed -E 's/(\/\/[^\/]*\/\/)/<em>\1<\/em>/g' \
		| sed -E 's/(__[^_]*__)/<u>\1<\/u>/g' \
		| sed -E 's/(--[^-]*--)/<s>\1<\/s>/g' \
		| sed -E 's/(``[^`]*``)/<code>\1<\/code>/g' \
)"
echo "</pre></body>"
echo "</html>"

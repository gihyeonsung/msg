#!/bin/sh
echo "<!DOCTYPE html>"
echo "<html lang="ko">"
echo "<head>"
echo "<meta charset=\"utf-8\">"
echo "<title>$1</title>"
echo "<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">"
echo "<link rel=\"stylesheet\" href=\"style.css\" type=\"text/css\">"
echo "</head>"
echo "<body><pre>"
echo "$( \
	cat "$1" \
		| sed -E 's/(``[^`]*``)/<code>\1<\/code>/g' \
		| sed -E 's/(\*\*[^\*]*\*\*)/<b>\1<\/b>/g' \
		| sed -E 's/(--[^-]*--)/<s>\1<\/s>/g' \
		| sed -E 's/(__[^_]*__)/<u>\1<\/u>/g' \
		| sed -E 's/(\[\[.+\]\])/<a href="\1">\1<\/a>/g' \
)"
echo "</pre></body>"
echo "</html>"

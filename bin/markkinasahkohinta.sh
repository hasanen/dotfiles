#!/bin/bash

# Finnish month names
months=("Tammikuu" "Helmikuu" "Maaliskuu" "Huhtikuu" "Toukokuu" "Kesäkuu" "Heinäkuu" "Elokuu" "Syyskuu" "Lokakuu" "Marraskuu" "Joulukuu")

# Get the current month number (1-12) and convert it to zero-indexed (0-11)
month_num=$(date +%m | sed 's/^0*//') && month_index=$((month_num - 1))
month=${months[$month_index]}

year=$(date +%Y)

curl --silent https://www.helen.fi/sahko/sahkosopimus/markkinahintasahko/hinnan-muodostumisen-periaate | xmllint --html --nowarning --xpath "//h3[text()='Energiahinnat vuonna $year']/following::table[1]/tbody/tr[td[contains(text(), '$month')]]/td[2]/text()" - 2>/dev/null

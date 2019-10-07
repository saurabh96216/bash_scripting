#!/bin/bash


end="\e[0m"
cyan="\e[36m"
purple="\e[35m"

read -p "[+] Enter Domain: " domain

# link: https://github.com/Edu4rdSHL/findomain
echo -e $cyan"[*] Start Findomain"$end # Getting a list of subdomains
findomain -t $domain -o &>/dev/null
size=$(wc -l $domain.txt)
echo "[+] Results: $size"

# link: https://github.com/bing0o/Python-Scripts/blob/master/subchecker.py
echo -e $cyan"[*] Start Subchecker"$end # Filter the result and save only the live subdomains
subchecker -w "$domain.txt" -t 30 -o "$domain-checked" &>/dev/null
size=$(wc -l $domain-checked)
echo "[+] Results: $size"

# link: https://github.com/bing0o/Python-Scripts/blob/master/webtech.py
echo -e $cyan"[*] Start WebTech"$end # Getting the technologies that running in each subdomain
webtech -w "$domain-checked" -t 30 -o "$domain-Tech" -i &>/dev/null
size=$(wc -l $domain-Tech)
echo "[+] Results: $size"

echo -e $purple"[!] You Did Nothing Yet,Go Deeper!"$end
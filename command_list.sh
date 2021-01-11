#curl -sSf "https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts" | grep '^0\.0\.0\.0' | awk '{print "local-zone: \""$2"\" always_nxdomain"}' > /etc/unbound/blacklists/stevenblack.conf
#curl -sSf "https://mirror1.malwaredomains.com/files/justdomains" | awk '{print "local-zone: \""$1"\" always_nxdomain"}' | grep -v 'local-zone: "" always_nxdomain'  > /etc/unbound/blacklists/malwaredomains.conf
#energized
#curl -sSf "https://block.energized.pro/ultimate/formats/domains.txt" | grep -v "^#"  | awk '{print "local-zone: \""$1"\" always_nxdomain"}' > /etc/unbound/blacklists/energized.conf


#Activas
curl -sSf "https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts" | grep '^0\.0\.0\.0' | awk '{print "local-zone: \""$2"\" always_nxdomain"}' > /etc/unbound/blacklists/stevenblack.conf


result=$(/usr/sbin/unbound-checkconf);
result_ok=$(echo $result | grep "no error");



echo "result_ok: "$result_ok

if [ -n "$result_ok" ]; then
        echo "config is ok"
        unbound-control reload
else

    echo "config is not ok"
fi


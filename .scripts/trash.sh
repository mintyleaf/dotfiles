ls -A ~/.local/share/fff/trash
if [ $(ls -A ~/.local/share/fff/trash | wc -l) -gt 2 ]
then
while true; do
    read -p "delete them all? " yn
    case $yn in
        [Yy]* ) rm -rf ~/.local/share/fff/trash && mkdir ~/.local/share/fff/trash break;;
        [Nn]* ) exit;;
        * ) echo "what";;
    esac
done
else
	echo "empty!"
fi

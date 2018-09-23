#!/usr/bin/env bash	

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )/../" >/dev/null && pwd )"


if [ "$(ls | grep -e "^pma$")" ]; then
    echo "phpmyadmin already installed. Skipping..."
else
	if [ ! "$(ls | grep -e phpMyAdmin*.xz)" ]; then
	  curl -O https://files.phpmyadmin.net/phpMyAdmin/4.8.3/phpMyAdmin-4.8.3-english.tar.xz
	fi

	tar xf phpMyAdmin-4.8.3-english.tar.xz
	mv phpMyAdmin-4.8.3-english pma
	cp config/phpmyadmin/config.inc.php pma

	if [ ! "$(ls | grep -e fallen*.zip)" ]; then
	  curl -O https://files.phpmyadmin.net/themes/fallen/0.7/fallen-0.7.zip
	fi

	unzip fallen-0.7.zip
	mv fallen pma/themes

	rm fallen-0.7.zip
	rm phpMyAdmin-4.8.3-english.tar.xz
fi

echo "launchind phpmyadmin on port 8001..."
cd $DIR/pma && php -S localhost:8001





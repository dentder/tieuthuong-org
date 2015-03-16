# Introduction #

1. follow instruction here:
```
   Ubuntu 14.04
   apache2
```

http://ubuntuvps.net/how-to-install-and-configure-elgg-on-your-ubuntu-or-debian-server-2/

2. rewrite test fail:

http://docs.elgg.org/wiki/Rewrite_test_failed

Ubuntu Linux
Install the dependencies:
```
sudo apt-get install apache2
sudo apt-get install mysql-server
sudo apt-get install php5 libapache2-mod-php5 php5-mysql
sudo apt-get install phpmyadmin
sudo a2enmod rewrite
```
Edit
`/etc/apache2/sites_available/default` to enable .htaccess processing (set AllowOverride to All)
Restart Apache:
`sudo /etc/init.d/apache2 restart`
Follow the standard installation instructions above
# Details #


## install the plug in ##

1. Download the plug in

2. unzip

3.  copy to `mod` folder

```
sudo cp -avr profile_manager /var/www/elgg/mod
```

Add your content here.  Format your content with:
  * Text in **bold** or _italic_
  * Headings, paragraphs, and lists
  * Automatic links to other wiki pages
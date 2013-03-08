plugin_name = php-plugin

publish_bucket = cloudbees-clickstack
publish_repo = testing
publish_url = s3://$(publish_bucket)/$(publish_repo)/

# Versions
lib/php.zip = php-5.4.12.zip
lib/httpd.zip = httpd-2.4.4.zip
lib/mysql-c.zip = mysql-c-6.0.2.zip

deps = lib lib/php.zip lib/httpd.zip lib/mysql-c.zip lib/parser

pkg_files = README.md LICENSE conf control lib scripts/*

include plugin.mk

base_url = http://cloudbees-clickstack.s3.amazonaws.com/lib
parser_repo = git://github.com/benjaminsavoy/genapp-metadata-parser.git

lib:
	mkdir -p lib

lib/parser:
	git clone $(parser_repo) lib/parser

lib/%:
	wget -qO $@ $(base_url)/$($@)
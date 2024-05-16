sed -i "s/mysqlUser/${WP_USER}/" /tools/init.maria

sed -i "s/mysqlUserPass/${WP_PASS}/"  /tools/init.maria

sed -i "s/mysqlRootPass/test/" /tools/init.maria

sed -i "s/mysqlDb/wordpress/" /tools/init.maria

sed -i "s/mysqlTable/wordpress/" /tools/init.maria

mariadbd --bootstrap --user=root < /tools/init.maria


mariadbd --user=root

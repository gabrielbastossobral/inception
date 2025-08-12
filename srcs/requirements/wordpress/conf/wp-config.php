<?php
define( 'DB_NAME', 'wordpress' );
define( 'DB_USER', 'wp_user' );
define( 'DB_PASSWORD', trim(file_get_contents('/run/secrets/db_password')));
define( 'DB_HOST', 'mariadb' );
define( 'DB_CHARSET', 'utf8' );
define( 'DB_COLLATE', '' );

define( 'AUTH_KEY',         'chave1' );
define( 'SECURE_AUTH_KEY',  'chave2' );
define( 'LOGGED_IN_KEY',    'chave3' );
define( 'NONCE_KEY',        'chave4' );
define( 'AUTH_SALT',        'chave5' );
define( 'SECURE_AUTH_SALT', 'chave6' );
define( 'LOGGED_IN_SALT',   'chave7' );
define( 'NONCE_SALT',       'chave8' );

$table_prefix = 'wp_';
define( 'WP_DEBUG', false );

if ( !defined('ABSPATH') )
    define('ABSPATH', __DIR__ . '/');

require_once ABSPATH . 'wp-settings.php';
<?php

define('DB_TYPE', getenv('DB_TYPE') ?: 'postgres');
define('DB_USER', getenv('DB_USER') ?: 'testlink');
define('DB_PASS', getenv('DB_PASS') ?: 'testlink');
define('DB_HOST', getenv('DB_HOST') ?: 'localhost');
define('DB_NAME', getenv('DB_NAME') ?: 'testlink');
define('DB_TABLE_PREFIX', getenv('DB_TABLE_PREFIX') ?: '');

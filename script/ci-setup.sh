#!/bin/bash
set -ev

# set up default yml configs for mysql redis and memcache
cat >> config/database.yml << EOF
test: &test
  adapter: mysql2
  encoding: utf8
  database: GAPTest_test
  pool: 5
  username: root
  password:
  host: 127.0.0.1

staging:
  <<: *test
  database: GAPTest_test
EOF

cat > config/redis.yml << EOF
test: &test
  :host: '127.0.0.1'
  :port: 6379
  :namespace: 'test'
  :db: 15

staging:
  <<: *test
EOF

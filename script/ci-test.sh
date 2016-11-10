#!/bin/bash
set -e

date

if [ "${TASK##*:}" = "spec" ] || [ "${TASK##*:}" = "test" ]; then
  echo "travis_fold:start:db-migrate"
  echo "Setting up the DB"

  bundle exec rake db:create db:migrate

  CPUS=$(grep -c ^processor /proc/cpuinfo)
  for ((i=2; i<=$CPUS; i++))
  do
    TEST_ENV_NUMBER=$i bundle exec rake db:create db:migrate
  done

  echo "travis_fold:end:db-migrate"
fi

echo "travis_fold:start:${TASK##*:}"
echo "Running ${TASK##*:}"
bundle exec $TASK
echo "travis_fold:end:${TASK##*:}"

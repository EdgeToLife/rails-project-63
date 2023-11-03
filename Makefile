# Makefile
install:
	bundle install

lint: 
	bundle exec rubocop

test:
	ruby ./test/test_hexlet_code.rb

.PHONY: test
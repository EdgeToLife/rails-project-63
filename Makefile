# Makefile
install:
	bundle install

lint: 
	rubocop

test:
	ruby ./test/test_hexlet_code.rb

.PHONY: test
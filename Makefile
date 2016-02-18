#!/usr/bin/make
REBAR=./rebar3
CT=./covertool
EUNIT_DIR=./.eunit
SRC_DIR=./src
SERVER := erl -pa ebin -pa deps/*/ebin -smp enable -s lager -config sample.config ${ERL_ARGS}

all: clean compile

clean:
	@$(REBAR) clean

compile:
	@$(REBAR) compile

test:
	@$(REBAR) eunit

shell:			
	${SERVER} -name lager@`hostname` -boot start_sasl

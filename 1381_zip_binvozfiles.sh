#!/bin/bash

dothething() {
	mkdir -p offtest
	mv test/*off offtest
	zip -r test.zip test

	mkdir -p offtrain
	mv train/*off offtrain
	zip -r train.zip train
}
dothething

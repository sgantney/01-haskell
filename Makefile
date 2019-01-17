
#####################################################################################################
COURSE=cs130w
ASGN=01
NAME=haskell
STACK=stack
#####################################################################################################

UNAME := $(shell uname)
ifeq ($(UNAME), Linux)
  FORMAT=aout
else
ifeq ($(UNAME), Darwin)
  FORMAT=macho
endif
endif

test: clean
	$(STACK) test --allow-different-user 

bin:
	$(STACK) build --allow-different-user

clean: 
	$(STACK) clean --allow-different-user

distclean: clean 
	rm -rf .stack-work 

tags:
	hasktags -x -c lib/

turnin: 
	# rm -rf .stack-work
	rm -rf ./$(ASGN)-$(NAME).tgz
	tar -zcvf ../$(ASGN)-$(NAME).tgz --exclude .stack-work --exclude .git ../$(ASGN)-$(NAME)
	mv ../$(ASGN)-$(NAME).tgz . 
	turnin -c $(COURSE) -p $(ASGN) ./$(ASGN)-$(NAME).tgz  



CNAME=ssh-hpn 


all: build run 
                                                                                                                

build :
	nvidia-docker build -t $(CNAME)  .

run:
	nvidia-docker run --cap-add SYS_ADMIN --privileged --ipc=host -it -d -p 10001:22 -t $(CNAME) # --name=$(CNAME) 
	nvidia-docker ps 

gotterm: 

	echo "usage example : arg=b69d7dcab0fb make gotterm "
	echo " docker exec -it $(arg) /bin/bash " 
	docker exec -it $(arg) /bin/bash 


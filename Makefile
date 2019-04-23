caffe:
	cd caffe-colorization && make clean && make all -j16 && make pycaffe

imagenet-to-lmdb:
	rm -rf data/caffe-train-lmdb data/caffe-val-lmdb
#	GLOG_logtostderr=1 ./caffe-colorization/build/tools/convert_imageset \
#	    --resize_height=256 \
#	    --resize_width=256 \
#	    --shuffle \
#	    /root/imagenet/test/ \
#	    /root/imagenet/test.txt \
#	    data/caffe-val-lmdb/

	GLOG_logtostderr=1 ./caffe-colorization/build/tools/convert_imageset \
	    --resize_height=256 \
	    --resize_width=256 \
	    --shuffle \
	    /root/imagenet/train/ \
	    sample-train.txt \
	    data/caffe-train-lmdb/
	
	
buildc:
	cd docker && docker build -t  ai2/ubuntu-colorization .

runc:
	docker run -v/mnt/disk2/colorization/data:/root/data -v`pwd`:/root/colorization -v/mnt/disk1/datasets/imagenet/:/root/imagenet --privileged -it ai2/ubuntu-colorization
	

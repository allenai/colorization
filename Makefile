caffe:
	cd caffe-colorization && make clean && make all -j16 && make pycaffe

imagenet-to-lmdb:
	rm -rf data/caffe-train-lmdb data/caffe-val-lmdb
	GLOG_logtostderr=1 ./caffe-colorization/build/tools/convert_imageset \
	    --resize_height=256 \
	    --resize_width=256 \
	    --shuffle \
	    imagenet/val/ \
	    imagenet/val.txt \
	    data/caffe-val-lmdb/

	GLOG_logtostderr=1 ./caffe-colorization/build/tools/convert_imageset \
	    --resize_height=256 \
	    --resize_width=256 \
	    --shuffle \
	    imagenet/train/ \
	    imagenet/train.txt \
	    data/caffe-train-lmdb/
	
	
buildc:
	cd docker && docker build -t  ai2/ubuntu-colorization .

runc:
	docker run -v`pwd`:/root/colorization -v/home/erick/imagenet:/root/imagenet --privileged -it ai2/ubuntu-colorization
	

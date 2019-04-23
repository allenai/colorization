#!/bin/bash

source config.sh
# Usage: ./run_linear_tests.sh <GPU_ID> <alexnet-colornet-iteration>
 
mkdir ./feature_learning_tests/linear/models/
./caffe-colorization/build/tools/caffe train -gpu ${1} -solver ./feature_learning_tests/linear/solver.prototxt -weights ./train_alexnet/colornet_iter_${2}_nobn_rs.caffemodel
#./caffe-colorization/build/tools/caffe train -gpu ${1} -solver ./feature_learning_tests/linear/solver.prototxt -weights ./models/alexnet_release_450000_nobn_rs.caffemodel

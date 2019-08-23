# PersistentDeepLearning
This repository contains the files created for a CSE Research Honors project on deep learning persistent topological features.

### Structure
It consists of the following structure:
* datagen - This contains all the relevant files that were used for data generation, including an Jupyter Notebook script that was used to create the input shape data, a script to extract the relevant data from the Ripser output, and a BAT script (Windows only) that runs ripser on the dataset and pipes it into the extractor script.
  * ripser - Contains source file of the Ripser script.
* experiment1 - All relevant files for experiment 1.
  * data - Contains the training and validation datasets.
    * stat - Contains some statistics on the dataset, plus an R script plot.r to log some statistics and create figures.
  * logs - Contains TensorBoard log files for the training of the neural networks.
  * models - Contains the saved model weight files used to load a network.
  * pred - Contains .txt files of 100 predictions compared to correct solution of the network.
  * stat - Contains some generated statistics of the prediction by the network after transformations to the images are made.
* experiment2 - All relevant files for experiment 2. Similar structure to experiment 1.
* images - Contains some images and IPE .pdf files used in the [report](https://www.overleaf.com/read/srcdbgcbvtxj).
* report.pdf - Report documenting the entire project.
* topology_net.ipynb - The Google Colab file that was used to train the networks. Only runs inside [Google Colab](https://colab.research.google.com/drive/1s9QMZ7ZO9BsIzrQOMpGsrR_oiqEfoFn3).

#!/bin/bash

clear
cd ~/Desktop/
touch output.txt

while true; do
read -p "Do you want to install the 'Data Science' packages for Python? [y/n] " yn

    case $yn in
        [Yy]* ) echo "Starting installation..."
            declare -a packages=("jupyter" "testresources" "wheel" "pandas" "numpy" "scipy" "theano" "keras" "torch" "pybrain" "scikit-learn" "matplotlib" "tensorflow" "cython" "seaborn" "bokeh" "plotly" "nltk" "gensim" "scrapy" "statsmodels" "kivy" "opencv" "pydot" )

            echo "Installing dependencies..."
            yes | sudo apt-get install libreadline-gplv2-dev libncursesw5-dev libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev libffi-dev &>> ~/Desktop/output.txt
            echo "Adding python2.7 repo..."
            yes | sudo add-apt-repository ppa:fkrull/deadsnakes-python2.7 &>> ~/Desktop/output.txt
            echo "Adding python3.6 repo..."
            yes | sudo add-apt-repository ppa:jonathonf/python-3.6 &>> ~/Desktop/output.txt
            echo "Updating..."
            yes |sudo apt-get update &>> ~/Desktop/output.txt
            echo "Upgrading..."
            yes | sudo apt-get upgrade &>> ~/Desktop/output.txt
            echo "Installing build-essential & checkinstall..."
            yes | sudo apt-get install build-essential checkinstall &>> ~/Desktop/output.txt
            echo "Installing python2.6..."
            yes | sudo apt-get install python2.6 &>> ~/Desktop/output.txt
            echo "Installing pip for python2..."
            yes | sudo apt-get install python-pip &>> ~/Desktop/output.txt
            echo "Installing python3.6..."
            yes | sudo apt-get install python3.6 &>> ~/Desktop/output.txt
            echo "Installing pip for python3.6..."
            yes | sudo apt-get install python3-pip &>> ~/Desktop/output.txt
            echo "Upgrading SetupTools..."
            yes | pip install --upgrade setuptools &>> ~/Desktop/output.txt
            yes | pip3 install --upgrade setuptools &>> ~/Desktop/output.txt

            for val in ${packages[@]}; do
                echo "Installing" $val "..."
                yes | pip install $val &>> ~/Desktop/output.txt
                yes | pip3 install $val &>> ~/Desktop/output.txt
            done
            yes | sudo apt install jupyter-notebook
            echo "Installations are done. Output file has been created on Desktop."
            echo "Thank you for using this script."
            echo "{Scripted by Sultan Alshehri | GitHub: SoulSA}"
            exit;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done

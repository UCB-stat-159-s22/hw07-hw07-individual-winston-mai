env:
    mamba env create -f environment.yml -p ~/envs/fire
    conda activate fire
    python -m ipykernel install --user --name fire --display-name "IPython - fire"

html:
    jupyter-book build . 
    

html-hub:
    jupyter-book config sphinx .
    sphinx-build  . _build/html -D html_baseurl=${JUPYTERHUB_SERVICE_PREFIX}/proxy/absolute/8000
    cd _build/html; python -m http.server
    

clean:
    rm -rf figures/*.png
	rm -rf _build/*s
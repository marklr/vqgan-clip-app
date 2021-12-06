FROM condaforge/miniforge3 AS builder
RUN mkdir /app
COPY environment.yml /app
VOLUME /app

WORKDIR /app

RUN conda env create -f environment.yml
RUN git clone git@github.com:marklr/vqgan-clip-app.git . && \
    git clone git clone https://github.com/crowsonkb/guided-diffusion && \
    git clone https://github.com/CompVis/taming-transformers

FROM builder AS final
VOLUME /assets

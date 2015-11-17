FROM phusion/baseimage:0.9.17
RUN apt-get update && apt-get install -y gcc make libssl-dev git
RUN git clone git://github.com/yyuu/pyenv.git .pyenv
ENV PYENV_ROOT $HOME/.pyenv
ENV PATH $PYENV_ROOT/shims:$PYENV_ROOT/bin:$PATH
RUN pyenv install 3.4.2
RUN pyenv global 3.4.2
CMD rm -rf /code/vendor && pip install -r /code/requirements.txt --target=/code/vendor

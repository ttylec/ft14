# Randomness in Haskell

Presentation given at Functional Tricity #14 meet-up.

[Presentation](https://github.com/ttylec/ft14/blob/master/presentation/randomness.pdf)
is pre-compiled, but LaTeX sources are included. Use `latexmk` with given config file.

[Demo notebook](https://github.com/ttylec/ft14/blob/master/presentation/randomness-live-coding.ipynb)
used for live-coding requires HaskellR to be installed. Use:

```
stack --nix build
stack --nix exec ihaskell install
```

to build and install and then

```
stack --nix exec jupyter notebook
```

to start Jupyter notebook server. Open in browser (due to Nix-stuff it will not
automatically open browser for you).

# Randomness in Haskell

Presentation given at Functional Tricity #14 meet-up.

[Presentation](https://github.com/ttylec/ft14/blob/master/presentation/randomness.pdf)
is pre-compiled, but LaTeX sources are included. Use `latexmk` with given config file.

[Demo
notebook](https://github.com/ttylec/ft14/blob/master/presentation/randomness-live-coding.ipynb)
prototype for live-coding during talks and
the
[one](https://github.com/ttylec/ft14/blob/master/presentation/randomness-live-coding.ipynb)
that was live-coded during presentation. Both require HaskellR, use:

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



``` @meta
CurrentModule = CounterfactualExplanations 
```

# Reference

In this reference, you will find a detailed overview of the package API.

> Reference guides are technical descriptions of the machinery and how to operate it. Reference material is information-oriented.
>
> — [Diátaxis](https://diataxis.fr/reference/)

In other words, you come here because you want to take a very close look at the code 🧐.

## Content

``` @contents
Pages = ["reference.md"]
Depth = 2:3
```

## Exported functions

``` @autodocs
Modules = [
    CounterfactualExplanations, 
    CounterfactualExplanations.Convergence,
    CounterfactualExplanations.Evaluation,
    CounterfactualExplanations.DataPreprocessing,
    CounterfactualExplanations.Models,
    CounterfactualExplanations.GenerativeModels, 
    CounterfactualExplanations.Generators, 
    CounterfactualExplanations.Objectives
]
Private = false
```

## Internal functions

``` @autodocs
Modules = [
    CounterfactualExplanations, 
    CounterfactualExplanations.Convergence,
    CounterfactualExplanations.Evaluation,
    CounterfactualExplanations.DataPreprocessing,
    CounterfactualExplanations.Models, 
    CounterfactualExplanations.GenerativeModels,
    CounterfactualExplanations.Generators, 
    CounterfactualExplanations.Objectives
]
Public = false
```

## Extensions

``` @autodocs
Modules = [
    Base.get_extension(CounterfactualExplanations, :DecisionTreeExt),
    Base.get_extension(CounterfactualExplanations, :JEMExt),
    Base.get_extension(CounterfactualExplanations, :LaplaceReduxExt),
    Base.get_extension(CounterfactualExplanations, :NeuroTreeExt),
]
```


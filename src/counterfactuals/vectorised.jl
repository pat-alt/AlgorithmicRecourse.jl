"""
    generate_counterfactual(
        x::Base.Iterators.Zip,
        target::RawTargetType,
        data::CounterfactualData,
        M::Models.AbstractModel,
        generator::AbstractGenerator;
        kwargs...,
    )

Overloads the `generate_counterfactual` method to accept a zip of factuals `x` and return a vector of counterfactuals.
"""
function generate_counterfactual(
    x::Base.Iterators.Zip,
    target::RawTargetType,
    data::CounterfactualData,
    M::Models.AbstractModel,
    generator::AbstractGenerator;
    kwargs...,
)
    x = collect(Base.Iterators.flatten(x))
    counterfactuals = generate_counterfactual(x, target, data, M, generator; kwargs...)
    return counterfactuals
end

"""
    generate_counterfactual(
        x::Vector{<:Matrix},
        target::RawTargetType,
        data::CounterfactualData,
        M::Models.AbstractModel,
        generator::AbstractGenerator;
        kwargs...,
    )

Overloads the `generate_counterfactual` method to accept a vector of factuals `x` and return a vector of counterfactuals.
"""
function generate_counterfactual(
    x::Vector{<:Matrix},
    target::RawTargetType,
    data::CounterfactualData,
    M::Models.AbstractModel,
    generator::AbstractGenerator;
    kwargs...,
)
    counterfactuals = map(
        x_ -> generate_counterfactual(x_, target, data, M, generator; kwargs...), x
    )

    return counterfactuals
end

using CounterfactualExplanations
using CounterfactualExplanations: counterfactual

include("mmd.jl")

function get_samples_for_metric(
    ces::Vector{<:AbstractCounterfactualExplanation}, data::CounterfactualData
)
    # Assertions:
    targets = (ce -> ce.target).(ces)
    @assert allequal(targets) "All targets must be equal."
    target = unique(targets)[1]

    # Counterfactuals:
    counterfactuals = (ce -> counterfactual(ce)).(ces) |> xs -> reduce(hcat, xs)

    # Data:
    neighbours = (data.X, data.output_encoder.labels) |> dt -> dt[1][:, dt[2] .== target]

    return counterfactuals, neighbours
end

function (metric::AbstractDivergenceMetric)(
    ces::Vector{<:AbstractCounterfactualExplanation}, data::CounterfactualData; kwrgs...
)

    # Get samples for metric:
    counterfactuals, neighbours = get_samples_for_metric(ces, data)

    # Compute divergence metric:
    return metric(counterfactuals, neighbours; kwrgs...)
end

function (metric::AbstractDivergenceMetric)(
    ces::Vector{<:AbstractCounterfactualExplanation},
    data::CounterfactualData,
    n::Int;
    kwrgs...,
)

    # Get samples for metric:
    counterfactuals, neighbours = get_samples_for_metric(ces, data)

    # Compute divergence metric:
    return metric(counterfactuals, neighbours, n; kwrgs...)
end

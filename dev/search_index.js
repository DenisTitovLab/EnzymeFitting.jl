var documenterSearchIndex = {"docs":
[{"location":"","page":"Home","title":"Home","text":"CurrentModule = DataDrivenEnzymeRateEquations","category":"page"},{"location":"#DataDrivenEnzymeRateEquations","page":"Home","title":"DataDrivenEnzymeRateEquations","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"Documentation for DataDrivenEnzymeRateEquations.","category":"page"},{"location":"","page":"Home","title":"Home","text":"","category":"page"},{"location":"","page":"Home","title":"Home","text":"Modules = [DataDrivenEnzymeRateEquations]","category":"page"},{"location":"#DataDrivenEnzymeRateEquations.calculate_all_parameter_removal_codes-Tuple{Tuple{Symbol, Vararg{Symbol}}}","page":"Home","title":"DataDrivenEnzymeRateEquations.calculate_all_parameter_removal_codes","text":"Generate all possibles codes for ways that mirror params for a and i states of MWC enzyme can be removed from the rate equation\n\n\n\n\n\n","category":"method"},{"location":"#DataDrivenEnzymeRateEquations.fit_rate_equation-Tuple{Function, DataFrames.DataFrame, Tuple, Tuple}","page":"Home","title":"DataDrivenEnzymeRateEquations.fit_rate_equation","text":"fit_rate_equation(\n    rate_equation::Function,\n    data::DataFrame,\n    metab_names::Tuple,\n    param_names::Tuple;\n    n_iter = 20\n\n)\n\nFit rate_equation to data and return loss and best fit parameters.\n\nArguments\n\nrate_equation::Function: Function that takes a NamedTuple of metabolite concentrations (with metab_names keys) and parameters (with param_names keys) and returns an enzyme rate.\ndata::DataFrame: DataFrame containing the data with column Rate and columns for each metab_names where each row is one measurement. It also needs to have a column source that contains a string that identifies the source of the data. This is used to calculate the weights for each figure in the publication.\nmetab_names::Tuple: Tuple of metabolite names that correspond to the metabolites of rate_equation and column names in data.\nparam_names::Tuple: Tuple of parameter names that correspond to the parameters of rate_equation.\nn_iter::Int: Number of iterations to run the fitting process.\n\nReturns\n\nloss::Float64: Loss of the best fit.\nparams::NamedTuple: Best fit parameters with param_names keys\n\nExample\n\nusing DataFrames\ndata = DataFrame(\n    Rate = [1.0, 2.0, 3.0],\n    A = [1.0, 2.0, 3.0],\n    source = [\"Figure 1\", \"Figure 1\", \"Figure 2\"]\n)\nrate_equation(metabs, params) = params.Vmax * metabs.S / (1 + metabs.S / params.K_S)\nfit_rate_equation(rate_equation, data, (:A,), (:Vmax, :K_S))\n\n\n\n\n\n","category":"method"},{"location":"#DataDrivenEnzymeRateEquations.forward_selection_next_param_removal_codes-NTuple{5, Any}","page":"Home","title":"DataDrivenEnzymeRateEquations.forward_selection_next_param_removal_codes","text":"Calculate nt_param_removal_codes with num_params including non-zero term combinations for codes (excluding alpha terms) in each previous_param_removal_codes that has num_params-1\n\n\n\n\n\n","category":"method"},{"location":"#DataDrivenEnzymeRateEquations.loss_rate_equation-Tuple{Any, Function, NamedTuple, Any, Vector{Vector{Int64}}}","page":"Home","title":"DataDrivenEnzymeRateEquations.loss_rate_equation","text":"Loss function used for fitting that calculate log of ratio of rate equation predicting of rate and rate data\n\n\n\n\n\n","category":"method"},{"location":"#DataDrivenEnzymeRateEquations.param_rescaling-Tuple{Any, Any}","page":"Home","title":"DataDrivenEnzymeRateEquations.param_rescaling","text":"Rescaling of fitting parameters from [0, 10] scale that optimizer uses to actual values\n\n\n\n\n\n","category":"method"},{"location":"#DataDrivenEnzymeRateEquations.param_subset_select-Tuple{Any, Any, Any}","page":"Home","title":"DataDrivenEnzymeRateEquations.param_subset_select","text":"Function to convert parameter vector to vector where some params are equal to 0, Inf or each other based on ntparamremoval_code\n\n\n\n\n\n","category":"method"},{"location":"#DataDrivenEnzymeRateEquations.reverse_selection_next_param_removal_codes-NTuple{5, Any}","page":"Home","title":"DataDrivenEnzymeRateEquations.reverse_selection_next_param_removal_codes","text":"Calculate param_removal_codes with num_params including zero term combinations for codes (excluding alpha terms) in each previous_param_removal_codes that has num_params+1\n\n\n\n\n\n","category":"method"},{"location":"#DataDrivenEnzymeRateEquations.test_rate_equation-Tuple{Function, Any, NamedTuple, Tuple{Symbol, Vararg{Symbol}}, Tuple{Symbol, Vararg{Symbol}}}","page":"Home","title":"DataDrivenEnzymeRateEquations.test_rate_equation","text":"Function to calculate loss for a given rate_equation and nt_fitted_params on data that was not used for training\n\n\n\n\n\n","category":"method"}]
}

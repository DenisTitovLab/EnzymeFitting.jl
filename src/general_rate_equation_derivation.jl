#=
CODE FOR RATE EQUATION DERIVATION
=#

#TODO: maybe divide general_mwc_equation into several functions for Z_a_cat, Z_i_cat, Z_a_reg,
# Z_i_reg. Then call these functions as args of general_mwc_rate_equation
function general_mwc_rate_equation(
    S1_cat1::T,
    S2_cat2::T,
    S3_cat3::T,
    P1_cat1::T,
    P2_cat2::T,
    P3_cat3::T,
    R1_reg1::T,
    R2_reg1::T,
    R3_reg1::T,
    R1_reg2::T,
    R2_reg2::T,
    R3_reg2::T,
    R1_reg3::T,
    R2_reg3::T,
    R3_reg3::T,
    L::T,
    Vmax_a::T,
    Vmax_i::T,
    K_a_S1_cat1::T,
    K_i_S1_cat1::T,
    K_a_S2_cat2::T,
    K_i_S2_cat2::T,
    K_a_S3_cat3::T,
    K_i_S3_cat3::T,
    K_a_P1_cat1::T,
    K_i_P1_cat1::T,
    K_a_P2_cat2::T,
    K_i_P2_cat2::T,
    K_a_P3_cat3::T,
    K_i_P3_cat3::T,
    K_a_R1_reg1::T,
    K_i_R1_reg1::T,
    K_a_R2_reg1::T,
    K_i_R2_reg1::T,
    K_a_R3_reg1::T,
    K_i_R3_reg1::T,
    K_a_R1_reg2::T,
    K_i_R1_reg2::T,
    K_a_R2_reg2::T,
    K_i_R2_reg2::T,
    K_a_R3_reg2::T,
    K_i_R3_reg2::T,
    K_a_R1_reg3::T,
    K_i_R1_reg3::T,
    K_a_R2_reg3::T,
    K_i_R2_reg3::T,
    K_a_R3_reg3::T,
    K_i_R3_reg3::T,
    alpha_S1_P2::T,
    alpha_S1_P3::T,
    alpha_S2_P1::T,
    alpha_S2_P3::T,
    alpha_S3_P1::T,
    alpha_S3_P2::T,
    Keq::T,
) where {T<:Float64}
    Vmax_a = 1.0
    Vmax_a_rev = ifelse(
        (K_a_P1_cat1 * K_a_P2_cat2 * K_a_P3_cat3) != Inf,
        Vmax_a * K_a_P1_cat1 * K_a_P2_cat2 * K_a_P3_cat3 /
        (Keq * K_a_S1_cat1 * K_a_S2_cat2 * K_a_S3_cat3),
        0.0,
    )
    Vmax_i_rev = ifelse(
        (K_i_P1_cat1 * K_i_P2_cat2 * K_i_P3_cat3) != Inf,
        Vmax_i * K_i_P1_cat1 * K_i_P2_cat2 * K_i_P3_cat3 /
        (Keq * K_i_S1_cat1 * K_i_S2_cat2 * K_i_S3_cat3),
        0.0,
    )
    Z_a_cat = (
        1 +
        (S1_cat1 / K_a_S1_cat1) +
        (S2_cat2 / K_a_S2_cat2) +
        (S3_cat3 / K_a_S3_cat3) +
        (P1_cat1 / K_a_P1_cat1) +
        (P2_cat2 / K_a_P2_cat2) +
        (P3_cat3 / K_a_P3_cat3) +
        (S1_cat1 / K_a_S1_cat1) * (S2_cat2 / K_a_S2_cat2) +
        (S1_cat1 / K_a_S1_cat1) * (S3_cat3 / K_a_S3_cat3) +
        (S2_cat2 / K_a_S2_cat2) * (S3_cat3 / K_a_S3_cat3) +
        (S1_cat1 / K_a_S1_cat1) * (S2_cat2 / K_a_S2_cat2) * (S3_cat3 / K_a_S3_cat3) +
        (P1_cat1 / K_a_P1_cat1) * (P2_cat2 / K_a_P2_cat2) +
        (P1_cat1 / K_a_P1_cat1) * (P3_cat3 / K_a_P3_cat3) +
        (P2_cat2 / K_a_P2_cat2) * (P3_cat3 / K_a_P3_cat3) +
        (P1_cat1 / K_a_P1_cat1) * (P2_cat2 / K_a_P2_cat2) * (P3_cat3 / K_a_P3_cat3) +
        alpha_S1_P2 * (S1_cat1 / K_a_S1_cat1) * (P2_cat2 / K_a_P2_cat2) +
        alpha_S1_P3 * (S1_cat1 / K_a_S1_cat1) * (P3_cat3 / K_a_P3_cat3) +
        alpha_S2_P1 * (S2_cat2 / K_a_S2_cat2) * (P1_cat1 / K_a_P1_cat1) +
        alpha_S2_P3 * (S2_cat2 / K_a_S2_cat2) * (P3_cat3 / K_a_P3_cat3) +
        alpha_S3_P1 * (S3_cat3 / K_a_S3_cat3) * (P1_cat1 / K_a_P1_cat1) +
        alpha_S3_P2 * (S3_cat3 / K_a_S3_cat3) * (P2_cat2 / K_a_P2_cat2)
    )
    Z_i_cat = (
        1 +
        (S1_cat1 / K_i_S1_cat1) +
        (S2_cat2 / K_i_S2_cat2) +
        (S3_cat3 / K_i_S3_cat3) +
        (P1_cat1 / K_i_P1_cat1) +
        (P2_cat2 / K_i_P2_cat2) +
        (P3_cat3 / K_i_P3_cat3) +
        (S1_cat1 / K_i_S1_cat1) * (S2_cat2 / K_i_S2_cat2) +
        (S1_cat1 / K_i_S1_cat1) * (S3_cat3 / K_i_S3_cat3) +
        (S2_cat2 / K_i_S2_cat2) * (S3_cat3 / K_i_S3_cat3) +
        (S1_cat1 / K_i_S1_cat1) * (S2_cat2 / K_i_S2_cat2) * (S3_cat3 / K_i_S3_cat3) +
        (P1_cat1 / K_i_P1_cat1) * (P2_cat2 / K_i_P2_cat2) +
        (P1_cat1 / K_i_P1_cat1) * (P3_cat3 / K_i_P3_cat3) +
        (P2_cat2 / K_i_P2_cat2) * (P3_cat3 / K_i_P3_cat3) +
        (P1_cat1 / K_i_P1_cat1) * (P2_cat2 / K_i_P2_cat2) * (P3_cat3 / K_i_P3_cat3) +
        alpha_S1_P2 * (S1_cat1 / K_i_S1_cat1) * (P2_cat2 / K_i_P2_cat2) +
        alpha_S1_P3 * (S1_cat1 / K_i_S1_cat1) * (P3_cat3 / K_i_P3_cat3) +
        alpha_S2_P1 * (S2_cat2 / K_i_S2_cat2) * (P1_cat1 / K_i_P1_cat1) +
        alpha_S2_P3 * (S2_cat2 / K_i_S2_cat2) * (P3_cat3 / K_i_P3_cat3) +
        alpha_S3_P1 * (S3_cat3 / K_i_S3_cat3) * (P1_cat1 / K_i_P1_cat1) +
        alpha_S3_P2 * (S3_cat3 / K_i_S3_cat3) * (P2_cat2 / K_i_P2_cat2)
    )
    Z_a_reg = (
        (1 + R1_reg1 / K_a_R1_reg1 + R2_reg1 / K_a_R2_reg1 + R3_reg1 / K_a_R3_reg1) *
        (1 + R1_reg2 / K_a_R1_reg2 + R2_reg2 / K_a_R2_reg2 + R3_reg2 / K_a_R3_reg2) *
        (1 + R1_reg3 / K_a_R1_reg3 + R2_reg3 / K_a_R2_reg3 + R3_reg3 / K_a_R3_reg3)
    )
    Z_i_reg = (
        (1 + R1_reg1 / K_i_R1_reg1 + R2_reg1 / K_i_R2_reg1 + R3_reg1 / K_i_R3_reg1) *
        (1 + R1_reg2 / K_i_R1_reg2 + R2_reg2 / K_i_R2_reg2 + R3_reg2 / K_i_R3_reg2) *
        (1 + R1_reg3 / K_i_R1_reg3 + R2_reg3 / K_i_R2_reg3 + R3_reg3 / K_i_R3_reg3)
    )
    Rate =
        (
            (
                Vmax_a *
                (S1_cat1 / K_a_S1_cat1) *
                (S2_cat2 / K_a_S2_cat2) *
                (S3_cat3 / K_a_S3_cat3) -
                Vmax_a_rev *
                (P1_cat1 / K_a_P1_cat1) *
                (P2_cat2 / K_a_P2_cat2) *
                (P3_cat3 / K_a_P3_cat3)
            ) *
            (Z_a_cat^3) *
            (Z_a_reg^4) +
            L *
            (
                Vmax_i *
                (S1_cat1 / K_i_S1_cat1) *
                (S2_cat2 / K_i_S2_cat2) *
                (S3_cat3 / K_i_S3_cat3) -
                Vmax_i_rev *
                (P1_cat1 / K_i_P1_cat1) *
                (P2_cat2 / K_i_P2_cat2) *
                (P3_cat3 / K_i_P3_cat3)
            ) *
            (Z_i_cat^3) *
            (Z_i_reg^4)
        ) / ((Z_a_cat^4) * (Z_a_reg^4) + L * (Z_i_cat^4) * (Z_i_reg^4))

    return Rate
end

# function general_mwc_rate_equation(
#         S1::T,
#         S2::T,
#         S3::T,
#         P1::T,
#         P2::T,
#         P3::T,
#         R1_reg1::T,
#         R2_reg1::T,
#         R3_reg1::T,
#         R1_reg2::T,
#         R2_reg2::T,
#         R3_reg2::T,
#         R1_reg3::T,
#         R2_reg3::T,
#         R3_reg3::T,
#         L::T,
#         Vmax_a::T,
#         Vmax_i::T,
#         K_a_S1_cat::T,
#         K_i_S1_cat::T,
#         K_a_S2_cat::T,
#         K_i_S2_cat::T,
#         K_a_P1_cat::T,
#         K_i_P1_cat::T,
#         K_a_P2_cat::T,
#         K_i_P2_cat::T,
#         K_a_R1_reg1::T,
#         K_i_R1_reg1::T,
#         K_a_R2_reg1::T,
#         K_i_R2_reg1::T,
#         K_a_R3_reg1::T,
#         K_i_R3_reg1::T,
#         K_a_R1_reg2::T,
#         K_i_R1_reg2::T,
#         K_a_R2_reg2::T,
#         K_i_R2_reg2::T,
#         K_a_R3_reg2::T,
#         K_i_R3_reg2::T,
#         K_a_R1_reg3::T,
#         K_i_R1_reg3::T,
#         K_a_R2_reg3::T,
#         K_i_R2_reg3::T,
#         K_a_R3_reg3::T,
#         K_i_R3_reg3::T,
#         alpha_S1_P2::T,
#         alpha_S2_P1::T,
#         Keq::T
# ) where {T <: Float64}
#     Vmax_a = 1.0
#     Vmax_a_rev = ifelse(
#         (K_a_P2_cat * K_a_P1_cat) != Inf,
#         Vmax_a * K_a_P2_cat * K_a_P1_cat / (Keq * K_a_S1_cat * K_a_S2_cat),
#         0.0
#     )
#     Vmax_i_rev = ifelse(
#         (K_i_P2_cat * K_i_P1_cat) != Inf,
#         Vmax_i * K_i_P2_cat * K_i_P1_cat / (Keq * K_i_S1_cat * K_i_S2_cat),
#         0.0
#     )
#     Z_a_cat = (
#         1 +
#         (S1 / K_a_S1_cat) +
#         (S2 / K_a_S2_cat) +
#         (P1 / K_a_P1_cat) +
#         (P2 / K_a_P2_cat) +
#         (S1 / K_a_S1_cat) * (S2 / K_a_S2_cat) +
#         (P1 / K_a_P1_cat) * (P2 / K_a_P2_cat) +
#         alpha_S1_P2 * (S1 / K_a_S1_cat) * (P2 / K_a_P2_cat) +
#         alpha_S2_P1 * (P1 / K_a_P1_cat) * (S2 / K_a_S2_cat)
#     )
#     Z_i_cat = (
#         1 +
#         (S1 / K_i_S1_cat) +
#         (S2 / K_i_S2_cat) +
#         (P1 / K_i_P1_cat) +
#         (P2 / K_i_P2_cat) +
#         (S1 / K_i_S1_cat) * (S2 / K_i_S2_cat) +
#         (P1 / K_i_P1_cat) * (P2 / K_i_P2_cat) +
#         alpha_S1_P2 * (S1 / K_i_S1_cat) * (P2 / K_i_P2_cat) +
#         alpha_S2_P1 * (P1 / K_i_P1_cat) * (S2 / K_i_S2_cat)
#     )
#     Z_a_reg = (
#         (1 + R1_reg1 / K_a_R1_reg1 + R2_reg1 / K_a_R2_reg1 + R3_reg1 / K_a_R3_reg1) *
#         (1 + R1_reg2 / K_a_R1_reg2 + R2_reg2 / K_a_R2_reg2 + R3_reg2 / K_a_R3_reg2) *
#         (1 + R1_reg3 / K_a_R1_reg3 + R2_reg3 / K_a_R2_reg3 + R3_reg3 / K_a_R3_reg3)
#     )
#     Z_i_reg = (
#         (1 + R1_reg1 / K_i_R1_reg1 + R2_reg1 / K_i_R2_reg1 + R3_reg1 / K_i_R3_reg1) *
#         (1 + R1_reg2 / K_i_R1_reg2 + R2_reg2 / K_i_R2_reg2 + R3_reg2 / K_i_R3_reg2) *
#         (1 + R1_reg3 / K_i_R1_reg3 + R2_reg3 / K_i_R2_reg3 + R3_reg3 / K_i_R3_reg3)
#     )
#     Rate = (
#         (
#             Vmax_a * (S1 / K_a_S1_cat) * (S2 / K_a_S2_cat) -
#             Vmax_a_rev * (P1 / K_a_P1_cat) * (P2 / K_a_P2_cat)
#         ) *
#         (Z_a_cat^3) *
#         (Z_a_reg^4) +
#         L *
#         (
#             Vmax_i * (S1 / K_i_S1_cat) * (S2 / K_i_S2_cat) -
#             Vmax_i_rev * (P1 / K_i_P1_cat) * (P2 / K_i_P2_cat)
#         ) *
#         (Z_i_cat^3) *
#         (Z_i_reg^4)
#     ) / ((Z_a_cat^4) * (Z_a_reg^4) + L * (Z_i_cat^4) * (Z_i_reg^4))

#     return Rate
# end

#=
TODO: ask users for substrates, products, inhibitors and regulators and then ask users to put
each into a site like cat1,2,3 and reg1,2,3. Add several catalytic sites (e.g., "cat1", "cat2")
for enzyme like PDH and PC that have clearly distinct catalytic sites but also to allow users
to highlight that some substrates likely bind to same site in mutually exclusive way. For
example for PKM2 ATP/ADP and PEP/Pyruvate behave like they bind to different sites.
Somehow include alpha terms only for cat1 / cat2 pair that user highlights that are part of
the same cat site like for PKM2.
=#

macro derive_general_mwc_rate_eq(metabs_and_regulators_kwargs...)
    expected_input_kwargs =
        [:substrates, :products, :cat1, :cat2, :cat3, :reg1, :reg2, :reg3, :Keq]
    processed_input = NamedTuple()
    for expr in metabs_and_regulators_kwargs
        expr.args[1] ∈ expected_input_kwargs || error(
            "invalid keyword: ",
            expr.args[1],
            ". The only supported keywords are: ",
            expected_input_kwargs,
        )
        processed_input = merge(processed_input, (; expr.args[1] => eval(expr)))
    end
    @assert 0 < length(processed_input.substrates) <= 3 "At least 1 and no more that 3 substrates are supported"
    @assert 0 < length(processed_input.products) <= 3 "At least 1 and no more that 3 products are supported"
    cat_site_metabs = [processed_input.cat1...]
    for field in [:cat2, :cat3]
        if hasproperty(processed_input, field)
            push!(cat_site_metabs, processed_input[field]...)
        end
    end
    println(cat_site_metabs)
    for metab_name in [processed_input.substrates..., processed_input.products...]
        @assert metab_name ∈ cat_site_metabs "Each substrate and product has to be assigned to one of the catalytic sites"
    end
    for field in [:cat1, :cat2, :cat3]
        hasproperty(processed_input, field) &&
            @assert length(processed_input[field]) <= 2 "No more that 2 metabolites can bind to one catalytic site. One substrate and one product"
    end
    for field in [:reg1, :reg2, :reg3]
        hasproperty(processed_input, field) &&
            @assert length(processed_input[field]) <= 3 "No more that 3 catalytic sites are supported"
    end
    enz = NamedTuple()
    for field in propertynames(processed_input)
        if field == :cat1
            for metab_name in processed_input[field]
                if metab_name ∈ processed_input.substrates
                    enz = merge(enz, (; Symbol(:S, 1) => metab_name))
                elseif metab_name ∈ processed_input.products
                    enz = merge(enz, (; Symbol(:P, 1) => metab_name))
                end
            end
        elseif hasproperty(processed_input, :cat2) && field == :cat2
            for metab_name in processed_input[field]
                if metab_name ∈ processed_input.substrates
                    enz = merge(enz, (; Symbol(:S, 2) => metab_name))
                elseif metab_name ∈ processed_input.products
                    enz = merge(enz, (; Symbol(:P, 2) => metab_name))
                end
            end
        elseif hasproperty(processed_input, :cat3) && field == :cat3
            for metab_name in processed_input[field]
                if metab_name ∈ processed_input.substrates
                    enz = merge(enz, (; Symbol(:S, 3) => metab_name))
                elseif metab_name ∈ processed_input.products
                    enz = merge(enz, (; Symbol(:P, 3) => metab_name))
                end
            end
        elseif hasproperty(processed_input, :reg1) && field == :reg1
            for (i, metab_name) in enumerate(processed_input[field])
                enz = merge(enz, (; Symbol(:R, i, "_", field) => metab_name))
            end
        elseif hasproperty(processed_input, :reg2) && field == :reg2
            for (i, metab_name) in enumerate(processed_input[field])
                enz = merge(enz, (; Symbol(:R, i, "_", field) => metab_name))
            end
        elseif hasproperty(processed_input, :reg3) && field == :reg3
            for (i, metab_name) in enumerate(processed_input[field])
                enz = merge(enz, (; Symbol(:R, i, "_", field) => metab_name))
            end
        end
    end
    println(enz)
    #TODO: use Base.method_argnames(methods(general_mwc_rate_equation)[1])[2:end] to get args
    mwc_rate_eq_args = [
        :S1,
        :S2,
        :S3,
        :P1,
        :P2,
        :P3,
        :R1_reg1,
        :R2_reg1,
        :R3_reg1,
        :R1_reg2,
        :R2_reg2,
        :R3_reg2,
        :R1_reg3,
        :R2_reg3,
        :R3_reg3,
    ]
    missing_keys = filter(x -> !haskey(enz, x), mwc_rate_eq_args)
    for key in missing_keys
        enz = merge(enz, (; key => nothing))
    end
    # qualified_name = esc(GlobalRef(Main, :rate_equation))
    function_name = esc(:rate_equation)
    return :(
        function $(function_name)(metabs, params, Keq)
            general_mwc_rate_equation(
                $(enz.S1 isa Symbol) ? metabs.$(enz.S1) : 1.0,
                $(enz.S2 isa Symbol) ? metabs.$(enz.S2) : 1.0,
                $(enz.S3 isa Symbol) ? metabs.$(enz.S3) : 1.0,
                $(enz.P1 isa Symbol) ? metabs.$(enz.P1) : 1.0,
                $(enz.P2 isa Symbol) ? metabs.$(enz.P2) : 1.0,
                $(enz.P3 isa Symbol) ? metabs.$(enz.P3) : 1.0,
                $(enz.R1_reg1 isa Symbol) ? metabs.$(enz.R1_reg1) : 0.0,
                $(enz.R2_reg1 isa Symbol) ? metabs.$(enz.R2_reg1) : 0.0,
                $(enz.R3_reg1 isa Symbol) ? metabs.$(enz.R3_reg1) : 0.0,
                $(enz.R1_reg2 isa Symbol) ? metabs.$(enz.R1_reg2) : 0.0,
                $(enz.R2_reg2 isa Symbol) ? metabs.$(enz.R2_reg2) : 0.0,
                $(enz.R3_reg2 isa Symbol) ? metabs.$(enz.R3_reg2) : 0.0,
                $(enz.R1_reg3 isa Symbol) ? metabs.$(enz.R1_reg3) : 0.0,
                $(enz.R2_reg3 isa Symbol) ? metabs.$(enz.R2_reg3) : 0.0,
                $(enz.R3_reg3 isa Symbol) ? metabs.$(enz.R3_reg3) : 0.0,
                params.L,
                params.Vmax_a,
                params.Vmax_i,
                $(enz.S1 isa Symbol) ? params.$(Symbol("K_a_", enz.S1, "_cat1")) : 1.0,
                $(enz.S1 isa Symbol) ? params.$(Symbol("K_i_", enz.S1, "_cat1")) : 1.0,
                $(enz.S2 isa Symbol) ? params.$(Symbol("K_a_", enz.S2, "_cat2")) : 1.0,
                $(enz.S2 isa Symbol) ? params.$(Symbol("K_i_", enz.S2, "_cat2")) : 1.0,
                $(enz.S3 isa Symbol) ? params.$(Symbol("K_a_", enz.S3, "_cat3")) : 1.0,
                $(enz.S3 isa Symbol) ? params.$(Symbol("K_i_", enz.S3, "_cat3")) : 1.0,
                $(enz.P1 isa Symbol) ? params.$(Symbol("K_a_", enz.P1, "_cat1")) : 1.0,
                $(enz.P1 isa Symbol) ? params.$(Symbol("K_i_", enz.P1, "_cat1")) : 1.0,
                $(enz.P2 isa Symbol) ? params.$(Symbol("K_a_", enz.P2, "_cat2")) : 1.0,
                $(enz.P2 isa Symbol) ? params.$(Symbol("K_i_", enz.P2, "_cat2")) : 1.0,
                $(enz.P3 isa Symbol) ? params.$(Symbol("K_a_", enz.P3, "_cat3")) : 1.0,
                $(enz.P3 isa Symbol) ? params.$(Symbol("K_i_", enz.P3, "_cat3")) : 1.0,
                $(enz.R1_reg1 isa Symbol) ? params.$(Symbol("K_a_", enz.R1_reg1, "_reg1")) :
                Inf,
                $(enz.R1_reg1 isa Symbol) ? params.$(Symbol("K_i_", enz.R1_reg1, "_reg1")) :
                Inf,
                $(enz.R2_reg1 isa Symbol) ? params.$(Symbol("K_a_", enz.R2_reg1, "_reg1")) :
                Inf,
                $(enz.R2_reg1 isa Symbol) ? params.$(Symbol("K_i_", enz.R2_reg1, "_reg1")) :
                Inf,
                $(enz.R3_reg1 isa Symbol) ? params.$(Symbol("K_a_", enz.R3_reg1, "_reg1")) :
                Inf,
                $(enz.R3_reg1 isa Symbol) ? params.$(Symbol("K_i_", enz.R3_reg1, "_reg1")) :
                Inf,
                $(enz.R1_reg2 isa Symbol) ? params.$(Symbol("K_a_", enz.R1_reg2, "_reg2")) :
                Inf,
                $(enz.R1_reg2 isa Symbol) ? params.$(Symbol("K_i_", enz.R1_reg2, "_reg2")) :
                Inf,
                $(enz.R2_reg2 isa Symbol) ? params.$(Symbol("K_a_", enz.R2_reg2, "_reg2")) :
                Inf,
                $(enz.R2_reg2 isa Symbol) ? params.$(Symbol("K_i_", enz.R2_reg2, "_reg2")) :
                Inf,
                $(enz.R3_reg2 isa Symbol) ? params.$(Symbol("K_a_", enz.R3_reg2, "_reg2")) :
                Inf,
                $(enz.R3_reg2 isa Symbol) ? params.$(Symbol("K_i_", enz.R3_reg2, "_reg2")) :
                Inf,
                $(enz.R1_reg3 isa Symbol) ? params.$(Symbol("K_a_", enz.R1_reg3, "_reg3")) :
                Inf,
                $(enz.R1_reg3 isa Symbol) ? params.$(Symbol("K_i_", enz.R1_reg3, "_reg3")) :
                Inf,
                $(enz.R2_reg3 isa Symbol) ? params.$(Symbol("K_a_", enz.R2_reg3, "_reg3")) :
                Inf,
                $(enz.R2_reg3 isa Symbol) ? params.$(Symbol("K_i_", enz.R2_reg3, "_reg3")) :
                Inf,
                $(enz.R3_reg3 isa Symbol) ? params.$(Symbol("K_a_", enz.R3_reg3, "_reg3")) :
                Inf,
                $(enz.R3_reg3 isa Symbol) ? params.$(Symbol("K_i_", enz.R3_reg3, "_reg3")) :
                Inf,
                $(enz.S1 isa Symbol && enz.P2 isa Symbol) ?
                params.$(Symbol("alpha_", enz.S1, "_", enz.P2)) : 0.0,
                $(enz.S1 isa Symbol && enz.P3 isa Symbol) ?
                params.$(Symbol("alpha_", enz.S1, "_", enz.P3)) : 0.0,
                $(enz.S2 isa Symbol && enz.P1 isa Symbol) ?
                params.$(Symbol("alpha_", enz.S2, "_", enz.P1)) : 0.0,
                $(enz.S2 isa Symbol && enz.P3 isa Symbol) ?
                params.$(Symbol("alpha_", enz.S2, "_", enz.P3)) : 0.0,
                $(enz.S3 isa Symbol && enz.P1 isa Symbol) ?
                params.$(Symbol("alpha_", enz.S3, "_", enz.P1)) : 0.0,
                $(enz.S3 isa Symbol && enz.P2 isa Symbol) ?
                params.$(Symbol("alpha_", enz.S3, "_", enz.P2)) : 0.0,
                Keq,
            )
        end
    )
end

metabs_nt = (
    PEP = 1.0e-3,
    ADP = 1.0e-3,
    Pyruvate = 1.0e-3,
    ATP = 1.0e-3,
    F16BP = 1.0e-3,
    Phenylalanine = 1.0e-3,
)

params_nt = (
    L = 1.0,
    Vmax_a = 1.0,
    Vmax_i = 1.0,
    K_a_PEP_cat = 1e-3,
    K_i_PEP_cat = 100e-3,
    K_a_ADP_cat = 1e-3,
    K_i_ADP_cat = 1e-3,
    K_a_Pyruvate_cat = 1e-3,
    K_i_Pyruvate_cat = 1e-3,
    K_a_ATP_cat = 1e-3,
    K_i_ATP_cat = 1e-3,
    K_a_F16BP_reg1 = 1e-3,
    K_i_F16BP_reg1 = 100e-3,
    K_a_Phenylalanine_reg2 = 100e-3,
    K_i_Phenylalanine_reg2 = 1e-3,
    alpha_PEP_ATP = 1.0,
    alpha_ADP_Pyruvate = 1.0,
)

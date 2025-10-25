using DataFrames
using CSV
using Statistics
using Plots

df=DataFrame(CSV.File("teste.csv"))
select!(df,Not("time"))
df.pos=df.pos .- minimum(df.pos)

df=combine(groupby(df, :pos), :freq => mean => :mean_freq)

scatter(df.pos,df.mean_freq,)
savefig("my_plot.png")



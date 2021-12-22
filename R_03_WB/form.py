warms = df2[df2['picmode'] == 'WARM1'].loc[:, ["x(calc)", "y(calc)"]]
warms["warm_u"] = warms.apply(lambda x: xy2u(x['x(calc)'], x['y(calc)']), axis=1)
warms["warm_v"] = warms.apply(lambda x: xy2v(x['x(calc)'], x['y(calc)']), axis=1)

fixed_warms = warms.loc[:, ['warm_u', 'warm_v']]
fixed_warms

expert1 = df2[df2['picmode'] == 'WARM2'].loc[:, ["x(calc)", "y(calc)"]]
expert1["expert1_u"] = expert1.apply(lambda x: xy2u(x['x(calc)'], x['y(calc)']), axis=1)
expert1["expert1_v"] = expert1.apply(lambda x: xy2v(x['x(calc)'], x['y(calc)']), axis=1)

fixed_expert1 = expert1.loc[:, ['expert1_u', 'expert1_v']]
fixed_expert1

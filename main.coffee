
[margin, width, height] = [80, 600, 400]
attrs = (obj)->
  ()->
    for k, v of obj
      this.attr(k, v)
    this

d3.csv "./isucon3.csv", (data)->

  # data = data.filter((d)-> +d.score < 30000)

  svg = d3.select('body').append('svg').call attrs
    width: width + margin * 2
    height: height + margin * 2
  main = svg.append('g').call attrs
    width: width
    height: height
    transform: "translate(#{margin},#{margin})"

  x = d3.scale.linear().domain(d3.extent(data, (d)-> +d.bench)).range([0, width])
  y = d3.scale.linear().domain(d3.extent(data, (d)-> +d.score)).range([height, 0])
  color = d3.scale.category20()


  xaxis = d3.svg.axis().scale(x)
  yaxis = d3.svg.axis().scale(y).orient('left')
  xAxis = main.append('g').call(xaxis).attr('transform', "translate(0,#{height})")
  yAxis = main.append('g').call(yaxis)
  xAxis.selectAll('path,line').call attrs
    fill: 'none'
    stroke: 'grey'
  yAxis.selectAll('path,line').call attrs
    fill: 'none'
    stroke: 'grey'
  xLabel = main.append('text').text('bench回数').style('text-anchor', 'middle').call attrs
    dx: width / 2
    dy: height + 50
  yLabel = main.append('text').text('スコア').style('text-anchor', 'middle').call attrs
    dx: -height / 2
    dy: -70
    transform: "rotate(-90)"


  circle = main.selectAll('g.team').data(data).enter().append('g').classed('team', true).call attrs
    transform: (d)-> "translate(#{x(+d.bench)},#{y(+d.score)})"

  circle.append('circle').call attrs
    r: 5
    fill: (d)-> color(d.name)
    stroke: 'none'
  circle.append('text').text((d)-> d.name)

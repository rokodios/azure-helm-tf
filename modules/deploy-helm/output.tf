output "helm_chart_status" {
  value = {
    for idx, chart in var.charts : chart.chart_name => helm_release.chart_installation[idx].status
  }
}
- dashboard: test
  title: Test
  layout: tile
  tile_size: 100

#  filters:

  elements:

  - name: add_a_unique_name_1475084833
    title: Untitled Visualization
    type: looker_column
    model: thesis_project
    explore: lapd_2015_stop_data
    dimensions: [lapd_2015_stop_data.persn_gender_cd, lapd_2015_stop_data.descent_desc]
    pivots: [lapd_2015_stop_data.descent_desc]
    measures: [lapd_2015_stop_data.count]
    dynamic_fields:
      - table_calculation: calculation_1
        label: Calculation 1
        expression: "pivot_index(${lapd_2015_stop_data.count},1)*2 - sum(pivot_offset_list(${lapd_2015_stop_data.count}, 1 - pivot_column(), pivot_column()))"
    filters:
      lapd_2015_stop_data.persn_gender_cd: M
    sorts: [lapd_2015_stop_data.count desc, lapd_2015_stop_data.descent_desc]
    limit: '500'
    column_limit: '50'
    query_timezone: America/Los_Angeles
    stacking: normal
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: '#808080'
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    show_null_points: true
    point_style: circle
    interpolation: linear
    value_labels: legend
    label_type: labPer
    series_types: {}

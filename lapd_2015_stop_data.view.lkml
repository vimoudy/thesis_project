view: lapd_2015_stop_data {
  sql_table_name: public.lapd_2015_stop_data ;;

  dimension: stop_nbr {
    label: "Stop Number"
    type: number
    sql: ${TABLE}.stop_nbr ;;
    primary_key: yes
  }

  dimension: form_ref_nbr {
    label: "Form Reference Number"
    type: number
    sql: ${TABLE}.form_ref_nbr ;;
  }

  dimension: persn_gender_cd {
    label: "Gender"
    type: string
    sql: ${TABLE}.persn_gender_cd ;;
  }

  dimension: persn_descent_cd {
    label: "Gender Character"
    type: string
    sql: ${TABLE}.persn_descent_cd ;;
  }

  dimension: descent_desc {
    label: "Ethnicity"
    type: string
    sql: ${TABLE}.descent_desc ;;
  }

  dimension_group: stop_dt {
    label: "Stop"
    type: time
    timeframes: [date, month]
    sql: ${TABLE}.stop_dt ;;
  }

  dimension: ofcr1_serl_nbr {
    label: "Officer 1 Serial Number"
    type: number
    sql: ${TABLE}.ofcr1_serl_nbr ;;
    drill_fields: [officer_stats*]
  }

  dimension:  ofcr1_div_nbr {
    label: "Officer 1 Division Number"
    type: string
    sql: ${TABLE}.ofcr1_div_nbr ;;
  }

  dimension: div1_desc {
    label: "Officer 1 Division Name"
    type: string
    sql: ${TABLE}.div1_desc ;;
  }

  dimension: rpt_dist_nbr {
    label: "District Number"
    type: number
    sql: ${TABLE}.rpt_dist_nbr ;;
    drill_fields: [viz_detail*]
  }

  dimension: stop_type {
    label: "Stop Type"
    type: string
    sql: ${TABLE}.stop_type ;;
  }

  dimension:  post_stop_actv_ind {
    label: "After Action Required"
    type: yesno
    sql: ${TABLE}.post_stop_actv_ind = 'Y' ;;
  }

  dimension: stop_tm {
    label: "Stop Time"
    type: string
    sql: ${TABLE}.stop_tm ;;
  }

  dimension: ofcr2_serl_nbr {
    label: "Officer 2 Serial Number"
    type: string
    sql: ${TABLE}.ofcr2_serl_nbr ;;
  }

  dimension:  ofcr2_div_nbr {
    label: "Officer 2 Division Number"
    type: string
    sql: ${TABLE}.ofcr2_div_nbr ;;
  }

  dimension: div2_desc {
    label: "Officer 2 Division Name"
    type: string
    sql: ${TABLE}.div2_desc ;;
  }

  measure: count {
    type: count
  }

  # Sets


  set: viz_detail {
    fields: [descent_desc, count]
  }

  set: officer_stats {
    fields: [descent_desc, count]
  }

}

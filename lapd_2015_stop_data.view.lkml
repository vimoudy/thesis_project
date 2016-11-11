view: lapd_2015_stop_data {
  sql_table_name: public.lapd_2015_stop_data ;;

  dimension: descent_desc {
    type: string
    sql: ${TABLE}.descent_desc ;;
  }

  dimension: div1_desc {
    type: string
    sql: ${TABLE}.div1_desc ;;
  }

  dimension: div2_desc {
    type: string
    sql: ${TABLE}.div2_desc ;;
  }

  dimension: form_ref_nbr {
    type: number
    sql: ${TABLE}.form_ref_nbr ;;
  }

  dimension: ofcr1_div_nbr {
    type: string
    sql: ${TABLE}.ofcr1_div_nbr ;;
  }

  dimension: ofcr1_serl_nbr {
    type: number
    sql: ${TABLE}.ofcr1_serl_nbr ;;
  }

  dimension: ofcr2_div_nbr {
    type: string
    sql: ${TABLE}.ofcr2_div_nbr ;;
  }

  dimension: ofcr2_serl_nbr {
    type: string
    sql: ${TABLE}.ofcr2_serl_nbr ;;
  }

  dimension: persn_descent_cd {
    type: string
    sql: ${TABLE}.persn_descent_cd ;;
  }

  dimension: persn_gender_cd {
    type: string
    sql: ${TABLE}.persn_gender_cd ;;
  }

  dimension: post_stop_actv_ind {
    type: string
    sql: ${TABLE}.post_stop_actv_ind ;;
  }

  dimension: rpt_dist_nbr {
    type: number
    sql: ${TABLE}.rpt_dist_nbr ;;
  }

  dimension_group: stop_dt {
    type: time
    timeframes: [date, week, month]
    convert_tz: no
    sql: ${TABLE}.stop_dt ;;
  }

  dimension: stop_nbr {
    type: number
    sql: ${TABLE}.stop_nbr ;;
  }

  dimension: stop_tm {
    type: string
    sql: ${TABLE}.stop_tm ;;
  }

  dimension: stop_type {
    type: string
    sql: ${TABLE}.stop_type ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}

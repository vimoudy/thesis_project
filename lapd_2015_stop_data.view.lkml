view: lapd_2015_stop_data {
  sql_table_name: public.lapd_2015_stop_data ;;

  dimension: stop_nbr {
    label: "Stop Number"
    type: number
    sql: ${TABLE}.stop_nbr ;;
    primary_key: yes
  }

  measure: test_sum {
    type: number
    sql: (SELECT SUM(CASE WHEN ${persn_gender_cd} = 'M' OR ${persn_gender_cd} = 'F' THEN 1 ELSE 0 END)
         FROM lapd_2015_stop_data) ;;
  }

  measure:  percent {
    type: number
    sql: ${count}::float / ${test_sum}::float ;;
    value_format_name: percent_2
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
    case: {
      when: {
        sql: ${TABLE}.descent_desc = 'AMERICAN INDIAN' ;;
        label: "American Indian"
      }
      when: {
        sql: ${TABLE}.descent_desc = 'ASIAN' ;;
        label: "Asian American"
      }
      when: {
        sql: ${TABLE}.descent_desc = 'BLACK' ;;
        label: "African American"
      }
      when: {
        sql: ${TABLE}.descent_desc = 'HISPANIC';;
        label: "Latino American"
      }
      when: {
        sql: ${TABLE}.descent_desc = 'WHITE' ;;
        label: "White"
      }
      else: "Other"
    }
  }

  dimension_group: stop_dt {
    label: "Stop"
    type: time
    timeframes: [date, month, week]
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
    type: string
    case: {
        when: {
          sql: ${TABLE}.stop_type = 'PED';;
          label: "Pedestrian"
        }
        when: {
          sql: ${TABLE}.stop_type = 'VEH' ;;
          label: "Vehicle"
        }
      }
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

  measure: count_distinct {
    type: count_distinct
    sql: ${stop_nbr} ;;
#     filters: {
#       field: post_stop_actv_ind
#       value: "yes"
#     }
  }

  measure: percent_of_previous {
    type: percent_of_previous
    sql: ${count} ;;
  }

  # Sets

  set: viz_detail {
    fields: [descent_desc, count]
  }

  set: officer_stats {
    fields: [descent_desc, count]
  }
}

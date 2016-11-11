view: lapd_2015_stop_data {
  sql_table_name: public.lapd_2015_stop_data ;;

<<<<<<< HEAD
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
=======
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

>>>>>>> branch 'dev-vincent-moudy-nngb' of git@lkrgit_github_22d6e6e6af84a849d72dab64f6b7a44e18ad81a2:vince-looker/thesis_project.git
}

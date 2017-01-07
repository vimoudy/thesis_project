connection: "thesis_postgresql"
include: "*.view.lkml"
include: "*.dashboard.lkml"


explore: lapd_2015_stop_data {
  persist_for: "1 hour"
}

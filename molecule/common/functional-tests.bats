#! /usr/bin/bats
#
# Functional tests for a VM set up with Ansible role bertvv.ROLENAME
#
# The variable SUT_IP, the IP address of the System Under Test must be set
# outside of the script.

#---------- Variables ---------------------------------------------------------

#---------- Helper functions --------------------------------------------------

#---------- Tests -------------------------------------------------------------

@test 'System Under Test should be accessible from physical system' {
  ping -c 1 "${SUT_IP}"
}

@test "Web interface should be accessible" {
  run curl --silent --head "http://${SUT_IP}/collectd/"
  
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = $'HTTP/1.1 200 OK\r' ]

  # Print the first line in POSIX $'' format so it can be compared with the
  # expected output.
  printf '%q' "${lines[0]}"
}

@test "There should be info about the 3 VMs available" {
  run curl --silent "http://${SUT_IP}/collectd/"
  
  [ "$status" -eq 0 ]
  printf '%s' "${output}"
  grep "hostname=cl1" <<< "${output}"
  grep "hostname=cl2" <<< "${output}"
  grep "hostname=srv" <<< "${output}"
}

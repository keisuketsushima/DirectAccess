program fig47

  implicit none
  integer :: len
  integer :: a
  integer :: i, iost
  double precision :: start_time, end_time, result_1, result_2
  integer :: length
  integer(8) :: answer_1=0, answer_2=0

  read(*, *) len
  read(9) length
  call cpu_time(start_time)
  open(10, access = "direct", recl = length)
  do i = 2, len, 2
     read(10, rec=i, iostat=iost) a
     answer_1 = answer_1 + a
  end do
  close(10)
  call cpu_time(end_time)
  result_1 = end_time - start_time

  call cpu_time(start_time)
  do i = 1, len
     read(20) a
     if (mod(i, 2) /= 0) cycle
     answer_2 = answer_2 + a
  end do
  call cpu_time(end_time)
  result_2 = end_time - start_time
  write(*, *) "Latencies:"
  write(*, *) "   Direct Access     :", result_1, "(sec)"
  write(*, *) "   Sequential Access :", result_2, "(sec)"
  !write(*, *) "answer 1: ", answer_1
  !write(*, *) "answer 2: ", answer_2

end program fig47

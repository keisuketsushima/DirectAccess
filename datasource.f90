program datasource

implicit none
integer :: n
integer :: i=0, length

read(*, *) n
inquire(iolength = length) i
write(9) length
open(10, access = "direct", recl = length)
do i = 1, n
   write(10,rec=i) i
end do
close(10)

do i = 1, n
   write(20) i
end do

end program datasource

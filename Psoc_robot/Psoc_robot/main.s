	cpu LMM
	.module main.c
	.area text(rom, con, rel)
	.dbfile ./main.c
	.dbfile C:\Users\Ben\DOCUME~1\GitHub\PSOC_R~1\PSOC_R~1\PSOC_R~1\main.c
	.dbfunc e main _main fV
_main::
	.dbline 0 ; func end
	jmp .
	.dbend
	.dbfunc e TimerCaptureISR _TimerCaptureISR fV
_TimerCaptureISR::
	pop A
	.dbline 0 ; func end
	reti
	.dbend
	.dbfunc e Timer2CaptureISR _Timer2CaptureISR fV
_Timer2CaptureISR::
	pop A
	.dbline 0 ; func end
	reti
	.dbend
	.dbfunc e Timer3CaptureISR _Timer3CaptureISR fV
_Timer3CaptureISR::
	pop A
	.dbline 0 ; func end
	reti
	.dbend
	.dbfunc e motorControll1 _motorControll1 fV
_motorControll1::
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e motorControll2 _motorControll2 fV
_motorControll2::
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e ultrasoonSensor _ultrasoonSensor fV
_ultrasoonSensor::
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e Pulse _Pulse fV
_Pulse::
	.dbline 0 ; func end
	ret
	.dbend
	.area data(ram, con, rel)
	.dbfile C:\Users\Ben\DOCUME~1\GitHub\PSOC_R~1\PSOC_R~1\PSOC_R~1\main.c
_Flags3::
	.byte 0
	.dbsym e Flags3 _Flags3 c
	.area data(ram, con, rel)
	.dbfile C:\Users\Ben\DOCUME~1\GitHub\PSOC_R~1\PSOC_R~1\PSOC_R~1\main.c
_PulseWidth3::
	.byte 0,0
	.dbsym e PulseWidth3 _PulseWidth3 i
	.area data(ram, con, rel)
	.dbfile C:\Users\Ben\DOCUME~1\GitHub\PSOC_R~1\PSOC_R~1\PSOC_R~1\main.c
_CaptureNegEdge3::
	.byte 0,0
	.dbsym e CaptureNegEdge3 _CaptureNegEdge3 i
	.area data(ram, con, rel)
	.dbfile C:\Users\Ben\DOCUME~1\GitHub\PSOC_R~1\PSOC_R~1\PSOC_R~1\main.c
_CapturePosEdge3::
	.byte 0,0
	.dbsym e CapturePosEdge3 _CapturePosEdge3 i
	.area data(ram, con, rel)
	.dbfile C:\Users\Ben\DOCUME~1\GitHub\PSOC_R~1\PSOC_R~1\PSOC_R~1\main.c
_Flags2::
	.byte 0
	.dbsym e Flags2 _Flags2 c
	.area data(ram, con, rel)
	.dbfile C:\Users\Ben\DOCUME~1\GitHub\PSOC_R~1\PSOC_R~1\PSOC_R~1\main.c
_PulseWidth2::
	.byte 0,0
	.dbsym e PulseWidth2 _PulseWidth2 i
	.area data(ram, con, rel)
	.dbfile C:\Users\Ben\DOCUME~1\GitHub\PSOC_R~1\PSOC_R~1\PSOC_R~1\main.c
_CaptureNegEdge2::
	.byte 0,0
	.dbsym e CaptureNegEdge2 _CaptureNegEdge2 i
	.area data(ram, con, rel)
	.dbfile C:\Users\Ben\DOCUME~1\GitHub\PSOC_R~1\PSOC_R~1\PSOC_R~1\main.c
_CapturePosEdge2::
	.byte 0,0
	.dbsym e CapturePosEdge2 _CapturePosEdge2 i
	.area data(ram, con, rel)
	.dbfile C:\Users\Ben\DOCUME~1\GitHub\PSOC_R~1\PSOC_R~1\PSOC_R~1\main.c
_done::
	.byte 0
	.dbsym e done _done c
	.area data(ram, con, rel)
	.dbfile C:\Users\Ben\DOCUME~1\GitHub\PSOC_R~1\PSOC_R~1\PSOC_R~1\main.c
_Flags::
	.byte 0
	.dbsym e Flags _Flags c
	.area data(ram, con, rel)
	.dbfile C:\Users\Ben\DOCUME~1\GitHub\PSOC_R~1\PSOC_R~1\PSOC_R~1\main.c
_PulseWidth::
	.byte 0,0
	.dbsym e PulseWidth _PulseWidth i
	.area data(ram, con, rel)
	.dbfile C:\Users\Ben\DOCUME~1\GitHub\PSOC_R~1\PSOC_R~1\PSOC_R~1\main.c
_CaptureNegEdge::
	.byte 0,0
	.dbsym e CaptureNegEdge _CaptureNegEdge i
	.area data(ram, con, rel)
	.dbfile C:\Users\Ben\DOCUME~1\GitHub\PSOC_R~1\PSOC_R~1\PSOC_R~1\main.c
_CapturePosEdge::
	.byte 0,0
	.dbsym e CapturePosEdge _CapturePosEdge i

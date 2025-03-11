	.file	"mat_vec.c"
	.text
.Ltext0:
	.file 0 "/home/liu.als/eece5640-hw3/q2" "mat_vec.c"
	.p2align 4
	.globl	CLOCK
	.type	CLOCK, @function
CLOCK:
.LFB5681:
	.file 1 "mat_vec.c"
	.loc 1 8 16 view -0
	.cfi_startproc
	.loc 1 9 5 view .LVU1
	.loc 1 10 5 view .LVU2
	.loc 1 8 16 is_stmt 0 view .LVU3
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	.loc 1 10 5 view .LVU4
	movl	$1, %edi
	movq	%rsp, %rsi
	call	clock_gettime
.LVL0:
	.loc 1 11 5 is_stmt 1 view .LVU5
	.loc 1 11 22 is_stmt 0 view .LVU6
	imulq	$1000, (%rsp), %rax
	.loc 1 11 40 view .LVU7
	vxorps	%xmm1, %xmm1, %xmm1
	vcvtsi2sdq	8(%rsp), %xmm1, %xmm0
	.loc 1 11 29 view .LVU8
	vcvtsi2sdq	%rax, %xmm1, %xmm1
	vfmadd132sd	.LC0(%rip), %xmm1, %xmm0
	.loc 1 12 1 view .LVU9
	addq	$24, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE5681:
	.size	CLOCK, .-CLOCK
	.p2align 4
	.globl	matvec_avx512f
	.type	matvec_avx512f, @function
matvec_avx512f:
.LVL1:
.LFB5682:
	.loc 1 15 87 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 17 5 view .LVU11
	.loc 1 18 5 view .LVU12
.LBB40:
	.loc 1 18 10 view .LVU13
	.loc 1 18 23 view .LVU14
	testl	%ecx, %ecx
	jle	.L12
	leal	-1(%rcx), %eax
	movq	%rdx, %r9
	xorl	%r10d, %r10d
	leaq	4(%rdx,%rax,4), %r11
	leal	-16(%r8), %edx
.LVL2:
	.loc 1 18 23 is_stmt 0 view .LVU15
	shrl	$4, %edx
	addl	$1, %edx
	salq	$6, %rdx
.LVL3:
	.p2align 4,,10
	.p2align 3
.L6:
.LBB41:
	.loc 1 22 32 is_stmt 1 view .LVU16
	vxorpd	%xmm0, %xmm0, %xmm0
	cmpl	$15, %r8d
	jle	.L9
	movslq	%r10d, %rax
.LBE41:
	.loc 1 19 19 is_stmt 0 view .LVU17
	vxorps	%xmm0, %xmm0, %xmm0
	leaq	(%rdi,%rax,4), %rcx
.LBB48:
	.loc 1 24 42 view .LVU18
	xorl	%eax, %eax
.LVL4:
	.p2align 4,,10
	.p2align 3
.L7:
	.loc 1 24 13 is_stmt 1 discriminator 3 view .LVU19
.LBB42:
.LBI42:
	.file 2 "/usr/lib/gcc/x86_64-redhat-linux/11/include/avx512fintrin.h"
	.loc 2 6289 1 discriminator 3 view .LVU20
.LBB43:
	.loc 2 6291 3 discriminator 3 view .LVU21
	.loc 2 6291 3 is_stmt 0 discriminator 3 view .LVU22
.LBE43:
.LBE42:
	.loc 1 25 13 is_stmt 1 discriminator 3 view .LVU23
.LBB44:
.LBI44:
	.loc 2 6289 1 discriminator 3 view .LVU24
.LBB45:
	.loc 2 6291 3 discriminator 3 view .LVU25
	.loc 2 6291 3 is_stmt 0 discriminator 3 view .LVU26
.LBE45:
.LBE44:
	.loc 1 26 13 is_stmt 1 discriminator 3 view .LVU27
.LBB46:
.LBI46:
	.loc 2 13324 1 discriminator 3 view .LVU28
.LBB47:
	.loc 2 13326 3 discriminator 3 view .LVU29
	.loc 2 13326 19 is_stmt 0 discriminator 3 view .LVU30
	vmovups	(%rcx,%rax), %zmm2
	vfmadd231ps	(%rsi,%rax), %zmm2, %zmm0
.LVL5:
	.loc 2 13326 19 discriminator 3 view .LVU31
.LBE47:
.LBE46:
	.loc 1 22 44 is_stmt 1 discriminator 3 view .LVU32
	.loc 1 22 32 discriminator 3 view .LVU33
	addq	$64, %rax
.LVL6:
	.loc 1 22 32 is_stmt 0 discriminator 3 view .LVU34
	cmpq	%rax, %rdx
	jne	.L7
.LVL7:
.L9:
	.loc 1 22 32 discriminator 3 view .LVU35
.LBE48:
	.loc 1 30 9 is_stmt 1 discriminator 2 view .LVU36
.LBB49:
.LBI49:
	.loc 2 16125 1 discriminator 2 view .LVU37
.LBB50:
	.loc 2 16127 3 discriminator 2 view .LVU38
.LBB51:
.LBI51:
	.loc 2 5902 1 discriminator 2 view .LVU39
.LBB52:
	.loc 2 5904 3 discriminator 2 view .LVU40
.LBB53:
.LBI53:
	.file 3 "/usr/lib/gcc/x86_64-redhat-linux/11/include/avxintrin.h"
	.loc 3 1208 1 discriminator 2 view .LVU41
.LBB54:
	.loc 3 1210 3 discriminator 2 view .LVU42
	.loc 3 1211 3 discriminator 2 view .LVU43
.LBE54:
.LBE53:
	.loc 2 5904 20 is_stmt 0 discriminator 2 view .LVU44
	vextractf64x4	$0x1, %zmm0, %ymm1
.LVL8:
	.loc 2 5904 20 discriminator 2 view .LVU45
.LBE52:
.LBE51:
	.loc 2 16127 3 is_stmt 1 discriminator 2 view .LVU46
.LBB55:
.LBI55:
	.loc 2 5902 1 discriminator 2 view .LVU47
.LBB56:
	.loc 2 5904 3 discriminator 2 view .LVU48
.LBB57:
.LBI57:
	.loc 3 1208 1 discriminator 2 view .LVU49
.LBB58:
	.loc 3 1210 3 discriminator 2 view .LVU50
	.loc 3 1211 3 discriminator 2 view .LVU51
	.loc 3 1211 3 is_stmt 0 discriminator 2 view .LVU52
.LBE58:
.LBE57:
.LBE56:
.LBE55:
	.loc 2 16127 3 is_stmt 1 discriminator 2 view .LVU53
.LBE50:
.LBE49:
	.loc 1 18 23 is_stmt 0 discriminator 2 view .LVU54
	addq	$4, %r9
.LVL9:
	.loc 1 18 23 discriminator 2 view .LVU55
	addl	%r8d, %r10d
.LBB64:
.LBB63:
	.loc 2 16127 3 discriminator 2 view .LVU56
	vaddps	%ymm0, %ymm1, %ymm0
.LVL10:
	.loc 2 16127 3 is_stmt 1 discriminator 2 view .LVU57
.LBB59:
.LBI59:
	.loc 3 524 1 discriminator 2 view .LVU58
.LBB60:
	.loc 3 526 3 discriminator 2 view .LVU59
	.loc 3 526 19 is_stmt 0 discriminator 2 view .LVU60
	vextractf128	$0x1, %ymm0, %xmm1
.LVL11:
	.loc 3 526 19 discriminator 2 view .LVU61
.LBE60:
.LBE59:
	.loc 2 16127 3 is_stmt 1 discriminator 2 view .LVU62
.LBB61:
.LBI61:
	.loc 3 524 1 discriminator 2 view .LVU63
.LBB62:
	.loc 3 526 3 discriminator 2 view .LVU64
	.loc 3 526 3 is_stmt 0 discriminator 2 view .LVU65
.LBE62:
.LBE61:
	.loc 2 16127 3 is_stmt 1 discriminator 2 view .LVU66
	vaddps	%xmm0, %xmm1, %xmm1
.LVL12:
	.loc 2 16127 3 discriminator 2 view .LVU67
	.loc 2 16127 3 discriminator 2 view .LVU68
	vpermilps	$78, %xmm1, %xmm0
.LVL13:
	.loc 2 16127 3 is_stmt 0 discriminator 2 view .LVU69
	vaddps	%xmm1, %xmm0, %xmm0
.LVL14:
	.loc 2 16127 3 is_stmt 1 discriminator 2 view .LVU70
	.loc 2 16127 3 is_stmt 0 discriminator 2 view .LVU71
	vmovaps	%xmm0, %xmm1
	vshufps	$85, %xmm0, %xmm0, %xmm0
.LVL15:
	.loc 2 16127 3 discriminator 2 view .LVU72
	vaddss	%xmm0, %xmm1, %xmm1
.LBE63:
.LBE64:
	.loc 1 30 16 discriminator 2 view .LVU73
	vmovss	%xmm1, -4(%r9)
	.loc 1 18 33 is_stmt 1 discriminator 2 view .LVU74
.LVL16:
	.loc 1 18 23 discriminator 2 view .LVU75
	cmpq	%r11, %r9
	jne	.L6
	vzeroupper
.L12:
	.loc 1 18 23 is_stmt 0 discriminator 2 view .LVU76
.LBE40:
	.loc 1 32 1 view .LVU77
	ret
	.cfi_endproc
.LFE5682:
	.size	matvec_avx512f, .-matvec_avx512f
	.p2align 4
	.globl	matvec
	.type	matvec, @function
matvec:
.LVL17:
.LFB5683:
	.loc 1 35 79 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 37 5 view .LVU79
.LBB65:
	.loc 1 37 10 view .LVU80
	.loc 1 37 23 view .LVU81
	testl	%ecx, %ecx
	jle	.L22
	leal	-1(%rcx), %eax
.LBE65:
	.loc 1 35 79 is_stmt 0 view .LVU82
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
.LBB70:
	.loc 1 37 23 view .LVU83
	xorl	%r11d, %r11d
	vxorps	%xmm1, %xmm1, %xmm1
	leaq	4(%rdx,%rax,4), %rbx
	leal	-1(%r8), %r10d
.LVL18:
	.p2align 4,,10
	.p2align 3
.L15:
.LBB66:
.LBB67:
	.loc 1 40 27 is_stmt 1 view .LVU84
.LBE67:
	.loc 1 38 15 is_stmt 0 view .LVU85
	vmovaps	%xmm1, %xmm0
.LBB68:
	.loc 1 40 27 view .LVU86
	testl	%r8d, %r8d
	jle	.L18
	movslq	%r11d, %rax
.LBE68:
	.loc 1 38 15 view .LVU87
	vmovaps	%xmm1, %xmm0
	leaq	(%rdi,%rax,4), %r9
.LBB69:
	.loc 1 41 24 view .LVU88
	xorl	%eax, %eax
.LVL19:
	.p2align 4,,10
	.p2align 3
.L16:
	.loc 1 41 13 is_stmt 1 discriminator 3 view .LVU89
	movq	%rax, %rcx
	.loc 1 41 17 is_stmt 0 discriminator 3 view .LVU90
	vmovss	(%r9,%rax,4), %xmm2
	vfmadd231ss	(%rsi,%rax,4), %xmm2, %xmm0
.LVL20:
	.loc 1 40 36 is_stmt 1 discriminator 3 view .LVU91
	.loc 1 40 27 discriminator 3 view .LVU92
	addq	$1, %rax
.LVL21:
	.loc 1 40 27 is_stmt 0 discriminator 3 view .LVU93
	cmpq	%rcx, %r10
	jne	.L16
.LVL22:
.L18:
	.loc 1 40 27 discriminator 3 view .LVU94
.LBE69:
	.loc 1 43 9 is_stmt 1 discriminator 2 view .LVU95
	.loc 1 43 16 is_stmt 0 discriminator 2 view .LVU96
	vmovss	%xmm0, (%rdx)
.LBE66:
	.loc 1 37 33 is_stmt 1 discriminator 2 view .LVU97
.LVL23:
	.loc 1 37 23 discriminator 2 view .LVU98
	addq	$4, %rdx
.LVL24:
	.loc 1 37 23 is_stmt 0 discriminator 2 view .LVU99
	addl	%r8d, %r11d
	cmpq	%rbx, %rdx
	jne	.L15
.LBE70:
	.loc 1 45 1 view .LVU100
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
.LVL25:
.L22:
	.cfi_restore 3
	.loc 1 45 1 view .LVU101
	ret
	.cfi_endproc
.LFE5683:
	.size	matvec, .-matvec
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC2:
	.string	"%f "
	.text
	.p2align 4
	.globl	print_vector
	.type	print_vector, @function
print_vector:
.LVL26:
.LFB5684:
	.loc 1 47 44 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 48 5 view .LVU103
.LBB71:
	.loc 1 48 9 view .LVU104
	.loc 1 48 22 view .LVU105
	testl	%esi, %esi
	jle	.L31
.LBE71:
	.loc 1 47 44 is_stmt 0 view .LVU106
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	movq	%rdi, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	movslq	%esi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
.LBB72:
	.loc 1 48 22 view .LVU107
	xorl	%ebx, %ebx
	jmp	.L28
.LVL27:
	.p2align 4,,10
	.p2align 3
.L27:
	.loc 1 51 9 is_stmt 1 discriminator 2 view .LVU108
	vxorpd	%xmm1, %xmm1, %xmm1
	movl	$.LC2, %edi
	movl	$1, %eax
	vcvtss2sd	(%r12,%rbx,4), %xmm1, %xmm0
	call	printf
.LVL28:
	.loc 1 48 30 discriminator 2 view .LVU109
	.loc 1 48 22 discriminator 2 view .LVU110
	addq	$1, %rbx
.LVL29:
	.loc 1 48 22 is_stmt 0 discriminator 2 view .LVU111
	cmpq	%rbp, %rbx
	je	.L34
.L28:
.LVL30:
	.loc 1 49 9 is_stmt 1 view .LVU112
	.loc 1 49 12 is_stmt 0 view .LVU113
	testb	$15, %bl
	jne	.L27
	.loc 1 50 13 is_stmt 1 view .LVU114
	movl	$10, %edi
	call	putchar
.LVL31:
	jmp	.L27
.LVL32:
	.p2align 4,,10
	.p2align 3
.L34:
	.loc 1 50 13 is_stmt 0 view .LVU115
.LBE72:
	.loc 1 53 5 is_stmt 1 view .LVU116
	.loc 1 54 1 is_stmt 0 view .LVU117
	popq	%rbx
	.cfi_restore 3
	.cfi_def_cfa_offset 24
	.loc 1 53 5 view .LVU118
	movl	$10, %edi
	.loc 1 54 1 view .LVU119
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa_offset 16
.LVL33:
	.loc 1 54 1 view .LVU120
	popq	%r12
	.cfi_restore 12
	.cfi_def_cfa_offset 8
.LVL34:
	.loc 1 53 5 view .LVU121
	jmp	putchar
.LVL35:
	.p2align 4,,10
	.p2align 3
.L31:
	.loc 1 53 5 is_stmt 1 view .LVU122
	movl	$10, %edi
.LVL36:
	.loc 1 53 5 is_stmt 0 view .LVU123
	jmp	putchar
.LVL37:
	.loc 1 53 5 view .LVU124
	.cfi_endproc
.LFE5684:
	.size	print_vector, .-print_vector
	.section	.rodata.str1.1
.LC4:
	.string	"Mat-vec result"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC5:
	.string	"The total time for matrix multiplication with AVX = %f ms\n"
	.align 8
.LC6:
	.string	"The total time for matrix multiplication without AVX = %f ms\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB5685:
	.loc 1 56 12 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 60 5 view .LVU126
	.loc 1 61 5 view .LVU127
	.loc 1 62 5 view .LVU128
	.loc 1 63 5 view .LVU129
	.loc 1 64 5 view .LVU130
.LVL38:
	.loc 1 65 5 view .LVU131
	.loc 1 68 5 view .LVU132
	.loc 1 68 16 view .LVU133
	.loc 1 56 12 is_stmt 0 view .LVU134
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	vxorps	%xmm1, %xmm1, %xmm1
	xorl	%eax, %eax
	subq	$2192, %rsp
	.cfi_def_cfa_offset 2208
.LVL39:
	.p2align 4,,10
	.p2align 3
.L36:
	.loc 1 69 9 is_stmt 1 discriminator 3 view .LVU135
	.loc 1 69 16 is_stmt 0 discriminator 3 view .LVU136
	vcvtsi2ssl	%eax, %xmm1, %xmm0
	vmovss	%xmm0, 144(%rsp,%rax,4)
	.loc 1 68 32 is_stmt 1 discriminator 3 view .LVU137
.LVL40:
	.loc 1 68 16 discriminator 3 view .LVU138
	addq	$1, %rax
.LVL41:
	.loc 1 68 16 is_stmt 0 discriminator 3 view .LVU139
	cmpq	$512, %rax
	jne	.L36
	vmovss	.LC3(%rip), %xmm0
	leaq	16(%rsp), %rax
	leaq	80(%rsp), %rbp
	.p2align 4,,10
	.p2align 3
.L37:
.LVL42:
	.loc 1 73 9 is_stmt 1 discriminator 3 view .LVU140
	.loc 1 73 14 is_stmt 0 discriminator 3 view .LVU141
	vmovss	%xmm0, (%rax)
	.loc 1 72 31 is_stmt 1 discriminator 3 view .LVU142
.LVL43:
	.loc 1 72 15 discriminator 3 view .LVU143
	addq	$4, %rax
.LVL44:
	.loc 1 72 15 is_stmt 0 discriminator 3 view .LVU144
	cmpq	%rax, %rbp
	jne	.L37
	.loc 1 81 5 is_stmt 1 view .LVU145
.LBB73:
	.loc 1 78 16 is_stmt 0 view .LVU146
	vpxor	%xmm1, %xmm1, %xmm1
.LBE73:
	.loc 1 81 13 view .LVU147
	xorl	%eax, %eax
.LVL45:
.LBB74:
	.loc 1 78 16 view .LVU148
	vmovdqa	%xmm1, 80(%rsp)
	vmovdqa	%xmm1, 96(%rsp)
	vmovdqa	%xmm1, 112(%rsp)
	vmovdqa	%xmm1, 128(%rsp)
.LBE74:
	.loc 1 81 13 view .LVU149
	call	CLOCK
.LVL46:
	.loc 1 82 5 is_stmt 1 view .LVU150
	movq	%rbp, %rdx
	movl	$16, %r8d
	movl	$32, %ecx
	leaq	16(%rsp), %rsi
	leaq	144(%rsp), %rdi
	.loc 1 81 13 is_stmt 0 view .LVU151
	vmovsd	%xmm0, 8(%rsp)
.LVL47:
	.loc 1 82 5 view .LVU152
	call	matvec_avx512f
.LVL48:
	.loc 1 83 5 is_stmt 1 view .LVU153
	.loc 1 83 14 is_stmt 0 view .LVU154
	xorl	%eax, %eax
	call	CLOCK
.LVL49:
	.loc 1 85 5 is_stmt 1 view .LVU155
	.loc 1 85 11 is_stmt 0 view .LVU156
	vsubsd	8(%rsp), %xmm0, %xmm0
.LVL50:
	.loc 1 86 5 view .LVU157
	movl	$.LC4, %edi
	.loc 1 85 11 view .LVU158
	vmovsd	%xmm0, 8(%rsp)
.LVL51:
	.loc 1 86 5 is_stmt 1 view .LVU159
	call	puts
.LVL52:
	.loc 1 87 5 view .LVU160
	movl	$16, %esi
	movq	%rbp, %rdi
	call	print_vector
.LVL53:
	.loc 1 88 5 view .LVU161
	movl	$.LC5, %edi
	movl	$1, %eax
	vmovsd	8(%rsp), %xmm0
	call	printf
.LVL54:
	.loc 1 91 5 view .LVU162
.LBB75:
	.loc 1 91 9 view .LVU163
	.loc 1 91 22 view .LVU164
	.loc 1 92 16 is_stmt 0 view .LVU165
	vpxor	%xmm1, %xmm1, %xmm1
.LBE75:
	.loc 1 95 13 view .LVU166
	xorl	%eax, %eax
.LBB76:
	.loc 1 92 16 view .LVU167
	vmovdqa	%xmm1, 80(%rsp)
	vmovdqa	%xmm1, 96(%rsp)
	vmovdqa	%xmm1, 112(%rsp)
	vmovdqa	%xmm1, 128(%rsp)
.LVL55:
	.loc 1 92 16 view .LVU168
.LBE76:
	.loc 1 95 5 is_stmt 1 view .LVU169
	.loc 1 95 13 is_stmt 0 view .LVU170
	call	CLOCK
.LVL56:
	.loc 1 96 5 is_stmt 1 view .LVU171
	movq	%rbp, %rdx
	movl	$16, %r8d
	movl	$32, %ecx
	leaq	16(%rsp), %rsi
	leaq	144(%rsp), %rdi
	.loc 1 95 13 is_stmt 0 view .LVU172
	vmovsd	%xmm0, 8(%rsp)
.LVL57:
	.loc 1 96 5 view .LVU173
	call	matvec
.LVL58:
	.loc 1 97 5 is_stmt 1 view .LVU174
	.loc 1 97 14 is_stmt 0 view .LVU175
	xorl	%eax, %eax
	call	CLOCK
.LVL59:
	.loc 1 98 5 is_stmt 1 view .LVU176
	.loc 1 98 11 is_stmt 0 view .LVU177
	vsubsd	8(%rsp), %xmm0, %xmm0
.LVL60:
	.loc 1 100 5 view .LVU178
	movl	$.LC4, %edi
	.loc 1 98 11 view .LVU179
	vmovsd	%xmm0, 8(%rsp)
.LVL61:
	.loc 1 100 5 is_stmt 1 view .LVU180
	call	puts
.LVL62:
	.loc 1 101 5 view .LVU181
	movq	%rbp, %rdi
	movl	$16, %esi
	call	print_vector
.LVL63:
	.loc 1 102 5 view .LVU182
	movl	$.LC6, %edi
	movl	$1, %eax
	vmovsd	8(%rsp), %xmm0
	call	printf
.LVL64:
	.loc 1 103 5 view .LVU183
	.loc 1 104 1 is_stmt 0 view .LVU184
	addq	$2192, %rsp
	.cfi_def_cfa_offset 16
	xorl	%eax, %eax
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE5685:
	.size	main, .-main
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC0:
	.long	-1598689907
	.long	1051772663
	.section	.rodata.cst4,"aM",@progbits,4
	.align 4
.LC3:
	.long	1065353216
	.text
.Letext0:
	.file 4 "/usr/lib/gcc/x86_64-redhat-linux/11/include/stddef.h"
	.file 5 "/usr/include/bits/types.h"
	.file 6 "/usr/include/bits/types/clockid_t.h"
	.file 7 "/usr/include/bits/types/struct_timespec.h"
	.file 8 "/usr/lib/gcc/x86_64-redhat-linux/11/include/xmmintrin.h"
	.file 9 "/usr/lib/gcc/x86_64-redhat-linux/11/include/emmintrin.h"
	.file 10 "/usr/include/stdio.h"
	.file 11 "/usr/include/time.h"
	.file 12 "<built-in>"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0xb17
	.value	0x5
	.byte	0x1
	.byte	0x8
	.long	.Ldebug_abbrev0
	.uleb128 0x28
	.long	.LASF70
	.byte	0x1d
	.long	.LASF0
	.long	.LASF1
	.long	.LLRL46
	.quad	0
	.long	.Ldebug_line0
	.uleb128 0x3
	.byte	0x8
	.byte	0x4
	.long	.LASF2
	.uleb128 0x2
	.long	.LASF10
	.byte	0x4
	.byte	0xd1
	.byte	0x17
	.long	0x3d
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF3
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.long	.LASF4
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.long	.LASF5
	.uleb128 0x3
	.byte	0x2
	.byte	0x7
	.long	.LASF6
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF7
	.uleb128 0x3
	.byte	0x2
	.byte	0x5
	.long	.LASF8
	.uleb128 0x29
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x14
	.long	0x67
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.long	.LASF9
	.uleb128 0x2
	.long	.LASF11
	.byte	0x5
	.byte	0xa0
	.byte	0x1a
	.long	0x73
	.uleb128 0x2
	.long	.LASF12
	.byte	0x5
	.byte	0xa9
	.byte	0x1d
	.long	0x67
	.uleb128 0x2
	.long	.LASF13
	.byte	0x5
	.byte	0xc5
	.byte	0x21
	.long	0x73
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF14
	.uleb128 0x14
	.long	0x9e
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.long	.LASF15
	.uleb128 0x3
	.byte	0x10
	.byte	0x4
	.long	.LASF16
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF17
	.uleb128 0x3
	.byte	0x4
	.byte	0x4
	.long	.LASF18
	.uleb128 0x14
	.long	0xbf
	.uleb128 0x2
	.long	.LASF19
	.byte	0x6
	.byte	0x7
	.byte	0x15
	.long	0x86
	.uleb128 0x2a
	.long	.LASF71
	.byte	0x10
	.byte	0x7
	.byte	0xb
	.byte	0x8
	.long	0xfd
	.uleb128 0x1d
	.long	.LASF20
	.byte	0x10
	.byte	0xc
	.long	0x7a
	.byte	0
	.uleb128 0x1d
	.long	.LASF21
	.byte	0x15
	.byte	0x15
	.long	0x92
	.byte	0x8
	.byte	0
	.uleb128 0xe
	.long	0x102
	.uleb128 0x2b
	.uleb128 0x2
	.long	.LASF22
	.byte	0x8
	.byte	0x45
	.byte	0xf
	.long	0x10f
	.uleb128 0x6
	.long	0xbf
	.long	0x11b
	.uleb128 0x4
	.byte	0x3
	.byte	0
	.uleb128 0x2
	.long	.LASF23
	.byte	0x9
	.byte	0x2b
	.byte	0xd
	.long	0x127
	.uleb128 0x6
	.long	0x67
	.long	0x133
	.uleb128 0x4
	.byte	0x3
	.byte	0
	.uleb128 0x2
	.long	.LASF24
	.byte	0x3
	.byte	0x29
	.byte	0x10
	.long	0x13f
	.uleb128 0x6
	.long	0x2a
	.long	0x14b
	.uleb128 0x4
	.byte	0x3
	.byte	0
	.uleb128 0x2
	.long	.LASF25
	.byte	0x3
	.byte	0x2a
	.byte	0xf
	.long	0x157
	.uleb128 0x6
	.long	0xbf
	.long	0x163
	.uleb128 0x4
	.byte	0x7
	.byte	0
	.uleb128 0x2
	.long	.LASF26
	.byte	0x3
	.byte	0x37
	.byte	0xf
	.long	0x16f
	.uleb128 0x6
	.long	0xbf
	.long	0x17b
	.uleb128 0x4
	.byte	0x7
	.byte	0
	.uleb128 0x2
	.long	.LASF27
	.byte	0x3
	.byte	0x3b
	.byte	0x10
	.long	0x187
	.uleb128 0x6
	.long	0x2a
	.long	0x193
	.uleb128 0x4
	.byte	0x3
	.byte	0
	.uleb128 0x2
	.long	.LASF28
	.byte	0x2
	.byte	0x26
	.byte	0x10
	.long	0x19f
	.uleb128 0x6
	.long	0x2a
	.long	0x1ab
	.uleb128 0x4
	.byte	0x7
	.byte	0
	.uleb128 0x2
	.long	.LASF29
	.byte	0x2
	.byte	0x27
	.byte	0xf
	.long	0x1b7
	.uleb128 0x6
	.long	0xbf
	.long	0x1c3
	.uleb128 0x4
	.byte	0xf
	.byte	0
	.uleb128 0x6
	.long	0xbf
	.long	0x1cf
	.uleb128 0x4
	.byte	0xf
	.byte	0
	.uleb128 0x2
	.long	.LASF30
	.byte	0x2
	.byte	0x35
	.byte	0x10
	.long	0x1db
	.uleb128 0x6
	.long	0x2a
	.long	0x1e7
	.uleb128 0x4
	.byte	0x7
	.byte	0
	.uleb128 0x2c
	.long	.LASF72
	.byte	0x2
	.byte	0x38
	.byte	0xf
	.long	0x1c3
	.byte	0x1
	.uleb128 0x2
	.long	.LASF31
	.byte	0x2
	.byte	0x3c
	.byte	0x18
	.long	0x4b
	.uleb128 0x2
	.long	.LASF32
	.byte	0x2
	.byte	0x3d
	.byte	0x18
	.long	0x52
	.uleb128 0xe
	.long	0xa5
	.uleb128 0x1e
	.long	.LASF33
	.byte	0xa
	.value	0x15e
	.long	0x67
	.long	0x228
	.uleb128 0x15
	.long	0x20c
	.uleb128 0x2d
	.byte	0
	.uleb128 0x1e
	.long	.LASF34
	.byte	0xb
	.value	0x117
	.long	0x67
	.long	0x243
	.uleb128 0x15
	.long	0xcb
	.uleb128 0x15
	.long	0x243
	.byte	0
	.uleb128 0xe
	.long	0xd7
	.uleb128 0x1f
	.long	.LASF40
	.byte	0x38
	.byte	0x5
	.long	0x67
	.quad	.LFB5685
	.quad	.LFE5685-.LFB5685
	.uleb128 0x1
	.byte	0x9c
	.long	0x48d
	.uleb128 0xc
	.long	.LASF35
	.byte	0x3c
	.byte	0xc
	.long	0x2a
	.long	.LLST38
	.long	.LVUS38
	.uleb128 0xc
	.long	.LASF36
	.byte	0x3c
	.byte	0x13
	.long	0x2a
	.long	.LLST39
	.long	.LVUS39
	.uleb128 0xc
	.long	.LASF37
	.byte	0x3c
	.byte	0x1b
	.long	0x2a
	.long	.LLST40
	.long	.LVUS40
	.uleb128 0x7
	.string	"i"
	.byte	0x3d
	.byte	0x9
	.long	0x67
	.long	.LLST41
	.long	.LVUS41
	.uleb128 0x7
	.string	"j"
	.byte	0x3d
	.byte	0xb
	.long	0x67
	.long	.LLST42
	.long	.LVUS42
	.uleb128 0xf
	.string	"a"
	.byte	0x3e
	.byte	0xb
	.long	0x48d
	.uleb128 0x3
	.byte	0x91
	.sleb128 -2064
	.uleb128 0xf
	.string	"x"
	.byte	0x3e
	.byte	0x1b
	.long	0x49e
	.uleb128 0x3
	.byte	0x91
	.sleb128 -2192
	.uleb128 0xf
	.string	"res"
	.byte	0x3f
	.byte	0xb
	.long	0x49e
	.uleb128 0x3
	.byte	0x91
	.sleb128 -2128
	.uleb128 0x20
	.long	.LASF38
	.byte	0x40
	.long	0x31
	.byte	0x20
	.uleb128 0x20
	.long	.LASF39
	.byte	0x41
	.long	0x31
	.byte	0x10
	.uleb128 0x10
	.long	.LLRL43
	.long	0x317
	.uleb128 0x2e
	.string	"i"
	.byte	0x1
	.byte	0x4d
	.byte	0xd
	.long	0x67
	.byte	0
	.uleb128 0x10
	.long	.LLRL44
	.long	0x332
	.uleb128 0x7
	.string	"i"
	.byte	0x5b
	.byte	0xd
	.long	0x67
	.long	.LLST45
	.long	.LVUS45
	.byte	0
	.uleb128 0x11
	.quad	.LVL46
	.long	0x973
	.uleb128 0x8
	.quad	.LVL48
	.long	0x629
	.long	0x36f
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x75
	.sleb128 0
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x2
	.byte	0x8
	.byte	0x20
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x58
	.uleb128 0x2
	.byte	0x78
	.sleb128 0
	.byte	0
	.uleb128 0x11
	.quad	.LVL49
	.long	0x973
	.uleb128 0x8
	.quad	.LVL52
	.long	0xb08
	.long	0x39b
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC4
	.byte	0
	.uleb128 0x8
	.quad	.LVL53
	.long	0x4ae
	.long	0x3b8
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x40
	.byte	0
	.uleb128 0x8
	.quad	.LVL54
	.long	0x211
	.long	0x3e1
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC5
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x61
	.uleb128 0x6
	.byte	0x91
	.sleb128 -2200
	.byte	0xa6
	.byte	0x8
	.uleb128 0x2a
	.byte	0
	.uleb128 0x11
	.quad	.LVL56
	.long	0x973
	.uleb128 0x8
	.quad	.LVL58
	.long	0x56b
	.long	0x41e
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x75
	.sleb128 0
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x2
	.byte	0x8
	.byte	0x20
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x58
	.uleb128 0x2
	.byte	0x78
	.sleb128 0
	.byte	0
	.uleb128 0x11
	.quad	.LVL59
	.long	0x973
	.uleb128 0x8
	.quad	.LVL62
	.long	0xb08
	.long	0x44a
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC4
	.byte	0
	.uleb128 0x8
	.quad	.LVL63
	.long	0x4ae
	.long	0x467
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x40
	.byte	0
	.uleb128 0x16
	.quad	.LVL64
	.long	0x211
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC6
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x61
	.uleb128 0x6
	.byte	0x91
	.sleb128 -2200
	.byte	0xa6
	.byte	0x8
	.uleb128 0x2a
	.byte	0
	.byte	0
	.uleb128 0x21
	.long	0xbf
	.long	0x49e
	.uleb128 0x2f
	.long	0x3d
	.value	0x1ff
	.byte	0
	.uleb128 0x21
	.long	0xbf
	.long	0x4ae
	.uleb128 0x30
	.long	0x3d
	.byte	0xf
	.byte	0
	.uleb128 0x17
	.long	.LASF41
	.byte	0x2f
	.quad	.LFB5684
	.quad	.LFE5684-.LFB5684
	.uleb128 0x1
	.byte	0x9c
	.long	0x566
	.uleb128 0x12
	.string	"v"
	.byte	0x2f
	.byte	0x20
	.long	0x566
	.long	.LLST34
	.long	.LVUS34
	.uleb128 0x12
	.string	"len"
	.byte	0x2f
	.byte	0x27
	.long	0x67
	.long	.LLST35
	.long	.LVUS35
	.uleb128 0x10
	.long	.LLRL36
	.long	0x53b
	.uleb128 0x7
	.string	"i"
	.byte	0x30
	.byte	0xd
	.long	0x67
	.long	.LLST37
	.long	.LVUS37
	.uleb128 0x8
	.quad	.LVL28
	.long	0x211
	.long	0x527
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC2
	.byte	0
	.uleb128 0x16
	.quad	.LVL31
	.long	0xb11
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x3a
	.byte	0
	.byte	0
	.uleb128 0x31
	.quad	.LVL35
	.long	0xb11
	.long	0x552
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x3a
	.byte	0
	.uleb128 0x32
	.quad	.LVL37
	.long	0xb11
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x3a
	.byte	0
	.byte	0
	.uleb128 0xe
	.long	0xc6
	.uleb128 0x17
	.long	.LASF42
	.byte	0x23
	.quad	.LFB5683
	.quad	.LFE5683-.LFB5683
	.uleb128 0x1
	.byte	0x9c
	.long	0x624
	.uleb128 0x13
	.string	"a"
	.byte	0x23
	.byte	0x1a
	.long	0x566
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x13
	.string	"x"
	.byte	0x23
	.byte	0x2a
	.long	0x566
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x12
	.string	"res"
	.byte	0x23
	.byte	0x34
	.long	0x624
	.long	.LLST27
	.long	.LVUS27
	.uleb128 0x22
	.long	.LASF43
	.byte	0x23
	.byte	0x3d
	.long	0x67
	.long	.LLST28
	.long	.LVUS28
	.uleb128 0x23
	.long	.LASF44
	.byte	0x23
	.byte	0x48
	.long	0x67
	.uleb128 0x1
	.byte	0x58
	.uleb128 0x18
	.long	.LLRL29
	.uleb128 0x7
	.string	"i"
	.byte	0x25
	.byte	0xe
	.long	0x67
	.long	.LLST30
	.long	.LVUS30
	.uleb128 0x24
	.quad	.LBB66
	.quad	.LBE66-.LBB66
	.uleb128 0x7
	.string	"sum"
	.byte	0x26
	.byte	0xf
	.long	0xbf
	.long	.LLST31
	.long	.LVUS31
	.uleb128 0x18
	.long	.LLRL32
	.uleb128 0x7
	.string	"j"
	.byte	0x28
	.byte	0x12
	.long	0x67
	.long	.LLST33
	.long	.LVUS33
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0xe
	.long	0xbf
	.uleb128 0x17
	.long	.LASF45
	.byte	0xf
	.quad	.LFB5682
	.quad	.LFE5682-.LFB5682
	.uleb128 0x1
	.byte	0x9c
	.long	0x963
	.uleb128 0x13
	.string	"a"
	.byte	0xf
	.byte	0x22
	.long	0x566
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x13
	.string	"x"
	.byte	0xf
	.byte	0x32
	.long	0x566
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x12
	.string	"res"
	.byte	0xf
	.byte	0x3c
	.long	0x624
	.long	.LLST0
	.long	.LVUS0
	.uleb128 0x22
	.long	.LASF43
	.byte	0xf
	.byte	0x45
	.long	0x67
	.long	.LLST1
	.long	.LVUS1
	.uleb128 0x23
	.long	.LASF44
	.byte	0xf
	.byte	0x50
	.long	0x67
	.uleb128 0x1
	.byte	0x58
	.uleb128 0xc
	.long	.LASF46
	.byte	0x11
	.byte	0xc
	.long	0x963
	.long	.LLST2
	.long	.LVUS2
	.uleb128 0xc
	.long	.LASF47
	.byte	0x11
	.byte	0x13
	.long	0x963
	.long	.LLST3
	.long	.LVUS3
	.uleb128 0xc
	.long	.LASF48
	.byte	0x11
	.byte	0x1a
	.long	0x963
	.long	.LLST4
	.long	.LVUS4
	.uleb128 0x24
	.quad	.LBB40
	.quad	.LBE40-.LBB40
	.uleb128 0x7
	.string	"i"
	.byte	0x12
	.byte	0xe
	.long	0x67
	.long	.LLST5
	.long	.LVUS5
	.uleb128 0x10
	.long	.LLRL6
	.long	0x7af
	.uleb128 0x7
	.string	"j"
	.byte	0x16
	.byte	0x12
	.long	0x67
	.long	.LLST7
	.long	.LVUS7
	.uleb128 0x25
	.long	0xa58
	.quad	.LBI42
	.byte	.LVU20
	.quad	.LBB42
	.quad	.LBE42-.LBB42
	.byte	0x18
	.long	0x734
	.uleb128 0x5
	.long	0xa68
	.long	.LLST8
	.long	.LVUS8
	.byte	0
	.uleb128 0x25
	.long	0xa58
	.quad	.LBI44
	.byte	.LVU24
	.quad	.LBB44
	.quad	.LBE44-.LBB44
	.byte	0x19
	.long	0x765
	.uleb128 0x5
	.long	0xa68
	.long	.LLST9
	.long	.LVUS9
	.byte	0
	.uleb128 0x33
	.long	0xa20
	.quad	.LBI46
	.byte	.LVU28
	.quad	.LBB46
	.quad	.LBE46-.LBB46
	.byte	0x1
	.byte	0x1a
	.byte	0x17
	.uleb128 0x5
	.long	0xa4a
	.long	.LLST10
	.long	.LVUS10
	.uleb128 0x5
	.long	0xa3d
	.long	.LLST11
	.long	.LVUS11
	.uleb128 0x5
	.long	0xa30
	.long	.LLST12
	.long	.LVUS12
	.byte	0
	.byte	0
	.uleb128 0x34
	.long	0x9ba
	.quad	.LBI49
	.byte	.LVU37
	.long	.LLRL13
	.byte	0x1
	.byte	0x1e
	.byte	0x12
	.uleb128 0x19
	.long	0x9ca
	.uleb128 0x18
	.long	.LLRL13
	.uleb128 0xb
	.long	0x9d7
	.long	.LLST14
	.long	.LVUS14
	.uleb128 0xb
	.long	0x9e0
	.long	.LLST15
	.long	.LVUS15
	.uleb128 0xb
	.long	0x9e9
	.long	.LLST16
	.long	.LVUS16
	.uleb128 0xb
	.long	0x9f2
	.long	.LLST17
	.long	.LVUS17
	.uleb128 0xb
	.long	0x9fb
	.long	.LLST18
	.long	.LVUS18
	.uleb128 0xb
	.long	0xa04
	.long	.LLST19
	.long	.LVUS19
	.uleb128 0x1a
	.long	0xa0d
	.uleb128 0xb
	.long	0xa16
	.long	.LLST20
	.long	.LVUS20
	.uleb128 0x1b
	.long	0xa76
	.quad	.LBI51
	.byte	.LVU39
	.quad	.LBB51
	.quad	.LBE51-.LBB51
	.long	0x88a
	.uleb128 0x5
	.long	0xa93
	.long	.LLST21
	.long	.LVUS21
	.uleb128 0x19
	.long	0xa86
	.uleb128 0x1c
	.long	0xabf
	.quad	.LBI53
	.byte	.LVU41
	.quad	.LBB53
	.quad	.LBE53-.LBB53
	.value	0x1713
	.byte	0xc
	.uleb128 0x1a
	.long	0xacf
	.byte	0
	.byte	0
	.uleb128 0x1b
	.long	0xa76
	.quad	.LBI55
	.byte	.LVU47
	.quad	.LBB55
	.quad	.LBE55-.LBB55
	.long	0x8e6
	.uleb128 0x5
	.long	0xa93
	.long	.LLST22
	.long	.LVUS22
	.uleb128 0x19
	.long	0xa86
	.uleb128 0x1c
	.long	0xabf
	.quad	.LBI57
	.byte	.LVU49
	.quad	.LBB57
	.quad	.LBE57-.LBB57
	.value	0x1713
	.byte	0xc
	.uleb128 0x1a
	.long	0xacf
	.byte	0
	.byte	0
	.uleb128 0x1b
	.long	0xadd
	.quad	.LBI59
	.byte	.LVU58
	.quad	.LBB59
	.quad	.LBE59-.LBB59
	.long	0x923
	.uleb128 0x5
	.long	0xafa
	.long	.LLST23
	.long	.LVUS23
	.uleb128 0x5
	.long	0xaed
	.long	.LLST24
	.long	.LVUS24
	.byte	0
	.uleb128 0x1c
	.long	0xadd
	.quad	.LBI61
	.byte	.LVU63
	.quad	.LBB61
	.quad	.LBE61-.LBB61
	.value	0x3eff
	.byte	0x3
	.uleb128 0x5
	.long	0xafa
	.long	.LLST25
	.long	.LVUS25
	.uleb128 0x5
	.long	0xaed
	.long	.LLST26
	.long	.LVUS26
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x26
	.long	.LASF63
	.long	0xbf
	.long	0x973
	.uleb128 0x4
	.byte	0xf
	.byte	0
	.uleb128 0x1f
	.long	.LASF49
	.byte	0x8
	.byte	0x8
	.long	0x2a
	.quad	.LFB5681
	.quad	.LFE5681-.LFB5681
	.uleb128 0x1
	.byte	0x9c
	.long	0x9ba
	.uleb128 0xf
	.string	"t"
	.byte	0x9
	.byte	0x15
	.long	0xd7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x16
	.quad	.LVL0
	.long	0x228
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x31
	.uleb128 0x1
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.byte	0
	.uleb128 0xd
	.long	.LASF58
	.byte	0x2
	.value	0x3efd
	.long	0xbf
	.long	0xa20
	.uleb128 0x9
	.string	"__A"
	.byte	0x2
	.value	0x3efd
	.byte	0x1e
	.long	0x963
	.uleb128 0xa
	.long	.LASF50
	.long	0x163
	.uleb128 0xa
	.long	.LASF51
	.long	0x163
	.uleb128 0xa
	.long	.LASF52
	.long	0x163
	.uleb128 0xa
	.long	.LASF53
	.long	0x103
	.uleb128 0xa
	.long	.LASF54
	.long	0x103
	.uleb128 0xa
	.long	.LASF55
	.long	0x103
	.uleb128 0xa
	.long	.LASF56
	.long	0x103
	.uleb128 0xa
	.long	.LASF57
	.long	0x103
	.byte	0
	.uleb128 0xd
	.long	.LASF59
	.byte	0x2
	.value	0x340c
	.long	0x963
	.long	0xa58
	.uleb128 0x9
	.string	"__A"
	.byte	0x2
	.value	0x340c
	.byte	0x19
	.long	0x963
	.uleb128 0x9
	.string	"__B"
	.byte	0x2
	.value	0x340c
	.byte	0x25
	.long	0x963
	.uleb128 0x9
	.string	"__C"
	.byte	0x2
	.value	0x340c
	.byte	0x31
	.long	0x963
	.byte	0
	.uleb128 0xd
	.long	.LASF60
	.byte	0x2
	.value	0x1891
	.long	0x963
	.long	0xa76
	.uleb128 0x9
	.string	"__P"
	.byte	0x2
	.value	0x1891
	.byte	0x1e
	.long	0xfd
	.byte	0
	.uleb128 0xd
	.long	.LASF61
	.byte	0x2
	.value	0x170e
	.long	0x17b
	.long	0xaa1
	.uleb128 0x9
	.string	"__A"
	.byte	0x2
	.value	0x170e
	.byte	0x21
	.long	0xaa1
	.uleb128 0x35
	.long	.LASF62
	.byte	0x2
	.value	0x170e
	.byte	0x30
	.long	0x6e
	.byte	0
	.uleb128 0x26
	.long	.LASF30
	.long	0x2a
	.long	0xab1
	.uleb128 0x4
	.byte	0x7
	.byte	0
	.uleb128 0x36
	.long	.LASF73
	.byte	0x2
	.value	0x131
	.byte	0x1
	.long	0x963
	.byte	0x3
	.uleb128 0xd
	.long	.LASF64
	.byte	0x3
	.value	0x4b8
	.long	0x17b
	.long	0xadd
	.uleb128 0x37
	.string	"__Y"
	.byte	0x3
	.value	0x4ba
	.byte	0xb
	.long	0x17b
	.byte	0
	.uleb128 0xd
	.long	.LASF65
	.byte	0x3
	.value	0x20c
	.long	0x103
	.long	0xb08
	.uleb128 0x9
	.string	"__X"
	.byte	0x3
	.value	0x20c
	.byte	0x1f
	.long	0x163
	.uleb128 0x9
	.string	"__N"
	.byte	0x3
	.value	0x20c
	.byte	0x2e
	.long	0x6e
	.byte	0
	.uleb128 0x27
	.long	.LASF66
	.long	.LASF68
	.uleb128 0x27
	.long	.LASF67
	.long	.LASF69
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x49
	.byte	0
	.uleb128 0x2
	.uleb128 0x18
	.uleb128 0x7e
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x21
	.byte	0
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.uleb128 0x2137
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x2107
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.uleb128 0x2137
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x48
	.byte	0x1
	.uleb128 0x7d
	.uleb128 0x1
	.uleb128 0x7f
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 2
	.uleb128 0x3b
	.uleb128 0x21
	.sleb128 16127
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 3
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x34
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.uleb128 0x2137
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.uleb128 0x2137
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x20
	.uleb128 0x21
	.sleb128 3
	.uleb128 0x34
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0x21
	.sleb128 8
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x48
	.byte	0
	.uleb128 0x7d
	.uleb128 0x1
	.uleb128 0x7f
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.uleb128 0x2137
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x48
	.byte	0x1
	.uleb128 0x7d
	.uleb128 0x1
	.uleb128 0x7f
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 6
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7a
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x34
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x52
	.uleb128 0x1
	.uleb128 0x2138
	.uleb128 0xb
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x58
	.uleb128 0x21
	.sleb128 2
	.uleb128 0x59
	.uleb128 0x21
	.sleb128 16127
	.uleb128 0x57
	.uleb128 0x21
	.sleb128 3
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1c
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x52
	.uleb128 0x1
	.uleb128 0x2138
	.uleb128 0xb
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x58
	.uleb128 0x21
	.sleb128 2
	.uleb128 0x59
	.uleb128 0x5
	.uleb128 0x57
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x1d
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 7
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x1e
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 12
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1f
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7a
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x20
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 12
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x21
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x22
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.uleb128 0x2137
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x23
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x24
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.byte	0
	.byte	0
	.uleb128 0x25
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x52
	.uleb128 0x1
	.uleb128 0x2138
	.uleb128 0xb
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x58
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x59
	.uleb128 0xb
	.uleb128 0x57
	.uleb128 0x21
	.sleb128 21
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x26
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x2107
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x27
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 12
	.uleb128 0x3b
	.uleb128 0x21
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x28
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x1f
	.uleb128 0x1b
	.uleb128 0x1f
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x29
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x2a
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2b
	.uleb128 0x26
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x2c
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x88
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x2d
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x2e
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2f
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x30
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x31
	.uleb128 0x48
	.byte	0x1
	.uleb128 0x7d
	.uleb128 0x1
	.uleb128 0x82
	.uleb128 0x19
	.uleb128 0x7f
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x32
	.uleb128 0x48
	.byte	0x1
	.uleb128 0x7d
	.uleb128 0x1
	.uleb128 0x82
	.uleb128 0x19
	.uleb128 0x7f
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x33
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x52
	.uleb128 0x1
	.uleb128 0x2138
	.uleb128 0xb
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0xb
	.uleb128 0x57
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x34
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x52
	.uleb128 0x1
	.uleb128 0x2138
	.uleb128 0xb
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0xb
	.uleb128 0x57
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x35
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x36
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x34
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x37
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loclists,"",@progbits
	.long	.Ldebug_loc3-.Ldebug_loc2
.Ldebug_loc2:
	.value	0x5
	.byte	0x8
	.byte	0
	.long	0
.Ldebug_loc0:
.LVUS38:
	.uleb128 .LVU150
	.uleb128 .LVU152
	.uleb128 .LVU171
	.uleb128 .LVU173
.LLST38:
	.byte	0x6
	.quad	.LVL46
	.byte	0x4
	.uleb128 .LVL46-.LVL46
	.uleb128 .LVL47-.LVL46
	.uleb128 0x3
	.byte	0x91
	.sleb128 -2200
	.byte	0x4
	.uleb128 .LVL56-.LVL46
	.uleb128 .LVL57-.LVL46
	.uleb128 0x3
	.byte	0x91
	.sleb128 -2200
	.byte	0
.LVUS39:
	.uleb128 .LVU155
	.uleb128 .LVU157
	.uleb128 .LVU176
	.uleb128 .LVU178
.LLST39:
	.byte	0x6
	.quad	.LVL49
	.byte	0x4
	.uleb128 .LVL49-.LVL49
	.uleb128 .LVL50-.LVL49
	.uleb128 0x1
	.byte	0x61
	.byte	0x4
	.uleb128 .LVL59-.LVL49
	.uleb128 .LVL60-.LVL49
	.uleb128 0x1
	.byte	0x61
	.byte	0
.LVUS40:
	.uleb128 .LVU159
	.uleb128 .LVU160
	.uleb128 .LVU160
	.uleb128 .LVU173
	.uleb128 .LVU180
	.uleb128 .LVU181
	.uleb128 .LVU181
	.uleb128 0
.LLST40:
	.byte	0x6
	.quad	.LVL51
	.byte	0x4
	.uleb128 .LVL51-.LVL51
	.uleb128 .LVL52-1-.LVL51
	.uleb128 0x1
	.byte	0x61
	.byte	0x4
	.uleb128 .LVL52-1-.LVL51
	.uleb128 .LVL57-.LVL51
	.uleb128 0x3
	.byte	0x91
	.sleb128 -2200
	.byte	0x4
	.uleb128 .LVL61-.LVL51
	.uleb128 .LVL62-1-.LVL51
	.uleb128 0x1
	.byte	0x61
	.byte	0x4
	.uleb128 .LVL62-1-.LVL51
	.uleb128 .LFE5685-.LVL51
	.uleb128 0x3
	.byte	0x91
	.sleb128 -2200
	.byte	0
.LVUS41:
	.uleb128 .LVU133
	.uleb128 .LVU135
	.uleb128 .LVU135
	.uleb128 .LVU138
	.uleb128 .LVU138
	.uleb128 .LVU139
.LLST41:
	.byte	0x6
	.quad	.LVL38
	.byte	0x4
	.uleb128 .LVL38-.LVL38
	.uleb128 .LVL39-.LVL38
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL39-.LVL38
	.uleb128 .LVL40-.LVL38
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL40-.LVL38
	.uleb128 .LVL41-.LVL38
	.uleb128 0x3
	.byte	0x70
	.sleb128 1
	.byte	0x9f
	.byte	0
.LVUS42:
	.uleb128 .LVU140
	.uleb128 .LVU143
	.uleb128 .LVU143
	.uleb128 .LVU144
	.uleb128 .LVU144
	.uleb128 .LVU148
.LLST42:
	.byte	0x6
	.quad	.LVL42
	.byte	0x4
	.uleb128 .LVL42-.LVL42
	.uleb128 .LVL43-.LVL42
	.uleb128 0xb
	.byte	0x70
	.sleb128 0
	.byte	0x91
	.sleb128 0
	.byte	0x1c
	.byte	0x23
	.uleb128 0x890
	.byte	0x32
	.byte	0x25
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL43-.LVL42
	.uleb128 .LVL44-.LVL42
	.uleb128 0xd
	.byte	0x70
	.sleb128 0
	.byte	0x91
	.sleb128 0
	.byte	0x1c
	.byte	0x23
	.uleb128 0x890
	.byte	0x32
	.byte	0x25
	.byte	0x23
	.uleb128 0x1
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL44-.LVL42
	.uleb128 .LVL45-.LVL42
	.uleb128 0xd
	.byte	0x70
	.sleb128 0
	.byte	0x91
	.sleb128 0
	.byte	0x1c
	.byte	0x23
	.uleb128 0x88c
	.byte	0x32
	.byte	0x25
	.byte	0x23
	.uleb128 0x1
	.byte	0x9f
	.byte	0
.LVUS45:
	.uleb128 .LVU164
	.uleb128 .LVU168
.LLST45:
	.byte	0x8
	.quad	.LVL54
	.uleb128 .LVL55-.LVL54
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LVUS34:
	.uleb128 0
	.uleb128 .LVU108
	.uleb128 .LVU108
	.uleb128 .LVU121
	.uleb128 .LVU121
	.uleb128 .LVU122
	.uleb128 .LVU122
	.uleb128 .LVU123
	.uleb128 .LVU123
	.uleb128 0
.LLST34:
	.byte	0x6
	.quad	.LVL26
	.byte	0x4
	.uleb128 .LVL26-.LVL26
	.uleb128 .LVL27-.LVL26
	.uleb128 0x1
	.byte	0x55
	.byte	0x4
	.uleb128 .LVL27-.LVL26
	.uleb128 .LVL34-.LVL26
	.uleb128 0x1
	.byte	0x5c
	.byte	0x4
	.uleb128 .LVL34-.LVL26
	.uleb128 .LVL35-.LVL26
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL35-.LVL26
	.uleb128 .LVL36-.LVL26
	.uleb128 0x1
	.byte	0x55
	.byte	0x4
	.uleb128 .LVL36-.LVL26
	.uleb128 .LFE5684-.LVL26
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.byte	0
.LVUS35:
	.uleb128 0
	.uleb128 .LVU108
	.uleb128 .LVU108
	.uleb128 .LVU120
	.uleb128 .LVU120
	.uleb128 .LVU122
	.uleb128 .LVU122
	.uleb128 .LVU124
	.uleb128 .LVU124
	.uleb128 0
.LLST35:
	.byte	0x6
	.quad	.LVL26
	.byte	0x4
	.uleb128 .LVL26-.LVL26
	.uleb128 .LVL27-.LVL26
	.uleb128 0x1
	.byte	0x54
	.byte	0x4
	.uleb128 .LVL27-.LVL26
	.uleb128 .LVL33-.LVL26
	.uleb128 0x1
	.byte	0x56
	.byte	0x4
	.uleb128 .LVL33-.LVL26
	.uleb128 .LVL35-.LVL26
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL35-.LVL26
	.uleb128 .LVL37-1-.LVL26
	.uleb128 0x1
	.byte	0x54
	.byte	0x4
	.uleb128 .LVL37-1-.LVL26
	.uleb128 .LFE5684-.LVL26
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.byte	0
.LVUS37:
	.uleb128 .LVU105
	.uleb128 .LVU108
	.uleb128 .LVU108
	.uleb128 .LVU110
	.uleb128 .LVU110
	.uleb128 .LVU111
	.uleb128 .LVU112
	.uleb128 .LVU115
	.uleb128 .LVU122
	.uleb128 0
.LLST37:
	.byte	0x6
	.quad	.LVL26
	.byte	0x4
	.uleb128 .LVL26-.LVL26
	.uleb128 .LVL27-.LVL26
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL27-.LVL26
	.uleb128 .LVL28-.LVL26
	.uleb128 0x1
	.byte	0x53
	.byte	0x4
	.uleb128 .LVL28-.LVL26
	.uleb128 .LVL29-.LVL26
	.uleb128 0x3
	.byte	0x73
	.sleb128 1
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL30-.LVL26
	.uleb128 .LVL32-.LVL26
	.uleb128 0x1
	.byte	0x53
	.byte	0x4
	.uleb128 .LVL35-.LVL26
	.uleb128 .LFE5684-.LVL26
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LVUS27:
	.uleb128 0
	.uleb128 .LVU84
	.uleb128 .LVU84
	.uleb128 .LVU101
	.uleb128 .LVU101
	.uleb128 0
.LLST27:
	.byte	0x6
	.quad	.LVL17
	.byte	0x4
	.uleb128 .LVL17-.LVL17
	.uleb128 .LVL18-.LVL17
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL18-.LVL17
	.uleb128 .LVL25-.LVL17
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL25-.LVL17
	.uleb128 .LFE5683-.LVL17
	.uleb128 0x1
	.byte	0x51
	.byte	0
.LVUS28:
	.uleb128 0
	.uleb128 .LVU84
	.uleb128 .LVU84
	.uleb128 .LVU101
	.uleb128 .LVU101
	.uleb128 0
.LLST28:
	.byte	0x6
	.quad	.LVL17
	.byte	0x4
	.uleb128 .LVL17-.LVL17
	.uleb128 .LVL18-.LVL17
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL18-.LVL17
	.uleb128 .LVL25-.LVL17
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL25-.LVL17
	.uleb128 .LFE5683-.LVL17
	.uleb128 0x1
	.byte	0x52
	.byte	0
.LVUS30:
	.uleb128 .LVU81
	.uleb128 .LVU84
	.uleb128 .LVU84
	.uleb128 .LVU98
	.uleb128 .LVU98
	.uleb128 .LVU99
	.uleb128 .LVU99
	.uleb128 .LVU101
	.uleb128 .LVU101
	.uleb128 0
.LLST30:
	.byte	0x6
	.quad	.LVL17
	.byte	0x4
	.uleb128 .LVL17-.LVL17
	.uleb128 .LVL18-.LVL17
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL18-.LVL17
	.uleb128 .LVL23-.LVL17
	.uleb128 0x9
	.byte	0x71
	.sleb128 0
	.byte	0xa3
	.uleb128 0x1
	.byte	0x51
	.byte	0x1c
	.byte	0x32
	.byte	0x25
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL23-.LVL17
	.uleb128 .LVL24-.LVL17
	.uleb128 0xb
	.byte	0x71
	.sleb128 0
	.byte	0xa3
	.uleb128 0x1
	.byte	0x51
	.byte	0x1c
	.byte	0x32
	.byte	0x25
	.byte	0x23
	.uleb128 0x1
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL24-.LVL17
	.uleb128 .LVL25-.LVL17
	.uleb128 0xd
	.byte	0x71
	.sleb128 0
	.byte	0xa3
	.uleb128 0x1
	.byte	0x51
	.byte	0x1c
	.byte	0x34
	.byte	0x1c
	.byte	0x32
	.byte	0x25
	.byte	0x23
	.uleb128 0x1
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL25-.LVL17
	.uleb128 .LFE5683-.LVL17
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LVUS31:
	.uleb128 .LVU84
	.uleb128 .LVU89
	.uleb128 .LVU89
	.uleb128 .LVU94
.LLST31:
	.byte	0x6
	.quad	.LVL18
	.byte	0x4
	.uleb128 .LVL18-.LVL18
	.uleb128 .LVL19-.LVL18
	.uleb128 0x6
	.byte	0x9e
	.uleb128 0x4
	.long	0
	.byte	0x4
	.uleb128 .LVL19-.LVL18
	.uleb128 .LVL22-.LVL18
	.uleb128 0x1
	.byte	0x61
	.byte	0
.LVUS33:
	.uleb128 .LVU84
	.uleb128 .LVU89
	.uleb128 .LVU89
	.uleb128 .LVU92
	.uleb128 .LVU92
	.uleb128 .LVU93
.LLST33:
	.byte	0x6
	.quad	.LVL18
	.byte	0x4
	.uleb128 .LVL18-.LVL18
	.uleb128 .LVL19-.LVL18
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL19-.LVL18
	.uleb128 .LVL20-.LVL18
	.uleb128 0x1
	.byte	0x50
	.byte	0x4
	.uleb128 .LVL20-.LVL18
	.uleb128 .LVL21-.LVL18
	.uleb128 0x3
	.byte	0x70
	.sleb128 1
	.byte	0x9f
	.byte	0
.LVUS0:
	.uleb128 0
	.uleb128 .LVU15
	.uleb128 .LVU15
	.uleb128 .LVU16
	.uleb128 .LVU16
	.uleb128 0
.LLST0:
	.byte	0x6
	.quad	.LVL1
	.byte	0x4
	.uleb128 .LVL1-.LVL1
	.uleb128 .LVL2-.LVL1
	.uleb128 0x1
	.byte	0x51
	.byte	0x4
	.uleb128 .LVL2-.LVL1
	.uleb128 .LVL3-.LVL1
	.uleb128 0x1
	.byte	0x59
	.byte	0x4
	.uleb128 .LVL3-.LVL1
	.uleb128 .LFE5682-.LVL1
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.byte	0
.LVUS1:
	.uleb128 0
	.uleb128 .LVU16
	.uleb128 .LVU16
	.uleb128 0
.LLST1:
	.byte	0x6
	.quad	.LVL1
	.byte	0x4
	.uleb128 .LVL1-.LVL1
	.uleb128 .LVL3-.LVL1
	.uleb128 0x1
	.byte	0x52
	.byte	0x4
	.uleb128 .LVL3-.LVL1
	.uleb128 .LFE5682-.LVL1
	.uleb128 0x4
	.byte	0xa3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.byte	0
.LVUS2:
	.uleb128 .LVU22
	.uleb128 .LVU34
	.uleb128 .LVU34
	.uleb128 .LVU35
.LLST2:
	.byte	0x6
	.quad	.LVL4
	.byte	0x4
	.uleb128 .LVL4-.LVL4
	.uleb128 .LVL6-.LVL4
	.uleb128 0x5
	.byte	0x72
	.sleb128 0
	.byte	0x70
	.sleb128 0
	.byte	0x22
	.byte	0x4
	.uleb128 .LVL6-.LVL4
	.uleb128 .LVL7-.LVL4
	.uleb128 0x1
	.byte	0x63
	.byte	0
.LVUS3:
	.uleb128 .LVU26
	.uleb128 .LVU34
	.uleb128 .LVU34
	.uleb128 .LVU35
.LLST3:
	.byte	0x6
	.quad	.LVL4
	.byte	0x4
	.uleb128 .LVL4-.LVL4
	.uleb128 .LVL6-.LVL4
	.uleb128 0x5
	.byte	0x74
	.sleb128 0
	.byte	0x70
	.sleb128 0
	.byte	0x22
	.byte	0x4
	.uleb128 .LVL6-.LVL4
	.uleb128 .LVL7-.LVL4
	.uleb128 0x8
	.byte	0x70
	.sleb128 0
	.byte	0x74
	.sleb128 0
	.byte	0x22
	.byte	0x8
	.byte	0x40
	.byte	0x1c
	.byte	0
.LVUS4:
	.uleb128 .LVU16
	.uleb128 .LVU19
	.uleb128 .LVU19
	.uleb128 .LVU35
.LLST4:
	.byte	0x6
	.quad	.LVL3
	.byte	0x4
	.uleb128 .LVL3-.LVL3
	.uleb128 .LVL4-.LVL3
	.uleb128 0x80
	.byte	0x9e
	.uleb128 0x4
	.long	0
	.byte	0x93
	.uleb128 0x4
	.byte	0x9e
	.uleb128 0x4
	.long	0
	.byte	0x93
	.uleb128 0x4
	.byte	0x9e
	.uleb128 0x4
	.long	0
	.byte	0x93
	.uleb128 0x4
	.byte	0x9e
	.uleb128 0x4
	.long	0
	.byte	0x93
	.uleb128 0x4
	.byte	0x9e
	.uleb128 0x4
	.long	0
	.byte	0x93
	.uleb128 0x4
	.byte	0x9e
	.uleb128 0x4
	.long	0
	.byte	0x93
	.uleb128 0x4
	.byte	0x9e
	.uleb128 0x4
	.long	0
	.byte	0x93
	.uleb128 0x4
	.byte	0x9e
	.uleb128 0x4
	.long	0
	.byte	0x93
	.uleb128 0x4
	.byte	0x9e
	.uleb128 0x4
	.long	0
	.byte	0x93
	.uleb128 0x4
	.byte	0x9e
	.uleb128 0x4
	.long	0
	.byte	0x93
	.uleb128 0x4
	.byte	0x9e
	.uleb128 0x4
	.long	0
	.byte	0x93
	.uleb128 0x4
	.byte	0x9e
	.uleb128 0x4
	.long	0
	.byte	0x93
	.uleb128 0x4
	.byte	0x9e
	.uleb128 0x4
	.long	0
	.byte	0x93
	.uleb128 0x4
	.byte	0x9e
	.uleb128 0x4
	.long	0
	.byte	0x93
	.uleb128 0x4
	.byte	0x9e
	.uleb128 0x4
	.long	0
	.byte	0x93
	.uleb128 0x4
	.byte	0x9e
	.uleb128 0x4
	.long	0
	.byte	0x93
	.uleb128 0x4
	.byte	0x4
	.uleb128 .LVL4-.LVL3
	.uleb128 .LVL7-.LVL3
	.uleb128 0x1
	.byte	0x61
	.byte	0
.LVUS5:
	.uleb128 .LVU14
	.uleb128 .LVU16
	.uleb128 .LVU16
	.uleb128 .LVU55
	.uleb128 .LVU55
	.uleb128 .LVU75
.LLST5:
	.byte	0x6
	.quad	.LVL1
	.byte	0x4
	.uleb128 .LVL1-.LVL1
	.uleb128 .LVL3-.LVL1
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL3-.LVL1
	.uleb128 .LVL9-.LVL1
	.uleb128 0x9
	.byte	0x79
	.sleb128 0
	.byte	0xa3
	.uleb128 0x1
	.byte	0x51
	.byte	0x1c
	.byte	0x32
	.byte	0x25
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL9-.LVL1
	.uleb128 .LVL16-.LVL1
	.uleb128 0xb
	.byte	0x79
	.sleb128 0
	.byte	0xa3
	.uleb128 0x1
	.byte	0x51
	.byte	0x1c
	.byte	0x34
	.byte	0x1c
	.byte	0x32
	.byte	0x25
	.byte	0x9f
	.byte	0
.LVUS7:
	.uleb128 .LVU16
	.uleb128 .LVU19
	.uleb128 .LVU19
	.uleb128 .LVU33
	.uleb128 .LVU33
	.uleb128 .LVU34
	.uleb128 .LVU34
	.uleb128 .LVU35
.LLST7:
	.byte	0x6
	.quad	.LVL3
	.byte	0x4
	.uleb128 .LVL3-.LVL3
	.uleb128 .LVL4-.LVL3
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL4-.LVL3
	.uleb128 .LVL5-.LVL3
	.uleb128 0x5
	.byte	0x70
	.sleb128 0
	.byte	0x32
	.byte	0x25
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL5-.LVL3
	.uleb128 .LVL6-.LVL3
	.uleb128 0x7
	.byte	0x70
	.sleb128 0
	.byte	0x32
	.byte	0x25
	.byte	0x23
	.uleb128 0x10
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL6-.LVL3
	.uleb128 .LVL7-.LVL3
	.uleb128 0x7
	.byte	0x70
	.sleb128 -64
	.byte	0x32
	.byte	0x25
	.byte	0x23
	.uleb128 0x10
	.byte	0x9f
	.byte	0
.LVUS8:
	.uleb128 .LVU20
	.uleb128 .LVU22
.LLST8:
	.byte	0x8
	.quad	.LVL4
	.uleb128 .LVL4-.LVL4
	.uleb128 0x11
	.byte	0x7a
	.sleb128 0
	.byte	0x8
	.byte	0x20
	.byte	0x24
	.byte	0x8
	.byte	0x20
	.byte	0x26
	.byte	0x32
	.byte	0x24
	.byte	0x70
	.sleb128 0
	.byte	0x22
	.byte	0x75
	.sleb128 0
	.byte	0x22
	.byte	0x9f
	.byte	0
.LVUS9:
	.uleb128 .LVU24
	.uleb128 .LVU26
.LLST9:
	.byte	0x8
	.quad	.LVL4
	.uleb128 .LVL4-.LVL4
	.uleb128 0x6
	.byte	0x74
	.sleb128 0
	.byte	0x70
	.sleb128 0
	.byte	0x22
	.byte	0x9f
	.byte	0
.LVUS10:
	.uleb128 .LVU28
	.uleb128 .LVU31
.LLST10:
	.byte	0x8
	.quad	.LVL4
	.uleb128 .LVL5-.LVL4
	.uleb128 0x1
	.byte	0x61
	.byte	0
.LVUS11:
	.uleb128 .LVU28
	.uleb128 .LVU31
.LLST11:
	.byte	0x8
	.quad	.LVL4
	.uleb128 .LVL5-.LVL4
	.uleb128 0x5
	.byte	0x74
	.sleb128 0
	.byte	0x70
	.sleb128 0
	.byte	0x22
	.byte	0
.LVUS12:
	.uleb128 .LVU28
	.uleb128 .LVU31
.LLST12:
	.byte	0x8
	.quad	.LVL4
	.uleb128 .LVL5-.LVL4
	.uleb128 0x5
	.byte	0x72
	.sleb128 0
	.byte	0x70
	.sleb128 0
	.byte	0x22
	.byte	0
.LVUS14:
	.uleb128 .LVU45
	.uleb128 .LVU61
.LLST14:
	.byte	0x8
	.quad	.LVL8
	.uleb128 .LVL11-.LVL8
	.uleb128 0x1
	.byte	0x62
	.byte	0
.LVUS15:
	.uleb128 .LVU52
	.uleb128 .LVU57
.LLST15:
	.byte	0x8
	.quad	.LVL8
	.uleb128 .LVL10-.LVL8
	.uleb128 0x1
	.byte	0x61
	.byte	0
.LVUS16:
	.uleb128 .LVU57
	.uleb128 .LVU69
.LLST16:
	.byte	0x8
	.quad	.LVL10
	.uleb128 .LVL13-.LVL10
	.uleb128 0x1
	.byte	0x61
	.byte	0
.LVUS17:
	.uleb128 .LVU61
	.uleb128 .LVU67
.LLST17:
	.byte	0x8
	.quad	.LVL11
	.uleb128 .LVL12-.LVL11
	.uleb128 0x1
	.byte	0x62
	.byte	0
.LVUS18:
	.uleb128 .LVU65
	.uleb128 .LVU69
.LLST18:
	.byte	0x8
	.quad	.LVL11
	.uleb128 .LVL13-.LVL11
	.uleb128 0x1
	.byte	0x61
	.byte	0
.LVUS19:
	.uleb128 .LVU67
	.uleb128 .LVU71
.LLST19:
	.byte	0x8
	.quad	.LVL12
	.uleb128 .LVL14-.LVL12
	.uleb128 0x1
	.byte	0x62
	.byte	0
.LVUS20:
	.uleb128 .LVU70
	.uleb128 .LVU72
.LLST20:
	.byte	0x8
	.quad	.LVL14
	.uleb128 .LVL15-.LVL14
	.uleb128 0x1
	.byte	0x61
	.byte	0
.LVUS21:
	.uleb128 .LVU39
	.uleb128 .LVU45
.LLST21:
	.byte	0x8
	.quad	.LVL7
	.uleb128 .LVL8-.LVL7
	.uleb128 0x2
	.byte	0x31
	.byte	0x9f
	.byte	0
.LVUS22:
	.uleb128 .LVU47
	.uleb128 .LVU52
.LLST22:
	.byte	0x8
	.quad	.LVL8
	.uleb128 .LVL8-.LVL8
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LVUS23:
	.uleb128 .LVU58
	.uleb128 .LVU61
.LLST23:
	.byte	0x8
	.quad	.LVL10
	.uleb128 .LVL11-.LVL10
	.uleb128 0x2
	.byte	0x31
	.byte	0x9f
	.byte	0
.LVUS24:
	.uleb128 .LVU58
	.uleb128 .LVU61
.LLST24:
	.byte	0x8
	.quad	.LVL10
	.uleb128 .LVL11-.LVL10
	.uleb128 0x1
	.byte	0x61
	.byte	0
.LVUS25:
	.uleb128 .LVU63
	.uleb128 .LVU65
.LLST25:
	.byte	0x8
	.quad	.LVL11
	.uleb128 .LVL11-.LVL11
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LVUS26:
	.uleb128 .LVU63
	.uleb128 .LVU65
.LLST26:
	.byte	0x8
	.quad	.LVL11
	.uleb128 .LVL11-.LVL11
	.uleb128 0x1
	.byte	0x61
	.byte	0
.Ldebug_loc3:
	.section	.debug_aranges,"",@progbits
	.long	0x3c
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x8
	.byte	0
	.value	0
	.value	0
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.quad	.LFB5685
	.quad	.LFE5685-.LFB5685
	.quad	0
	.quad	0
	.section	.debug_rnglists,"",@progbits
.Ldebug_ranges0:
	.long	.Ldebug_ranges3-.Ldebug_ranges2
.Ldebug_ranges2:
	.value	0x5
	.byte	0x8
	.byte	0
	.long	0
.LLRL6:
	.byte	0x5
	.quad	.LBB41
	.byte	0x4
	.uleb128 .LBB41-.LBB41
	.uleb128 .LBE41-.LBB41
	.byte	0x4
	.uleb128 .LBB48-.LBB41
	.uleb128 .LBE48-.LBB41
	.byte	0
.LLRL13:
	.byte	0x5
	.quad	.LBB49
	.byte	0x4
	.uleb128 .LBB49-.LBB49
	.uleb128 .LBE49-.LBB49
	.byte	0x4
	.uleb128 .LBB64-.LBB49
	.uleb128 .LBE64-.LBB49
	.byte	0
.LLRL29:
	.byte	0x5
	.quad	.LBB65
	.byte	0x4
	.uleb128 .LBB65-.LBB65
	.uleb128 .LBE65-.LBB65
	.byte	0x4
	.uleb128 .LBB70-.LBB65
	.uleb128 .LBE70-.LBB65
	.byte	0
.LLRL32:
	.byte	0x5
	.quad	.LBB67
	.byte	0x4
	.uleb128 .LBB67-.LBB67
	.uleb128 .LBE67-.LBB67
	.byte	0x4
	.uleb128 .LBB68-.LBB67
	.uleb128 .LBE68-.LBB67
	.byte	0x4
	.uleb128 .LBB69-.LBB67
	.uleb128 .LBE69-.LBB67
	.byte	0
.LLRL36:
	.byte	0x5
	.quad	.LBB71
	.byte	0x4
	.uleb128 .LBB71-.LBB71
	.uleb128 .LBE71-.LBB71
	.byte	0x4
	.uleb128 .LBB72-.LBB71
	.uleb128 .LBE72-.LBB71
	.byte	0
.LLRL43:
	.byte	0x5
	.quad	.LBB73
	.byte	0x4
	.uleb128 .LBB73-.LBB73
	.uleb128 .LBE73-.LBB73
	.byte	0x4
	.uleb128 .LBB74-.LBB73
	.uleb128 .LBE74-.LBB73
	.byte	0
.LLRL44:
	.byte	0x5
	.quad	.LBB75
	.byte	0x4
	.uleb128 .LBB75-.LBB75
	.uleb128 .LBE75-.LBB75
	.byte	0x4
	.uleb128 .LBB76-.LBB75
	.uleb128 .LBE76-.LBB75
	.byte	0
.LLRL46:
	.byte	0x7
	.quad	.Ltext0
	.uleb128 .Letext0-.Ltext0
	.byte	0x7
	.quad	.LFB5685
	.uleb128 .LFE5685-.LFB5685
	.byte	0
.Ldebug_ranges3:
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF21:
	.string	"tv_nsec"
.LASF68:
	.string	"__builtin_puts"
.LASF41:
	.string	"print_vector"
.LASF20:
	.string	"tv_sec"
.LASF58:
	.string	"_mm512_reduce_add_ps"
.LASF61:
	.string	"_mm512_extractf64x4_pd"
.LASF8:
	.string	"short int"
.LASF10:
	.string	"size_t"
.LASF43:
	.string	"len_a"
.LASF22:
	.string	"__m128"
.LASF67:
	.string	"putchar"
.LASF40:
	.string	"main"
.LASF39:
	.string	"x_len"
.LASF13:
	.string	"__syscall_slong_t"
.LASF28:
	.string	"__v8df"
.LASF25:
	.string	"__v8sf"
.LASF64:
	.string	"_mm256_undefined_pd"
.LASF44:
	.string	"len_x"
.LASF60:
	.string	"_mm512_loadu_ps"
.LASF27:
	.string	"__m256d"
.LASF49:
	.string	"CLOCK"
.LASF32:
	.string	"__mmask16"
.LASF18:
	.string	"float"
.LASF19:
	.string	"clockid_t"
.LASF15:
	.string	"long long int"
.LASF29:
	.string	"__v16sf"
.LASF42:
	.string	"matvec"
.LASF14:
	.string	"char"
.LASF62:
	.string	"__imm"
.LASF9:
	.string	"long int"
.LASF63:
	.string	"__m512"
.LASF46:
	.string	"a_vec"
.LASF36:
	.string	"finish"
.LASF65:
	.string	"_mm256_extractf128_ps"
.LASF30:
	.string	"__m512d"
.LASF72:
	.string	"__m512_u"
.LASF45:
	.string	"matvec_avx512f"
.LASF16:
	.string	"long double"
.LASF5:
	.string	"unsigned char"
.LASF7:
	.string	"signed char"
.LASF17:
	.string	"long long unsigned int"
.LASF4:
	.string	"unsigned int"
.LASF34:
	.string	"clock_gettime"
.LASF66:
	.string	"puts"
.LASF38:
	.string	"a_len"
.LASF35:
	.string	"start"
.LASF6:
	.string	"short unsigned int"
.LASF73:
	.string	"_mm512_setzero_ps"
.LASF24:
	.string	"__v4df"
.LASF33:
	.string	"printf"
.LASF23:
	.string	"__v4si"
.LASF59:
	.string	"_mm512_fmadd_ps"
.LASF69:
	.string	"__builtin_putchar"
.LASF48:
	.string	"sum_vec"
.LASF3:
	.string	"long unsigned int"
.LASF2:
	.string	"double"
.LASF11:
	.string	"__time_t"
.LASF26:
	.string	"__m256"
.LASF12:
	.string	"__clockid_t"
.LASF71:
	.string	"timespec"
.LASF37:
	.string	"total"
.LASF50:
	.string	"__T1"
.LASF51:
	.string	"__T2"
.LASF52:
	.string	"__T3"
.LASF53:
	.string	"__T4"
.LASF54:
	.string	"__T5"
.LASF55:
	.string	"__T6"
.LASF56:
	.string	"__T7"
.LASF57:
	.string	"__T8"
.LASF47:
	.string	"x_vec"
.LASF31:
	.string	"__mmask8"
.LASF70:
	.string	"GNU C17 11.4.1 20230605 (Red Hat 11.4.1-2) -mavx512f -mtune=generic -march=x86-64-v2 -g -O2"
	.section	.debug_line_str,"MS",@progbits,1
.LASF1:
	.string	"/home/liu.als/eece5640-hw3/q2"
.LASF0:
	.string	"mat_vec.c"
	.ident	"GCC: (GNU) 11.4.1 20230605 (Red Hat 11.4.1-2)"
	.section	.note.GNU-stack,"",@progbits

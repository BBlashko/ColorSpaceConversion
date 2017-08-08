	.file	"main.c"
	.text
	.globl	rgb_to_ycc
	.type	rgb_to_ycc, @function
rgb_to_ycc:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movq	%rdi, -56(%rbp)
	movl	%esi, -60(%rbp)
	movl	%edx, -64(%rbp)
	movl	-64(%rbp), %edx
	movl	-60(%rbp), %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	allocate_ycc_matrix
	movq	%rax, -16(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L2
.L5:
	movl	$0, -8(%rbp)
	jmp	.L3
.L4:
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-56(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rcx
	movl	-8(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	addq	%rcx, %rax
	movzwl	(%rax), %edx
	movw	%dx, -48(%rbp)
	movzbl	2(%rax), %eax
	movb	%al, -46(%rbp)
	movzbl	-48(%rbp), %eax
	movzbl	%al, %eax
	cvtsi2sd	%eax, %xmm0
	movsd	.LC0(%rip), %xmm1
	mulsd	%xmm1, %xmm0
	movsd	.LC1(%rip), %xmm1
	addsd	%xmm0, %xmm1
	movzbl	-47(%rbp), %eax
	movzbl	%al, %eax
	cvtsi2sd	%eax, %xmm0
	movsd	.LC2(%rip), %xmm2
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movzbl	-46(%rbp), %eax
	movzbl	%al, %eax
	cvtsi2sd	%eax, %xmm0
	movsd	.LC3(%rip), %xmm2
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	unpcklpd	%xmm0, %xmm0
	cvtpd2ps	%xmm0, %xmm0
	movss	%xmm0, -32(%rbp)
	movzbl	-48(%rbp), %eax
	movzbl	%al, %eax
	cvtsi2sd	%eax, %xmm0
	movsd	.LC4(%rip), %xmm1
	mulsd	%xmm1, %xmm0
	movsd	.LC5(%rip), %xmm1
	subsd	%xmm0, %xmm1
	movapd	%xmm1, %xmm0
	movzbl	-47(%rbp), %eax
	movzbl	%al, %eax
	cvtsi2sd	%eax, %xmm1
	movsd	.LC6(%rip), %xmm2
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	movapd	%xmm0, %xmm1
	movzbl	-46(%rbp), %eax
	movzbl	%al, %eax
	cvtsi2sd	%eax, %xmm0
	movsd	.LC7(%rip), %xmm2
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	unpcklpd	%xmm0, %xmm0
	cvtpd2ps	%xmm0, %xmm0
	movss	%xmm0, -28(%rbp)
	movzbl	-48(%rbp), %eax
	movzbl	%al, %eax
	cvtsi2sd	%eax, %xmm0
	movsd	.LC7(%rip), %xmm1
	mulsd	%xmm1, %xmm0
	movsd	.LC5(%rip), %xmm1
	addsd	%xmm1, %xmm0
	movzbl	-47(%rbp), %eax
	movzbl	%al, %eax
	cvtsi2sd	%eax, %xmm1
	movsd	.LC8(%rip), %xmm2
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	movzbl	-46(%rbp), %eax
	movzbl	%al, %eax
	cvtsi2sd	%eax, %xmm1
	movsd	.LC9(%rip), %xmm2
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	unpcklpd	%xmm0, %xmm0
	cvtpd2ps	%xmm0, %xmm0
	movss	%xmm0, -24(%rbp)
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rcx
	movl	-8(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	addq	%rcx, %rax
	movq	-32(%rbp), %rdx
	movq	%rdx, (%rax)
	movl	-24(%rbp), %edx
	movl	%edx, 8(%rax)
	addl	$1, -8(%rbp)
.L3:
	movl	-8(%rbp), %eax
	cmpl	-60(%rbp), %eax
	jl	.L4
	addl	$1, -4(%rbp)
.L2:
	movl	-4(%rbp), %eax
	cmpl	-64(%rbp), %eax
	jl	.L5
	movq	-16(%rbp), %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	rgb_to_ycc, .-rgb_to_ycc
	.globl	clip
	.type	clip, @function
clip:
.LFB3:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movss	%xmm0, -4(%rbp)
	movss	-4(%rbp), %xmm0
	ucomiss	.LC10(%rip), %xmm0
	jbe	.L15
	movl	$255, %eax
	jmp	.L10
.L15:
	xorps	%xmm0, %xmm0
	ucomiss	-4(%rbp), %xmm0
	jbe	.L16
	movl	$0, %eax
	jmp	.L10
.L16:
	cvttss2si	-4(%rbp), %eax
	movzbl	%al, %eax
.L10:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	clip, .-clip
	.globl	ycc_to_rgb
	.type	ycc_to_rgb, @function
ycc_to_rgb:
.LFB4:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movq	%rdi, -56(%rbp)
	movl	%esi, -60(%rbp)
	movl	%edx, -64(%rbp)
	movl	-64(%rbp), %edx
	movl	-60(%rbp), %eax
	movl	%edx, %esi
	movl	%eax, %edi
	movl	$0, %eax
	call	allocate_rgb_matrix
	cltq
	movq	%rax, -16(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L18
.L21:
	movl	$0, -8(%rbp)
	jmp	.L19
.L20:
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-56(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rcx
	movl	-8(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	addq	%rcx, %rax
	movq	(%rax), %rdx
	movq	%rdx, -32(%rbp)
	movl	8(%rax), %eax
	movl	%eax, -24(%rbp)
	movss	-32(%rbp), %xmm0
	movss	.LC12(%rip), %xmm1
	subss	%xmm1, %xmm0
	unpcklps	%xmm0, %xmm0
	cvtps2pd	%xmm0, %xmm0
	movsd	.LC13(%rip), %xmm1
	mulsd	%xmm0, %xmm1
	movss	-24(%rbp), %xmm0
	movss	.LC14(%rip), %xmm2
	subss	%xmm2, %xmm0
	unpcklps	%xmm0, %xmm0
	cvtps2pd	%xmm0, %xmm0
	movsd	.LC15(%rip), %xmm2
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	unpcklpd	%xmm0, %xmm0
	cvtpd2ps	%xmm0, %xmm0
	call	clip
	movb	%al, -48(%rbp)
	movss	-32(%rbp), %xmm0
	movss	.LC12(%rip), %xmm1
	subss	%xmm1, %xmm0
	unpcklps	%xmm0, %xmm0
	cvtps2pd	%xmm0, %xmm0
	movsd	.LC13(%rip), %xmm1
	mulsd	%xmm1, %xmm0
	movss	-24(%rbp), %xmm1
	movss	.LC14(%rip), %xmm2
	subss	%xmm2, %xmm1
	unpcklps	%xmm1, %xmm1
	cvtps2pd	%xmm1, %xmm1
	movsd	.LC16(%rip), %xmm2
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	movss	-28(%rbp), %xmm1
	movss	.LC14(%rip), %xmm2
	subss	%xmm2, %xmm1
	unpcklps	%xmm1, %xmm1
	cvtps2pd	%xmm1, %xmm1
	movsd	.LC17(%rip), %xmm2
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	unpcklpd	%xmm0, %xmm0
	cvtpd2ps	%xmm0, %xmm0
	call	clip
	movb	%al, -47(%rbp)
	movss	-32(%rbp), %xmm0
	movss	.LC12(%rip), %xmm1
	subss	%xmm1, %xmm0
	unpcklps	%xmm0, %xmm0
	cvtps2pd	%xmm0, %xmm0
	movsd	.LC13(%rip), %xmm1
	mulsd	%xmm0, %xmm1
	movss	-28(%rbp), %xmm0
	movss	.LC14(%rip), %xmm2
	subss	%xmm2, %xmm0
	unpcklps	%xmm0, %xmm0
	cvtps2pd	%xmm0, %xmm0
	movsd	.LC18(%rip), %xmm2
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	unpcklpd	%xmm0, %xmm0
	cvtpd2ps	%xmm0, %xmm0
	call	clip
	movb	%al, -46(%rbp)
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rcx
	movl	-8(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	addq	%rcx, %rax
	movzwl	-48(%rbp), %edx
	movw	%dx, (%rax)
	movzbl	-46(%rbp), %edx
	movb	%dl, 2(%rax)
	addl	$1, -8(%rbp)
.L19:
	movl	-8(%rbp), %eax
	cmpl	-60(%rbp), %eax
	jl	.L20
	addl	$1, -4(%rbp)
.L18:
	movl	-4(%rbp), %eax
	cmpl	-64(%rbp), %eax
	jl	.L21
	movq	-16(%rbp), %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	ycc_to_rgb, .-ycc_to_rgb
	.globl	ycc_normal_to_meta
	.type	ycc_normal_to_meta, @function
ycc_normal_to_meta:
.LFB5:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -40(%rbp)
	movq	%xmm0, -112(%rbp)
	movq	-112(%rbp), %rdi
	movss	%xmm1, -112(%rbp)
	movl	-112(%rbp), %esi
	movq	%xmm2, -112(%rbp)
	movq	-112(%rbp), %r10
	movss	%xmm3, -112(%rbp)
	movl	-112(%rbp), %ecx
	movq	%xmm4, -112(%rbp)
	movq	-112(%rbp), %r9
	movss	%xmm5, -112(%rbp)
	movl	-112(%rbp), %edx
	movq	%xmm6, -112(%rbp)
	movq	-112(%rbp), %r8
	movss	%xmm7, -112(%rbp)
	movl	-112(%rbp), %eax
	movq	%rdi, -56(%rbp)
	movl	%esi, -48(%rbp)
	movq	%r10, -72(%rbp)
	movl	%ecx, -64(%rbp)
	movq	%r9, -88(%rbp)
	movl	%edx, -80(%rbp)
	movq	%r8, -104(%rbp)
	movl	%eax, -96(%rbp)
	movl	.LC11(%rip), %eax
	movl	%eax, -4(%rbp)
	movl	.LC11(%rip), %eax
	movl	%eax, -8(%rbp)
	movl	-56(%rbp), %eax
	movl	%eax, -32(%rbp)
	movss	-52(%rbp), %xmm0
	movss	-4(%rbp), %xmm1
	addss	%xmm1, %xmm0
	movss	%xmm0, -4(%rbp)
	movss	-48(%rbp), %xmm0
	movss	-8(%rbp), %xmm1
	addss	%xmm1, %xmm0
	movss	%xmm0, -8(%rbp)
	movl	-72(%rbp), %eax
	movl	%eax, -28(%rbp)
	movss	-68(%rbp), %xmm0
	movss	-4(%rbp), %xmm1
	addss	%xmm1, %xmm0
	movss	%xmm0, -4(%rbp)
	movss	-64(%rbp), %xmm0
	movss	-8(%rbp), %xmm1
	addss	%xmm1, %xmm0
	movss	%xmm0, -8(%rbp)
	movl	-88(%rbp), %eax
	movl	%eax, -24(%rbp)
	movss	-84(%rbp), %xmm0
	movss	-4(%rbp), %xmm1
	addss	%xmm1, %xmm0
	movss	%xmm0, -4(%rbp)
	movss	-80(%rbp), %xmm0
	movss	-8(%rbp), %xmm1
	addss	%xmm1, %xmm0
	movss	%xmm0, -8(%rbp)
	movl	-104(%rbp), %eax
	movl	%eax, -20(%rbp)
	movss	-100(%rbp), %xmm0
	movss	-4(%rbp), %xmm1
	addss	%xmm1, %xmm0
	movss	%xmm0, -4(%rbp)
	movss	-96(%rbp), %xmm0
	movss	-8(%rbp), %xmm1
	addss	%xmm1, %xmm0
	movss	%xmm0, -8(%rbp)
	movss	-4(%rbp), %xmm0
	movss	.LC19(%rip), %xmm1
	divss	%xmm1, %xmm0
	movss	%xmm0, -16(%rbp)
	movss	-8(%rbp), %xmm0
	movss	.LC19(%rip), %xmm1
	divss	%xmm1, %xmm0
	movss	%xmm0, -12(%rbp)
	movq	-40(%rbp), %rax
	movq	-32(%rbp), %rdx
	movq	%rdx, (%rax)
	movq	-24(%rbp), %rdx
	movq	%rdx, 8(%rax)
	movq	-16(%rbp), %rdx
	movq	%rdx, 16(%rax)
	movq	-40(%rbp), %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	ycc_normal_to_meta, .-ycc_normal_to_meta
	.globl	ycc_downsample
	.type	ycc_downsample, @function
ycc_downsample:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$160, %rsp
	movq	%rdi, -136(%rbp)
	movl	%esi, -140(%rbp)
	movl	%edx, -144(%rbp)
	movl	-144(%rbp), %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	movl	%eax, %edx
	movl	-140(%rbp), %eax
	movl	%eax, %ecx
	shrl	$31, %ecx
	addl	%ecx, %eax
	sarl	%eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	allocate_meta_ycc_matrix
	movq	%rax, -24(%rbp)
	movl	$0, -12(%rbp)
	movl	$0, -16(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L26
.L29:
	movl	$0, -16(%rbp)
	movl	$0, -8(%rbp)
	jmp	.L27
.L28:
	movl	-12(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-136(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rcx
	movl	-16(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	addq	%rcx, %rax
	movq	(%rax), %rdx
	movq	%rdx, -48(%rbp)
	movl	8(%rax), %eax
	movl	%eax, -40(%rbp)
	movl	-12(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-136(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rcx
	movl	-16(%rbp), %eax
	cltq
	leaq	1(%rax), %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	addq	%rcx, %rax
	movq	(%rax), %rdx
	movq	%rdx, -64(%rbp)
	movl	8(%rax), %eax
	movl	%eax, -56(%rbp)
	movl	-12(%rbp), %eax
	cltq
	addq	$1, %rax
	leaq	0(,%rax,8), %rdx
	movq	-136(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rcx
	movl	-16(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	addq	%rcx, %rax
	movq	(%rax), %rdx
	movq	%rdx, -80(%rbp)
	movl	8(%rax), %eax
	movl	%eax, -72(%rbp)
	movl	-12(%rbp), %eax
	cltq
	addq	$1, %rax
	leaq	0(,%rax,8), %rdx
	movq	-136(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rcx
	movl	-16(%rbp), %eax
	cltq
	leaq	1(%rax), %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	addq	%rcx, %rax
	movq	(%rax), %rdx
	movq	%rdx, -96(%rbp)
	movl	8(%rax), %eax
	movl	%eax, -88(%rbp)
	leaq	-128(%rbp), %rdi
	movq	-96(%rbp), %r11
	movl	-88(%rbp), %esi
	movq	-80(%rbp), %r10
	movl	-72(%rbp), %ecx
	movq	-64(%rbp), %r9
	movl	-56(%rbp), %edx
	movq	-48(%rbp), %r8
	movl	-40(%rbp), %eax
	movq	%r11, -152(%rbp)
	movq	-152(%rbp), %xmm6
	movl	%esi, -152(%rbp)
	movss	-152(%rbp), %xmm7
	movq	%r10, -152(%rbp)
	movq	-152(%rbp), %xmm4
	movl	%ecx, -152(%rbp)
	movss	-152(%rbp), %xmm5
	movq	%r9, -152(%rbp)
	movq	-152(%rbp), %xmm2
	movl	%edx, -152(%rbp)
	movss	-152(%rbp), %xmm3
	movq	%r8, -152(%rbp)
	movq	-152(%rbp), %xmm0
	movl	%eax, -152(%rbp)
	movss	-152(%rbp), %xmm1
	call	ycc_normal_to_meta
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rcx
	movl	-8(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	movq	-128(%rbp), %rdx
	movq	%rdx, (%rax)
	movq	-120(%rbp), %rdx
	movq	%rdx, 8(%rax)
	movq	-112(%rbp), %rdx
	movq	%rdx, 16(%rax)
	addl	$2, -16(%rbp)
	addl	$1, -8(%rbp)
.L27:
	movl	-140(%rbp), %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	cmpl	-8(%rbp), %eax
	jg	.L28
	addl	$2, -12(%rbp)
	addl	$1, -4(%rbp)
.L26:
	movl	-144(%rbp), %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	cmpl	-4(%rbp), %eax
	jg	.L29
	movq	-24(%rbp), %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	ycc_downsample, .-ycc_downsample
	.globl	ycc_meta_to_normal
	.type	ycc_meta_to_normal, @function
ycc_meta_to_normal:
.LFB7:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movl	16(%rbp), %eax
	movq	-8(%rbp), %rdx
	movl	%eax, (%rdx)
	movl	20(%rbp), %eax
	movq	-8(%rbp), %rdx
	movl	%eax, 12(%rdx)
	movl	24(%rbp), %eax
	movq	-8(%rbp), %rdx
	movl	%eax, 24(%rdx)
	movl	28(%rbp), %eax
	movq	-8(%rbp), %rdx
	movl	%eax, 36(%rdx)
	movl	32(%rbp), %eax
	movq	-8(%rbp), %rdx
	movl	%eax, 4(%rdx)
	movl	32(%rbp), %eax
	movq	-8(%rbp), %rdx
	movl	%eax, 16(%rdx)
	movl	32(%rbp), %eax
	movq	-8(%rbp), %rdx
	movl	%eax, 28(%rdx)
	movl	32(%rbp), %eax
	movq	-8(%rbp), %rdx
	movl	%eax, 40(%rdx)
	movl	36(%rbp), %eax
	movq	-8(%rbp), %rdx
	movl	%eax, 8(%rdx)
	movl	36(%rbp), %eax
	movq	-8(%rbp), %rdx
	movl	%eax, 20(%rdx)
	movl	36(%rbp), %eax
	movq	-8(%rbp), %rdx
	movl	%eax, 32(%rdx)
	movl	36(%rbp), %eax
	movq	-8(%rbp), %rdx
	movl	%eax, 44(%rdx)
	movq	-8(%rbp), %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	ycc_meta_to_normal, .-ycc_meta_to_normal
	.globl	ycc_upsample
	.type	ycc_upsample, @function
ycc_upsample:
.LFB8:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$96, %rsp
	movq	%rdi, -56(%rbp)
	movl	%esi, -60(%rbp)
	movl	%edx, -64(%rbp)
	movl	-64(%rbp), %edx
	movl	-60(%rbp), %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	allocate_ycc_matrix
	movq	%rax, -24(%rbp)
	movl	$192, %edi
	call	malloc
	movq	%rax, -32(%rbp)
	movl	$0, -12(%rbp)
	movl	$0, -16(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L34
.L37:
	movl	$0, -16(%rbp)
	movl	$0, -8(%rbp)
	jmp	.L35
.L36:
	movl	$192, %edi
	call	malloc
	movq	%rax, -40(%rbp)
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-56(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rcx
	movl	-8(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	movq	-40(%rbp), %rdx
	movq	(%rax), %rcx
	movq	%rcx, (%rsp)
	movq	8(%rax), %rcx
	movq	%rcx, 8(%rsp)
	movq	16(%rax), %rax
	movq	%rax, 16(%rsp)
	movq	%rdx, %rdi
	call	ycc_meta_to_normal
	movq	%rax, -32(%rbp)
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	free
	movl	-12(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rcx
	movl	-16(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	leaq	(%rcx,%rax), %rdx
	movq	-32(%rbp), %rax
	movq	(%rax), %rcx
	movq	%rcx, (%rdx)
	movl	8(%rax), %eax
	movl	%eax, 8(%rdx)
	movl	-12(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rcx
	movl	-16(%rbp), %eax
	cltq
	leaq	1(%rax), %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	leaq	(%rcx,%rax), %rdx
	movq	-32(%rbp), %rax
	movq	12(%rax), %rcx
	movq	%rcx, (%rdx)
	movl	20(%rax), %eax
	movl	%eax, 8(%rdx)
	movl	-12(%rbp), %eax
	cltq
	addq	$1, %rax
	leaq	0(,%rax,8), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rcx
	movl	-16(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	leaq	(%rcx,%rax), %rdx
	movq	-32(%rbp), %rax
	movq	24(%rax), %rcx
	movq	%rcx, (%rdx)
	movl	32(%rax), %eax
	movl	%eax, 8(%rdx)
	movl	-12(%rbp), %eax
	cltq
	addq	$1, %rax
	leaq	0(,%rax,8), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rcx
	movl	-16(%rbp), %eax
	cltq
	leaq	1(%rax), %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	leaq	(%rcx,%rax), %rdx
	movq	-32(%rbp), %rax
	movq	36(%rax), %rcx
	movq	%rcx, (%rdx)
	movl	44(%rax), %eax
	movl	%eax, 8(%rdx)
	addl	$2, -16(%rbp)
	addl	$1, -8(%rbp)
.L35:
	movl	-60(%rbp), %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	cmpl	-8(%rbp), %eax
	jg	.L36
	addl	$2, -12(%rbp)
	addl	$1, -4(%rbp)
.L34:
	movl	-64(%rbp), %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	cmpl	-4(%rbp), %eax
	jg	.L37
	movq	-24(%rbp), %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	ycc_upsample, .-ycc_upsample
	.section	.rodata
	.align 8
.LC20:
	.string	"Usage: main <image_filename.bmp"
.LC21:
	.string	"r"
.LC22:
	.string	"trainRGB.bmp"
	.text
	.globl	main
	.type	main, @function
main:
.LFB9:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	addq	$-128, %rsp
	movl	%edi, -84(%rbp)
	movq	%rsi, -96(%rbp)
	cmpl	$2, -84(%rbp)
	je	.L40
	movl	$.LC20, %edi
	movl	$0, %eax
	call	printf
	movl	$1, %edi
	call	exit
.L40:
	movq	-96(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	movl	$.LC21, %esi
	movq	%rax, %rdi
	call	fopen
	movq	%rax, -8(%rbp)
	leaq	-80(%rbp), %rax
	movq	-8(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	read_header_info
	movl	-72(%rbp), %edx
	movl	-76(%rbp), %ecx
	movq	-8(%rbp), %rax
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	load_image
	movq	%rax, -16(%rbp)
	movl	-72(%rbp), %edx
	movl	-76(%rbp), %ecx
	movq	-8(%rbp), %rax
	movl	%ecx, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	allocate_rgb_matrix
	cltq
	movq	%rax, -24(%rbp)
	movl	-72(%rbp), %edx
	movl	-76(%rbp), %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	allocate_ycc_matrix
	movq	%rax, -32(%rbp)
	movl	-72(%rbp), %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	movl	%eax, %edx
	movl	-76(%rbp), %eax
	movl	%eax, %ecx
	shrl	$31, %ecx
	addl	%ecx, %eax
	sarl	%eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	allocate_meta_ycc_matrix
	movq	%rax, -40(%rbp)
	movl	-72(%rbp), %edx
	movl	-76(%rbp), %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	allocate_ycc_matrix
	movq	%rax, -48(%rbp)
	movl	-72(%rbp), %edx
	movl	-76(%rbp), %ecx
	movq	-16(%rbp), %rax
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	rgb_to_ycc
	movq	%rax, -32(%rbp)
	movl	-72(%rbp), %edx
	movl	-76(%rbp), %ecx
	movq	-32(%rbp), %rax
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	ycc_downsample
	movq	%rax, -40(%rbp)
	movl	-72(%rbp), %edx
	movl	-76(%rbp), %ecx
	movq	-40(%rbp), %rax
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	ycc_upsample
	movq	%rax, -48(%rbp)
	movl	-72(%rbp), %edx
	movl	-76(%rbp), %ecx
	movq	-48(%rbp), %rax
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	ycc_to_rgb
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rax
	movq	-80(%rbp), %rdx
	movq	%rdx, (%rsp)
	movq	-72(%rbp), %rdx
	movq	%rdx, 8(%rsp)
	movq	-64(%rbp), %rdx
	movq	%rdx, 16(%rsp)
	movq	-56(%rbp), %rdx
	movq	%rdx, 24(%rsp)
	movq	%rax, %rsi
	movl	$.LC22, %edi
	call	save_RGB_image
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	fclose
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	free
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	free
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	free
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	main, .-main
	.section	.rodata
	.align 8
.LC0:
	.long	549755814
	.long	1070625456
	.align 8
.LC1:
	.long	0
	.long	1076887552
	.align 8
.LC2:
	.long	2611340116
	.long	1071653060
	.align 8
.LC3:
	.long	721554506
	.long	1069094535
	.align 8
.LC4:
	.long	4226247819
	.long	1069740457
	.align 8
.LC5:
	.long	0
	.long	1080033280
	.align 8
.LC6:
	.long	1992864825
	.long	1070768062
	.align 8
.LC7:
	.long	1958505087
	.long	1071388819
	.align 8
.LC8:
	.long	3745211482
	.long	1071091023
	.align 8
.LC9:
	.long	1443109011
	.long	1068641550
	.align 4
.LC10:
	.long	1132396544
	.align 4
.LC11:
	.long	0
	.align 4
.LC12:
	.long	1098907648
	.align 8
.LC13:
	.long	1992864825
	.long	1072865214
	.align 4
.LC14:
	.long	1124073472
	.align 8
.LC15:
	.long	1271310320
	.long	1073318199
	.align 8
.LC16:
	.long	2473901162
	.long	1072301080
	.align 8
.LC17:
	.long	3710851744
	.long	1071187492
	.align 8
.LC18:
	.long	790273982
	.long	1073751261
	.align 4
.LC19:
	.long	1082130432
	.ident	"GCC: (GNU) 4.8.5 20150623 (Red Hat 4.8.5-11)"
	.section	.note.GNU-stack,"",@progbits

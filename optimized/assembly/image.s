	.file	"image.c"
	.section	.rodata
	.align 8
.LC0:
	.string	"[ERROR] No memory available for allocation of RGB matrix!"
	.align 8
.LC1:
	.string	"[ERROR] No more memory available for each RGB row allocation!"
	.text
	.globl	allocate_rgb_data
	.type	allocate_rgb_data, @function
allocate_rgb_data:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$56, %rsp
	.cfi_offset 3, -24
	movl	%edi, -52(%rbp)
	movl	%esi, -56(%rbp)
	movl	-56(%rbp), %eax
	cltq
	salq	$3, %rax
	movq	%rax, %rdi
	call	malloc
	movq	%rax, -32(%rbp)
	cmpq	$0, -32(%rbp)
	jne	.L2
	movl	$.LC0, %edi
	call	perror
	movl	$0, %edi
	call	exit
.L2:
	movl	$0, -20(%rbp)
	jmp	.L3
.L5:
	movl	-20(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-32(%rbp), %rax
	leaq	(%rdx,%rax), %rbx
	movl	-52(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	movq	%rax, %rdi
	call	malloc
	movq	%rax, (%rbx)
	movl	-20(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L4
	movl	$.LC1, %edi
	call	perror
	movl	$0, %edi
	call	exit
.L4:
	addl	$1, -20(%rbp)
.L3:
	movl	-20(%rbp), %eax
	cmpl	-56(%rbp), %eax
	jl	.L5
	movq	-32(%rbp), %rax
	movq	%rax, -48(%rbp)
	movl	-52(%rbp), %eax
	movl	%eax, -40(%rbp)
	movl	-56(%rbp), %eax
	movl	%eax, -36(%rbp)
	movq	-48(%rbp), %rax
	movq	-40(%rbp), %rdx
	addq	$56, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	allocate_rgb_data, .-allocate_rgb_data
	.globl	allocate_ycc_data
	.type	allocate_ycc_data, @function
allocate_ycc_data:
.LFB3:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$56, %rsp
	.cfi_offset 3, -24
	movl	%edi, -52(%rbp)
	movl	%esi, -56(%rbp)
	movl	-56(%rbp), %eax
	cltq
	salq	$3, %rax
	movq	%rax, %rdi
	call	malloc
	movq	%rax, -32(%rbp)
	cmpq	$0, -32(%rbp)
	jne	.L8
	movl	$.LC0, %edi
	call	perror
	movl	$0, %edi
	call	exit
.L8:
	movl	$0, -20(%rbp)
	jmp	.L9
.L11:
	movl	-20(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-32(%rbp), %rax
	leaq	(%rdx,%rax), %rbx
	movl	-52(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	movq	%rax, %rdi
	call	malloc
	movq	%rax, (%rbx)
	movl	-20(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L10
	movl	$.LC1, %edi
	call	perror
	movl	$0, %edi
	call	exit
.L10:
	addl	$1, -20(%rbp)
.L9:
	movl	-20(%rbp), %eax
	cmpl	-56(%rbp), %eax
	jl	.L11
	movq	-32(%rbp), %rax
	movq	%rax, -48(%rbp)
	movl	-52(%rbp), %eax
	movl	%eax, -40(%rbp)
	movl	-56(%rbp), %eax
	movl	%eax, -36(%rbp)
	movq	-48(%rbp), %rax
	movq	-40(%rbp), %rdx
	addq	$56, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	allocate_ycc_data, .-allocate_ycc_data
	.globl	allocate_meta_ycc_matrix
	.type	allocate_meta_ycc_matrix, @function
allocate_meta_ycc_matrix:
.LFB4:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$40, %rsp
	.cfi_offset 3, -24
	movl	%edi, -36(%rbp)
	movl	%esi, -40(%rbp)
	movl	-40(%rbp), %eax
	cltq
	salq	$3, %rax
	movq	%rax, %rdi
	call	malloc
	movq	%rax, -32(%rbp)
	cmpq	$0, -32(%rbp)
	jne	.L14
	movl	$.LC0, %edi
	call	perror
	movl	$0, %edi
	call	exit
.L14:
	movl	$0, -20(%rbp)
	jmp	.L15
.L17:
	movl	-20(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-32(%rbp), %rax
	leaq	(%rdx,%rax), %rbx
	movl	-36(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	addq	%rax, %rax
	movq	%rax, %rdi
	call	malloc
	movq	%rax, (%rbx)
	movl	-20(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L16
	movl	$.LC1, %edi
	call	perror
	movl	$0, %edi
	call	exit
.L16:
	addl	$1, -20(%rbp)
.L15:
	movl	-20(%rbp), %eax
	cmpl	-40(%rbp), %eax
	jl	.L17
	movq	-32(%rbp), %rax
	addq	$40, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	allocate_meta_ycc_matrix, .-allocate_meta_ycc_matrix
	.section	.rodata
.LC2:
	.string	"BM"
	.align 8
.LC3:
	.string	"\nThe file is not in BMP format."
	.align 8
.LC4:
	.string	"\nThe file does not have 24 bits per pixel."
	.text
	.globl	read_header_info
	.type	read_header_info, @function
read_header_info:
.LFB5:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movq	%rdi, -56(%rbp)
	movq	%rsi, -64(%rbp)
	movq	-64(%rbp), %rax
	movl	$0, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	fseek
	movq	-64(%rbp), %rdx
	leaq	-48(%rbp), %rax
	movq	%rdx, %rcx
	movl	$2, %edx
	movl	$1, %esi
	movq	%rax, %rdi
	call	fread
	movb	$0, -46(%rbp)
	leaq	-48(%rbp), %rax
	movl	$.LC2, %esi
	movq	%rax, %rdi
	call	strcmp
	cmpl	$1, %eax
	jne	.L20
	movl	$.LC3, %edi
	call	puts
.L20:
	movq	-64(%rbp), %rax
	movl	$0, %edx
	movl	$2, %esi
	movq	%rax, %rdi
	call	fseek
	movq	-64(%rbp), %rdx
	leaq	-32(%rbp), %rax
	movq	%rdx, %rcx
	movl	$4, %edx
	movl	$1, %esi
	movq	%rax, %rdi
	call	fread
	movq	-64(%rbp), %rax
	movl	$0, %edx
	movl	$18, %esi
	movq	%rax, %rdi
	call	fseek
	movq	-64(%rbp), %rax
	movl	$0, %edx
	movl	$18, %esi
	movq	%rax, %rdi
	call	fseek
	movq	-64(%rbp), %rax
	leaq	-32(%rbp), %rdx
	leaq	4(%rdx), %rdi
	movq	%rax, %rcx
	movl	$4, %edx
	movl	$1, %esi
	call	fread
	movq	-64(%rbp), %rax
	movl	$0, %edx
	movl	$22, %esi
	movq	%rax, %rdi
	call	fseek
	movq	-64(%rbp), %rax
	leaq	-32(%rbp), %rdx
	leaq	8(%rdx), %rdi
	movq	%rax, %rcx
	movl	$4, %edx
	movl	$1, %esi
	call	fread
	movq	-64(%rbp), %rax
	movl	$0, %edx
	movl	$28, %esi
	movq	%rax, %rdi
	call	fseek
	movq	-64(%rbp), %rax
	leaq	-32(%rbp), %rdx
	leaq	12(%rdx), %rdi
	movq	%rax, %rcx
	movl	$2, %edx
	movl	$1, %esi
	call	fread
	movzwl	-20(%rbp), %eax
	cmpw	$24, %ax
	je	.L21
	movl	$.LC4, %edi
	call	puts
	movl	$0, %edi
	call	exit
.L21:
	movq	-64(%rbp), %rax
	movl	$0, %edx
	movl	$30, %esi
	movq	%rax, %rdi
	call	fseek
	movq	-64(%rbp), %rax
	leaq	-32(%rbp), %rdx
	leaq	16(%rdx), %rdi
	movq	%rax, %rcx
	movl	$4, %edx
	movl	$1, %esi
	call	fread
	movq	-64(%rbp), %rax
	movl	$0, %edx
	movl	$34, %esi
	movq	%rax, %rdi
	call	fseek
	movq	-64(%rbp), %rax
	leaq	-32(%rbp), %rdx
	leaq	20(%rdx), %rdi
	movq	%rax, %rcx
	movl	$4, %edx
	movl	$1, %esi
	call	fread
	movq	-64(%rbp), %rax
	movl	$0, %edx
	movl	$46, %esi
	movq	%rax, %rdi
	call	fseek
	movq	-64(%rbp), %rax
	leaq	-32(%rbp), %rdx
	leaq	24(%rdx), %rdi
	movq	%rax, %rcx
	movl	$4, %edx
	movl	$1, %esi
	call	fread
	movq	-64(%rbp), %rax
	movl	$0, %edx
	movl	$50, %esi
	movq	%rax, %rdi
	call	fseek
	movq	-64(%rbp), %rax
	leaq	-32(%rbp), %rdx
	leaq	28(%rdx), %rdi
	movq	%rax, %rcx
	movl	$4, %edx
	movl	$1, %esi
	call	fread
	movq	-56(%rbp), %rax
	movq	-32(%rbp), %rdx
	movq	%rdx, (%rax)
	movq	-24(%rbp), %rdx
	movq	%rdx, 8(%rax)
	movq	-16(%rbp), %rdx
	movq	%rdx, 16(%rax)
	movq	-8(%rbp), %rdx
	movq	%rdx, 24(%rax)
	movq	-56(%rbp), %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	read_header_info, .-read_header_info
	.globl	load_image
	.type	load_image, @function
load_image:
.LFB6:
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
	call	allocate_rgb_data
	movq	%rax, -32(%rbp)
	movq	%rdx, -24(%rbp)
	movq	$51, -16(%rbp)
	movq	-56(%rbp), %rax
	movl	$0, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	fseek
	movl	$0, -4(%rbp)
	jmp	.L24
.L27:
	movl	$0, -8(%rbp)
	jmp	.L25
.L26:
	addq	$3, -16(%rbp)
	movq	-16(%rbp), %rcx
	movq	-56(%rbp), %rax
	movl	$0, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	fseek
	movq	-56(%rbp), %rax
	leaq	-48(%rbp), %rdx
	leaq	2(%rdx), %rdi
	movq	%rax, %rcx
	movl	$1, %edx
	movl	$1, %esi
	call	fread
	movq	-56(%rbp), %rax
	leaq	-48(%rbp), %rdx
	leaq	1(%rdx), %rdi
	movq	%rax, %rcx
	movl	$1, %edx
	movl	$1, %esi
	call	fread
	movq	-56(%rbp), %rdx
	leaq	-48(%rbp), %rax
	movq	%rdx, %rcx
	movl	$1, %edx
	movl	$1, %esi
	movq	%rax, %rdi
	call	fread
	movq	-32(%rbp), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
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
.L25:
	movl	-8(%rbp), %eax
	cmpl	-60(%rbp), %eax
	jl	.L26
	addl	$1, -4(%rbp)
.L24:
	movl	-4(%rbp), %eax
	cmpl	-64(%rbp), %eax
	jl	.L27
	movq	-32(%rbp), %rax
	movq	-24(%rbp), %rdx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	load_image, .-load_image
	.globl	save_image_header
	.type	save_image_header, @function
save_image_header:
.LFB7:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$80, %rsp
	movq	%rdi, -72(%rbp)
	movb	$66, -16(%rbp)
	movb	$77, -15(%rbp)
	movb	$0, -14(%rbp)
	movb	$0, -13(%rbp)
	movb	$0, -12(%rbp)
	movb	$0, -11(%rbp)
	movb	$0, -10(%rbp)
	movb	$0, -9(%rbp)
	movb	$0, -8(%rbp)
	movb	$0, -7(%rbp)
	movb	$54, -6(%rbp)
	movb	$0, -5(%rbp)
	movb	$0, -4(%rbp)
	movb	$0, -3(%rbp)
	movl	16(%rbp), %eax
	movb	%al, -14(%rbp)
	movl	16(%rbp), %eax
	shrl	$8, %eax
	movb	%al, -13(%rbp)
	movl	16(%rbp), %eax
	shrl	$16, %eax
	movb	%al, -12(%rbp)
	movl	16(%rbp), %eax
	shrl	$24, %eax
	movb	%al, -11(%rbp)
	movq	-72(%rbp), %rdx
	leaq	-16(%rbp), %rax
	movq	%rdx, %rcx
	movl	$14, %edx
	movl	$1, %esi
	movq	%rax, %rdi
	call	fwrite
	movq	$0, -64(%rbp)
	movq	$0, -56(%rbp)
	movq	$0, -48(%rbp)
	movq	$0, -40(%rbp)
	movq	$0, -32(%rbp)
	movb	$40, -64(%rbp)
	movb	$1, -52(%rbp)
	movb	$24, -50(%rbp)
	movl	20(%rbp), %eax
	movb	%al, -60(%rbp)
	movl	20(%rbp), %eax
	sarl	$8, %eax
	movb	%al, -59(%rbp)
	movl	20(%rbp), %eax
	sarl	$16, %eax
	movb	%al, -58(%rbp)
	movl	20(%rbp), %eax
	sarl	$24, %eax
	movb	%al, -57(%rbp)
	movl	24(%rbp), %eax
	movb	%al, -56(%rbp)
	movl	24(%rbp), %eax
	sarl	$8, %eax
	movb	%al, -55(%rbp)
	movl	24(%rbp), %eax
	sarl	$16, %eax
	movb	%al, -54(%rbp)
	movl	24(%rbp), %eax
	sarl	$24, %eax
	movb	%al, -53(%rbp)
	movzwl	28(%rbp), %eax
	movb	%al, -50(%rbp)
	movzwl	28(%rbp), %eax
	shrw	$8, %ax
	movb	%al, -49(%rbp)
	movl	32(%rbp), %eax
	movb	%al, -48(%rbp)
	movl	32(%rbp), %eax
	shrl	$8, %eax
	movb	%al, -47(%rbp)
	movl	32(%rbp), %eax
	shrl	$16, %eax
	movb	%al, -46(%rbp)
	movl	32(%rbp), %eax
	shrl	$24, %eax
	movb	%al, -45(%rbp)
	movl	36(%rbp), %eax
	movb	%al, -44(%rbp)
	movl	36(%rbp), %eax
	shrl	$8, %eax
	movb	%al, -43(%rbp)
	movl	36(%rbp), %eax
	shrl	$16, %eax
	movb	%al, -42(%rbp)
	movl	36(%rbp), %eax
	shrl	$24, %eax
	movb	%al, -41(%rbp)
	movl	40(%rbp), %eax
	movb	%al, -32(%rbp)
	movl	40(%rbp), %eax
	shrl	$8, %eax
	movb	%al, -31(%rbp)
	movl	40(%rbp), %eax
	shrl	$16, %eax
	movb	%al, -30(%rbp)
	movl	40(%rbp), %eax
	shrl	$24, %eax
	movb	%al, -29(%rbp)
	movl	44(%rbp), %eax
	movb	%al, -28(%rbp)
	movl	44(%rbp), %eax
	shrl	$8, %eax
	movb	%al, -27(%rbp)
	movl	44(%rbp), %eax
	shrl	$16, %eax
	movb	%al, -26(%rbp)
	movl	44(%rbp), %eax
	shrl	$24, %eax
	movb	%al, -25(%rbp)
	movq	-72(%rbp), %rdx
	leaq	-64(%rbp), %rax
	movq	%rdx, %rcx
	movl	$40, %edx
	movl	$1, %esi
	movq	%rax, %rdi
	call	fwrite
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	save_image_header, .-save_image_header
	.section	.rodata
.LC5:
	.string	"wb"
	.text
	.globl	save_RGB_image
	.type	save_RGB_image, @function
save_RGB_image:
.LFB8:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$104, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -72(%rbp)
	movq	%rsi, -80(%rbp)
	movq	-72(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	addq	$14, %rax
	movq	%rax, %rdi
	call	malloc
	movq	%rax, -32(%rbp)
	movq	-32(%rbp), %rax
	movabsq	$7883937507492389235, %rbx
	movq	%rbx, (%rax)
	movl	$1936025441, 8(%rax)
	movw	$47, 12(%rax)
	movq	-72(%rbp), %rdx
	movq	-32(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcat
	movq	-32(%rbp), %rax
	movl	$.LC5, %esi
	movq	%rax, %rdi
	call	fopen
	movq	%rax, -40(%rbp)
	movq	-40(%rbp), %rax
	movq	16(%rbp), %rdx
	movq	%rdx, (%rsp)
	movq	24(%rbp), %rdx
	movq	%rdx, 8(%rsp)
	movq	32(%rbp), %rdx
	movq	%rdx, 16(%rsp)
	movq	40(%rbp), %rdx
	movq	%rdx, 24(%rsp)
	movq	%rax, %rdi
	call	save_image_header
	movl	$0, -20(%rbp)
	jmp	.L31
.L34:
	movl	$0, -24(%rbp)
	jmp	.L32
.L33:
	movl	-20(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-80(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rcx
	movl	-24(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	addq	%rcx, %rax
	movzwl	(%rax), %edx
	movw	%dx, -48(%rbp)
	movzbl	2(%rax), %eax
	movb	%al, -46(%rbp)
	movzbl	-46(%rbp), %eax
	movb	%al, -64(%rbp)
	movzbl	-47(%rbp), %eax
	movb	%al, -63(%rbp)
	movzbl	-48(%rbp), %eax
	movb	%al, -62(%rbp)
	movq	-40(%rbp), %rdx
	leaq	-64(%rbp), %rax
	movq	%rdx, %rcx
	movl	$3, %edx
	movl	$1, %esi
	movq	%rax, %rdi
	call	fwrite
	addl	$1, -24(%rbp)
.L32:
	movl	20(%rbp), %eax
	cmpl	-24(%rbp), %eax
	jg	.L33
	addl	$1, -20(%rbp)
.L31:
	movl	24(%rbp), %eax
	cmpl	-20(%rbp), %eax
	jg	.L34
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	fclose
	addq	$104, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	save_RGB_image, .-save_RGB_image
	.globl	save_YCC_image
	.type	save_YCC_image, @function
save_YCC_image:
.LFB9:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$184, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -136(%rbp)
	movq	%rsi, %rax
	movq	%rdx, %rsi
	movq	%rsi, %rdx
	movq	%rax, -160(%rbp)
	movq	%rdx, -152(%rbp)
	movl	%ecx, -140(%rbp)
	movq	-136(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	addq	$14, %rax
	movq	%rax, %rdi
	call	malloc
	movq	%rax, -56(%rbp)
	movq	-56(%rbp), %rax
	movabsq	$7883937507492389235, %rbx
	movq	%rbx, (%rax)
	movl	$1936025441, 8(%rax)
	movw	$47, 12(%rax)
	movq	-136(%rbp), %rdx
	movq	-56(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcat
	movq	-160(%rbp), %rax
	movq	%rax, -64(%rbp)
	movq	-56(%rbp), %rax
	movl	$.LC5, %esi
	movq	%rax, %rdi
	call	fopen
	movq	%rax, -72(%rbp)
	movq	-72(%rbp), %rax
	movq	16(%rbp), %rdx
	movq	%rdx, (%rsp)
	movq	24(%rbp), %rdx
	movq	%rdx, 8(%rsp)
	movq	32(%rbp), %rdx
	movq	%rdx, 16(%rsp)
	movq	40(%rbp), %rdx
	movq	%rdx, 24(%rsp)
	movq	%rax, %rdi
	call	save_image_header
	cmpl	$0, -140(%rbp)
	je	.L36
	movq	-56(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	addq	$2, %rax
	movq	%rax, %rdi
	call	malloc
	movq	%rax, -80(%rbp)
	movq	-56(%rbp), %rdx
	movq	-80(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcpy
	movq	-80(%rbp), %rax
	movq	$-1, %rcx
	movq	%rax, %rdx
	movl	$0, %eax
	movq	%rdx, %rdi
	repnz scasb
	movq	%rcx, %rax
	notq	%rax
	leaq	-1(%rax), %rdx
	movq	-80(%rbp), %rax
	addq	%rdx, %rax
	movw	$89, (%rax)
	movq	-56(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	addq	$3, %rax
	movq	%rax, %rdi
	call	malloc
	movq	%rax, -88(%rbp)
	movq	-56(%rbp), %rdx
	movq	-88(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcpy
	movq	-88(%rbp), %rax
	movq	$-1, %rcx
	movq	%rax, %rdx
	movl	$0, %eax
	movq	%rdx, %rdi
	repnz scasb
	movq	%rcx, %rax
	notq	%rax
	leaq	-1(%rax), %rdx
	movq	-88(%rbp), %rax
	addq	%rdx, %rax
	movw	$25155, (%rax)
	movb	$0, 2(%rax)
	movq	-56(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	addq	$3, %rax
	movq	%rax, %rdi
	call	malloc
	movq	%rax, -96(%rbp)
	movq	-56(%rbp), %rdx
	movq	-96(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcpy
	movq	-96(%rbp), %rax
	movq	$-1, %rcx
	movq	%rax, %rdx
	movl	$0, %eax
	movq	%rdx, %rdi
	repnz scasb
	movq	%rcx, %rax
	notq	%rax
	leaq	-1(%rax), %rdx
	movq	-96(%rbp), %rax
	addq	%rdx, %rax
	movw	$29251, (%rax)
	movb	$0, 2(%rax)
	movq	-80(%rbp), %rax
	movl	$.LC5, %esi
	movq	%rax, %rdi
	call	fopen
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rax
	movq	16(%rbp), %rdx
	movq	%rdx, (%rsp)
	movq	24(%rbp), %rdx
	movq	%rdx, 8(%rsp)
	movq	32(%rbp), %rdx
	movq	%rdx, 16(%rsp)
	movq	40(%rbp), %rdx
	movq	%rdx, 24(%rsp)
	movq	%rax, %rdi
	call	save_image_header
	movq	-88(%rbp), %rax
	movl	$.LC5, %esi
	movq	%rax, %rdi
	call	fopen
	movq	%rax, -32(%rbp)
	movq	-32(%rbp), %rax
	movq	16(%rbp), %rdx
	movq	%rdx, (%rsp)
	movq	24(%rbp), %rdx
	movq	%rdx, 8(%rsp)
	movq	32(%rbp), %rdx
	movq	%rdx, 16(%rsp)
	movq	40(%rbp), %rdx
	movq	%rdx, 24(%rsp)
	movq	%rax, %rdi
	call	save_image_header
	movq	-96(%rbp), %rax
	movl	$.LC5, %esi
	movq	%rax, %rdi
	call	fopen
	movq	%rax, -40(%rbp)
	movq	-40(%rbp), %rax
	movq	16(%rbp), %rdx
	movq	%rdx, (%rsp)
	movq	24(%rbp), %rdx
	movq	%rdx, 8(%rsp)
	movq	32(%rbp), %rdx
	movq	%rdx, 16(%rsp)
	movq	40(%rbp), %rdx
	movq	%rdx, 24(%rsp)
	movq	%rax, %rdi
	call	save_image_header
.L36:
	movl	20(%rbp), %eax
	movl	%eax, -100(%rbp)
	movl	24(%rbp), %eax
	movl	%eax, -104(%rbp)
	movl	$0, -44(%rbp)
	jmp	.L37
.L41:
	movl	$0, -48(%rbp)
	jmp	.L38
.L40:
	movl	-44(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-64(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rcx
	movl	-48(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	addq	%rcx, %rax
	movzwl	(%rax), %edx
	movw	%dx, -112(%rbp)
	movzbl	2(%rax), %eax
	movb	%al, -110(%rbp)
	movzbl	-110(%rbp), %eax
	movb	%al, -128(%rbp)
	movzbl	-111(%rbp), %eax
	movb	%al, -127(%rbp)
	movzbl	-112(%rbp), %eax
	movb	%al, -126(%rbp)
	movq	-72(%rbp), %rdx
	leaq	-128(%rbp), %rax
	movq	%rdx, %rcx
	movl	$3, %edx
	movl	$1, %esi
	movq	%rax, %rdi
	call	fwrite
	cmpl	$0, -140(%rbp)
	je	.L39
	movzbl	-112(%rbp), %eax
	movb	%al, -128(%rbp)
	movzbl	-112(%rbp), %eax
	movb	%al, -127(%rbp)
	movzbl	-112(%rbp), %eax
	movb	%al, -126(%rbp)
	movq	-24(%rbp), %rdx
	leaq	-128(%rbp), %rax
	movq	%rdx, %rcx
	movl	$3, %edx
	movl	$1, %esi
	movq	%rax, %rdi
	call	fwrite
	movzbl	-111(%rbp), %eax
	movb	%al, -128(%rbp)
	movzbl	-112(%rbp), %eax
	movb	%al, -127(%rbp)
	movzbl	-112(%rbp), %eax
	movb	%al, -126(%rbp)
	movq	-32(%rbp), %rdx
	leaq	-128(%rbp), %rax
	movq	%rdx, %rcx
	movl	$3, %edx
	movl	$1, %esi
	movq	%rax, %rdi
	call	fwrite
	movzbl	-112(%rbp), %eax
	movb	%al, -128(%rbp)
	movzbl	-110(%rbp), %eax
	movb	%al, -127(%rbp)
	movzbl	-112(%rbp), %eax
	movb	%al, -126(%rbp)
	movq	-40(%rbp), %rdx
	leaq	-128(%rbp), %rax
	movq	%rdx, %rcx
	movl	$3, %edx
	movl	$1, %esi
	movq	%rax, %rdi
	call	fwrite
.L39:
	addl	$1, -48(%rbp)
.L38:
	movl	-48(%rbp), %eax
	cmpl	-100(%rbp), %eax
	jl	.L40
	addl	$1, -44(%rbp)
.L37:
	movl	-44(%rbp), %eax
	cmpl	-104(%rbp), %eax
	jl	.L41
	movq	-72(%rbp), %rax
	movq	%rax, %rdi
	call	fclose
	cmpl	$0, -140(%rbp)
	je	.L35
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	fclose
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	fclose
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	fclose
.L35:
	addq	$184, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	save_YCC_image, .-save_YCC_image
	.ident	"GCC: (GNU) 4.8.5 20150623 (Red Hat 4.8.5-11)"
	.section	.note.GNU-stack,"",@progbits

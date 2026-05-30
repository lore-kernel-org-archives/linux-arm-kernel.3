Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F161CD6E43
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 May 2026 00:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BTJODSZ6QGmMUevGaoHSn6rTroHEuOqUe6r0UU6EnUc=; b=GIxz/9Lb2zvjpLNGC9p+11yOyU
	eZ1SlUMqKdRWMlDGI1z2emNIoN8deDcJCnWs+P4aFWXSsWAfdL9iqNcdXXX2+slod5KQyy0+T0erY
	eLKsInZ5VARz/7CcZJgkXpVneZUdnWQBF/crmhjBbi8jcWaWeK6oXxLSp1gP1WTvehlU//2fpr0Ea
	Z6e5DWQC1kpjkBpVmKgvWXpBrTApKcy+eOiSSfv/gfIvBSegMrINZH6C0qUpKcaoHgTQ1tJnsbEqf
	ddoF/WqyE+VGEMYsIiAeFjR0uM+c5bIPfbhEXnvuQNVXH20PCroey+tcN0Q0ltndvRb0DvEWDDge0
	w7MVQEDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wT7rV-00000008LJZ-0ip5;
	Sat, 30 May 2026 00:47:37 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wT7rS-00000008LIx-0Vm9
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 May 2026 00:47:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3D197409D3;
	Sat, 30 May 2026 00:47:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5F6A1F00898;
	Sat, 30 May 2026 00:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780102053;
	bh=BTJODSZ6QGmMUevGaoHSn6rTroHEuOqUe6r0UU6EnUc=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=L5GZr6L+FuaxhEvORMGfXyAzMuYWTnEwZ/fZXphbiWsUTJc/yXGid/cAXMyrGRzzJ
	 XhGIiUOQmd9w4m+vMwdY0viWXVRbuWA04Wsv7l+tLSaRJyXvhIPjhTrotZ8j4GmzHc
	 TPUD5ch3G2zdOC+EnnGTWJ1oryWJD8HsBGIdxWMZ6rxrrXQwHB4Q7ZMbO9YWP6Gma2
	 6mbE27n/Z1G0Uzm6mcv7JBKxb0seyIDhUWnMwF40ZKl5ptQ2WJ/X6cRvqOOeW2bahV
	 ukBZ1xWXMGis7/9v+dTnLGbMEZDEq7FmiPmo9VlQm3OGZ5fX43daXELIaS2ICCrhU/
	 jmCkZk1S0zyVw==
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v3 2/2] kconfig: Remove the architecture specific
 config for Propeller
From: Nathan Chancellor <nathan@kernel.org>
To: xur@google.com
Cc: Yabin Cui <yabinc@google.com>, Will Deacon <will@kernel.org>, 
 Han Shen <shenhan@google.com>, Thomas Gleixner <tglx@linutronix.de>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, 
 Kees Cook <kees@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nicolas.schier@linux.dev>, 
 Linus Walleij <linusw@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Jinjie Ruan <ruanjinjie@huawei.com>, 
 Lukas Bulwahn <lukas.bulwahn@redhat.com>, linux-kernel@vger.kernel.org, 
 Juergen Gross <jgross@suse.com>, Helge Deller <deller@gmx.de>, 
 Ryan Roberts <ryan.roberts@arm.com>, Marc Zyngier <maz@kernel.org>, 
 Ard Biesheuvel <ardb@kernel.org>, Vincent Donnefort <vdonnefort@google.com>, 
 Alice Ryhl <aliceryhl@google.com>, x86@kernel.org, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20260527214510.3907973-3-xur@google.com>
References: <20260527214510.3907973-1-xur@google.com>
 <20260527214510.3907973-3-xur@google.com>
Date: Fri, 29 May 2026 17:47:11 -0700
Message-Id: <178010203122.3743687.12531843798236779880.b4-review@b4>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3531; i=nathan@kernel.org;
 h=from:subject:message-id; bh=9OMPifNitnzGPA2fSMJItQgS33sgKeWBK76+/2tkOdI=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFlSxjO5Hy7ZF6/RfoTztvS9E17My/bm+x+dMHn3IamIk
 KkHZqfd6ihlYRDjYpAVU2Spfqx63NBwzlnGG6cmwcxhZQIZwsDFKQATOdXF8M9wocXb9DrNXWpz
 K2XrnPwCL795vWMh78+gDL/gUN/OhK2MDN/Wp337fV794fJjUxPEtxhlZVo15VgsaO7n+ajzbBv
 jFE4A
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_174734_226579_EA9B7E5C 
X-CRM114-Status: GOOD (  15.93  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Wed, 27 May 2026 14:45:08 -0700, xur@google.com <xur@google.com> wrote:
> diff --git a/arch/Kconfig b/arch/Kconfig
> index e510c585ea84..e4eaca9c917c 100644
> --- a/arch/Kconfig
> +++ b/arch/Kconfig
> @@ -879,12 +879,8 @@ config AUTOFDO_CLANG
>  
>  	  If unsure, say N.
>  
> -config ARCH_SUPPORTS_PROPELLER_CLANG
> -	bool
> -
>  config PROPELLER_CLANG
>  	bool "Enable Clang's Propeller build"
> -	depends on ARCH_SUPPORTS_PROPELLER_CLANG

It does not look like '-fbasic-block-address-map' or its predecessor,
'-fbasic-block-sections=labels', are supported by all architectures?
This will break allmodconfig for some architectures in that case, so
this needs to addressed with some other dependency.

  | $ make -skj"$(nproc)" ARCH=arm LLVM=1 mrproper allmodconfig all
  | ...
  | clang: error: unsupported option '-fbasic-block-address-map' for target 'armv6k-unknown-linux-gnueabi'
  | ...
  |
  | $ make -skj"$(nproc)" ARCH=s390 LLVM=1 mrproper allmodconfig all
  | ...
  | clang: error: unsupported option '-fbasic-block-address-map' for target 's390x-unknown-linux-gnu'
  | ...

Maybe something like

  depends on CC_IS_CLANG && $(cc-option,-fbasic-block-address-map)

then cleaning up scripts/Makefile.propeller to use it exclusively?

>
> diff --git a/arch/arm64/kernel/vmlinux.lds.S b/arch/arm64/kernel/vmlinux.lds.S
> index e1ac876200a3..44a42e7c66cf 100644
> --- a/arch/arm64/kernel/vmlinux.lds.S
> +++ b/arch/arm64/kernel/vmlinux.lds.S
> @@ -368,6 +368,9 @@ SECTIONS
>  
>  	STABS_DEBUG
>  	DWARF_DEBUG
> +#ifdef CONFIG_PROPELLER_CLANG
> +        .llvm_bb_addr_map : { *(.llvm_bb_addr_map) }

I would prefer to take the opportunity to consolidate this into
include/asm-generic/vmlinux.lds.h with something like this:

  | diff --git a/arch/arm64/kernel/vmlinux.lds.S b/arch/arm64/kernel/vmlinux.lds.S
  | index 44a42e7c66cf..8aaf404980a7 100644
  | --- a/arch/arm64/kernel/vmlinux.lds.S
  | +++ b/arch/arm64/kernel/vmlinux.lds.S
  | @@ -368,9 +368,7 @@ SECTIONS
  |  
  |  	STABS_DEBUG
  |  	DWARF_DEBUG
  | -#ifdef CONFIG_PROPELLER_CLANG
  | -        .llvm_bb_addr_map : { *(.llvm_bb_addr_map) }
  | -#endif
  | +	PROPELLER_DATA
  |  	MODINFO
  |  	ELF_DETAILS
  |  
  | diff --git a/arch/x86/kernel/vmlinux.lds.S b/arch/x86/kernel/vmlinux.lds.S
  | index 4711a35e706c..d93611675d8a 100644
  | --- a/arch/x86/kernel/vmlinux.lds.S
  | +++ b/arch/x86/kernel/vmlinux.lds.S
  | @@ -423,9 +423,7 @@ SECTIONS
  |  
  |  	STABS_DEBUG
  |  	DWARF_DEBUG
  | -#ifdef CONFIG_PROPELLER_CLANG
  | -	.llvm_bb_addr_map : { *(.llvm_bb_addr_map) }
  | -#endif
  | +	PROPELLER_DATA
  |  
  |  	MODINFO
  |  	ELF_DETAILS
  | diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
  | index 60c8c22fd3e4..7a157a1320b9 100644
  | --- a/include/asm-generic/vmlinux.lds.h
  | +++ b/include/asm-generic/vmlinux.lds.h
  | @@ -1011,6 +1011,13 @@
  |  #define PERCPU_DECRYPTED_SECTION
  |  #endif
  |  
  | +#ifdef CONFIG_PROPELLER_CLANG
  | +#define PROPELLER_DATA							\
  | +	.llvm_bb_addr_map : { *(.llvm_bb_addr_map) }
  | +#else
  | +#define PROPELLER_DATA
  | +#endif
  | +
  |  
  |  /*
  |   * Default discarded sections.

That keeps the ifdef in one place and makes it easy to add this to other
architecture linker scripts as they gain support for Propeller. Are
there any other architectures that need this added? Or are arm64 and
x86_64 the only supported architectures?

-- 
Cheers,
Nathan



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37549C0218A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jan 2025 09:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NRGiBYGv+vKqDqDaesyuawX4ZPxUYYpwD/wnO7/ks+Y=; b=X+CdfPJG3hakEeS/2m461tEL2S
	Yc+nvW28hlEjGuFe+9Fa/t5UHXbjzMh2rPJDZ9TSBH+5VYY5Y4/wn+yj04/BEjV03myBdrDR72qo+
	2cE6T0o/J4WnUaTp4XpGi6pkaYRNG0+V0N86Kkn407/7jlRNlTq2N2K5s1Ce0BAVxJjY7dsTdJ4sM
	ZXb+fdb7qV+/15GAICmLMbzVLVmpOKSdC5+LcRxAJtuNW1FwBnubw+SoN/prVd2XXQDFrMMvXQVIo
	wQ/y0wG8lPPHqreO0ROP3u5z+QmpeLEpqbKgJP6nzGfIC22rxULROXBiQ/0K015bfSu9m1rbptESC
	hVj6XBkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdR81-00000008X2f-41EW;
	Thu, 30 Jan 2025 09:46:29 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdR6i-00000008WxN-2aMt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jan 2025 09:45:09 +0000
Received: from [10.156.205.88] (unknown [167.220.238.88])
	by linux.microsoft.com (Postfix) with ESMTPSA id EE9E72109CD7;
	Thu, 30 Jan 2025 01:45:02 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com EE9E72109CD7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1738230306;
	bh=NRGiBYGv+vKqDqDaesyuawX4ZPxUYYpwD/wnO7/ks+Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=IsSf5FRFEtFqA4+wMmOLBhT+u99GjlRyAoqK3hukAvyDf6BXvo1bzRR8Hxn03jmpN
	 Lhz5KNPyeMWkhA3VAUsMLmnM3tbO6yKa8Mu1VW2YaE19FRA0sWqnZE1lAWq+I8921f
	 m79XGe6iux/lhe6N2Ds11PSJQQp121cf/U9or2uc=
Message-ID: <d7f69c61-8daf-4996-8c62-108589442604@linux.microsoft.com>
Date: Thu, 30 Jan 2025 15:15:01 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] unwind: build kernel with sframe info
To: Weinan Liu <wnliu@google.com>, Josh Poimboeuf <jpoimboe@kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>, Indu Bhagat <indu.bhagat@oracle.com>,
 Peter Zijlstra <peterz@infradead.org>
Cc: Mark Rutland <mark.rutland@arm.com>, roman.gushchin@linux.dev,
 Will Deacon <will@kernel.org>, Ian Rogers <irogers@google.com>,
 linux-toolchains@vger.kernel.org, linux-kernel@vger.kernel.org,
 live-patching@vger.kernel.org, joe.lawrence@redhat.com,
 linux-arm-kernel@lists.infradead.org
References: <20250127213310.2496133-1-wnliu@google.com>
 <20250127213310.2496133-2-wnliu@google.com>
Content-Language: en-US
From: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
In-Reply-To: <20250127213310.2496133-2-wnliu@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_014508_728831_8071EF4C 
X-CRM114-Status: GOOD (  20.44  )
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


On 28-01-2025 03:03, Weinan Liu wrote:
> Use the -Wa,--gsframe flags to build the code, so GAS will generate
> a new .sframe section for the stack trace information.
> Currently, the sframe format only supports arm64 and x86_64
> architectures. Add this configuration on arm64 to enable sframe
> unwinder in the future.
>
> Signed-off-by: Weinan Liu <wnliu@google.com>
> ---
>   Makefile                          |  6 ++++++
>   arch/Kconfig                      |  8 ++++++++
>   arch/arm64/Kconfig.debug          | 10 ++++++++++
>   include/asm-generic/vmlinux.lds.h | 12 ++++++++++++
>   4 files changed, 36 insertions(+)
>
> diff --git a/Makefile b/Makefile
> index b9464c88ac72..35200c39b98d 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1064,6 +1064,12 @@ ifdef CONFIG_CC_IS_GCC
>   KBUILD_CFLAGS   += -fconserve-stack
>   endif
>   
> +# build with sframe table
> +ifdef CONFIG_SFRAME_UNWIND_TABLE
> +KBUILD_CFLAGS	+= -Wa,--gsframe
> +KBUILD_AFLAGS	+= -Wa,--gsframe
> +endif
> +
>   # change __FILE__ to the relative path to the source directory
>   ifdef building_out_of_srctree
>   KBUILD_CPPFLAGS += $(call cc-option,-fmacro-prefix-map=$(srcroot)/=)
> diff --git a/arch/Kconfig b/arch/Kconfig
> index 6682b2a53e34..ae70f7dbe326 100644
> --- a/arch/Kconfig
> +++ b/arch/Kconfig
> @@ -1736,4 +1736,12 @@ config ARCH_WANTS_PRE_LINK_VMLINUX
>   	  An architecture can select this if it provides arch/<arch>/tools/Makefile
>   	  with .arch.vmlinux.o target to be linked into vmlinux.
>   
> +config AS_HAS_SFRAME_SUPPORT
> +	# Detect availability of the AS option -Wa,--gsframe for generating
> +	# sframe unwind table.
> +	def_bool $(cc-option,-Wa$(comma)--gsframe)
> +
> +config SFRAME_UNWIND_TABLE
> +	bool
> +
>   endmenu
> diff --git a/arch/arm64/Kconfig.debug b/arch/arm64/Kconfig.debug
> index 265c4461031f..ed619fcb18b3 100644
> --- a/arch/arm64/Kconfig.debug
> +++ b/arch/arm64/Kconfig.debug
> @@ -20,4 +20,14 @@ config ARM64_RELOC_TEST
>   	depends on m
>   	tristate "Relocation testing module"
>   
> +config SFRAME_UNWINDER
> +	bool "Sframe unwinder"
> +	depends on AS_HAS_SFRAME_SUPPORT
> +	depends on 64BIT
> +	select SFRAME_UNWIND_TABLE
> +	help
> +	  This option enables the sframe (Simple Frame) unwinder for unwinding
> +	  kernel stack traces. It uses unwind table that is direclty generated
> +	  by toolchain based on DWARF CFI information
> +
>   source "drivers/hwtracing/coresight/Kconfig"
> diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
> index 54504013c749..6a437bd084c7 100644
> --- a/include/asm-generic/vmlinux.lds.h
> +++ b/include/asm-generic/vmlinux.lds.h
> @@ -469,6 +469,8 @@ defined(CONFIG_AUTOFDO_CLANG) || defined(CONFIG_PROPELLER_CLANG)
>   		*(.rodata1)						\
>   	}								\
>   									\
> +	SFRAME								\
> +									\
>   	/* PCI quirks */						\
>   	.pci_fixup        : AT(ADDR(.pci_fixup) - LOAD_OFFSET) {	\
>   		BOUNDED_SECTION_PRE_LABEL(.pci_fixup_early,  _pci_fixups_early,  __start, __end) \
> @@ -886,6 +888,16 @@ defined(CONFIG_AUTOFDO_CLANG) || defined(CONFIG_PROPELLER_CLANG)
>   #define TRACEDATA
>   #endif
>   
> +#ifdef CONFIG_SFRAME_UNWIND_TABLE
> +#define SFRAME							\
> +	/* sframe */						\
> +	.sframe        : AT(ADDR(.sframe) - LOAD_OFFSET) {	\
> +		BOUNDED_SECTION_BY(.sframe, _sframe_header)	\
> +	}
> +#else
> +#define SFRAME
> +#endif
> +
>   #ifdef CONFIG_PRINTK_INDEX
>   #define PRINTK_INDEX							\
>   	.printk_index : AT(ADDR(.printk_index) - LOAD_OFFSET) {		\

Looks good to me.

Reviewed-by: Prasanna Kumar T S M <ptsm@linux.microsoft.com>.



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C72BC02196
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 18:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i1ckMaeApZheowRCFdwyOEZHCVxXZVaayUJeeHHQNNU=; b=zocrUdxBeucuri6LKzms2OXyA+
	b4DGEACYjBiEJHr2XloTc2LktgHLOFKL/iOhJs6zEHysfuvpYnI9A2FIPe5KFsVK4ycZDnLLOPEKj
	+9yrFcDGGThuLoSZ+uQwEj/7H0mq+l1PTH26ESP3XcnKvcf1Gb6oPpsRkrNWy5dd9Eme8YmPVFCdt
	T43Jvi3nwe0BHcpkqPza4PtVDYBUX34+Zav68nHJE+r3jtFop5dHkULAzXrZf5TQMpvg73pNmct+E
	+Rc6UvYrBAkF78trvZz7Jef4l03OYR9Gd7MSeTXkBGGT3jU/rGdyOMX1ZdqmeyIWVZjimXnyZaOdq
	CIdxyjMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgTFo-0000000Ajxc-07Se;
	Fri, 07 Feb 2025 18:39:04 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgTEP-0000000AjcK-0zqH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 18:37:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5D278113E;
	Fri,  7 Feb 2025 10:37:58 -0800 (PST)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 27E173F63F;
	Fri,  7 Feb 2025 10:37:33 -0800 (PST)
Date: Fri, 7 Feb 2025 18:37:27 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Shuah Khan <shuah@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v5 3/5] arm64/hwcap: Describe 2024 dpISA extensions to
 userspace
Message-ID: <Z6ZS51BLkfFLl-5Y@J2N7QTR9R3>
References: <20250107-arm64-2024-dpisa-v5-0-7578da51fc3d@kernel.org>
 <20250107-arm64-2024-dpisa-v5-3-7578da51fc3d@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250107-arm64-2024-dpisa-v5-3-7578da51fc3d@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_103737_391235_81AD4B9C 
X-CRM114-Status: GOOD (  17.61  )
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

On Tue, Jan 07, 2025 at 10:59:43PM +0000, Mark Brown wrote:
> The 2024 dpISA introduces a number of architecture features all of which
> only add new instructions so only require the addition of hwcaps and ID
> register visibility.

While working on SME fixes atop v6.14-rc1, I found this patch breaks the
build spectacularly with CONFIG_ARM64_SME is enabled (splat at the end
of this mail), due to some missing definitions.

From a quick scan, there are some other missing bits too. For example
these two caps are defined in terms of ID_AA64FPFR0_EL1 fields:

> +HWCAP_F8MM8
> +    Functionality implied by ID_AA64FPFR0_EL1.F8MM8 == 0b0001.
> +
> +HWCAP_F8MM4
> +    Functionality implied by ID_AA64FPFR0_EL1.F8MM4 == 0b0001.

> +#define KERNEL_HWCAP_F8MM8		__khwcap_feature(F8MM8)
> +#define KERNEL_HWCAP_F8MM4		__khwcap_feature(F8MM4)

> +#define HWCAP_F8MM8		(1UL << 35)
> +#define HWCAP_F8MM4		(1UL << 36)

... and we expose the ID register bits to userspace:

> @@ -381,6 +396,8 @@ static const struct arm64_ftr_bits ftr_id_aa64fpfr0[] = {
>  	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_EXACT, ID_AA64FPFR0_EL1_F8FMA_SHIFT, 1, 0),
>  	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_EXACT, ID_AA64FPFR0_EL1_F8DP4_SHIFT, 1, 0),
>  	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_EXACT, ID_AA64FPFR0_EL1_F8DP2_SHIFT, 1, 0),
> +	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_EXACT, ID_AA64FPFR0_EL1_F8MM8_SHIFT, 1, 0),
> +	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_EXACT, ID_AA64FPFR0_EL1_F8MM4_SHIFT, 1, 0),
>  	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_EXACT, ID_AA64FPFR0_EL1_F8E4M3_SHIFT, 1, 0),
>  	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_EXACT, ID_AA64FPFR0_EL1_F8E5M2_SHIFT, 1, 0),

... but there's no corresponding arm64_elf_hwcaps additions to actually
expose the hwcaps.

There are *SME* variants in arm64_elf_hwcaps:

> @@ -3163,6 +3187,13 @@ static const struct arm64_cpu_capabilities arm64_elf_hwcaps[] = {
>  	HWCAP_CAP(ID_AA64SMFR0_EL1, SF8FMA, IMP, CAP_HWCAP, KERNEL_HWCAP_SME_SF8FMA),
>  	HWCAP_CAP(ID_AA64SMFR0_EL1, SF8DP4, IMP, CAP_HWCAP, KERNEL_HWCAP_SME_SF8DP4),
>  	HWCAP_CAP(ID_AA64SMFR0_EL1, SF8DP2, IMP, CAP_HWCAP, KERNEL_HWCAP_SME_SF8DP2),
> +	HWCAP_CAP(ID_AA64SMFR0_EL1, SF8MM8, IMP, CAP_HWCAP, KERNEL_HWCAP_SME_SF8MM8),
> +	HWCAP_CAP(ID_AA64SMFR0_EL1, SF8MM4, IMP, CAP_HWCAP, KERNEL_HWCAP_SME_SF8MM4),

... but those KERNEL_HWCAP_SME_* values are never defined, and neither
are the UAPI equivalents.

We need to fix that quick, in case we need to shuffle values.

> diff --git a/arch/arm64/kernel/cpuinfo.c b/arch/arm64/kernel/cpuinfo.c
> index d79e88fccdfce427507e7a34c5959ce6309cbd12..b08ea3dd5e210626102b83edc3be4efcc9225fc6 100644
> --- a/arch/arm64/kernel/cpuinfo.c
> +++ b/arch/arm64/kernel/cpuinfo.c
> @@ -145,6 +145,21 @@ static const char *const hwcap_str[] = {
>  	[KERNEL_HWCAP_SME_SF8DP4]	= "smesf8dp4",
>  	[KERNEL_HWCAP_SME_SF8DP2]	= "smesf8dp2",
>  	[KERNEL_HWCAP_POE]		= "poe",
> +	[KERNEL_HWCAP_CMPBR]		= "cmpbr",
> +	[KERNEL_HWCAP_FPRCVT]		= "fprcvt",
> +	[KERNEL_HWCAP_F8MM8]		= "f8mm8",
> +	[KERNEL_HWCAP_F8MM4]		= "f8mm4",
> +	[KERNEL_HWCAP_SVE_F16MM]	= "svef16mm",
> +	[KERNEL_HWCAP_SVE_ELTPERM]	= "sveeltperm",
> +	[KERNEL_HWCAP_SVE_AES2]		= "sveaes2",
> +	[KERNEL_HWCAP_SVE_BFSCALE]	= "svebfscale",
> +	[KERNEL_HWCAP_SVE2P2]		= "sve2p2",
> +	[KERNEL_HWCAP_SME2P2]		= "sme2p2",
> +	[KERNEL_HWCAP_SME_SBITPERM]	= "smesbitperm",
> +	[KERNEL_HWCAP_SME_AES]		= "smeaes",
> +	[KERNEL_HWCAP_SME_SFEXPA]	= "smesfexpa",
> +	[KERNEL_HWCAP_SME_STMOP]	= "smestmop",
> +	[KERNEL_HWCAP_SME_SMOP4]	= "smesmop4",
>  };

Likewise they're missing from the strings table here.

The full splat I got was:

| [mark@lakrids:~/src/linux]% usekorg 14.2.0 make ARCH=arm64 CROSS_COMPILE=aarch64-linux- arch/arm64/
|   CALL    scripts/checksyscalls.sh
|   CC      arch/arm64/kernel/cpufeature.o
| arch/arm64/kernel/cpufeature.c:3183:61: error: 'KERNEL_HWCAP_SME_SF8MM8' undeclared here (not in a function); did you mean 'KERNEL_HWCAP_SME_SF8FMA'?
|  3183 |         HWCAP_CAP(ID_AA64SMFR0_EL1, SF8MM8, IMP, CAP_HWCAP, KERNEL_HWCAP_SME_SF8MM8),
|       |                                                             ^~~~~~~~~~~~~~~~~~~~~~~
| arch/arm64/kernel/cpufeature.c:3013:26: note: in definition of macro '__HWCAP_CAP'
|  3013 |                 .hwcap = cap,                                                   \
|       |                          ^~~
| arch/arm64/kernel/cpufeature.c:3183:9: note: in expansion of macro 'HWCAP_CAP'
|  3183 |         HWCAP_CAP(ID_AA64SMFR0_EL1, SF8MM8, IMP, CAP_HWCAP, KERNEL_HWCAP_SME_SF8MM8),
|       |         ^~~~~~~~~
| arch/arm64/kernel/cpufeature.c:3183:19: error: 'ID_AA64SMFR0_EL1_SF8MM8_SHIFT' undeclared here (not in a function); did you mean 'ID_AA64SMFR0_EL1_SF8FMA_SHIFT'?
|  3183 |         HWCAP_CAP(ID_AA64SMFR0_EL1, SF8MM8, IMP, CAP_HWCAP, KERNEL_HWCAP_SME_SF8MM8),
|       |                   ^~~~~~~~~~~~~~~~
| arch/arm64/kernel/cpufeature.c:154:30: note: in definition of macro '__ARM64_CPUID_FIELDS'
|   154 |                 .field_pos = reg##_##field##_SHIFT,                     \
|       |                              ^~~
| arch/arm64/kernel/cpufeature.c:3007:17: note: in expansion of macro 'ARM64_CPUID_FIELDS'
|  3007 |                 ARM64_CPUID_FIELDS(reg, field, min_value)
|       |                 ^~~~~~~~~~~~~~~~~~
| arch/arm64/kernel/cpufeature.c:3018:17: note: in expansion of macro 'HWCAP_CPUID_MATCH'
|  3018 |                 HWCAP_CPUID_MATCH(reg, field, min_value)                \
|       |                 ^~~~~~~~~~~~~~~~~
| arch/arm64/kernel/cpufeature.c:3183:9: note: in expansion of macro 'HWCAP_CAP'
|  3183 |         HWCAP_CAP(ID_AA64SMFR0_EL1, SF8MM8, IMP, CAP_HWCAP, KERNEL_HWCAP_SME_SF8MM8),
|       |         ^~~~~~~~~
| arch/arm64/kernel/cpufeature.c:3183:19: error: 'ID_AA64SMFR0_EL1_SF8MM8_WIDTH' undeclared here (not in a function); did you mean 'ID_AA64SMFR0_EL1_SF8FMA_WIDTH'?
|  3183 |         HWCAP_CAP(ID_AA64SMFR0_EL1, SF8MM8, IMP, CAP_HWCAP, KERNEL_HWCAP_SME_SF8MM8),
|       |                   ^~~~~~~~~~~~~~~~
| arch/arm64/kernel/cpufeature.c:155:32: note: in definition of macro '__ARM64_CPUID_FIELDS'
|   155 |                 .field_width = reg##_##field##_WIDTH,                   \
|       |                                ^~~
| arch/arm64/kernel/cpufeature.c:3007:17: note: in expansion of macro 'ARM64_CPUID_FIELDS'
|  3007 |                 ARM64_CPUID_FIELDS(reg, field, min_value)
|       |                 ^~~~~~~~~~~~~~~~~~
| arch/arm64/kernel/cpufeature.c:3018:17: note: in expansion of macro 'HWCAP_CPUID_MATCH'
|  3018 |                 HWCAP_CPUID_MATCH(reg, field, min_value)                \
|       |                 ^~~~~~~~~~~~~~~~~
| arch/arm64/kernel/cpufeature.c:3183:9: note: in expansion of macro 'HWCAP_CAP'
|  3183 |         HWCAP_CAP(ID_AA64SMFR0_EL1, SF8MM8, IMP, CAP_HWCAP, KERNEL_HWCAP_SME_SF8MM8),
|       |         ^~~~~~~~~
| arch/arm64/kernel/cpufeature.c:3183:19: error: 'ID_AA64SMFR0_EL1_SF8MM8_SIGNED' undeclared here (not in a function); did you mean 'ID_AA64SMFR0_EL1_SF8FMA_SIGNED'?
|  3183 |         HWCAP_CAP(ID_AA64SMFR0_EL1, SF8MM8, IMP, CAP_HWCAP, KERNEL_HWCAP_SME_SF8MM8),
|       |                   ^~~~~~~~~~~~~~~~
| arch/arm64/kernel/cpufeature.c:156:25: note: in definition of macro '__ARM64_CPUID_FIELDS'
|   156 |                 .sign = reg##_##field##_SIGNED,                         \
|       |                         ^~~
| arch/arm64/kernel/cpufeature.c:3007:17: note: in expansion of macro 'ARM64_CPUID_FIELDS'
|  3007 |                 ARM64_CPUID_FIELDS(reg, field, min_value)
|       |                 ^~~~~~~~~~~~~~~~~~
| arch/arm64/kernel/cpufeature.c:3018:17: note: in expansion of macro 'HWCAP_CPUID_MATCH'
|  3018 |                 HWCAP_CPUID_MATCH(reg, field, min_value)                \
|       |                 ^~~~~~~~~~~~~~~~~
| arch/arm64/kernel/cpufeature.c:3183:9: note: in expansion of macro 'HWCAP_CAP'
|  3183 |         HWCAP_CAP(ID_AA64SMFR0_EL1, SF8MM8, IMP, CAP_HWCAP, KERNEL_HWCAP_SME_SF8MM8),
|       |         ^~~~~~~~~
| arch/arm64/kernel/cpufeature.c:3183:19: error: 'ID_AA64SMFR0_EL1_SF8MM8_IMP' undeclared here (not in a function); did you mean 'ID_AA64SMFR0_EL1_SF8FMA_IMP'?
|  3183 |         HWCAP_CAP(ID_AA64SMFR0_EL1, SF8MM8, IMP, CAP_HWCAP, KERNEL_HWCAP_SME_SF8MM8),
|       |                   ^~~~~~~~~~~~~~~~
| arch/arm64/kernel/cpufeature.c:157:36: note: in definition of macro '__ARM64_CPUID_FIELDS'
|   157 |                 .min_field_value = min_value,                           \
|       |                                    ^~~~~~~~~
| arch/arm64/kernel/cpufeature.c:169:30: note: in expansion of macro 'SYS_FIELD_VALUE'
|   169 |                              SYS_FIELD_VALUE(reg, field, min_value),    \
|       |                              ^~~~~~~~~~~~~~~
| arch/arm64/kernel/cpufeature.c:3007:17: note: in expansion of macro 'ARM64_CPUID_FIELDS'
|  3007 |                 ARM64_CPUID_FIELDS(reg, field, min_value)
|       |                 ^~~~~~~~~~~~~~~~~~
| arch/arm64/kernel/cpufeature.c:3018:17: note: in expansion of macro 'HWCAP_CPUID_MATCH'
|  3018 |                 HWCAP_CPUID_MATCH(reg, field, min_value)                \
|       |                 ^~~~~~~~~~~~~~~~~
| arch/arm64/kernel/cpufeature.c:3183:9: note: in expansion of macro 'HWCAP_CAP'
|  3183 |         HWCAP_CAP(ID_AA64SMFR0_EL1, SF8MM8, IMP, CAP_HWCAP, KERNEL_HWCAP_SME_SF8MM8),
|       |         ^~~~~~~~~
| arch/arm64/kernel/cpufeature.c:3184:61: error: 'KERNEL_HWCAP_SME_SF8MM4' undeclared here (not in a function); did you mean 'KERNEL_HWCAP_SME_SF8DP4'?
|  3184 |         HWCAP_CAP(ID_AA64SMFR0_EL1, SF8MM4, IMP, CAP_HWCAP, KERNEL_HWCAP_SME_SF8MM4),
|       |                                                             ^~~~~~~~~~~~~~~~~~~~~~~
| arch/arm64/kernel/cpufeature.c:3013:26: note: in definition of macro '__HWCAP_CAP'
|  3013 |                 .hwcap = cap,                                                   \
|       |                          ^~~
| arch/arm64/kernel/cpufeature.c:3184:9: note: in expansion of macro 'HWCAP_CAP'
|  3184 |         HWCAP_CAP(ID_AA64SMFR0_EL1, SF8MM4, IMP, CAP_HWCAP, KERNEL_HWCAP_SME_SF8MM4),
|       |         ^~~~~~~~~
| arch/arm64/kernel/cpufeature.c:3184:19: error: 'ID_AA64SMFR0_EL1_SF8MM4_SHIFT' undeclared here (not in a function); did you mean 'ID_AA64SMFR0_EL1_SF8FMA_SHIFT'?
|  3184 |         HWCAP_CAP(ID_AA64SMFR0_EL1, SF8MM4, IMP, CAP_HWCAP, KERNEL_HWCAP_SME_SF8MM4),
|       |                   ^~~~~~~~~~~~~~~~
| arch/arm64/kernel/cpufeature.c:154:30: note: in definition of macro '__ARM64_CPUID_FIELDS'
|   154 |                 .field_pos = reg##_##field##_SHIFT,                     \
|       |                              ^~~
| arch/arm64/kernel/cpufeature.c:3007:17: note: in expansion of macro 'ARM64_CPUID_FIELDS'
|  3007 |                 ARM64_CPUID_FIELDS(reg, field, min_value)
|       |                 ^~~~~~~~~~~~~~~~~~
| arch/arm64/kernel/cpufeature.c:3018:17: note: in expansion of macro 'HWCAP_CPUID_MATCH'
|  3018 |                 HWCAP_CPUID_MATCH(reg, field, min_value)                \
|       |                 ^~~~~~~~~~~~~~~~~
| arch/arm64/kernel/cpufeature.c:3184:9: note: in expansion of macro 'HWCAP_CAP'
|  3184 |         HWCAP_CAP(ID_AA64SMFR0_EL1, SF8MM4, IMP, CAP_HWCAP, KERNEL_HWCAP_SME_SF8MM4),
|       |         ^~~~~~~~~
| arch/arm64/kernel/cpufeature.c:3184:19: error: 'ID_AA64SMFR0_EL1_SF8MM4_WIDTH' undeclared here (not in a function); did you mean 'ID_AA64SMFR0_EL1_SF8FMA_WIDTH'?
|  3184 |         HWCAP_CAP(ID_AA64SMFR0_EL1, SF8MM4, IMP, CAP_HWCAP, KERNEL_HWCAP_SME_SF8MM4),
|       |                   ^~~~~~~~~~~~~~~~
| arch/arm64/kernel/cpufeature.c:155:32: note: in definition of macro '__ARM64_CPUID_FIELDS'
|   155 |                 .field_width = reg##_##field##_WIDTH,                   \
|       |                                ^~~
| arch/arm64/kernel/cpufeature.c:3007:17: note: in expansion of macro 'ARM64_CPUID_FIELDS'
|  3007 |                 ARM64_CPUID_FIELDS(reg, field, min_value)
|       |                 ^~~~~~~~~~~~~~~~~~
| arch/arm64/kernel/cpufeature.c:3018:17: note: in expansion of macro 'HWCAP_CPUID_MATCH'
|  3018 |                 HWCAP_CPUID_MATCH(reg, field, min_value)                \
|       |                 ^~~~~~~~~~~~~~~~~
| arch/arm64/kernel/cpufeature.c:3184:9: note: in expansion of macro 'HWCAP_CAP'
|  3184 |         HWCAP_CAP(ID_AA64SMFR0_EL1, SF8MM4, IMP, CAP_HWCAP, KERNEL_HWCAP_SME_SF8MM4),
|       |         ^~~~~~~~~
| arch/arm64/kernel/cpufeature.c:3184:19: error: 'ID_AA64SMFR0_EL1_SF8MM4_SIGNED' undeclared here (not in a function); did you mean 'ID_AA64SMFR0_EL1_SF8DP4_SIGNED'?
|  3184 |         HWCAP_CAP(ID_AA64SMFR0_EL1, SF8MM4, IMP, CAP_HWCAP, KERNEL_HWCAP_SME_SF8MM4),
|       |                   ^~~~~~~~~~~~~~~~
| arch/arm64/kernel/cpufeature.c:156:25: note: in definition of macro '__ARM64_CPUID_FIELDS'
|   156 |                 .sign = reg##_##field##_SIGNED,                         \
|       |                         ^~~
| arch/arm64/kernel/cpufeature.c:3007:17: note: in expansion of macro 'ARM64_CPUID_FIELDS'
|  3007 |                 ARM64_CPUID_FIELDS(reg, field, min_value)
|       |                 ^~~~~~~~~~~~~~~~~~
| arch/arm64/kernel/cpufeature.c:3018:17: note: in expansion of macro 'HWCAP_CPUID_MATCH'
|  3018 |                 HWCAP_CPUID_MATCH(reg, field, min_value)                \
|       |                 ^~~~~~~~~~~~~~~~~
| arch/arm64/kernel/cpufeature.c:3184:9: note: in expansion of macro 'HWCAP_CAP'
|  3184 |         HWCAP_CAP(ID_AA64SMFR0_EL1, SF8MM4, IMP, CAP_HWCAP, KERNEL_HWCAP_SME_SF8MM4),
|       |         ^~~~~~~~~
| arch/arm64/kernel/cpufeature.c:3184:19: error: 'ID_AA64SMFR0_EL1_SF8MM4_IMP' undeclared here (not in a function); did you mean 'ID_AA64SMFR0_EL1_SF8DP4_IMP'?
|  3184 |         HWCAP_CAP(ID_AA64SMFR0_EL1, SF8MM4, IMP, CAP_HWCAP, KERNEL_HWCAP_SME_SF8MM4),
|       |                   ^~~~~~~~~~~~~~~~
| arch/arm64/kernel/cpufeature.c:157:36: note: in definition of macro '__ARM64_CPUID_FIELDS'
|   157 |                 .min_field_value = min_value,                           \
|       |                                    ^~~~~~~~~
| arch/arm64/kernel/cpufeature.c:169:30: note: in expansion of macro 'SYS_FIELD_VALUE'
|   169 |                              SYS_FIELD_VALUE(reg, field, min_value),    \
|       |                              ^~~~~~~~~~~~~~~
| arch/arm64/kernel/cpufeature.c:3007:17: note: in expansion of macro 'ARM64_CPUID_FIELDS'
|  3007 |                 ARM64_CPUID_FIELDS(reg, field, min_value)
|       |                 ^~~~~~~~~~~~~~~~~~
| arch/arm64/kernel/cpufeature.c:3018:17: note: in expansion of macro 'HWCAP_CPUID_MATCH'
|  3018 |                 HWCAP_CPUID_MATCH(reg, field, min_value)                \
|       |                 ^~~~~~~~~~~~~~~~~
| arch/arm64/kernel/cpufeature.c:3184:9: note: in expansion of macro 'HWCAP_CAP'
|  3184 |         HWCAP_CAP(ID_AA64SMFR0_EL1, SF8MM4, IMP, CAP_HWCAP, KERNEL_HWCAP_SME_SF8MM4),
|       |         ^~~~~~~~~
| make[4]: *** [scripts/Makefile.build:207: arch/arm64/kernel/cpufeature.o] Error 1
| make[3]: *** [scripts/Makefile.build:465: arch/arm64/kernel] Error 2
| make[2]: *** [scripts/Makefile.build:465: arch/arm64] Error 2
| make[1]: *** [/home/mark/src/linux/Makefile:1994: .] Error 2
| make: *** [Makefile:251: __sub-make] Error 2

Mark.


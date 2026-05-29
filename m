Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22995CD6E49
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 15:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WBiwHGCiw9Myhj8FPUiy6U6RW3ZRRMa5Jy4NrDV481I=; b=CR5LTT8gFhlxi3Gwh5jsvomxL9
	Xi2mjIvHxgbU56LpbPob1shUZJuC32kBWcugezL2DaN7rLp9CpZGUnar8YFtpf0R9Ml48uOUGizwh
	1bvqI3g+P6FHO8v1AnixJkP56tW8G1ESvoJ8bWW/KmrpjymdbnYR7INjROXyzcFIcvm3LVtECNDGn
	mpmHZk3kPBOvOeYNwLc0lGZNU6Z3yfCxgcJcqipl8T6G/NcImDLZfglgxv/Eff/vMAH5J4JwdTB5i
	e9wHKumjhT1Lx1jmsmed5qyS2DdfPOdPXVZrqexRw9pg7vTKa3drTCVxVv/qGllOJWtTYIGpaJdUA
	05CTPx+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSzWe-00000007kqM-2zoZ;
	Fri, 29 May 2026 15:53:32 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSzVz-00000007klB-2mjm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 15:52:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 26E871C00;
	Fri, 29 May 2026 08:52:43 -0700 (PDT)
Received: from [10.57.72.122] (unknown [10.57.72.122])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C90103F632;
	Fri, 29 May 2026 08:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780069968; bh=f/w7mTwYDvz8h8dLB6/Nyvab2IZrXvJ7DSVWZv6qDw0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LLC2hMgwutgd6K+xqM/uxPsGhSCS/soZiCxqIfE04gtLxtegLARgW1RajDDPBupBh
	 ci4eggq2O2nG11SgmnziepEExFQP6+e7aN/laxclU1da4gmY4QoUynfjBvhkOQPuWj
	 oUJWEvwhCuBAOLUHwspe9X7Wx58W1Hrd1CeyPaLU=
Message-ID: <f69417f3-485e-4255-b544-0b9f1a6b1ec1@arm.com>
Date: Fri, 29 May 2026 16:52:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BOOTWRAPPER PATCH v3 2/2] Add support for GICv5
To: Sascha Bischoff <Sascha.Bischoff@arm.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Cc: "maz@kernel.org" <maz@kernel.org>, Joey Gouly <Joey.Gouly@arm.com>,
 Mark Rutland <Mark.Rutland@arm.com>, nd <nd@arm.com>
References: <20260529095032.48951-1-vladimir.murzin@arm.com>
 <20260529095032.48951-3-vladimir.murzin@arm.com>
 <81e52eb94e26f8c7469d24ceb857890964c5383c.camel@arm.com>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <81e52eb94e26f8c7469d24ceb857890964c5383c.camel@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_085251_815194_DB458B70 
X-CRM114-Status: GOOD (  33.07  )
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

Hi Sascha,

On 5/29/26 16:34, Sascha Bischoff wrote:
> Hi Vladimir,
> 
> Thanks for the rapid turn-around. This is now looking good to me. I've
> tested things again and have confirmed that they're working for me.
> 
> One small thing to point out is that I got this when applying:
> 
> Applying: Add support for GICv5
> .git/rebase-apply/patch:203: new blank line at EOF.
> +
> warning: 1 line adds whitespace errors.
> 
> It looks like you have an extra newline, which must have been there
> previously too. Sorry for missing it. In either case, this looks to be
> in a good state now:
> 
> Reviewed-by: Sascha Bischoff <sascha.bischoff@arm.com>
> 

Thanks for your time!

> Thanks,
> Sascha
> 
> On Fri, 2026-05-29 at 10:50 +0100, Vladimir Murzin wrote:
>> Performs the minimal initialization required for GICv5 support. GICv5
>> support can be requested with --with-gic=v5.
>>
>> Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
>> Tested-by: Sascha Bischoff <sascha.bischoff@arm.com>
>> ---
>>  Makefile.am                    |   7 ++
>>  arch/aarch64/include/asm/cpu.h |  11 +++
>>  common/gic-v5.c                | 132
>> +++++++++++++++++++++++++++++++++
>>  configure.ac                   |   7 +-
>>  scripts/FDT.pm                 |  16 ++++
>>  scripts/findbase-by-regname.pl |  44 +++++++++++
>>  6 files changed, 214 insertions(+), 3 deletions(-)
>>  create mode 100644 common/gic-v5.c
>>  create mode 100755 scripts/findbase-by-regname.pl
>>
>> diff --git a/Makefile.am b/Makefile.am
>> index 2710494..aacd639 100644
>> --- a/Makefile.am
>> +++ b/Makefile.am
>> @@ -82,6 +82,13 @@ PSCI_NODE	:=
>>  CPU_NODES	:=
>>  endif
>>  
>> +if GICV5
>> +GIC_IRS_BASE	:= $(shell perl -I $(SCRIPT_DIR)
>> $(SCRIPT_DIR)/findbase-by-regname.pl $(KERNEL_DTB) "el3-config"
>> 'arm,gic-v5-irs')
>> +GIC_IWB_BASE	:= $(shell perl -I $(SCRIPT_DIR)
>> $(SCRIPT_DIR)/findbase.pl $(KERNEL_DTB) 0 'arm,gic-v5-iwb')
>> +DEFINES		+= -DGIC_IRS_BASE=$(GIC_IRS_BASE)
>> +DEFINES		+= -DGIC_IWB_BASE=$(GIC_IWB_BASE)
>> +endif
>> +
>>  if GICV3
>>  GIC_DIST_BASE	:= $(shell perl -I $(SCRIPT_DIR)
>> $(SCRIPT_DIR)/findbase.pl $(KERNEL_DTB) 0 'arm,gic-v3')
>>  GIC_RDIST_BASE	:= $(shell perl -I $(SCRIPT_DIR)
>> $(SCRIPT_DIR)/findbase.pl $(KERNEL_DTB) 1 'arm,gic-v3')
>> diff --git a/arch/aarch64/include/asm/cpu.h
>> b/arch/aarch64/include/asm/cpu.h
>> index ac50474..af4191c 100644
>> --- a/arch/aarch64/include/asm/cpu.h
>> +++ b/arch/aarch64/include/asm/cpu.h
>> @@ -128,6 +128,7 @@
>>  #define ID_AA64PFR1_EL1_THE		BITS(51, 48)
>>  
>>  #define ID_AA64PFR2_EL1			s3_0_c0_c4_2
>> +#define ID_AA64PFR2_EL1_GCIE		BITS(15, 12)
>>  #define ID_AA64PFR2_EL1_FPMR		BITS(35, 32)
>>  
>>  #define ID_AA64SMFR0_EL1		s3_0_c0_c4_5
>> @@ -169,6 +170,11 @@
>>  #define ICC_CTLR_EL3		S3_6_C12_C12_4
>>  #define ICC_PMR_EL1		S3_0_C4_C6_0
>>  
>> +#define ICC_PPI_DOMAINR0_EL3	S3_6_C12_C8_4
>> +#define ICC_PPI_DOMAINR1_EL3	S3_6_C12_C8_5
>> +#define ICC_PPI_DOMAINR2_EL3	S3_6_C12_C8_6
>> +#define ICC_PPI_DOMAINR3_EL3	S3_6_C12_C8_7
>> +
>>  #define VSTCR_EL2		s3_4_c2_c6_2
>>  #define VSCTLR_EL2		s3_4_c2_c0_0
>>  
>> @@ -245,6 +251,11 @@ static inline int has_gicv3_sysreg(void)
>>  	return !!mrs_field(ID_AA64PFR0_EL1, GIC);
>>  }
>>  
>> +static inline int has_gicv5_sysreg(void)
>> +{
>> +	return !!mrs_field(ID_AA64PFR2_EL1, GCIE);
>> +}
>> +
>>  #endif /* !__ASSEMBLY__ */
>>  
>>  #endif
>> diff --git a/common/gic-v5.c b/common/gic-v5.c
>> new file mode 100644
>> index 0000000..49b7b0e
>> --- /dev/null
>> +++ b/common/gic-v5.c
>> @@ -0,0 +1,132 @@
>> +/*
>> + * gic-v5.c
>> + *
>> + * Copyright (C) 2025 ARM Limited. All rights reserved.
>> + *
>> + * Use of this source code is governed by a BSD-style license that
>> can be
>> + * found in the LICENSE.txt file.
>> + */
>> +
>> +#include <stdint.h>
>> +
>> +#include <cpu.h>
>> +#include <gic.h>
>> +#include <asm/io.h>
>> +
>> +#define IWB_IDR0			0x0
>> +#define IWB_IDR0_IW_RANGE_SHIFT		0x0
>> +#define IWB_IDR0_IW_RANGE_MASK		0x7ff
>> +
>> +#define IWB_CR0				0x80
>> +#define IWB_CR0_IWBEN			(1 << 0)
>> +#define IWB_CR0_IDLE			(1 << 1)
>> +
>> +#define IWB_WENABLE_STATUSR		0xc0
>> +#define IWB_WENABLE_STATUSR_IDLE	(1 << 0)
>> +
>> +#define IWB_WDOMAIN_STATUSR		0xc4
>> +#define IWB_WDOMAIN_STATUSR_IDLE	(1 << 0)
>> +
>> +#define IWB_WENABLER			0x2000
>> +#define IWB_WDOMAINR			0x8000
>> +
>> +#define IRS_IDR6			0x0018
>> +#define IRS_IDR6_SPI_IRS_RANGE_MASK	0x1ffffff
>> +
>> +#define IRS_IDR7			0x001c
>> +#define IRS_IDR7_SPI_BASE_MASK		0xffffff
>> +
>> +#define IRS_SPI_SELR			0x108
>> +#define IRS_SPI_DOMAINR			0x10c
>> +
>> +#define IRS_SPI_STATUSR			0x0118
>> +#define IRS_SPI_STATUSR_IDLE		(1 << 0)
>> +
>> +static void gic_iwb_init(void) {
>> +	void *iwb_ptr = (void *)GIC_IWB_BASE;
>> +	unsigned int num;
>> +	unsigned int i;
>> +
>> +	/* Get number of implemented wire control registers */
>> +	num = ((raw_readl(iwb_ptr + IWB_IDR0) >>
>> IWB_IDR0_IW_RANGE_SHIFT) & IWB_IDR0_IW_RANGE_MASK) + 1;
>> +
>> +	/* Disable all wires */
>> +	for (i = 0; i < num; i++)
>> +		raw_writel(0, iwb_ptr + IWB_WENABLER + i * 4);
>> +
>> +	while (!(raw_readl(iwb_ptr + IWB_WENABLE_STATUSR) &
>> IWB_WENABLE_STATUSR_IDLE));
>> +
>> +	/* Assign all wires to Non-Secure domain */
>> +	for (i = 0; i < num * 2; i++)
>> +		raw_writel(0x55555555, iwb_ptr + IWB_WDOMAINR + i *
>> 4);
>> +
>> +	while (!(raw_readl(iwb_ptr + IWB_WDOMAIN_STATUSR) &
>> IWB_WDOMAIN_STATUSR_IDLE));
>> +
>> +	/* Enable IWB */
>> +	raw_writel(IWB_CR0_IWBEN, iwb_ptr + IWB_CR0);
>> +
>> +	while (!(raw_readl(iwb_ptr + IWB_CR0) & IWB_CR0_IDLE));
>> +}
>> +
>> +static void gic_irs_init(void) {
>> +	void *irs_ptr = (void *)GIC_IRS_BASE;
>> +	unsigned int range;
>> +	unsigned int base;
>> +	unsigned int i;
>> +
>> +	/* Get the range of implemented SPIs */
>> +	base = raw_readl(irs_ptr + IRS_IDR7) &
>> IRS_IDR7_SPI_BASE_MASK;
>> +	range = raw_readl(irs_ptr + IRS_IDR6) &
>> IRS_IDR6_SPI_IRS_RANGE_MASK;
>> +
>> +	for (i = base; i < base + range; i++) {
>> +		/* Select SPI */
>> +		raw_writel(i, irs_ptr + IRS_SPI_SELR);
>> +		while (!(raw_readl(irs_ptr + IRS_SPI_STATUSR) &
>> IRS_SPI_STATUSR_IDLE));
>> +
>> +		/* Assign SPI to Non-Secure domain */
>> +		raw_writel(1, irs_ptr + IRS_SPI_DOMAINR);
>> +		while (!(raw_readl(irs_ptr + IRS_SPI_STATUSR) &
>> IRS_SPI_STATUSR_IDLE));
>> +	}
>> +}
>> +
>> +static void gic_ppi_init(void) {
>> +	uint64_t val = 0;
>> +
>> +	val |= 1UL << (2 * 31); // Trace Buffer Unit
>> +	val |= 1UL << (2 * 30); // EL1 Physical Timer
>> +	val |= 1UL << (2 * 28); // Non-secure EL2 Virtual Timer
>> +	val |= 1UL << (2 * 27); // EL1 Virtual Timer
>> +	val |= 1UL << (2 * 26); // Non-secure EL2 Physical Timer
>> +	val |= 1UL << (2 * 25); // GIC maintenance interrupt
>> +	val |= 1UL << (2 * 24); // Generic CTI interrupt trigger
>> event
>> +	val |= 1UL << (2 * 23); // PMU overflow interrupt request
>> +	val |= 1UL << (2 * 22); // Debug communication channel
>> +	val |= 1UL << (2 * 21); // Profiling Buffer management
>> interrupt request
>> +	val |= 1UL << (2 * 15); // Hardware accelerator for cleaning
>> Dirty state interrupt
>> +	val |= 1UL << (2 * 3);  // Reserved for software usage
>> +
>> +	/* Assign PPI to Non-Secure domain */
>> +	msr(ICC_PPI_DOMAINR0_EL3, val);
>> +	isb();
>> +}
>> +
>> +void gic_secure_init(void)
>> +{
>> +	/*
>> +	 * If GICv5 is not available, skip initialisation. The OS
>> will probably
>> +	 * fail with a warning, but this should be easier to debug
>> than a
>> +	 * failure within the boot wrapper.
>> +	 */
>> +	if (!has_gicv5_sysreg())
>> +		return;
>> +
>> +	if (this_cpu_logical_id() == 0) {
>> +		gic_iwb_init();
>> +		gic_irs_init();
>> +	}
>> +
>> +	gic_ppi_init();
>> +
>> +	return;
>> +}
>> +

It is where new blank line has been lurking :) Fixed locally.

I'll wait some time before sending v4 in case someone wants to have
a look or give it a try ;)

Cheers
Vladimir



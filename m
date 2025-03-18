Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23AEAC28B28
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 10:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lg8LoqKtUOQ739XZEjBctrLRozivGbRQMx/pQxNulCA=; b=VwzfrkRM07wOI8RyCvz/yQn5nq
	EGyuT77BIoM/++rSGwmz55rU41OzF4CF7R1NQekVqunHO80qEhDPbBJ39L5vQtadW4lfSt3Apz0u9
	zvYQCj8MTNzKEBbg+s2Fj+tLXZBL3quXcpROOLRa/yaAHme9+Zquu22FeKZp5Xmu+ATgLbXfSK+NU
	GapFODRCTS8OUanKuwAAMnxs6RmVhB6uMz1RUAcVQG1GeaOpnTfQxuXjYAKWr81edRUH4sMKiQ9Lx
	N9F/5NWArp1ge7UUmtscktgM7kiFgNkWr1ioTOk2RmFgNwGKbMRtrX/wve/QfYUar/E8lD7AHEmzK
	IRURiHYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuUZR-00000005blX-0nK1;
	Tue, 18 Mar 2025 10:53:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuUUc-00000005b0O-35Vw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 10:48:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8BB0B13D5;
	Tue, 18 Mar 2025 03:48:26 -0700 (PDT)
Received: from [10.1.197.1] (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 431D63F63F;
	Tue, 18 Mar 2025 03:48:17 -0700 (PDT)
Message-ID: <15720521-7ee3-4945-a0bd-2b166682d4c9@arm.com>
Date: Tue, 18 Mar 2025 10:48:16 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm: coresight: Finish removal of Coresight support in
 arch/arm/kernel
To: James Clark <james.clark@linaro.org>,
 linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org
Cc: Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>
References: <20250210112927.623872-1-james.clark@linaro.org>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20250210112927.623872-1-james.clark@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_034818_867967_16771D9C 
X-CRM114-Status: GOOD (  20.49  )
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

On 10/02/2025 11:29, James Clark wrote:
> Commit 184901a06a36 ("ARM: removing support for etb/etm in
> "arch/arm/kernel/"") removed asm/hardware/coresight.h which is included
> by this file. Therefore this is dead code so delete it.
> 
> Signed-off-by: James Clark <james.clark@linaro.org>

Acked-by: Suzuki K Poulose <suzuki.poulose@arm.com>

> ---
>   arch/arm/include/asm/cti.h | 160 -------------------------------------
>   1 file changed, 160 deletions(-)
>   delete mode 100644 arch/arm/include/asm/cti.h
> 
> diff --git a/arch/arm/include/asm/cti.h b/arch/arm/include/asm/cti.h
> deleted file mode 100644
> index f8500e5d6ea8..000000000000
> --- a/arch/arm/include/asm/cti.h
> +++ /dev/null
> @@ -1,160 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> -#ifndef __ASMARM_CTI_H
> -#define __ASMARM_CTI_H
> -
> -#include	<asm/io.h>
> -#include	<asm/hardware/coresight.h>
> -
> -/* The registers' definition is from section 3.2 of
> - * Embedded Cross Trigger Revision: r0p0
> - */
> -#define		CTICONTROL		0x000
> -#define		CTISTATUS		0x004
> -#define		CTILOCK			0x008
> -#define		CTIPROTECTION		0x00C
> -#define		CTIINTACK		0x010
> -#define		CTIAPPSET		0x014
> -#define		CTIAPPCLEAR		0x018
> -#define		CTIAPPPULSE		0x01c
> -#define		CTIINEN			0x020
> -#define		CTIOUTEN		0x0A0
> -#define		CTITRIGINSTATUS		0x130
> -#define		CTITRIGOUTSTATUS	0x134
> -#define		CTICHINSTATUS		0x138
> -#define		CTICHOUTSTATUS		0x13c
> -#define		CTIPERIPHID0		0xFE0
> -#define		CTIPERIPHID1		0xFE4
> -#define		CTIPERIPHID2		0xFE8
> -#define		CTIPERIPHID3		0xFEC
> -#define		CTIPCELLID0		0xFF0
> -#define		CTIPCELLID1		0xFF4
> -#define		CTIPCELLID2		0xFF8
> -#define		CTIPCELLID3		0xFFC
> -
> -/* The below are from section 3.6.4 of
> - * CoreSight v1.0 Architecture Specification
> - */
> -#define		LOCKACCESS		0xFB0
> -#define		LOCKSTATUS		0xFB4
> -
> -/**
> - * struct cti - cross trigger interface struct
> - * @base: mapped virtual address for the cti base
> - * @irq: irq number for the cti
> - * @trig_out_for_irq: triger out number which will cause
> - *	the @irq happen
> - *
> - * cti struct used to operate cti registers.
> - */
> -struct cti {
> -	void __iomem *base;
> -	int irq;
> -	int trig_out_for_irq;
> -};
> -
> -/**
> - * cti_init - initialize the cti instance
> - * @cti: cti instance
> - * @base: mapped virtual address for the cti base
> - * @irq: irq number for the cti
> - * @trig_out: triger out number which will cause
> - *	the @irq happen
> - *
> - * called by machine code to pass the board dependent
> - * @base, @irq and @trig_out to cti.
> - */
> -static inline void cti_init(struct cti *cti,
> -	void __iomem *base, int irq, int trig_out)
> -{
> -	cti->base = base;
> -	cti->irq  = irq;
> -	cti->trig_out_for_irq = trig_out;
> -}
> -
> -/**
> - * cti_map_trigger - use the @chan to map @trig_in to @trig_out
> - * @cti: cti instance
> - * @trig_in: trigger in number
> - * @trig_out: trigger out number
> - * @channel: channel number
> - *
> - * This function maps one trigger in of @trig_in to one trigger
> - * out of @trig_out using the channel @chan.
> - */
> -static inline void cti_map_trigger(struct cti *cti,
> -	int trig_in, int trig_out, int chan)
> -{
> -	void __iomem *base = cti->base;
> -	unsigned long val;
> -
> -	val = __raw_readl(base + CTIINEN + trig_in * 4);
> -	val |= BIT(chan);
> -	__raw_writel(val, base + CTIINEN + trig_in * 4);
> -
> -	val = __raw_readl(base + CTIOUTEN + trig_out * 4);
> -	val |= BIT(chan);
> -	__raw_writel(val, base + CTIOUTEN + trig_out * 4);
> -}
> -
> -/**
> - * cti_enable - enable the cti module
> - * @cti: cti instance
> - *
> - * enable the cti module
> - */
> -static inline void cti_enable(struct cti *cti)
> -{
> -	__raw_writel(0x1, cti->base + CTICONTROL);
> -}
> -
> -/**
> - * cti_disable - disable the cti module
> - * @cti: cti instance
> - *
> - * enable the cti module
> - */
> -static inline void cti_disable(struct cti *cti)
> -{
> -	__raw_writel(0, cti->base + CTICONTROL);
> -}
> -
> -/**
> - * cti_irq_ack - clear the cti irq
> - * @cti: cti instance
> - *
> - * clear the cti irq
> - */
> -static inline void cti_irq_ack(struct cti *cti)
> -{
> -	void __iomem *base = cti->base;
> -	unsigned long val;
> -
> -	val = __raw_readl(base + CTIINTACK);
> -	val |= BIT(cti->trig_out_for_irq);
> -	__raw_writel(val, base + CTIINTACK);
> -}
> -
> -/**
> - * cti_unlock - unlock cti module
> - * @cti: cti instance
> - *
> - * unlock the cti module, or else any writes to the cti
> - * module is not allowed.
> - */
> -static inline void cti_unlock(struct cti *cti)
> -{
> -	__raw_writel(CS_LAR_KEY, cti->base + LOCKACCESS);
> -}
> -
> -/**
> - * cti_lock - lock cti module
> - * @cti: cti instance
> - *
> - * lock the cti module, so any writes to the cti
> - * module will be not allowed.
> - */
> -static inline void cti_lock(struct cti *cti)
> -{
> -	__raw_writel(~CS_LAR_KEY, cti->base + LOCKACCESS);
> -}
> -#endif



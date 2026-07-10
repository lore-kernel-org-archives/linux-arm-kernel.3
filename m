Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82EA3C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 06:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mUYNMbq0oNGD5yIDpErpVLCnkGGhJV4w/7T/OLo9HY8=; b=QXuaTPlXeulO/FO9Is5AH9Mo8J
	u14XNNZSHUQHJs+qhv/pPHNmSqheVE7ZXZHVA8SB+oUI9YmyjaVkFy/52xk5UsYjqNqyQ+lB1usRX
	niXPnUuhF7fMflMZN7WPIMhfc/6dz78O4NFBG1kIFkudsdGt60vfOj7C7sLrnrK3a11F5tWCjth/l
	wxuabOIRklL8x1jr5Oi03d1QZWnLFaGFU++K5t2kORKMJxChUTGOofGb6vK3N1LhHn68UH1YBg8cM
	B+88KpGD2WNqIZFvhuHO3jy3hz73aohYR3NolRTbkjsiLxOKthmLA2b73ezlyQ31jPCr4pv73lvOA
	dUhGIfgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi4rq-00000004HBW-0YJm;
	Fri, 10 Jul 2026 06:37:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi4rn-00000004HAl-2CP0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 06:37:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 88932168F;
	Thu,  9 Jul 2026 23:37:37 -0700 (PDT)
Received: from [10.174.42.251] (unknown [10.174.42.251])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1E76B3F66F;
	Thu,  9 Jul 2026 23:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783665461; bh=DvcgE2AI+oYci9aiT+oSIXc5m/0uljUESJ/kUwIL7Rc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GgjX0U5ADuLeUqFfFaF6opP4iZ82Mb09TzqfFUEt9HxxtMUYkhvg02dbbnuDoa/TF
	 wpnqfgYP6YbCfpg1nr34ihdZD5MfLpTnbG3ENpLnv5X855TgBkihbvRqJ1lcq/IM+x
	 lZpJv/5OpeVNCx/PsE+qW7iNpBmpT6vK+LfD2bw0=
Message-ID: <ddb34ff6-e9eb-43ae-86f0-bf49a355e5cf@arm.com>
Date: Fri, 10 Jul 2026 12:07:36 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] arm64: cputype: Add C1-Nano definitions
To: Linu Cherian <linu.cherian@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Ryan Roberts <ryan.roberts@arm.com>, Kevin Brodsky <kevin.brodsky@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260708144331.679816-1-linu.cherian@arm.com>
 <20260708144331.679816-3-linu.cherian@arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20260708144331.679816-3-linu.cherian@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_233743_606961_1C2CD863 
X-CRM114-Status: GOOD (  14.85  )
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



On 08/07/26 8:13 PM, Linu Cherian wrote:
> Add cputype definitions for C1-Nano.
> 
> The definition can be found in C1-Nano TRM,
> https://developer.arm.com/documentation/107753/0002
> as part of MIDR_EL1 bit descriptions.
> 
> This is going to be used in the bbml3 support list.
> 
> Signed-off-by: Linu Cherian <linu.cherian@arm.com>
> ---
>  arch/arm64/include/asm/cputype.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/include/asm/cputype.h b/arch/arm64/include/asm/cputype.h
> index e41fae46426b..1fa29616e586 100644
> --- a/arch/arm64/include/asm/cputype.h
> +++ b/arch/arm64/include/asm/cputype.h
> @@ -100,6 +100,7 @@
>  #define ARM_CPU_PART_CORTEX_A720AE	0xD89
>  #define ARM_CPU_PART_C1_ULTRA		0xD8C
>  #define ARM_CPU_PART_NEOVERSE_N3	0xD8E
> +#define ARM_CPU_PART_C1_NANO		0xD8A
>  #define ARM_CPU_PART_C1_PRO		0xD8B
>  #define ARM_CPU_PART_C1_PREMIUM		0xD90
>  
> @@ -195,6 +196,7 @@
>  #define MIDR_CORTEX_A720AE MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORTEX_A720AE)
>  #define MIDR_C1_ULTRA MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_C1_ULTRA)
>  #define MIDR_NEOVERSE_N3 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_NEOVERSE_N3)
> +#define MIDR_C1_NANO MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_C1_NANO)
>  #define MIDR_C1_PRO MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_C1_PRO)
>  #define MIDR_C1_PREMIUM MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_C1_PREMIUM)
>  #define MIDR_THUNDERX	MIDR_CPU_MODEL(ARM_CPU_IMP_CAVIUM, CAVIUM_CPU_PART_THUNDERX)

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>


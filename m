Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 396CBC43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 05:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q1eUh6axEL/L8/fsJaI5xbDPMBpF5OHDEBc1zLSIqSI=; b=sbmoYlDS4jU0lNB3XN7SBJfsHe
	FIjsu6wYjxl8v7FyuGIBlnTpMlnohelf9wkbHG4L644YhuiLBcMSbtrTuwkKhTF8qEGONTaT9MISL
	9WRCcznUqbVUV0Gsl+yVGq6ItZZ8spl7xlJnNEwW3J4QjvFWgbU9QWs52v0fGqstk5165HzIM2vIV
	RSmE21Cjse3IeE3Rgz2U5LlW8aVOFW/DYgraph+6A5rOOaLsA8+Y8vf30K6vouT3K9sAb2QkoZamp
	+0nZThRuIGdHyD/fLq+ixPxQyfXLvEotd615Y4NDfB9MU1wzkHV54og1qqMce+xsb0Hxepm/2HQWf
	4hMHeW1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfWAQ-000000063Ct-3eQq;
	Fri, 03 Jul 2026 05:10:22 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfWAL-000000063CI-3jFR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 05:10:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9725122D7;
	Thu,  2 Jul 2026 22:10:12 -0700 (PDT)
Received: from [10.163.170.216] (unknown [10.163.170.216])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 85A543F673;
	Thu,  2 Jul 2026 22:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783055417; bh=4XB1SQRtMhzH7Y3vbnI5tWzJG9PfjDjfBdugTPmYg30=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=vLi9+39+W6d95A7ed9v9SVPNWFu+YmilP+dpJ1XCIZNd50qCspynISZTpEWWZh0zk
	 tMpUMDaVzZDfczo+1x+9eP+4620RfgfIhl5C2P5Bct9TZ16SWAzh303GNRolnKJnX1
	 PXzLUdq2x+yKevrJDcKLhE6JFGspvBEnGkLfQT4U=
Message-ID: <e155f25b-fe7b-4432-8615-126e71d2543a@arm.com>
Date: Fri, 3 Jul 2026 10:40:11 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] arm64: cputype: Add C1-Nano definitions
To: Linu Cherian <linu.cherian@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Ryan Roberts <ryan.roberts@arm.com>, Kevin Brodsky <kevin.brodsky@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260701094131.677636-1-linu.cherian@arm.com>
 <20260701094131.677636-5-linu.cherian@arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20260701094131.677636-5-linu.cherian@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_221019_408649_526D0377 
X-CRM114-Status: GOOD (  14.64  )
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

On 01/07/26 3:11 PM, Linu Cherian wrote:
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

Part number checks out in the TRM.
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



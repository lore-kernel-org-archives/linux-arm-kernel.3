Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCA5BC43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 05:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vBy2hk1X2SuJlwu/XPYC319GTebhFR5gYpjhRWYZcxA=; b=eF4hCSxCjDq31RHPd2M+pLfDoG
	TVPxsA5E+vNmZx54wFFfTFSjx5Jg8GkZBDpPx4i2x5aBadcYGmydHGIHmy/vKvEtulXuCr0/ek936
	Hphp4VnwFEK30sGQjUgL8HOjgGPjy22XbhisoCRr+j1JWytg+fyQHMiPk3kqMrUdgKdCqxqyFrPSq
	YneEjcvgfJJxqiFySK8Hyy6p4XO5LhV/O6ITkj7qBCLHmhpoKHTqF3fzfe4LowAuR3N9VStZLUSJI
	PAKS8IdkdsG5zYSH8UEj3y7DGcrxh0F6Y1teEs2qu7iBrKHsnpvWWlT3BVSihBvvL7AuGmWhE7xOh
	DIElcoRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfW7x-0000000636h-2KiR;
	Fri, 03 Jul 2026 05:07:49 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfW7u-0000000636E-1gLk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 05:07:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D317822D7;
	Thu,  2 Jul 2026 22:07:39 -0700 (PDT)
Received: from [10.163.170.216] (unknown [10.163.170.216])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A3B3E3F673;
	Thu,  2 Jul 2026 22:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783055264; bh=k9XiWI3TNK/R0dGu8CwvcUGF91gLpaB5UfgbTRX11A8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NU67JIiOkURmkAc5eZhwVSMA+S/yr+//BgY44DII8lQWoIgLo+6wP/ShBlyl/6b2y
	 5h1ZDjGjA/2XkZy5i2Uh6e/jXLCSr4dd0uG7OtHQQjb52qPH/8m0p4nWhHsLaF+Nvx
	 QlWooe+RVHL5vXfwVzMq1aWef+RIbZNFefWIhAC4=
Message-ID: <e9ab2cc0-0b01-459b-9bdf-8f2b825256ce@arm.com>
Date: Fri, 3 Jul 2026 10:37:38 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] arm64: cputype: Add Cortex-A520AE definitions
To: Linu Cherian <linu.cherian@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Ryan Roberts <ryan.roberts@arm.com>, Kevin Brodsky <kevin.brodsky@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260701094131.677636-1-linu.cherian@arm.com>
 <20260701094131.677636-4-linu.cherian@arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20260701094131.677636-4-linu.cherian@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_220746_512147_1C1105EE 
X-CRM114-Status: GOOD (  14.73  )
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
> Add cputype definitions for Cortex-A520AE.
> 
> The definition can be found in Cortex-A520AE TRM,
> https://developer.arm.com/documentation/107726/0001/
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
> index 1b9f0cda1336..e41fae46426b 100644
> --- a/arch/arm64/include/asm/cputype.h
> +++ b/arch/arm64/include/asm/cputype.h
> @@ -82,6 +82,7 @@
>  #define ARM_CPU_PART_CORTEX_X1		0xD44
>  #define ARM_CPU_PART_CORTEX_A510	0xD46
>  #define ARM_CPU_PART_CORTEX_A520	0xD80
> +#define ARM_CPU_PART_CORTEX_A520AE	0xD88

Part number checks out in the TRM
>  #define ARM_CPU_PART_CORTEX_A710	0xD47
>  #define ARM_CPU_PART_CORTEX_A715	0xD4D
>  #define ARM_CPU_PART_CORTEX_X2		0xD48
> @@ -176,6 +177,7 @@
>  #define MIDR_CORTEX_X1	MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORTEX_X1)
>  #define MIDR_CORTEX_A510 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORTEX_A510)
>  #define MIDR_CORTEX_A520 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORTEX_A520)
> +#define MIDR_CORTEX_A520AE MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORTEX_A520AE)
>  #define MIDR_CORTEX_A710 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORTEX_A710)
>  #define MIDR_CORTEX_A715 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORTEX_A715)
>  #define MIDR_CORTEX_X2 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORTEX_X2)

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>


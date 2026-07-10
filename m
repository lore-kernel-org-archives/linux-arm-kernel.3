Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F85FC43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 06:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xGceCeNLO3k2SUgQZfzBCpnEY1G7MB/07KVha4Owe9Q=; b=UFNEsbHAknZ4U7nM3gGUYJWo05
	ZS7bGepXzhdCQYPoi7rBeV9GalEZEvcSQy4gJ0vm0mkp6HVI402m7q5ia63ItW5xVKdzmwLdEc+8g
	KVQ4fFv1IultLFdOfA5rx9N4oaFqNA5hwPyQ8H8tRBADdlmC9HbEeywTfXvBu0JqZVAMX5wpS9QkN
	NfjejEP4iQr6nbpbiE8t8/FGL+RS7tYW6fBlyuo8Vw0TY2CItloOU4NBJbpO7PqJPAAjldPHxcSMh
	zppNnekRIc33X35f3scDuShMgt3zarmc2/imFzSpoHQIcBpb2uK9WV9GRU3sY5y/1YUKkCenqwf/P
	MrtiNBYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi4rO-00000004H3f-3tMH;
	Fri, 10 Jul 2026 06:37:18 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi4rM-00000004H3F-3Dcl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 06:37:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6ED7D168F;
	Thu,  9 Jul 2026 23:37:11 -0700 (PDT)
Received: from [10.174.42.251] (unknown [10.174.42.251])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DC5563F66F;
	Thu,  9 Jul 2026 23:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783665435; bh=/zKyv+msrbfJ3fiX/4tO4JJVUdgC29fJ+C78w2qqgJM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TjABRsuySFp6zdh8eFUea58VWg0eEBKR3x2Syp15M7bDIUbhcSs3rP6c2JkYC2wvO
	 71WFTNQ95ERHwdkeSzDH00QRhiAqLYfsQD5ha1YOgHvtNAViCIxxJH3joqzNRh5ZV3
	 Fmz9BT8RmNrR2O9m2ubghzzax7qIPgYWsms+v8gA=
Message-ID: <0c34971d-7243-4e29-9bf7-aa36707b207e@arm.com>
Date: Fri, 10 Jul 2026 12:07:09 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] arm64: cputype: Add Cortex-A520AE definitions
To: Linu Cherian <linu.cherian@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Ryan Roberts <ryan.roberts@arm.com>, Kevin Brodsky <kevin.brodsky@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260708144331.679816-1-linu.cherian@arm.com>
 <20260708144331.679816-2-linu.cherian@arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20260708144331.679816-2-linu.cherian@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_233716_909886_AB302B49 
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


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CED7C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 14:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VIQCToQafoXpGkuQvU5LDxZBqxRfSQuLre/6EFRkE5Q=; b=RuGOXQ31v1qgy3EmUDINLIkatI
	REmSoER64WHN6w3U7ny0vVh0u2Cav7bQOH/Bmm23dq1qYpWF7NHw+BJ8HggOh1d4vn6CzwQq+ap6F
	S6nGnQCs4h0aCttNyepCFhSqTAYtqhfYg3VfzCJ0K1EY3/d/433xvEkmLipvhcfTiv+9NJm9t/JU2
	tNbofehIbZ6I6ob5vjuJ9K60re2mzm8wJZ7ipCqZM3p7M9uZnwN+aluc4DVrbCweYMbpvtCXLJJ/v
	ki+8A4MOes6qh6g/4qWnQXYuYOWwEcQnreN/sk+g2SPrUkLKyoA67yQI3gq5XCCtcj4vJvxrPajAV
	KQyS3yeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whTf8-0000000HP7B-1nms;
	Wed, 08 Jul 2026 14:54:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whTf4-0000000HP4V-239A
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 14:54:07 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6498A1CDD;
	Wed,  8 Jul 2026 07:53:58 -0700 (PDT)
Received: from [10.57.40.57] (unknown [10.57.40.57])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 485F93F7B4;
	Wed,  8 Jul 2026 07:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783522442; bh=AcjH9SdpY3q8KEK0I3lS3ZGt8lxh8eDzLRv5cCg3MxE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JvCChG4OSuivC3Xf/PYguCGP8vc6OJahpyxXERigM45LIuL7Uu9uHfybLD+9UnzB+
	 F3p4XuN70nj9yuaFRH9l3gaLgCJL/2QrKzbgAQC/as628RQD5wcochQ6Vu1HZIi2y+
	 5WoQArH696XYwtqTAdcev+FOYFLD55HAt2iD98Ug=
Message-ID: <eab6908e-d897-4fd0-9626-ef2e0b553cc2@arm.com>
Date: Wed, 8 Jul 2026 15:53:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] arm64: cpufeature: Extend bbml2_noabort support
 list
Content-Language: en-GB
To: Linu Cherian <linu.cherian@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Ryan Roberts <ryan.roberts@arm.com>, Kevin Brodsky <kevin.brodsky@arm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260708144331.679816-1-linu.cherian@arm.com>
 <20260708144331.679816-4-linu.cherian@arm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20260708144331.679816-4-linu.cherian@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_075406_602056_A2F76278 
X-CRM114-Status: GOOD (  15.17  )
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

On 08/07/2026 15:43, Linu Cherian wrote:
> Add below cpus to the midr list, which supports
> BBML2_NOABORT.
> 
> Cortex A520(AE)
> Cortex A715
> Cortex A720(AE)
> Cortex A725
> Neoverse N3
> C1-Nano
> C1-Pro
> C1-Ultra
> C1-Premium
> 
> C1-Ultra and C1-Premium both suffer from erratum 3683289,
> where Break-Before-Make must be followed to avoid a livelock.
> For both CPUs, the erratum is fixed from r1p1.
> Hence we do not enable BBML2_NOABORT for CPU revisions <= r1p0.

Please could you also update the list of errata here :

Documentation/arch/arm64/silicon-errata.rst

> 
> The relevant SDENs are:
> * C1-Ultra: https://developer.arm.com/documentation/111077/9-00/
> * C1-Premium: https://developer.arm.com/documentation/111078/9-00/
> 
> Signed-off-by: Linu Cherian <linu.cherian@arm.com>
> ---
>   arch/arm64/kernel/cpufeature.c | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
> index 9a22df0c5120..adcabea80fcb 100644
> --- a/arch/arm64/kernel/cpufeature.c
> +++ b/arch/arm64/kernel/cpufeature.c
> @@ -2152,6 +2152,15 @@ bool cpu_supports_bbml2_noabort(void)
>   		MIDR_ALL_VERSIONS(MIDR_NVIDIA_OLYMPUS),
>   		MIDR_ALL_VERSIONS(MIDR_AMPERE1),
>   		MIDR_ALL_VERSIONS(MIDR_AMPERE1A),
> +		MIDR_ALL_VERSIONS(MIDR_CORTEX_A520AE),
> +		MIDR_ALL_VERSIONS(MIDR_CORTEX_A715),
> +		MIDR_ALL_VERSIONS(MIDR_CORTEX_A720AE),
> +		MIDR_ALL_VERSIONS(MIDR_CORTEX_A725),
> +		MIDR_ALL_VERSIONS(MIDR_NEOVERSE_N3),
> +		MIDR_ALL_VERSIONS(MIDR_C1_NANO),
> +		MIDR_ALL_VERSIONS(MIDR_C1_PRO),

And mention it here, so that it is evident from the code alone ?

> +		MIDR_REV_RANGE(MIDR_C1_ULTRA, 1, 1, 0xf),
> +		MIDR_REV_RANGE(MIDR_C1_PREMIUM, 1, 1, 0xf),


Suzuki


>   		{}
>   	};
>   



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89B93C4450A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 06:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ybH6iy/jmMklY3ZOKz98OawUvoJ0wyl2XX2l5/80kMg=; b=dfabrlvP0yKBcS+vr74EgKVBqU
	DN/xm9yqEZpMacAqrby5hkdtt1xwadlR/gPcWsnjD+qeIAqPZpBIWuyccSCn6F+DAZ37spwhy4BPu
	c14zpUkzpmIOJv8MAir/Ci7PMeaviRnY2/vsvBIY04ULKyqaoIM+WEOsaHn3hG1TDU5mpwRnwm6n2
	mq47tlhH8wz0qMH257VeCaE5375anbqzlHKrebbvLZf7nOpDUAorrlMIRaeME/L5vgzoIBZ+E9+TG
	8GYhVj7rrf7blj8p1Pkc97zqJWEVmOxe2E92e8nJysCt2JASap5XJtC7tNXVvlXiCuuNrAm/28jDN
	wXr6hytQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjslN-0000000Dqsw-3yDp;
	Wed, 15 Jul 2026 06:06:33 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjslL-0000000Dqrx-0bjZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 06:06:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 521FC339;
	Tue, 14 Jul 2026 23:06:25 -0700 (PDT)
Received: from [10.164.18.40] (unknown [10.164.18.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 224E33F7D8;
	Tue, 14 Jul 2026 23:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784095589; bh=FU/fTrfu1x2zOXnH4TjfbCrXQEQPIF0X3YJyDBMbC80=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LeOVttFSDZP9fMDZlB5HQo9yMLmX9mSD2gfJgnokZeszD4MBB42fTVxKcD7LZaz9m
	 MeELTkQgOYh9xLjmsPjw3c3JzwN1RQUbPLP4LpzRptryNuwVLlRv1JYI/20meo5jW6
	 qN78exzpy/HMhms7cV90yKi4qIHNG1QEjEoKH/EI=
Message-ID: <0fe2d985-3ba4-47b1-beb2-02c8d2e4a4d5@arm.com>
Date: Wed, 15 Jul 2026 11:36:24 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/6] arm64: cpufeature: Extend bbml2_noabort support
 list
To: Linu Cherian <linu.cherian@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Ryan Roberts <ryan.roberts@arm.com>, Kevin Brodsky <kevin.brodsky@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260715053408.1950475-1-linu.cherian@arm.com>
 <20260715053408.1950475-4-linu.cherian@arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20260715053408.1950475-4-linu.cherian@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_230631_274866_CF5E1877 
X-CRM114-Status: GOOD (  13.94  )
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



On 15/07/26 11:04 AM, Linu Cherian wrote:
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
> 
> The relevant SDENs are:
> * C1-Ultra: https://developer.arm.com/documentation/111077/9-00/
> * C1-Premium: https://developer.arm.com/documentation/111078/9-00/
> 
> Signed-off-by: Linu Cherian <linu.cherian@arm.com>
> ---
>  Documentation/arch/arm64/silicon-errata.rst |  4 ++++
>  arch/arm64/kernel/cpufeature.c              | 10 ++++++++++
>  2 files changed, 14 insertions(+)
> 
> diff --git a/Documentation/arch/arm64/silicon-errata.rst b/Documentation/arch/arm64/silicon-errata.rst
> index 014aa1c215a1..57c778446936 100644
> --- a/Documentation/arch/arm64/silicon-errata.rst
> +++ b/Documentation/arch/arm64/silicon-errata.rst
> @@ -242,10 +242,14 @@ stable kernels.
>  +----------------+-----------------+-----------------+-----------------------------+
>  | ARM            | Neoverse-V3AE   | #4193784        | ARM64_ERRATUM_4118414       |
>  +----------------+-----------------+-----------------+-----------------------------+
> +| ARM            | C1-Premium      | #3683289        | N/A                         |
> ++----------------+-----------------+-----------------+-----------------------------+
>  | ARM            | C1-Premium      | #4193780        | ARM64_ERRATUM_4118414       |
>  +----------------+-----------------+-----------------+-----------------------------+
>  | ARM            | C1-Pro          | #4193714        | ARM64_ERRATUM_4193714       |
>  +----------------+-----------------+-----------------+-----------------------------+
> +| ARM            | C1-Ultra        | #3683289        | N/A                         |
> ++----------------+-----------------+-----------------+-----------------------------+
>  | ARM            | C1-Ultra        | #4193780        | ARM64_ERRATUM_4118414       |
>  +----------------+-----------------+-----------------+-----------------------------+
>  | ARM            | MMU-500         | #562869,        | ARM_SMMU_MMU_500_CPRE_ERRATA|
> diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
> index 9a22df0c5120..1b804b6c4fe0 100644
> --- a/arch/arm64/kernel/cpufeature.c
> +++ b/arch/arm64/kernel/cpufeature.c
> @@ -2152,6 +2152,16 @@ bool cpu_supports_bbml2_noabort(void)
>  		MIDR_ALL_VERSIONS(MIDR_NVIDIA_OLYMPUS),
>  		MIDR_ALL_VERSIONS(MIDR_AMPERE1),
>  		MIDR_ALL_VERSIONS(MIDR_AMPERE1A),
> +		MIDR_ALL_VERSIONS(MIDR_CORTEX_A520AE),
> +		MIDR_ALL_VERSIONS(MIDR_CORTEX_A715),
> +		MIDR_ALL_VERSIONS(MIDR_CORTEX_A720AE),
> +		MIDR_ALL_VERSIONS(MIDR_CORTEX_A725),
> +		MIDR_ALL_VERSIONS(MIDR_NEOVERSE_N3),
> +		MIDR_ALL_VERSIONS(MIDR_C1_NANO),
> +		MIDR_ALL_VERSIONS(MIDR_C1_PRO),
> +		/* Erratum 3683289 fixed in r1p1 */
> +		MIDR_REV_RANGE(MIDR_C1_ULTRA, 1, 1, 0xf),
> +		MIDR_REV_RANGE(MIDR_C1_PREMIUM, 1, 1, 0xf),
>  		{}
>  	};
> 

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 551F5CA1009
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 08:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=edx4+FJnnd5hSSVQbCAZvYcoc4d8akKqCYi6kJbh5UQ=; b=PAT+S04PSJjTalViiF1Zb5M1Ti
	NIFeyqTXKyy/zAeYe4K4pEL2HtyMbetYidHzagPHmyZbLFyAORwsMqNQgklIyYGZsQXUqm4dSTerU
	PL5dYoRfK1caA3qS+JsI9GpLX2Vx7Sc+wRYXdgBbRZ1R6Y7TUvu6eVfJWBQ9V8jnIXGKe+FEA42ZY
	6Vi+7ozavMf6avnX52GAwSyRwMReJzdq5+OkpMaAYAF7pQUq5W2G6bte8vQzylwSFILgbvmzt9V3z
	ESNc4GuYWTVU/a6uswY/6/jjHOu79feoojZwwweXDUTURUaKGzOCpU3KYJl36hngvsl5FBzfZ07DR
	Z88RGPXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utMhj-0000000GAex-3Ywv;
	Tue, 02 Sep 2025 08:49:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utMIn-0000000G1ox-1ck4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 08:23:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1B6D82720;
	Tue,  2 Sep 2025 01:23:29 -0700 (PDT)
Received: from [10.57.4.221] (unknown [10.57.4.221])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5EA903F6A8;
	Tue,  2 Sep 2025 01:23:35 -0700 (PDT)
Message-ID: <e823610a-e145-4627-9968-6d2dcc873184@arm.com>
Date: Tue, 2 Sep 2025 09:23:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] arm64: cpucaps: Add GICv5 Legacy vCPU interface
 (GCIE_LEGACY) capability
Content-Language: en-GB
To: Sascha Bischoff <Sascha.Bischoff@arm.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>
Cc: nd <nd@arm.com>, "maz@kernel.org" <maz@kernel.org>,
 "oliver.upton@linux.dev" <oliver.upton@linux.dev>,
 Joey Gouly <Joey.Gouly@arm.com>, "yuzenghui@huawei.com"
 <yuzenghui@huawei.com>, "will@kernel.org" <will@kernel.org>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "lpieralisi@kernel.org" <lpieralisi@kernel.org>,
 Timothy Hayes <Timothy.Hayes@arm.com>
References: <20250828105925.3865158-1-sascha.bischoff@arm.com>
 <20250828105925.3865158-4-sascha.bischoff@arm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20250828105925.3865158-4-sascha.bischoff@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_012341_473255_935D52BC 
X-CRM114-Status: GOOD (  18.90  )
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

On 28/08/2025 11:59, Sascha Bischoff wrote:
> Implement the GCIE_LEGACY capability as a system feature to be able to
> check for support from KVM. The type is explicitly
> ARM64_CPUCAP_EARLY_LOCAL_CPU_FEATURE, which means that the capability
> is enabled early if all boot CPUs support it. Additionally, if this
> capability is enabled during boot, it prevents late onlining of CPUs
> that lack it, thereby avoiding potential mismatched configurations
> which would break KVM.
> 
> Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>


> ---
>   arch/arm64/kernel/cpufeature.c | 15 +++++++++++++++
>   arch/arm64/tools/cpucaps       |  1 +
>   2 files changed, 16 insertions(+)
> 
> diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
> index 9ad065f15f1d..afb3b10afd75 100644
> --- a/arch/arm64/kernel/cpufeature.c
> +++ b/arch/arm64/kernel/cpufeature.c
> @@ -2520,6 +2520,15 @@ test_has_mpam_hcr(const struct arm64_cpu_capabilities *entry, int scope)
>   	return idr & MPAMIDR_EL1_HAS_HCR;
>   }
>   
> +static bool
> +test_has_gicv5_legacy(const struct arm64_cpu_capabilities *entry, int scope)
> +{
> +	if (!this_cpu_has_cap(ARM64_HAS_GICV5_CPUIF))
> +		return false;
> +
> +	return !!(read_sysreg_s(SYS_ICC_IDR0_EL1) & ICC_IDR0_EL1_GCIE_LEGACY);
> +}
> +
>   static const struct arm64_cpu_capabilities arm64_features[] = {
>   	{
>   		.capability = ARM64_ALWAYS_BOOT,
> @@ -3131,6 +3140,12 @@ static const struct arm64_cpu_capabilities arm64_features[] = {
>   		.matches = has_cpuid_feature,
>   		ARM64_CPUID_FIELDS(ID_AA64PFR2_EL1, GCIE, IMP)
>   	},
> +	{
> +		.desc = "GICv5 Legacy vCPU interface",
> +		.type = ARM64_CPUCAP_EARLY_LOCAL_CPU_FEATURE,

This is the right type for the capability intended, running the test on 
each boot time CPUs and setting the cap accordingly.

Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>




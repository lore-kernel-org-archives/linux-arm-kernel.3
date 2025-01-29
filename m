Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 110B6C0218D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jan 2025 16:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ay1zb3j/Qz2cEEUXSB9OIn4Z57/5hqlOinLRV0wNa64=; b=kmxO2UAxlppDJcPjS8ieeQ1MYM
	tizL1AbUwoHE6XdqLLwOIpT6cBXE/AjlllOEz6O1l0bANy7FUoB0NUtqq+/Tn3Iql95AmzhtzIgp0
	DgLKceX1odlIRHa2MpnkNXa/0dBikSc/c59mOHbMsRLagh3GEgG8eL/cFHTIqo+9/vlAzhbunBhoo
	ZyP490S6k2qyOkVtU31S4Jxk2Xg6sqzVERQUnSQr7NcZ6iCwIdkiANixf7AGLURY1j1lZFXvKC520
	CrZEemAcuhxZIJXr2iqelc+VI/MxxR+2q/VnEcAZNYFW2FXyQMIC2Do2tgsHHjI2z/gwknyctr6Tj
	Jgfae1+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdBBW-00000007Pax-3mnA;
	Wed, 29 Jan 2025 16:45:02 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdBAD-00000007PO8-0nyx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jan 2025 16:43:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9F175497;
	Wed, 29 Jan 2025 08:44:04 -0800 (PST)
Received: from [10.1.196.57] (eglon.cambridge.arm.com [10.1.196.57])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2AD2A3F63F;
	Wed, 29 Jan 2025 08:43:36 -0800 (PST)
Message-ID: <e6820d63-a8da-4ebb-b078-741ab3fcd262@arm.com>
Date: Wed, 29 Jan 2025 16:43:26 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/5] arm64: errata: Assume that unknown CPUs _are_
 vulnerable to Spectre BHB
To: Douglas Anderson <dianders@chromium.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>
Cc: Roxana Bradescu <roxabee@google.com>, Julius Werner
 <jwerner@chromium.org>, bjorn.andersson@oss.qualcomm.com,
 Trilok Soni <quic_tsoni@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 linux-arm-kernel@lists.infradead.org, Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Scott Bauer <sbauer@quicinc.com>, stable@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250107200715.422172-1-dianders@chromium.org>
 <20250107120555.v4.2.I2040fa004dafe196243f67ebcc647cbedbb516e6@changeid>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <20250107120555.v4.2.I2040fa004dafe196243f67ebcc647cbedbb516e6@changeid>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250129_084341_360316_60A079D5 
X-CRM114-Status: GOOD (  39.00  )
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

Hi Doug,

On 07/01/2025 20:05, Douglas Anderson wrote:
> The code for detecting CPUs that are vulnerable to Spectre BHB was
> based on a hardcoded list of CPU IDs that were known to be affected.
> Unfortunately, the list mostly only contained the IDs of standard ARM
> cores. The IDs for many cores that are minor variants of the standard
> ARM cores (like many Qualcomm Kyro CPUs) weren't listed. This led the
> code to assume that those variants were not affected.
> 
> Flip the code on its head and instead assume that a core is vulnerable
> if it doesn't have CSV2_3 but is unrecognized as being safe. This
> involves creating a "Spectre BHB safe" list.
> 
> As of right now, the only CPU IDs added to the "Spectre BHB safe" list
> are ARM Cortex A35, A53, A55, A510, and A520. This list was created by
> looking for cores that weren't listed in ARM's list [1] as per review
> feedback on v2 of this patch [2]. Additionally Brahma A53 is added as
> per mailing list feedback [3].
> 
> NOTE: this patch will not actually _mitigate_ anyone, it will simply
> cause them to report themselves as vulnerable. If any cores in the
> system are reported as vulnerable but not mitigated then the whole
> system will be reported as vulnerable though the system will attempt
> to mitigate with the information it has about the known cores.

> arch/arm64/include/asm/spectre.h |   1 -
> arch/arm64/kernel/proton-pack.c  | 203 ++++++++++++++++---------------
> 2 files changed, 102 insertions(+), 102 deletions(-)

This is a pretty hefty diff-stat for adding a list of six CPUs. It looks like there are
multiple things going on here: I think you're adding the 'safe' list of CPUs, then
removing the list of firmware-mitigated list, then removing some indentation to do the
mitigation detection differently. Any chance this can be split up?
(I'm not sure about the last chunk - it breaks automatic backporting)


> diff --git a/arch/arm64/kernel/proton-pack.c b/arch/arm64/kernel/proton-pack.c
> index e149efadff20..17aa836fe46d 100644
> --- a/arch/arm64/kernel/proton-pack.c
> +++ b/arch/arm64/kernel/proton-pack.c


> +static u8 spectre_bhb_loop_affected(void)
>  {
>  	u8 k = 0;
> -	static u8 max_bhb_k;
> -
> -	if (scope == SCOPE_LOCAL_CPU) {
> -		static const struct midr_range spectre_bhb_k32_list[] = {
> -			MIDR_ALL_VERSIONS(MIDR_CORTEX_A78),
> -			MIDR_ALL_VERSIONS(MIDR_CORTEX_A78AE),
> -			MIDR_ALL_VERSIONS(MIDR_CORTEX_A78C),
> -			MIDR_ALL_VERSIONS(MIDR_CORTEX_X1),
> -			MIDR_ALL_VERSIONS(MIDR_CORTEX_A710),
> -			MIDR_ALL_VERSIONS(MIDR_CORTEX_X2),
> -			MIDR_ALL_VERSIONS(MIDR_NEOVERSE_N2),
> -			MIDR_ALL_VERSIONS(MIDR_NEOVERSE_V1),
> -			{},
> -		};
> -		static const struct midr_range spectre_bhb_k24_list[] = {
> -			MIDR_ALL_VERSIONS(MIDR_CORTEX_A76),
> -			MIDR_ALL_VERSIONS(MIDR_CORTEX_A77),
> -			MIDR_ALL_VERSIONS(MIDR_NEOVERSE_N1),
> -			MIDR_ALL_VERSIONS(MIDR_QCOM_KRYO_4XX_GOLD),
> -			{},
> -		};
> -		static const struct midr_range spectre_bhb_k11_list[] = {
> -			MIDR_ALL_VERSIONS(MIDR_AMPERE1),
> -			{},
> -		};
> -		static const struct midr_range spectre_bhb_k8_list[] = {
> -			MIDR_ALL_VERSIONS(MIDR_CORTEX_A72),
> -			MIDR_ALL_VERSIONS(MIDR_CORTEX_A57),
> -			{},
> -		};
> -
> -		if (is_midr_in_range_list(read_cpuid_id(), spectre_bhb_k32_list))
> -			k = 32;
> -		else if (is_midr_in_range_list(read_cpuid_id(), spectre_bhb_k24_list))
> -			k = 24;
> -		else if (is_midr_in_range_list(read_cpuid_id(), spectre_bhb_k11_list))
> -			k = 11;
> -		else if (is_midr_in_range_list(read_cpuid_id(), spectre_bhb_k8_list))
> -			k =  8;
> -
> -		max_bhb_k = max(max_bhb_k, k);
> -	} else {
> -		k = max_bhb_k;
> -	}
> +
> +	static const struct midr_range spectre_bhb_k32_list[] = {
> +		MIDR_ALL_VERSIONS(MIDR_CORTEX_A78),
> +		MIDR_ALL_VERSIONS(MIDR_CORTEX_A78AE),
> +		MIDR_ALL_VERSIONS(MIDR_CORTEX_A78C),
> +		MIDR_ALL_VERSIONS(MIDR_CORTEX_X1),
> +		MIDR_ALL_VERSIONS(MIDR_CORTEX_A710),
> +		MIDR_ALL_VERSIONS(MIDR_CORTEX_X2),
> +		MIDR_ALL_VERSIONS(MIDR_NEOVERSE_N2),
> +		MIDR_ALL_VERSIONS(MIDR_NEOVERSE_V1),
> +		{},
> +	};
> +	static const struct midr_range spectre_bhb_k24_list[] = {
> +		MIDR_ALL_VERSIONS(MIDR_CORTEX_A76),
> +		MIDR_ALL_VERSIONS(MIDR_CORTEX_A77),
> +		MIDR_ALL_VERSIONS(MIDR_NEOVERSE_N1),
> +		MIDR_ALL_VERSIONS(MIDR_QCOM_KRYO_4XX_GOLD),
> +		{},
> +	};
> +	static const struct midr_range spectre_bhb_k11_list[] = {
> +		MIDR_ALL_VERSIONS(MIDR_AMPERE1),
> +		{},
> +	};
> +	static const struct midr_range spectre_bhb_k8_list[] = {
> +		MIDR_ALL_VERSIONS(MIDR_CORTEX_A72),
> +		MIDR_ALL_VERSIONS(MIDR_CORTEX_A57),
> +		{},
> +	};
> +
> +	if (is_midr_in_range_list(read_cpuid_id(), spectre_bhb_k32_list))
> +		k = 32;
> +	else if (is_midr_in_range_list(read_cpuid_id(), spectre_bhb_k24_list))
> +		k = 24;
> +	else if (is_midr_in_range_list(read_cpuid_id(), spectre_bhb_k11_list))
> +		k = 11;
> +	else if (is_midr_in_range_list(read_cpuid_id(), spectre_bhb_k8_list))
> +		k =  8;
>  
>  	return k;
>  }

This previous hunk reduces the indent to remove the static variable from inside the
function. Your patch-1 can be picked up automatically by stable branches, but after this
change, that will have to be done by hand. Arm have recently updated that table of CPUs
with extra entries (thanks for picking those up!) - but now that patch can't be easily
applied to older kernels.
I suspect making the reporting assuming-vulnerable may make other CPUs come out of the
wood work too...

Could we avoid changing this unless we really need to?


As background, the idea is that CPUs that are newer than the kernel will discover the need
for mitigation from firmware. That sucks for performance, but it can be improved once the
kernel is updated to know about the 'local' workaround.


> @@ -955,6 +956,8 @@ static bool supports_ecbhb(int scope)
>  						    ID_AA64MMFR1_EL1_ECBHB_SHIFT);
>  }
>  
> +static u8 max_bhb_k;
> +
>  bool is_spectre_bhb_affected(const struct arm64_cpu_capabilities *entry,
>  			     int scope)
>  {
> @@ -963,16 +966,18 @@ bool is_spectre_bhb_affected(const struct arm64_cpu_capabilities *entry,
>  	if (supports_csv2p3(scope))
>  		return false;
>  
> -	if (supports_clearbhb(scope))
> -		return true;
> -
> -	if (spectre_bhb_loop_affected(scope))
> -		return true;
> +	if (is_spectre_bhb_safe(scope))
> +		return false;
>  
> -	if (is_spectre_bhb_fw_affected(scope))
> -		return true;
> +	/*
> +	 * At this point the core isn't known to be "safe" so we're going to
> +	 * assume it's vulnerable. We still need to update `max_bhb_k` though,
> +	 * but only if we aren't mitigating with clearbhb though.

+	or firmware.


> +	 */
> +	if (scope == SCOPE_LOCAL_CPU && !supports_clearbhb(SCOPE_LOCAL_CPU))
> +		max_bhb_k = max(max_bhb_k, spectre_bhb_loop_affected());

CPUs that need a firmware mitigation will get in here too. Its probably harmless as
they'll report '0' as their k value... but you went to the trouble to weed out the CPUs
that support the clearbhb instruction ...

For the change described in the commit message, isn't it enough to replace the final
'return false' with 'return !is_spectre_bhb_safe(scope)' ?


>  
> -	return false;
> +	return true;
>  }


Thanks,

James


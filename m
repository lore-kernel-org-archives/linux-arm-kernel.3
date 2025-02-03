Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5455C02193
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 08:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DJpNqJ4KIgCiHv5IBKCmYrL76ZYAdEy0ybHwfixo3ic=; b=FqjkCuPoJw+cRYgzQbjYfaHMdI
	3OiKtk4WVcqmOYFDuJlF7inzmVoSsMKs+PBKu7zNfc/A8qBYJsxmm+kaXanaLSHpbym+fPhgIsXRg
	Hh6GkXqizu+Vwrh4ZThtHb9gQAIBvxt4shvHVkKzM4kO/K6xBjbrJjStAHnkKZmnq0xp8IcDqNGSi
	HMSThPn3w8aXRiSyAiXPdfF+gyG60gyEjLQ8rbDzxiXhf51pbIG4Pqzkzm3wTvftL3dvxvcHMb/rv
	vlfOg5kiigb3HEFd6LqJYJtUZLV1h+87svcFFNRBoIBlmD8QImIocIEqAE5wxGcdsy8LareahUg7N
	Pq3wCL4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1terrP-0000000EqKV-3oUV;
	Mon, 03 Feb 2025 08:31:15 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1terdN-0000000EnjV-0L4R
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 08:16:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C7B261476;
	Mon,  3 Feb 2025 00:17:08 -0800 (PST)
Received: from [10.162.16.79] (unknown [10.162.16.79])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0EB923F63F;
	Mon,  3 Feb 2025 00:16:39 -0800 (PST)
Message-ID: <522bb984-3dd7-4099-b956-f2e42af71b1c@arm.com>
Date: Mon, 3 Feb 2025 13:46:37 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v19 07/11] perf: arm_pmu: Move PMUv3-specific data
To: "Rob Herring (Arm)" <robh@kernel.org>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Jonathan Corbet <corbet@lwn.net>,
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Zenghui Yu <yuzenghui@huawei.com>, James Clark <james.clark@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 kvmarm@lists.linux.dev
References: <20250202-arm-brbe-v19-v19-0-1c1300802385@kernel.org>
 <20250202-arm-brbe-v19-v19-7-1c1300802385@kernel.org>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20250202-arm-brbe-v19-v19-7-1c1300802385@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_001645_164421_4FADEB60 
X-CRM114-Status: GOOD (  18.71  )
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


On 2/3/25 06:13, Rob Herring (Arm) wrote:
> From: Mark Rutland <mark.rutland@arm.com>
> 
> A few fields in struct arm_pmu are only used with PMUv3, and soon we
> will need to add more for BRBE. Group the fields together so that we
> have a logical place to add more data in future.
> 
> At the same time, remove the comment for reg_pmmir as it doesn't convey
> anything useful.
> 
> There should be no functional change as a result of this patch.
> 
> Signed-off-by: Mark Rutland <mark.rutland@arm.com>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  include/linux/perf/arm_pmu.h | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/include/linux/perf/arm_pmu.h b/include/linux/perf/arm_pmu.h
> index 4b5b83677e3f..c70d528594f2 100644
> --- a/include/linux/perf/arm_pmu.h
> +++ b/include/linux/perf/arm_pmu.h
> @@ -84,7 +84,6 @@ struct arm_pmu {
>  	struct pmu	pmu;
>  	cpumask_t	supported_cpus;
>  	char		*name;
> -	int		pmuver;
>  	irqreturn_t	(*handle_irq)(struct arm_pmu *pmu);
>  	void		(*enable)(struct perf_event *event);
>  	void		(*disable)(struct perf_event *event);
> @@ -102,18 +101,20 @@ struct arm_pmu {
>  	int		(*map_event)(struct perf_event *event);
>  	DECLARE_BITMAP(cntr_mask, ARMPMU_MAX_HWEVENTS);
>  	bool		secure_access; /* 32-bit ARM only */
> -#define ARMV8_PMUV3_MAX_COMMON_EVENTS		0x40
> -	DECLARE_BITMAP(pmceid_bitmap, ARMV8_PMUV3_MAX_COMMON_EVENTS);
> -#define ARMV8_PMUV3_EXT_COMMON_EVENT_BASE	0x4000
> -	DECLARE_BITMAP(pmceid_ext_bitmap, ARMV8_PMUV3_MAX_COMMON_EVENTS);
>  	struct platform_device	*plat_device;
>  	struct pmu_hw_events	__percpu *hw_events;
>  	struct hlist_node	node;
>  	struct notifier_block	cpu_pm_nb;
>  	/* the attr_groups array must be NULL-terminated */
>  	const struct attribute_group *attr_groups[ARMPMU_NR_ATTR_GROUPS + 1];
> -	/* store the PMMIR_EL1 to expose slots */
> +
> +	/* PMUv3 only */
> +	int		pmuver;
>  	u64		reg_pmmir;
> +#define ARMV8_PMUV3_MAX_COMMON_EVENTS		0x40
> +	DECLARE_BITMAP(pmceid_bitmap, ARMV8_PMUV3_MAX_COMMON_EVENTS);
> +#define ARMV8_PMUV3_EXT_COMMON_EVENT_BASE	0x4000
> +	DECLARE_BITMAP(pmceid_ext_bitmap, ARMV8_PMUV3_MAX_COMMON_EVENTS);
>  
>  	/* Only to be used by ACPI probing code */
>  	unsigned long acpi_cpuid;
> 

Makes sense.

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>


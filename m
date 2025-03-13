Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8C7CC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 11:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qCqxw65KD8l7tfxbzFmTvALT/vb9m/uNMbda2yDNgXI=; b=w8JBvUBa7Ot1jdmUTdD3fP7OmY
	8JAHmqFDROIFpvCzpuliL7Tg+6YH2ZgBU18oCEi81QakXpk2ZbbPdcmNcj+b2Irl583bqVLahFHfG
	p3p7u92HkPmucxe0AuI2iymbs2KVAY++dtRjUkUHsm9HlnXUIbcNsU/tu68jozFpL32bsxIGqdltQ
	su1RCGJ8mPG/kkuBQBUwsmuSzlKq8RtNFwYBpD5zuham5E2J/rAS8mPTgt/Td4SR15RbCWFpMDJtv
	pen44IPpDQcx204/nQUSNSXbEw5MgTbdpFKxw4KxtL4wTeQQTCNNSRv22YkUELHmx837YiwM1C3sL
	N/TxoiMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsgvi-0000000B4Oz-3iTv;
	Thu, 13 Mar 2025 11:40:50 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsgu4-0000000B49r-1Fbq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Mar 2025 11:39:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F20581C00;
	Thu, 13 Mar 2025 04:39:17 -0700 (PDT)
Received: from [10.57.40.246] (unknown [10.57.40.246])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 95B703F673;
	Thu, 13 Mar 2025 04:39:02 -0700 (PDT)
Message-ID: <880d8d7d-cd83-4e39-a0de-e278187b7a36@arm.com>
Date: Thu, 13 Mar 2025 11:39:00 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] iommu/arm: Add BBM Level 2 smmu feature
To: =?UTF-8?Q?Miko=C5=82aj_Lenczewski?= <miko.lenczewski@arm.com>,
 ryan.roberts@arm.com, suzuki.poulose@arm.com, yang@os.amperecomputing.com,
 corbet@lwn.net, catalin.marinas@arm.com, will@kernel.org,
 jean-philippe@linaro.org, joro@8bytes.org, akpm@linux-foundation.org,
 mark.rutland@arm.com, joey.gouly@arm.com, maz@kernel.org,
 james.morse@arm.com, broonie@kernel.org, anshuman.khandual@arm.com,
 oliver.upton@linux.dev, ioworker0@gmail.com, baohua@kernel.org,
 david@redhat.com, jgg@ziepe.ca, shameerali.kolothum.thodi@huawei.com,
 nicolinc@nvidia.com, mshavit@google.com, jsnitsel@redhat.com,
 smostafa@google.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux.dev
References: <20250313104111.24196-2-miko.lenczewski@arm.com>
 <20250313104111.24196-4-miko.lenczewski@arm.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20250313104111.24196-4-miko.lenczewski@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_043908_423545_4554D6CA 
X-CRM114-Status: GOOD (  14.72  )
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

On 2025-03-13 10:41 am, Mikołaj Lenczewski wrote:
> For supporting BBM Level 2 for userspace mappings, we want to ensure
> that the smmu also supports its own version of BBM Level 2. Luckily, the
> smmu spec (IHI 0070G 3.21.1.3) is stricter than the aarch64 spec (DDI
> 0487K.a D8.16.2), so already guarantees that no aborts are raised when
> BBM level 2 is claimed.
> 
> Add the feature and testing for it under arm_smmu_sva_supported().

Reviewed-by: Robin Murphy <robin.murphy@arm.com>

> Signed-off-by: Mikołaj Lenczewski <miko.lenczewski@arm.com>
> ---
>   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c | 3 +++
>   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c     | 3 +++
>   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h     | 4 ++++
>   3 files changed, 10 insertions(+)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c
> index 9ba596430e7c..6ba182572788 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c
> @@ -222,6 +222,9 @@ bool arm_smmu_sva_supported(struct arm_smmu_device *smmu)
>   		feat_mask |= ARM_SMMU_FEAT_VAX;
>   	}
>   
> +	if (system_supports_bbml2_noabort())
> +		feat_mask |= ARM_SMMU_FEAT_BBML2;
> +
>   	if ((smmu->features & feat_mask) != feat_mask)
>   		return false;
>   
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> index 358072b4e293..dcee0bdec924 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> @@ -4406,6 +4406,9 @@ static int arm_smmu_device_hw_probe(struct arm_smmu_device *smmu)
>   	if (FIELD_GET(IDR3_RIL, reg))
>   		smmu->features |= ARM_SMMU_FEAT_RANGE_INV;
>   
> +	if (FIELD_GET(IDR3_BBML, reg) == IDR3_BBML2)
> +		smmu->features |= ARM_SMMU_FEAT_BBML2;
> +
>   	/* IDR5 */
>   	reg = readl_relaxed(smmu->base + ARM_SMMU_IDR5);
>   
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> index bd9d7c85576a..85eaf3ab88c2 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> @@ -60,6 +60,9 @@ struct arm_smmu_device;
>   #define ARM_SMMU_IDR3			0xc
>   #define IDR3_FWB			(1 << 8)
>   #define IDR3_RIL			(1 << 10)
> +#define IDR3_BBML			GENMASK(12, 11)
> +#define IDR3_BBML1			(1 << 11)
> +#define IDR3_BBML2			(2 << 11)
>   
>   #define ARM_SMMU_IDR5			0x14
>   #define IDR5_STALL_MAX			GENMASK(31, 16)
> @@ -754,6 +757,7 @@ struct arm_smmu_device {
>   #define ARM_SMMU_FEAT_HA		(1 << 21)
>   #define ARM_SMMU_FEAT_HD		(1 << 22)
>   #define ARM_SMMU_FEAT_S2FWB		(1 << 23)
> +#define ARM_SMMU_FEAT_BBML2		(1 << 24)
>   	u32				features;
>   
>   #define ARM_SMMU_OPT_SKIP_PREFETCH	(1 << 0)



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E71ECD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 10:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VM1VW/zkZHLxqKgr8Iky1pd1e17D2JOBbhsQH1ksfGE=; b=E9MOno43z+lru4tIMkSS3Jz825
	+XeLl0ukBHCw8pW4ihZkEpC2Vo+Zmix28WXlfp8i8bIS17cnVmGHMVoxTQLG0zjBdemywV8g/5nTv
	vgK9N77UF8qKm/04aYJeWxtWx1/R1DO8oGjMJR51VLDPGuDc7kaD3DvpK5qMWfmk2YAIDy+QfhC6h
	E8JblgVnwbMoNNkHZRVL0hT2Bp9yzXgctF5exEGEtQ8pCO++3+znFaDAj7lmgxuWLmFEa//47uKlw
	+1b55t74R5NpT7A1RRF25gMqxOIpT0X5Nlxco843NkQ+84iH736mRhLNCOaJ7ee7upZ4Lq8tco3PO
	LgrsLwOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSY4H-00000005bJ4-1sNg;
	Thu, 28 May 2026 10:34:25 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSY4E-00000005bIW-3uhg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 10:34:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BAFAD43F7;
	Thu, 28 May 2026 03:34:14 -0700 (PDT)
Received: from [10.57.35.233] (unknown [10.57.35.233])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4C1123F905;
	Thu, 28 May 2026 03:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779964459; bh=6I0RUYpIm1S2IYch2bSU9bcVtz94N5mghp4kUJjkPBI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fElDc5KOCPdHu1JH6xL0iLFoL2GSUtcpQ5G7tZHxS+n6xgSwmPgDMoZju9bqm6xJL
	 nZLdKUmw5HuNLp7MC7K8rFye2kdV6qiqh56+Qv2qpFtcLdmx5TYE1qzRuNt6CPxSdZ
	 Gwoywn5rNPUO5jmEzjHQxH5DXc5vygZIQ1mTH32E=
Message-ID: <f25b769a-d89f-46c6-a3d2-9fa35882b848@arm.com>
Date: Thu, 28 May 2026 11:34:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] iommu/arm-smmu-v3: Detect Tegra264 erratum
To: Ashish Mhetre <amhetre@nvidia.com>, will@kernel.org, joro@8bytes.org,
 jgg@ziepe.ca, nicolinc@nvidia.com
Cc: linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20260528101617.4068249-1-amhetre@nvidia.com>
 <20260528101617.4068249-2-amhetre@nvidia.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20260528101617.4068249-2-amhetre@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_033423_051460_9E09E2FE 
X-CRM114-Status: GOOD (  21.48  )
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

On 2026-05-28 11:16 am, Ashish Mhetre wrote:
> Tegra264 SMMU is affected by erratum where a TLB entry can survive an
> invalidation that races with concurrent traffic targeting the same
> entry. The hardware-recommended software workaround is to issue every
> CFGI/TLBI command (each followed by CMD_SYNC) twice. The second issue is
> guaranteed to evict the entry. ATC_INV is not affected and must not be
> doubled.
> 
> Add the ARM_SMMU_OPT_TLBI_TWICE option and set it on instances matching
> the existing "nvidia,tegra264-smmu" compatible. No callers consume the
> option yet, next patch wires the workaround into the CMDQ issue paths.

Can you not detect this implementation from IIDR like for our other 
workarounds? Otherwise what about ACPI?

Thanks,
Robin.

> Signed-off-by: Ashish Mhetre <amhetre@nvidia.com>
> ---
>   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 4 +++-
>   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h | 8 ++++++++
>   2 files changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> index 9be589d14a3b..88296c0a5337 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> @@ -5229,8 +5229,10 @@ static int arm_smmu_device_dt_probe(struct platform_device *pdev,
>   	if (of_dma_is_coherent(dev->of_node))
>   		smmu->features |= ARM_SMMU_FEAT_COHERENCY;
>   
> -	if (of_device_is_compatible(dev->of_node, "nvidia,tegra264-smmu"))
> +	if (of_device_is_compatible(dev->of_node, "nvidia,tegra264-smmu")) {
>   		tegra_cmdqv_dt_probe(dev->of_node, smmu);
> +		smmu->options |= ARM_SMMU_OPT_TLBI_TWICE;
> +	}
>   
>   	return ret;
>   }
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> index 16353596e08a..08d1abaf31ae 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> @@ -928,6 +928,14 @@ struct arm_smmu_device {
>   #define ARM_SMMU_OPT_MSIPOLL		(1 << 2)
>   #define ARM_SMMU_OPT_CMDQ_FORCE_SYNC	(1 << 3)
>   #define ARM_SMMU_OPT_TEGRA241_CMDQV	(1 << 4)
> +/*
> + * Tegra264 erratum: a TLB entry can survive an invalidation that races
> + * with concurrent traffic targeting the same entry. The software
> + * workaround is to issue every CFGI/TLBI command twice, each followed
> + * by CMD_SYNC. The second issue is guaranteed to evict the entry.
> + * ATC_INV commands are not affected and must not be doubled.
> + */
> +#define ARM_SMMU_OPT_TLBI_TWICE		(1 << 5)
>   	u32				options;
>   
>   	struct arm_smmu_cmdq		cmdq;



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B477D0EE00
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Nov 2025 17:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lQmM6amtvyUAIhMb4KVdNQHnz1RSVl/M3Gx+eWCtNUE=; b=x77J2m3L0GNUSWODqnDy22BinZ
	VwMLSea00s7C+xr2XSuYK+Kc0KTAGZdRB8mRdgiJuLDBQXNYXlxh9A08rZwKdQuwjyHyS5P1OXmu5
	B/NlGgn5efdJRoKEabWvOLLfOJD7WhdjvvoCNKjSSpJNXWy60uwnZL+5/aUPbsw5GgyXX2i8jFB9X
	VnQ5wUCqcbsRc38ZMOgKuWD61nSLSLuH0JOj9ziDNGe2n/AQgtUMTvLr00S9/leylxdhPIgFkPWJy
	3ElxB6LlBqpGXm6JFL1CESWZlkr9Jynas2TI0bkjyyvcDZE83boIGr/LqijU/VBi2PCc8jzutx2yO
	1HanNc6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNwnC-0000000DfO0-2PQy;
	Tue, 25 Nov 2025 17:25:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNwn9-0000000DfNZ-0pUh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Nov 2025 17:25:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F3365168F;
	Tue, 25 Nov 2025 09:25:14 -0800 (PST)
Received: from [10.1.30.102] (unknown [10.1.30.102])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DED8B3F73B;
	Tue, 25 Nov 2025 09:25:19 -0800 (PST)
Message-ID: <b0f94951-2896-49a2-ac19-b885903067ad@arm.com>
Date: Tue, 25 Nov 2025 17:25:16 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 1/3] iommu/arm-smmu-v3: Add device-tree support for
 CMDQV driver
To: Ashish Mhetre <amhetre@nvidia.com>, will@kernel.org, joro@8bytes.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, nicolinc@nvidia.com
Cc: thierry.reding@gmail.com, jonathanh@nvidia.com, vdumpa@nvidia.com,
 jgg@ziepe.ca, linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-tegra@vger.kernel.org
References: <20251125071659.3048659-1-amhetre@nvidia.com>
 <20251125071659.3048659-2-amhetre@nvidia.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20251125071659.3048659-2-amhetre@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_092527_359586_2EBB691B 
X-CRM114-Status: GOOD (  29.82  )
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

On 2025-11-25 7:16 am, Ashish Mhetre wrote:
> Add device tree support to the CMDQV driver to enable usage on Tegra264
> SoCs. The implementation parses the nvidia,cmdqv phandle from the SMMU
> device tree node to associate each SMMU with its corresponding CMDQV
> instance.
> 
> Update the dependency from Kconfig as the driver now supports both
> ACPI and device tree initialization through conditional compilation.
> 
> Add nvidia,tegra264-smmu to the arm-smmu-v3 device tree match table to
> enable device tree based probing on Nvidia Tegra264 platforms and
> restrict CMDQV usage to other vendors.
> 
> Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>
> Signed-off-by: Ashish Mhetre <amhetre@nvidia.com>
> ---
>   drivers/iommu/arm/Kconfig                     |  2 +-
>   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   | 32 ++++++++++++++
>   .../iommu/arm/arm-smmu-v3/tegra241-cmdqv.c    | 43 ++++++++++++++++++-
>   3 files changed, 75 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iommu/arm/Kconfig b/drivers/iommu/arm/Kconfig
> index ef42bbe07dbe..168ada9c3d68 100644
> --- a/drivers/iommu/arm/Kconfig
> +++ b/drivers/iommu/arm/Kconfig
> @@ -121,7 +121,7 @@ config ARM_SMMU_V3_KUNIT_TEST
>   
>   config TEGRA241_CMDQV
>   	bool "NVIDIA Tegra241 CMDQ-V extension support for ARM SMMUv3"
> -	depends on ACPI
> +	depends on OF || ACPI

This now does nothing, since ARM_SMMU_V3 depends on ARM64 which already 
implies at least OF anyway.

>   	help
>   	  Support for NVIDIA CMDQ-Virtualization extension for ARM SMMUv3. The
>   	  CMDQ-V extension is similar to v3.3 ECMDQ for multi command queues
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> index a33fbd12a0dd..2eec7cd4f3de 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> @@ -4530,6 +4530,34 @@ static int arm_smmu_device_hw_probe(struct arm_smmu_device *smmu)
>   	return 0;
>   }
>   
> +#ifdef CONFIG_TEGRA241_CMDQV
> +static void tegra_cmdqv_dt_probe(struct device_node *smmu_node,
> +				 struct arm_smmu_device *smmu)
> +{
> +	struct platform_device *pdev;
> +	struct device_node *np;
> +
> +	np = of_parse_phandle(smmu_node, "nvidia,cmdqv", 0);
> +	if (!np)
> +		return;
> +
> +	pdev = of_find_device_by_node(np);
> +	of_node_put(np);
> +	if (!pdev)
> +		return;
> +

You need to drop the reference on the platform device too.

> +	smmu->impl_dev = &pdev->dev;
> +	smmu->options |= ARM_SMMU_OPT_TEGRA241_CMDQV;
> +	dev_info(smmu->dev, "found companion CMDQV device: %s\n",
> +		 dev_name(smmu->impl_dev));
> +}
> +#else
> +static void tegra_cmdqv_dt_probe(struct device_node *smmu_node,
> +				 struct arm_smmu_device *smmu)
> +{
> +}
> +#endif
> +
>   #ifdef CONFIG_ACPI
>   #ifdef CONFIG_TEGRA241_CMDQV
>   static void acpi_smmu_dsdt_probe_tegra241_cmdqv(struct acpi_iort_node *node,
> @@ -4634,6 +4662,9 @@ static int arm_smmu_device_dt_probe(struct platform_device *pdev,
>   	if (of_dma_is_coherent(dev->of_node))
>   		smmu->features |= ARM_SMMU_FEAT_COHERENCY;
>   
> +	if (of_device_is_compatible(dev->of_node, "nvidia,tegra264-smmu"))
> +		tegra_cmdqv_dt_probe(dev->of_node, smmu);
> +
>   	return ret;
>   }
>   
> @@ -4867,6 +4898,7 @@ static void arm_smmu_device_shutdown(struct platform_device *pdev)
>   
>   static const struct of_device_id arm_smmu_of_match[] = {
>   	{ .compatible = "arm,smmu-v3", },
> +	{ .compatible = "nvidia,tegra264-smmu", },

Since you're not using match data, this is pointless, as anything with 
this compatible must still also match the generic compatible anyway.

Thanks,
Robin.

>   	{ },
>   };
>   MODULE_DEVICE_TABLE(of, arm_smmu_of_match);
> diff --git a/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c b/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
> index 378104cd395e..2608bf6518b4 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
> @@ -11,6 +11,8 @@
>   #include <linux/iommufd.h>
>   #include <linux/iopoll.h>
>   #include <uapi/linux/iommufd.h>
> +#include <linux/of_platform.h>
> +#include <linux/platform_device.h>
>   
>   #include <acpi/acpixf.h>
>   
> @@ -917,6 +919,26 @@ tegra241_cmdqv_find_acpi_resource(struct device *dev, int *irq)
>   	return res;
>   }
>   
> +static struct resource *
> +tegra241_cmdqv_find_dt_resource(struct device *dev, int *irq)
> +{
> +	struct platform_device *pdev = to_platform_device(dev);
> +	struct resource *res;
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	if (!res) {
> +		dev_err(dev, "no memory resource found for CMDQV\n");
> +		return NULL;
> +	}
> +
> +	if (irq)
> +		*irq = platform_get_irq_optional(pdev, 0);
> +	if (!irq || *irq <= 0)
> +		dev_warn(dev, "no interrupt. errors will not be reported\n");
> +
> +	return res;
> +}
> +
>   static int tegra241_cmdqv_init_structures(struct arm_smmu_device *smmu)
>   {
>   	struct tegra241_cmdqv *cmdqv =
> @@ -1048,11 +1070,14 @@ struct arm_smmu_device *tegra241_cmdqv_probe(struct arm_smmu_device *smmu)
>   
>   	if (!smmu->dev->of_node)
>   		res = tegra241_cmdqv_find_acpi_resource(smmu->impl_dev, &irq);
> +	else
> +		res = tegra241_cmdqv_find_dt_resource(smmu->impl_dev, &irq);
>   	if (!res)
>   		goto out_fallback;
>   
>   	new_smmu = __tegra241_cmdqv_probe(smmu, res, irq);
> -	kfree(res);
> +	if (!smmu->dev->of_node)
> +		kfree(res);
>   
>   	if (new_smmu)
>   		return new_smmu;
> @@ -1346,4 +1371,20 @@ tegra241_cmdqv_init_vintf_user(struct arm_vsmmu *vsmmu,
>   	return ret;
>   }
>   
> +static const struct of_device_id tegra241_cmdqv_of_match[] = {
> +	{ .compatible = "nvidia,tegra264-cmdqv" },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, tegra241_cmdqv_of_match);
> +
> +static struct platform_driver tegra241_cmdqv_driver = {
> +	.driver = {
> +		.name = "tegra241-cmdqv",
> +		.of_match_table = tegra241_cmdqv_of_match,
> +	},
> +};
> +module_platform_driver(tegra241_cmdqv_driver);
> +
> +MODULE_DESCRIPTION("NVIDIA Tegra241 Command Queue Virtualization Driver");
> +MODULE_LICENSE("GPL");
>   MODULE_IMPORT_NS("IOMMUFD");


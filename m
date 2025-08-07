Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3D28C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Aug 2025 17:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OwE7IjWl6VZ3ggI0SvEUvgOmvcIShKD7xDHpGQrOZfc=; b=JM5uxPqU5HhPlG9av590MZSO3x
	Ro6CW1GGoXypvpl1QhspMEmeKxei7RaylZMkqAH4aI1i/YeeQfGY3iWWHDo1EKDmwftFH3cSD0ui7
	WiscknW4mLEMU3ffooOmOOPoRMaQfg1HxGvkss7D2Vgtt4PZzREtYiOWHQYsqJlwUKZtvMqkbx2ie
	k5bYLzL38lkxqvmU3IDcClzrxSuTXJqADNFTxh2aSMJqbVz83QfxzTXqBa5Z7EinggzAi99iJhE+w
	akEhkwn93KjgDq4btESyI+rIbSYVoxbn71Eu71Au20WaTYw1d2WxADNkVDzk7u65ezH7cdLqmIAJm
	2BnG0j4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uk4Oj-00000001FIk-346d;
	Thu, 07 Aug 2025 17:27:25 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uk4MB-00000001F91-07gj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Aug 2025 17:24:48 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 577HOUKU856464;
	Thu, 7 Aug 2025 12:24:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1754587470;
	bh=OwE7IjWl6VZ3ggI0SvEUvgOmvcIShKD7xDHpGQrOZfc=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=CmlHr1Gy5tJ3TmYS8qHbb7V746RPNQSYpAacXOEf1qAsF3yTy7gODfdaYq+wAtwGO
	 MTX4ySWV/kTpyaO2FhkaojxAcyRicXsQhG+lXXn0GgRc4FaM7maRl/phGACH7iPdfN
	 ChSS4cEezQr+FTCeyuZZYlLmL/opF/irVFVCVQ+s=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 577HOUF24044652
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 7 Aug 2025 12:24:30 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 7
 Aug 2025 12:24:29 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 7 Aug 2025 12:24:29 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 577HOT3E1416840;
	Thu, 7 Aug 2025 12:24:29 -0500
Message-ID: <37f73812-be0c-43b2-a5bc-a41e09db85ea@ti.com>
Date: Thu, 7 Aug 2025 12:24:29 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] soc: ti: k3-socinfo: Add support for AM62P variants
To: Judith Mendez <jm@ti.com>, Nishanth Menon <nm@ti.com>,
        Tero Kristo
	<kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Adrian Hunter
	<adrian.hunter@intel.com>,
        Ulf Hansson <ulf.hansson@linaro.org>
CC: Vignesh Raghavendra <vigneshr@ti.com>,
        Santosh Shilimkar
	<ssantosh@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-mmc@vger.kernel.org>
References: <20250805234950.3781367-1-jm@ti.com>
 <20250805234950.3781367-3-jm@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20250805234950.3781367-3-jm@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250807_102447_165065_2BD3EE90 
X-CRM114-Status: GOOD (  27.12  )
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

On 8/5/25 6:49 PM, Judith Mendez wrote:
> This adds a support for detecting AM62P SR1.0, SR1.1, SR1.2.
> 
> On AM62P, silicon revision is discovered with GP_SW1 instead of JTAGID
> register, so introduce GP_SW register range to determine SoC revision.
> 
> Signed-off-by: Judith Mendez <jm@ti.com>
> ---
>   drivers/soc/ti/k3-socinfo.c | 82 +++++++++++++++++++++++++++++++++----
>   1 file changed, 74 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/soc/ti/k3-socinfo.c b/drivers/soc/ti/k3-socinfo.c
> index d716be113c84..9daeced656d6 100644
> --- a/drivers/soc/ti/k3-socinfo.c
> +++ b/drivers/soc/ti/k3-socinfo.c
> @@ -15,6 +15,7 @@
>   #include <linux/sys_soc.h>
>   
>   #define CTRLMMR_WKUP_JTAGID_REG		0
> +#define CTRLMMR_WKUP_GP_SW1_REG		4
>   /*
>    * Bits:
>    *  31-28 VARIANT	Device variant
> @@ -62,10 +63,63 @@ static const struct k3_soc_id {
>   	{ JTAG_ID_PARTNO_AM62LX, "AM62LX" },
>   };
>   
> +static const struct regmap_config k3_chipinfo_regmap_cfg = {
> +	.reg_bits = 32,
> +	.val_bits = 32,
> +	.reg_stride = 4,
> +};
> +
>   static const char * const j721e_rev_string_map[] = {
>   	"1.0", "1.1", "2.0",
>   };
>   
> +static const char * const am62p_gpsw_rev_string_map[] = {
> +	"1.0", "1.1", "1.2",
> +};
> +
> +static int
> +k3_chipinfo_get_variant_alternate(struct platform_device *pdev, unsigned int partno, u32 *variant)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct regmap *regmap;
> +	void __iomem *base;
> +	u32 offset;
> +	int ret;
> +
> +	base = devm_platform_ioremap_resource(pdev, 1);
> +	if (IS_ERR(base))
> +		return PTR_ERR(base);
> +
> +	regmap = regmap_init_mmio(dev, base, &k3_chipinfo_regmap_cfg);

devm_regmap_init_mmio()

Otherwise this regmap never gets freed up in the error paths.

> +	if (IS_ERR(regmap))
> +		return PTR_ERR(regmap);
> +
> +	switch (partno) {
> +	case JTAG_ID_PARTNO_AM62PX:
> +		offset = CTRLMMR_WKUP_GP_SW1_REG;
> +		break;
> +	default:
> +		offset = CTRLMMR_WKUP_GP_SW1_REG;

This switch case does nothing, if offset ever can get any other
value, then you can add it back.

> +	}
> +
> +	ret = regmap_read(regmap, offset, variant);
> +

Extra newline

> +	if (ret < 0)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +static bool k3_chipinfo_variant_in_gp_sw(unsigned int partno)
> +{
> +	switch (partno) {
> +	case JTAG_ID_PARTNO_AM62PX:

Do you really need a function just to hold a switch-case? You also
have a switch-case that checks for PARTNO_AM62PX in the below function
that makes use of the extra "gp_sw1", why not inside that case fetch
the value. Would avoid passing in a variable "gp_sw1" which is unused
in all but the PARTNO_AM62PX case.

Andrew

> +		return true;
> +	default:
> +		return false;
> +	}
> +}
> +
>   static int
>   k3_chipinfo_partno_to_names(unsigned int partno,
>   			    struct soc_device_attribute *soc_dev_attr)
> @@ -83,8 +137,10 @@ k3_chipinfo_partno_to_names(unsigned int partno,
>   
>   static int
>   k3_chipinfo_variant_to_sr(unsigned int partno, unsigned int variant,
> -			  struct soc_device_attribute *soc_dev_attr)
> +			  struct soc_device_attribute *soc_dev_attr, u32 gp_sw1)
>   {
> +	u32 gpsw_variant = gp_sw1 % 16;
> +
>   	switch (partno) {
>   	case JTAG_ID_PARTNO_J721E:
>   		if (variant >= ARRAY_SIZE(j721e_rev_string_map))
> @@ -92,6 +148,13 @@ k3_chipinfo_variant_to_sr(unsigned int partno, unsigned int variant,
>   		soc_dev_attr->revision = kasprintf(GFP_KERNEL, "SR%s",
>   						   j721e_rev_string_map[variant]);
>   		break;
> +	case JTAG_ID_PARTNO_AM62PX:
> +		/* Always parse AM62P variant from GP_SW1 */
> +		if (gpsw_variant >= ARRAY_SIZE(am62p_gpsw_rev_string_map))
> +			goto err_unknown_variant;
> +		soc_dev_attr->revision = kasprintf(GFP_KERNEL, "SR%s",
> +						   am62p_gpsw_rev_string_map[gpsw_variant]);
> +		break;
>   	default:
>   		variant++;
>   		soc_dev_attr->revision = kasprintf(GFP_KERNEL, "SR%x.0",
> @@ -107,12 +170,6 @@ k3_chipinfo_variant_to_sr(unsigned int partno, unsigned int variant,
>   	return -ENODEV;
>   }
>   
> -static const struct regmap_config k3_chipinfo_regmap_cfg = {
> -	.reg_bits = 32,
> -	.val_bits = 32,
> -	.reg_stride = 4,
> -};
> -
>   static int k3_chipinfo_probe(struct platform_device *pdev)
>   {
>   	struct device_node *node = pdev->dev.of_node;
> @@ -121,6 +178,7 @@ static int k3_chipinfo_probe(struct platform_device *pdev)
>   	struct soc_device *soc_dev;
>   	struct regmap *regmap;
>   	void __iomem *base;
> +	u32 gp_sw1_val = 0;
>   	u32 partno_id;
>   	u32 variant;
>   	u32 jtag_id;
> @@ -163,7 +221,15 @@ static int k3_chipinfo_probe(struct platform_device *pdev)
>   		goto err;
>   	}
>   
> -	ret = k3_chipinfo_variant_to_sr(partno_id, variant, soc_dev_attr);
> +	if (k3_chipinfo_variant_in_gp_sw(partno_id)) {
> +		ret = k3_chipinfo_get_variant_alternate(pdev, partno_id, &gp_sw1_val);
> +		if (ret < 0) {
> +			dev_err(dev, "Failed to read GP_SW1: %d\n", ret);
> +			goto err;
> +		}
> +	}
> +
> +	ret = k3_chipinfo_variant_to_sr(partno_id, variant, soc_dev_attr, gp_sw1_val);
>   	if (ret) {
>   		dev_err(dev, "Unknown SoC SR[0x%08X]: %d\n", jtag_id, ret);
>   		goto err;



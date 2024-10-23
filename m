Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CB54D2E03D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 09:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3TInnJKLUkbjN7HN9QOcNUqOGpRWKzJ3tAforkpO8L0=; b=SThv7oxMtY198V6Hd8Oscb9hvF
	Nk/I8qvUz5b9zMNbK1x59y+F5qjBbdAnFIACa+mT6ixol+aE935XTGyCgzQz1rk1hDIev5HE4oe+K
	yNvpq3OWPu/4UEtleiqFdpzaBZp/8qaZEf41h68v3EkEYuJycI7jMOVbh/tOEm8viNE+rrv604Pc3
	n5G7od6HCvKbtbV/mWfgcKaz6dhfp1ZV3EXlIKZsIrKG02ypbxM0yAroLeU1zvWbsz5AhimjY2a4O
	WB0LL4EIl//cp49tk/BJXHRUQt8gMYO1SfRZongHJMx+4DIfDzH9yJfLmpUnDDFXawWRqubhCNVr7
	vcsEasIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3Y9Z-0000000Dtq0-2d8x;
	Wed, 23 Oct 2024 09:59:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3XkL-0000000Dogk-39RW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 09:34:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E8EFA339;
	Wed, 23 Oct 2024 02:34:08 -0700 (PDT)
Received: from [10.57.66.28] (unknown [10.57.66.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E4E933F71E;
	Wed, 23 Oct 2024 02:33:37 -0700 (PDT)
Message-ID: <111ddb4d-4765-4acd-82ba-efe25b3c4470@arm.com>
Date: Wed, 23 Oct 2024 10:33:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 RESEND 1/3] coresight-tpdm: Add MCMB dataset support
Content-Language: en-GB
To: Mao Jinlong <quic_jinlmao@quicinc.com>, Mike Leach
 <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Tao Zhang <quic_taozha@quicinc.com>
References: <20241011064732.8480-1-quic_jinlmao@quicinc.com>
 <20241011064732.8480-2-quic_jinlmao@quicinc.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20241011064732.8480-2-quic_jinlmao@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_023341_992249_613E7F25 
X-CRM114-Status: GOOD (  32.37  )
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

On 11/10/2024 07:47, Mao Jinlong wrote:
> MCMB (Multi-lane CMB) is a special form of CMB dataset type. MCMB
> subunit TPDM has the same number and usage of registers as CMB
> subunit TPDM. MCMB subunit can be enabled for data collection by
> writing 1 to the first bit of CMB_CR register. The difference is
> that MCMB subunit TPDM needs to select the lane and enable it in
> using it.
> 
> Signed-off-by: Tao Zhang <quic_taozha@quicinc.com>
> Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
> ---
>   drivers/hwtracing/coresight/coresight-tpda.c |  5 ++-
>   drivers/hwtracing/coresight/coresight-tpdm.c | 41 +++++++++++++++++---
>   drivers/hwtracing/coresight/coresight-tpdm.h | 26 ++++++++++++-
>   3 files changed, 63 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-tpda.c b/drivers/hwtracing/coresight/coresight-tpda.c
> index bfca103f9f84..e063a31ff88a 100644
> --- a/drivers/hwtracing/coresight/coresight-tpda.c
> +++ b/drivers/hwtracing/coresight/coresight-tpda.c
> @@ -1,6 +1,6 @@
>   // SPDX-License-Identifier: GPL-2.0
>   /*
> - * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) 2023-2024 Qualcomm Innovation Center, Inc. All rights reserved.
>    */
>   
>   #include <linux/amba/bus.h>
> @@ -72,7 +72,8 @@ static int tpdm_read_element_size(struct tpda_drvdata *drvdata,
>   		rc = fwnode_property_read_u32(dev_fwnode(csdev->dev.parent),
>   				"qcom,dsb-element-bits", &drvdata->dsb_esize);
>   	}
> -	if (tpdm_has_cmb_dataset(tpdm_data)) {
> +
> +	if (tpdm_has_cmb_dataset(tpdm_data) || tpdm_has_mcmb_dataset(tpdm_data)) {

minor nit: All such places could be replaced by

if (tdpm_data->cmb)

Because at probe time we allocate the above structure ?


>   		rc = fwnode_property_read_u32(dev_fwnode(csdev->dev.parent),
>   				"qcom,cmb-element-bits", &drvdata->cmb_esize);
>   	}
> diff --git a/drivers/hwtracing/coresight/coresight-tpdm.c b/drivers/hwtracing/coresight/coresight-tpdm.c
> index 0726f8842552..58f8c3e804c1 100644
> --- a/drivers/hwtracing/coresight/coresight-tpdm.c
> +++ b/drivers/hwtracing/coresight/coresight-tpdm.c
> @@ -1,6 +1,6 @@
>   // SPDX-License-Identifier: GPL-2.0
>   /*
> - * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) 2023-2024 Qualcomm Innovation Center, Inc. All rights reserved.
>    */
>   
>   #include <linux/amba/bus.h>
> @@ -198,7 +198,8 @@ static umode_t tpdm_cmb_is_visible(struct kobject *kobj,
>   	struct device *dev = kobj_to_dev(kobj);
>   	struct tpdm_drvdata *drvdata = dev_get_drvdata(dev->parent);
>   
> -	if (drvdata && tpdm_has_cmb_dataset(drvdata))
> +	if (drvdata && (tpdm_has_cmb_dataset(drvdata) ||
> +			tpdm_has_mcmb_dataset(drvdata)))

	if (drvdata && drvdata->cmb) ?

>   		return attr->mode;
>   
>   	return 0;
> @@ -246,8 +247,10 @@ static void tpdm_reset_datasets(struct tpdm_drvdata *drvdata)
>   		drvdata->dsb->trig_type = false;
>   	}
>   
> -	if (drvdata->cmb)
> +	if (drvdata->cmb) {
>   		memset(drvdata->cmb, 0, sizeof(struct cmb_dataset));
> +		drvdata->cmb->trig_ts = true;
> +	}
>   }
>   
>   static void set_dsb_mode(struct tpdm_drvdata *drvdata, u32 *val)
> @@ -388,7 +391,8 @@ static void tpdm_enable_cmb(struct tpdm_drvdata *drvdata)
>   {
>   	u32 val, i;
>   
> -	if (!tpdm_has_cmb_dataset(drvdata))
> +	if (!(tpdm_has_cmb_dataset(drvdata) ||
> +		tpdm_has_mcmb_dataset(drvdata)))

	if (!drvdata->cmb)

>   		return;
>   
>   	/* Configure pattern registers */
> @@ -415,6 +419,19 @@ static void tpdm_enable_cmb(struct tpdm_drvdata *drvdata)
>   		val |= TPDM_CMB_CR_MODE;
>   	else
>   		val &= ~TPDM_CMB_CR_MODE;
> +
> +	if (tpdm_has_mcmb_dataset(drvdata)) {
> +		val &= ~TPDM_CMB_CR_XTRIG_LNSEL;
> +		/*Set the lane participates in tghe output pattern*/

minor nit: Leave a single space after '/*' and before '*/'

> +		val |= FIELD_PREP(TPDM_CMB_CR_XTRIG_LNSEL,
> +			drvdata->cmb->mcmb->mcmb_trig_lane);
> +
> +		/* Set the enablement of the lane */
> +		val &= ~TPDM_CMB_CR_E_LN;
> +		val |= FIELD_PREP(TPDM_CMB_CR_E_LN,
> +			drvdata->cmb->mcmb->mcmb_lane_select);
> +	}
> +
>   	/* Set the enable bit of CMB control register to 1 */
>   	val |= TPDM_CMB_CR_ENA;
>   	writel_relaxed(val, drvdata->base + TPDM_CMB_CR);
> @@ -474,7 +491,8 @@ static void tpdm_disable_cmb(struct tpdm_drvdata *drvdata)
>   {
>   	u32 val;
>   
> -	if (!tpdm_has_cmb_dataset(drvdata))
> +	if (!(tpdm_has_cmb_dataset(drvdata) ||
> +		tpdm_has_mcmb_dataset(drvdata)))

	if (!drvdata->cmb) ?

>   		return;
>   
>   	val = readl_relaxed(drvdata->base + TPDM_CMB_CR);
> @@ -541,6 +559,19 @@ static int tpdm_datasets_setup(struct tpdm_drvdata *drvdata)
>   		if (!drvdata->cmb)
>   			return -ENOMEM;
>   	}
> +
> +	if (tpdm_has_mcmb_dataset(drvdata) && (!drvdata->cmb)) {
> +		drvdata->cmb = devm_kzalloc(drvdata->dev,
> +						sizeof(*drvdata->cmb), GFP_KERNEL);
> +		if (!drvdata->cmb)
> +			return -ENOMEM;
> +		drvdata->cmb->mcmb = devm_kzalloc(drvdata->dev,
> +						sizeof(*drvdata->cmb->mcmb),
> +						GFP_KERNEL);

Please avoid this ^^, instead embed the fields in drvdata as mentioned
below.

Is it possible that both CMB and MCMB can be present on the same TPDM ?
If so, we need to be careful about ^ block ?


> +		if (!drvdata->cmb->mcmb)
> +			return -ENOMEM;
> +	}
> +
>   	tpdm_reset_datasets(drvdata);
>   
>   	return 0;
> diff --git a/drivers/hwtracing/coresight/coresight-tpdm.h b/drivers/hwtracing/coresight/coresight-tpdm.h
> index e08d212642e3..2e84daad1a58 100644
> --- a/drivers/hwtracing/coresight/coresight-tpdm.h
> +++ b/drivers/hwtracing/coresight/coresight-tpdm.h
> @@ -1,6 +1,6 @@
>   /* SPDX-License-Identifier: GPL-2.0 */
>   /*
> - * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) 2023-2024 Qualcomm Innovation Center, Inc. All rights reserved.
>    */
>   
>   #ifndef _CORESIGHT_CORESIGHT_TPDM_H
> @@ -9,7 +9,7 @@
>   /* The max number of the datasets that TPDM supports */
>   #define TPDM_DATASETS       7
>   
> -/* CMB Subunit Registers */
> +/* CMB/MCMB Subunit Registers */
>   #define TPDM_CMB_CR		(0xA00)
>   /* CMB subunit timestamp insertion enable register */
>   #define TPDM_CMB_TIER		(0xA04)
> @@ -34,6 +34,10 @@
>   #define TPDM_CMB_TIER_XTRIG_TSENAB	BIT(1)
>   /* For timestamp fo all trace */
>   #define TPDM_CMB_TIER_TS_ALL		BIT(2)
> +/* MCMB trigger lane select */
> +#define TPDM_CMB_CR_XTRIG_LNSEL		GENMASK(20, 18)
> +/* MCMB lane enablement */
> +#define TPDM_CMB_CR_E_LN		GENMASK(17, 10)
>   
>   /* Patten register number */
>   #define TPDM_CMB_MAX_PATT		2
> @@ -112,11 +116,13 @@
>    * PERIPHIDR0[0] : Fix to 1 if ImplDef subunit present, else 0
>    * PERIPHIDR0[1] : Fix to 1 if DSB subunit present, else 0
>    * PERIPHIDR0[2] : Fix to 1 if CMB subunit present, else 0
> + * PERIPHIDR0[6] : Fix to 1 if MCMB subunit present, else 0
>    */
>   
>   #define TPDM_PIDR0_DS_IMPDEF	BIT(0)
>   #define TPDM_PIDR0_DS_DSB	BIT(1)
>   #define TPDM_PIDR0_DS_CMB	BIT(2)
> +#define TPDM_PIDR0_DS_MCMB	BIT(6)
>   
>   #define TPDM_DSB_MAX_LINES	256
>   /* MAX number of EDCR registers */
> @@ -245,6 +251,16 @@ struct dsb_dataset {
>   	bool			trig_type;
>   };
>   
> +/**
> + * struct mcmb_dataset
> + * @mcmb_trig_lane:       Save data for trigger lane
> + * @mcmb_lane_select:     Save data for lane enablement
> + */
> +struct mcmb_dataset {
> +	u8		mcmb_trig_lane;
> +	u8		mcmb_lane_select;
> +};
> +

If it is only these two members, why not embed this in the cmb_dataset ?
This takes just 2bytes and we are instead allocating 2bytes + 4bytes for 
storing and additional pointer dereference + error handling of
allocations etc.

>   /**
>    * struct cmb_dataset
>    * @trace_mode:       Dataset collection mode
> @@ -267,6 +283,7 @@ struct cmb_dataset {
>   	bool			patt_ts;
>   	bool			trig_ts;
>   	bool			ts_all;
> +	struct mcmb_dataset	*mcmb;

	struct 			{
		u8		trig_lane;
		u8		lane_select;
	} mcmb;

?

Suzuki



>   };
>   
>   /**
> @@ -334,4 +351,9 @@ static bool tpdm_has_cmb_dataset(struct tpdm_drvdata *drvdata)
>   {
>   	return (drvdata->datasets & TPDM_PIDR0_DS_CMB);
>   }
> +
> +static bool tpdm_has_mcmb_dataset(struct tpdm_drvdata *drvdata)
> +{
> +	return (drvdata->datasets & TPDM_PIDR0_DS_MCMB);
> +}
>   #endif  /* _CORESIGHT_CORESIGHT_TPDM_H */



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0955AE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 14:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ka+Uk71pu3J2jjmU46Z/YrwBcPcCFn6leemONWeplF8=; b=hyIlnGj0c9Jzr7u9Zd7kYwVMGv
	wWW0PRaLVVHnta6PTIUgkR2WSQpQ6ShEWJR6Gj/qtHijG/bcgeh0PBNUffSPyiZME+LM0+6KA9nGC
	qKGi/TPNcde1F5Z3h9zh20HpHguZ4kEGNZ4SCs1dwzEVAm/4IkLV8UF7P8qB/bxGTDiVqVs0jFt/+
	VcU95RhcJe+PNihqYrFIswrVgkk4Y407n49P3WeU1ai8F3sPYZG2J1ao50iQ+35I65ACwumC2YrR+
	BCBzL1hiPgF8XccE7J/L+tEhGSl5/QazitdZZu45kO0j2aUKBKL6gGaROairoxT/Qgk0cvjNM56KP
	s2RzWh7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNYxA-0000000Dq8S-1Qh5;
	Tue, 17 Dec 2024 14:53:40 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNYvu-0000000DpnL-3Qto
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 14:52:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9F0ED1063;
	Tue, 17 Dec 2024 06:52:49 -0800 (PST)
Received: from [10.57.71.247] (unknown [10.57.71.247])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5CA4B3F528;
	Tue, 17 Dec 2024 06:52:20 -0800 (PST)
Message-ID: <065b4ad2-db39-42ed-91d1-d818f82ece79@arm.com>
Date: Tue, 17 Dec 2024 14:52:19 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] coresight-tpdm: Add MCMB dataset support
Content-Language: en-GB
To: Mao Jinlong <quic_jinlmao@quicinc.com>, Mike Leach
 <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Tao Zhang <quic_taozha@quicinc.com>
References: <20241105123940.39602-1-quic_jinlmao@quicinc.com>
 <20241105123940.39602-2-quic_jinlmao@quicinc.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20241105123940.39602-2-quic_jinlmao@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_065222_951339_D521A954 
X-CRM114-Status: GOOD (  31.00  )
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

On 05/11/2024 12:39, Mao Jinlong wrote:
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
>   drivers/hwtracing/coresight/coresight-tpda.c |  7 ++--
>   drivers/hwtracing/coresight/coresight-tpdm.c | 44 +++++++++++++++++---
>   drivers/hwtracing/coresight/coresight-tpdm.h | 27 ++++++------
>   3 files changed, 57 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-tpda.c b/drivers/hwtracing/coresight/coresight-tpda.c
> index bfca103f9f84..4b61b9840740 100644
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
> @@ -68,11 +68,12 @@ static int tpdm_read_element_size(struct tpda_drvdata *drvdata,
>   	int rc = -EINVAL;
>   	struct tpdm_drvdata *tpdm_data = dev_get_drvdata(csdev->dev.parent);
>   
> -	if (tpdm_has_dsb_dataset(tpdm_data)) {
> +	if (tpdm_data->dsb) {
>   		rc = fwnode_property_read_u32(dev_fwnode(csdev->dev.parent),
>   				"qcom,dsb-element-bits", &drvdata->dsb_esize);
>   	}
> -	if (tpdm_has_cmb_dataset(tpdm_data)) {
> +
> +	if (tpdm_data->cmb) {
>   		rc = fwnode_property_read_u32(dev_fwnode(csdev->dev.parent),
>   				"qcom,cmb-element-bits", &drvdata->cmb_esize);
>   	}
> diff --git a/drivers/hwtracing/coresight/coresight-tpdm.c b/drivers/hwtracing/coresight/coresight-tpdm.c
> index b7d99e91ab84..0529858586c1 100644
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
> @@ -21,6 +21,21 @@
>   
>   DEFINE_CORESIGHT_DEVLIST(tpdm_devs, "tpdm");
>   
> +static bool tpdm_has_dsb_dataset(struct tpdm_drvdata *drvdata)
> +{
> +	return (drvdata->datasets & TPDM_PIDR0_DS_DSB);
> +}
> +
> +static bool tpdm_has_cmb_dataset(struct tpdm_drvdata *drvdata)
> +{
> +	return (drvdata->datasets & TPDM_PIDR0_DS_CMB);
> +}
> +
> +static bool tpdm_has_mcmb_dataset(struct tpdm_drvdata *drvdata)
> +{
> +	return (drvdata->datasets & TPDM_PIDR0_DS_MCMB);
> +}
> +
>   /* Read dataset array member with the index number */
>   static ssize_t tpdm_simple_dataset_show(struct device *dev,
>   					struct device_attribute *attr,
> @@ -198,7 +213,7 @@ static umode_t tpdm_cmb_is_visible(struct kobject *kobj,
>   	struct device *dev = kobj_to_dev(kobj);
>   	struct tpdm_drvdata *drvdata = dev_get_drvdata(dev->parent);
>   
> -	if (drvdata && tpdm_has_cmb_dataset(drvdata))
> +	if (drvdata && drvdata->cmb)
>   		return attr->mode;
>   
>   	return 0;
> @@ -246,8 +261,10 @@ static void tpdm_reset_datasets(struct tpdm_drvdata *drvdata)
>   		drvdata->dsb->trig_type = false;
>   	}
>   
> -	if (drvdata->cmb)
> +	if (drvdata->cmb) {
>   		memset(drvdata->cmb, 0, sizeof(struct cmb_dataset));
> +		drvdata->cmb->trig_ts = true;

This looks like an unrelated change from the MCMB dataset. Is there an 
explanation ? Is this a mistake ? If it is intended, please make it a
separate patch.

> +	}
>   }
>   
>   static void set_dsb_mode(struct tpdm_drvdata *drvdata, u32 *val)
> @@ -388,7 +405,7 @@ static void tpdm_enable_cmb(struct tpdm_drvdata *drvdata)
>   {
>   	u32 val, i;
>   
> -	if (!tpdm_has_cmb_dataset(drvdata))
> +	if (!drvdata->cmb)
>   		return;
>   
>   	/* Configure pattern registers */
> @@ -415,6 +432,19 @@ static void tpdm_enable_cmb(struct tpdm_drvdata *drvdata)
>   		val |= TPDM_CMB_CR_MODE;
>   	else
>   		val &= ~TPDM_CMB_CR_MODE;
> +
> +	if (tpdm_has_mcmb_dataset(drvdata)) {
> +		val &= ~TPDM_CMB_CR_XTRIG_LNSEL;
> +		/* Set the lane participates in tghe output pattern */

minor nit: typo "tghe" => "the"

> +		val |= FIELD_PREP(TPDM_CMB_CR_XTRIG_LNSEL,
> +			drvdata->cmb->mcmb.trig_lane);
> +
> +		/* Set the enablement of the lane */
> +		val &= ~TPDM_CMB_CR_E_LN;
> +		val |= FIELD_PREP(TPDM_CMB_CR_E_LN,
> +			drvdata->cmb->mcmb.lane_select);
> +	}
> +
>   	/* Set the enable bit of CMB control register to 1 */
>   	val |= TPDM_CMB_CR_ENA;
>   	writel_relaxed(val, drvdata->base + TPDM_CMB_CR);
> @@ -480,7 +510,7 @@ static void tpdm_disable_cmb(struct tpdm_drvdata *drvdata)
>   {
>   	u32 val;
>   
> -	if (!tpdm_has_cmb_dataset(drvdata))
> +	if (!drvdata->cmb)
>   		return;
>   
>   	val = readl_relaxed(drvdata->base + TPDM_CMB_CR);
> @@ -542,12 +572,14 @@ static int tpdm_datasets_setup(struct tpdm_drvdata *drvdata)
>   		if (!drvdata->dsb)
>   			return -ENOMEM;
>   	}
> -	if (tpdm_has_cmb_dataset(drvdata) && (!drvdata->cmb)) {
> +	if ((tpdm_has_cmb_dataset(drvdata) || tpdm_has_mcmb_dataset(drvdata))
> +			&& (!drvdata->cmb)) {
>   		drvdata->cmb = devm_kzalloc(drvdata->dev,
>   						sizeof(*drvdata->cmb), GFP_KERNEL);
>   		if (!drvdata->cmb)
>   			return -ENOMEM;
>   	}
> +
>   	tpdm_reset_datasets(drvdata);
>   
>   	return 0;
> diff --git a/drivers/hwtracing/coresight/coresight-tpdm.h b/drivers/hwtracing/coresight/coresight-tpdm.h
> index e08d212642e3..fd9153b92335 100644
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

Please could you move the CMB_CR related defintions together ?
i.e., closer to TPDM_CMB_CR_MODE

Suzuki

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
> @@ -256,6 +262,9 @@ struct dsb_dataset {
>    * @patt_ts:          Indicates if pattern match for timestamp is enabled.
>    * @trig_ts:          Indicates if CTI trigger for timestamp is enabled.
>    * @ts_all:           Indicates if timestamp is enabled for all packets.
> + * struct mcmb_dataset
> + * @mcmb_trig_lane:       Save data for trigger lane
> + * @mcmb_lane_select:     Save data for lane enablement
>    */
>   struct cmb_dataset {
>   	u32			trace_mode;
> @@ -267,6 +276,10 @@ struct cmb_dataset {
>   	bool			patt_ts;
>   	bool			trig_ts;
>   	bool			ts_all;
> +	struct {
> +		u8		trig_lane;
> +		u8		lane_select;
> +	} mcmb;
>   };
>   
>   /**
> @@ -324,14 +337,4 @@ struct tpdm_dataset_attribute {
>   	enum dataset_mem mem;
>   	u32 idx;
>   };
> -
> -static bool tpdm_has_dsb_dataset(struct tpdm_drvdata *drvdata)
> -{
> -	return (drvdata->datasets & TPDM_PIDR0_DS_DSB);
> -}
> -
> -static bool tpdm_has_cmb_dataset(struct tpdm_drvdata *drvdata)
> -{
> -	return (drvdata->datasets & TPDM_PIDR0_DS_CMB);
> -}
>   #endif  /* _CORESIGHT_CORESIGHT_TPDM_H */



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26373D767C3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 10:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vwYIvKAIcSKMxHZJ9znZVnNg22zfHHuj2tx849lmBJw=; b=kGBz0NkbfLQXqIjfdI0pT+/LKu
	2X7PYKZjYBGydckux2nnVWyxzglcYerRGnZrxlImcUiM/bavdQkMU0AG7X6H8P+mwn1pX5wIbYqbx
	NnNpshbaVqK/PaiW51ubgr/5LUGHvwehJtaLAsB74U20bjF1YkcKSzdeY0w4ZmehOcTtRV1mIYp6u
	yFx9wrSgWJRm9v3wMShSccSwGUE5izr7UzLpI/0NvZ8YvZW89BbzqDTAxxdegEEAsvZGbPBbQQiJc
	yRoTwoEkWbqPRu7YW+aa2pr7WYUGUiEv2sOhEaYrGdLLWE6bnL0wuRysdmPB5Ortv3bSpuLtZhEAh
	NWeVXdjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWXdZ-0000000A42t-3a16;
	Fri, 19 Dec 2025 10:23:05 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWXdX-0000000A42E-2FTO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 10:23:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 76211FEC;
	Fri, 19 Dec 2025 02:22:55 -0800 (PST)
Received: from [10.1.197.1] (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 590413F5CA;
	Fri, 19 Dec 2025 02:23:00 -0800 (PST)
Message-ID: <afc078d5-5855-4439-98ac-c132a2588627@arm.com>
Date: Fri, 19 Dec 2025 10:22:59 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] coresight: tpda: add sysfs nodes for tpda
 cross-trigger configuration
To: Jie Gan <jie.gan@oss.qualcomm.com>, Mike Leach <mike.leach@linaro.org>,
 James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Tao Zhang <tao.zhang@oss.qualcomm.com>
References: <20251219-add_sysfs_nodes_to_configure_tpda-v5-0-ca93ddfe9d30@oss.qualcomm.com>
 <20251219-add_sysfs_nodes_to_configure_tpda-v5-1-ca93ddfe9d30@oss.qualcomm.com>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20251219-add_sysfs_nodes_to_configure_tpda-v5-1-ca93ddfe9d30@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_022303_676297_4867C633 
X-CRM114-Status: GOOD (  33.66  )
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

On 19/12/2025 10:04, Jie Gan wrote:
> From: Tao Zhang <tao.zhang@oss.qualcomm.com>
> 
> Introduce sysfs nodes to configure cross-trigger parameters for TPDA.
> These registers define the characteristics of cross-trigger packets,
> including generation frequency and flag values.
> 
> Signed-off-by: Tao Zhang <tao.zhang@oss.qualcomm.com>
> Reviewed-by: James Clark <james.clark@linaro.org>
> Co-developed-by: Jie Gan <jie.gan@oss.qualcomm.com>
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
>   .../ABI/testing/sysfs-bus-coresight-devices-tpda   |  43 +++++++
>   drivers/hwtracing/coresight/coresight-tpda.c       | 138 ++++++++++++++++++++-
>   drivers/hwtracing/coresight/coresight-tpda.h       |  69 ++++++++++-
>   3 files changed, 243 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda
> new file mode 100644
> index 000000000000..a7855922328e
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda
> @@ -0,0 +1,43 @@
> +What:		/sys/bus/coresight/devices/<tpda-name>/global_cr/trig_async_enable
> +Date:		December 2025
> +KernelVersion:	6.19
> +Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang <tao.zhang@oss.qualcomm.com>, Jie Gan <jie.gan@oss.qualcomm.com>
> +Description:
> +		(RW) Enable/disable cross trigger synchronization sequence interface.
> +
> +What:		/sys/bus/coresight/devices/<tpda-name>/global_cr/trig_flag_ts_enable
> +Date:		December 2025
> +KernelVersion:	6.19
> +Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang <tao.zhang@oss.qualcomm.com>, Jie Gan <jie.gan@oss.qualcomm.com>
> +Description:
> +		(RW) Enable/disable cross trigger FLAG packet request interface.
> +
> +What:		/sys/bus/coresight/devices/<tpda-name>/global_cr/trig_freq_enable
> +Date:		December 2025
> +KernelVersion:	6.19
> +Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang <tao.zhang@oss.qualcomm.com>, Jie Gan <jie.gan@oss.qualcomm.com>
> +Description:
> +		(RW) Enable/disable cross trigger FREQ packet request interface.
> +
> +What:		/sys/bus/coresight/devices/<tpda-name>/global_cr/freq_ts_enable
> +Date:		December 2025
> +KernelVersion:	6.19
> +Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang <tao.zhang@oss.qualcomm.com>, Jie Gan <jie.gan@oss.qualcomm.com>
> +Description:
> +		(RW) Enable/disable the timestamp for all FREQ packets.
> +
> +What:		/sys/bus/coresight/devices/<tpda-name>/global_cr/global_flush_req
> +Date:		December 2025
> +KernelVersion:	6.19
> +Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang <tao.zhang@oss.qualcomm.com>, Jie Gan <jie.gan@oss.qualcomm.com>
> +Description:
> +		(RW) Set global (all ports) flush request bit. The bit remains set until a
> +		global flush request sequence completes.
> +
> +What:		/sys/bus/coresight/devices/<tpda-name>/global_cr/cmbchan_mode
> +Date:		December 2025
> +KernelVersion:	6.19
> +Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang <tao.zhang@oss.qualcomm.com>, Jie Gan <jie.gan@oss.qualcomm.com>
> +Description:
> +		(RW) Configure the CMB/MCMB channel mode for all enabled ports.
> +		Value 0 means raw channel mapping mode. Value 1 means channel pair marking mode.
> diff --git a/drivers/hwtracing/coresight/coresight-tpda.c b/drivers/hwtracing/coresight/coresight-tpda.c
> index 3a3825d27f86..d25a8bcfb3d4 100644
> --- a/drivers/hwtracing/coresight/coresight-tpda.c
> +++ b/drivers/hwtracing/coresight/coresight-tpda.c
> @@ -137,12 +137,32 @@ static int tpda_get_element_size(struct tpda_drvdata *drvdata,
>   /* Settings pre enabling port control register */
>   static void tpda_enable_pre_port(struct tpda_drvdata *drvdata)
>   {
> -	u32 val;
> +	u32 val = 0;
>   
> -	val = readl_relaxed(drvdata->base + TPDA_CR);
> -	val &= ~TPDA_CR_ATID;
>   	val |= FIELD_PREP(TPDA_CR_ATID, drvdata->atid);
> +	if (drvdata->trig_async)
> +		val |= TPDA_CR_SRIE;
> +
> +	if (drvdata->trig_flag_ts)
> +		val |= TPDA_CR_FLRIE;
> +
> +	if (drvdata->trig_freq)
> +		val |= TPDA_CR_FRIE;
> +
> +	if (drvdata->freq_ts)
> +		val |= TPDA_CR_FREQTS;
> +
> +	if (drvdata->cmbchan_mode)
> +		val |= TPDA_CR_CMBCHANMODE;
> +
>   	writel_relaxed(val, drvdata->base + TPDA_CR);
> +
> +	/*
> +	 * If FLRIE bit is set, set the master and channel
> +	 * id as zero
> +	 */
> +	if (drvdata->trig_flag_ts)
> +		writel_relaxed(0x0, drvdata->base + TPDA_FPID_CR);
>   }
>   
>   static int tpda_enable_port(struct tpda_drvdata *drvdata, int port)
> @@ -258,6 +278,116 @@ static const struct coresight_ops tpda_cs_ops = {
>   	.link_ops	= &tpda_link_ops,
>   };
>   
> +/* Read cross-trigger register member */
> +static ssize_t tpda_trig_sysfs_show(struct device *dev,
> +				    struct device_attribute *attr,
> +				    char *buf)
> +{
> +	struct tpda_trig_sysfs_attribute *tpda_attr =
> +		container_of(attr, struct tpda_trig_sysfs_attribute, attr);
> +	struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
> +	unsigned long val;
> +
> +	guard(spinlock)(&drvdata->spinlock);
> +	switch (tpda_attr->mem) {
> +	case FLREQ:
> +		if (!drvdata->csdev->refcnt)
> +			return -EINVAL;
> +
> +		val = readl_relaxed(drvdata->base + TPDA_CR);
> +		/* read global flush request bit only */
> +		val &= TPDA_CR_FLREQ;
> +		return sysfs_emit(buf, "%lu\n", val);
> +	case FREQTS:
> +		return sysfs_emit(buf, "%u\n", (unsigned int)drvdata->freq_ts);
> +	case FRIE:
> +		return sysfs_emit(buf, "%u\n", (unsigned int)drvdata->trig_freq);
> +	case FLRIE:
> +		return sysfs_emit(buf, "%u\n", (unsigned int)drvdata->trig_flag_ts);
> +	case SRIE:
> +		return sysfs_emit(buf, "%u\n", (unsigned int)drvdata->trig_async);
> +	case CMBCHANMODE:
> +		return sysfs_emit(buf, "%u\n", (unsigned int)drvdata->cmbchan_mode);
> +
> +	}
> +	return -EINVAL;
> +}
> +
> +static ssize_t tpda_trig_sysfs_store(struct device *dev,
> +				     struct device_attribute *attr,
> +				     const char *buf,
> +				     size_t size)
> +{
> +	struct tpda_trig_sysfs_attribute *tpda_attr =
> +		container_of(attr, struct tpda_trig_sysfs_attribute, attr);
> +	struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
> +	ssize_t ret = -EINVAL;
   +	unsigned long val;
> +
> +	if (kstrtoul(buf, 0, &val))
> +		return ret;

		return -EINVAL;

> +
> +	guard(spinlock)(&drvdata->spinlock);
> +	switch (tpda_attr->mem) {
> +	case FLREQ:
> +		if (!drvdata->csdev->refcnt || !val)
> +			return ret;
			return -EINVAL;

> +
> +		val = readl_relaxed(drvdata->base + TPDA_CR);

CS_UNLOCK before readl ? I didn't mean the global_flush_req to be
unified with the rest. Obviously it has different access semantics.


> +		/* set global flush request bit */
> +		val |= TPDA_CR_FLREQ;
> +		CS_UNLOCK(drvdata->base);
> +		writel_relaxed(val, drvdata->base + TPDA_CR);
> +		CS_LOCK(drvdata->base);
> +		ret = size;

Please remove this from all the cases and explicitly return -EINVAL in
the error cases.

> +		break;
> +	case FREQTS:
> +		drvdata->freq_ts = !!val;
> +		ret = size;
> +		break;
> +	case FRIE:
> +		drvdata->trig_freq = !!val;
> +		ret = size;
> +		break;
> +	case FLRIE:
> +		drvdata->trig_flag_ts = !!val;
> +		ret = size;
> +		break;
> +	case SRIE:
> +		drvdata->trig_async = !!val;
> +		ret = size;
> +		break;
> +	case CMBCHANMODE:
> +		drvdata->cmbchan_mode = !!val;
> +		ret = size;
> +		break;
> +	default:
		return -EINVAL;

> +		break;
> +	}
> +


> +	return ret;

	return size;

> +}
> +
> +static struct attribute *tpda_global_cr_attrs[] = {
> +	tpda_trig_sysfs_rw(global_flush_req, FLREQ),
> +	tpda_trig_sysfs_rw(freq_ts_enable, FREQTS),
> +	tpda_trig_sysfs_rw(trig_freq_enable, FRIE),
> +	tpda_trig_sysfs_rw(trig_flag_ts_enable, FLRIE),
> +	tpda_trig_sysfs_rw(trig_async_enable, SRIE),
> +	tpda_trig_sysfs_rw(cmbchan_mode, CMBCHANMODE),
> +	NULL,
> +};
> +
> +static struct attribute_group tpda_global_cr_attr_grp = {
> +	.attrs	= tpda_global_cr_attrs,
> +	.name	= "global_cr",
> +};
> +
> +static const struct attribute_group *tpda_attr_grps[] = {
> +	&tpda_global_cr_attr_grp,
> +	NULL,
> +};
> +
>   static int tpda_init_default_data(struct tpda_drvdata *drvdata)
>   {
>   	int atid;
> @@ -273,6 +403,7 @@ static int tpda_init_default_data(struct tpda_drvdata *drvdata)
>   		return atid;
>   
>   	drvdata->atid = atid;
> +	drvdata->freq_ts = true;
>   	return 0;
>   }
>   
> @@ -316,6 +447,7 @@ static int tpda_probe(struct amba_device *adev, const struct amba_id *id)
>   	desc.ops = &tpda_cs_ops;
>   	desc.pdata = adev->dev.platform_data;
>   	desc.dev = &adev->dev;
> +	desc.groups = tpda_attr_grps;
>   	desc.access = CSDEV_ACCESS_IOMEM(base);
>   	drvdata->csdev = coresight_register(&desc);
>   	if (IS_ERR(drvdata->csdev))
> diff --git a/drivers/hwtracing/coresight/coresight-tpda.h b/drivers/hwtracing/coresight/coresight-tpda.h
> index c6af3d2da3ef..8a075cfbc3cc 100644
> --- a/drivers/hwtracing/coresight/coresight-tpda.h
> +++ b/drivers/hwtracing/coresight/coresight-tpda.h
> @@ -1,6 +1,6 @@
>   /* SPDX-License-Identifier: GPL-2.0 */
>   /*
> - * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) 2023,2025 Qualcomm Innovation Center, Inc. All rights reserved.
>    */
>   
>   #ifndef _CORESIGHT_CORESIGHT_TPDA_H
> @@ -8,6 +8,30 @@
>   
>   #define TPDA_CR			(0x000)
>   #define TPDA_Pn_CR(n)		(0x004 + (n * 4))
> +#define TPDA_FPID_CR		(0x084)
> +
> +/* Cross trigger Global (all ports) flush request bit */
> +#define TPDA_CR_FLREQ		BIT(0)
> +/* Cross trigger FREQ packets timestamp bit */
> +#define TPDA_CR_FREQTS		BIT(2)
> +/* Cross trigger FREQ packet request bit */
> +#define TPDA_CR_FRIE		BIT(3)
> +/* Cross trigger FLAG packet request interface bit */
> +#define TPDA_CR_FLRIE		BIT(4)
> +/* Cross trigger synchronization bit */
> +#define TPDA_CR_SRIE		BIT(5)
> +/* Bits 6 ~ 12 is for atid value */
> +#define TPDA_CR_ATID		GENMASK(12, 6)
> +/* Bits 13 ~ 19 is for mid value */
> +/* Assign a unique master ID to identify the TPDA device */
> +#define TPDA_CR_MID		GENMASK(19, 13)

Where do we use this ? Does this need to be preserved ?
Is this programmable ?

Suzuki

> +/*
> + * Channel mode bit of the packetization of CMB/MCB traffic
> + * 0 - raw channel mapping mode
> + * 1 - channel pair marking mode
> + */
> +#define TPDA_CR_CMBCHANMODE	BIT(20)
> +
>   /* Aggregator port enable bit */
>   #define TPDA_Pn_CR_ENA		BIT(0)
>   /* Aggregator port CMB data set element size bit */
> @@ -17,9 +41,6 @@
>   
>   #define TPDA_MAX_INPORTS	32
>   
> -/* Bits 6 ~ 12 is for atid value */
> -#define TPDA_CR_ATID		GENMASK(12, 6)
> -
>   /**
>    * struct tpda_drvdata - specifics associated to an TPDA component
>    * @base:       memory mapped base address for this component.
> @@ -29,6 +50,11 @@
>    * @enable:     enable status of the component.
>    * @dsb_esize   Record the DSB element size.
>    * @cmb_esize   Record the CMB element size.
> + * @trig_async:	Enable/disable cross trigger synchronization sequence interface.
> + * @trig_flag_ts: Enable/disable cross trigger FLAG packet request interface.
> + * @trig_freq:	Enable/disable cross trigger FREQ packet request interface.
> + * @freq_ts:	Enable/disable the timestamp for all FREQ packets.
> + * @cmbchan_mode: Configure the CMB/MCMB channel mode.
>    */
>   struct tpda_drvdata {
>   	void __iomem		*base;
> @@ -38,6 +64,41 @@ struct tpda_drvdata {
>   	u8			atid;
>   	u32			dsb_esize;
>   	u32			cmb_esize;
> +	bool			trig_async;
> +	bool			trig_flag_ts;
> +	bool			trig_freq;
> +	bool			freq_ts;
> +	bool			cmbchan_mode;
> +};
> +
> +/* Enumerate members of global control register(cr) */
> +enum tpda_cr_mem {
> +	FLREQ,
> +	FREQTS,
> +	FRIE,
> +	FLRIE,
> +	SRIE,
> +	CMBCHANMODE
> +};
> +
> +/**
> + * struct tpda_trig_sysfs_attribute - Record the member variables of cross
> + * trigger register that need to be operated by sysfs file
> + * @attr:	The device attribute
> + * @mem:	The member in the control register data structure
> + */
> +struct tpda_trig_sysfs_attribute {
> +	struct device_attribute attr;
> +	enum tpda_cr_mem mem;
>   };
>   
> +#define tpda_trig_sysfs_rw(name, mem)				\
> +	(&((struct tpda_trig_sysfs_attribute[]) {		\
> +	   {							\
> +		__ATTR(name, 0644, tpda_trig_sysfs_show,	\
> +		tpda_trig_sysfs_store),				\
> +		mem,						\
> +	   }							\
> +	   })[0].attr.attr)
> +
>   #endif  /* _CORESIGHT_CORESIGHT_TPDA_H */
> 



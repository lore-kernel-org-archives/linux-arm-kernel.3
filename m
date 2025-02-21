Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E506C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 11:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fff+wYzu31F+HMc/kDmvuBJ+pCi1ldYVP76Lf97rRJU=; b=U9lHNYjqEZB1TYlIg7BCey/NIW
	/zovjzdoOU9VOmDISj/dGGXRswGbDJJ9MxvAFUD3exnsy4xjmmDP2Lr19jda4FM31M+eapoPxFSRg
	tP72n/hQgG+lxAF9NKa9cqH4B8ZDu9VdvWHMM7lmnAuo7/j9Vu1RK5DjGPT1tI+YvuMmEf9bc6c7/
	S7JUVdWRBrwSXaZQLf3K31CgeNkB4BTqDqlbhpO2iKiQDI+D9om2rH8kvuy/RGU9OKFY8OUFDQp9R
	7rjq/B+uMO5J9N5j9bcp8TG1pMnZ0mrmrTGVj55yvbbhRPKWm+bW31rNuB9liOkiUKCO38WpHyatl
	WYVZSXdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlRSe-00000005NJ2-0ZX8;
	Fri, 21 Feb 2025 11:44:52 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlRNb-00000005Lxm-3sfr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Feb 2025 11:39:41 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C597E1516;
	Fri, 21 Feb 2025 03:39:56 -0800 (PST)
Received: from [10.57.36.38] (unknown [10.57.36.38])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D3F393F59E;
	Fri, 21 Feb 2025 03:39:35 -0800 (PST)
Message-ID: <35d1a923-4e8e-4fe2-bf4a-0b78b1d511e3@arm.com>
Date: Fri, 21 Feb 2025 11:39:34 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 6/7] Coresight: Add Coresight TMC Control Unit driver
Content-Language: en-GB
To: Jie Gan <quic_jiegan@quicinc.com>, Mike Leach <mike.leach@linaro.org>,
 James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Tingwei Zhang <quic_tingweiz@quicinc.com>,
 Jinlong Mao <quic_jinlmao@quicinc.com>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20250217093024.1133096-1-quic_jiegan@quicinc.com>
 <20250217093024.1133096-7-quic_jiegan@quicinc.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20250217093024.1133096-7-quic_jiegan@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_033940_063665_D6891523 
X-CRM114-Status: GOOD (  46.28  )
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

On 17/02/2025 09:30, Jie Gan wrote:
> The Coresight TMC Control Unit hosts miscellaneous configuration registers
> which control various features related to TMC ETR sink.
> 
> Based on the trace ID, which is programmed in the related CTCU ATID
> register of a specific ETR, trace data with that trace ID gets into
> the ETR buffer, while other trace data gets dropped.
> 
> Enabling source device sets one bit of the ATID register based on
> source device's trace ID.
> Disabling source device resets the bit according to the source
> device's trace ID.
> 
> Reviewed-by: James Clark <james.clark@linaro.org>
> Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
> ---
>   drivers/hwtracing/coresight/Kconfig          |  12 +
>   drivers/hwtracing/coresight/Makefile         |   1 +
>   drivers/hwtracing/coresight/coresight-ctcu.c | 268 +++++++++++++++++++
>   drivers/hwtracing/coresight/coresight-ctcu.h |  24 ++
>   include/linux/coresight.h                    |   3 +-
>   5 files changed, 307 insertions(+), 1 deletion(-)
>   create mode 100644 drivers/hwtracing/coresight/coresight-ctcu.c
>   create mode 100644 drivers/hwtracing/coresight/coresight-ctcu.h
> 
> diff --git a/drivers/hwtracing/coresight/Kconfig b/drivers/hwtracing/coresight/Kconfig
> index 06f0a7594169..ecd7086a5b83 100644
> --- a/drivers/hwtracing/coresight/Kconfig
> +++ b/drivers/hwtracing/coresight/Kconfig
> @@ -133,6 +133,18 @@ config CORESIGHT_STM
>   	  To compile this driver as a module, choose M here: the
>   	  module will be called coresight-stm.
>   
> +config CORESIGHT_CTCU
> +	tristate "CoreSight TMC Control Unit driver"
> +	depends on CORESIGHT_LINK_AND_SINK_TMC
> +	help
> +	  This driver provides support for CoreSight TMC Control Unit
> +	  that hosts miscellaneous configuration registers. This is
> +	  primarily used for controlling the behaviors of the TMC
> +	  ETR device.
> +
> +	  To compile this driver as a module, choose M here: the
> +	  module will be called coresight-ctcu.
> +
>   config CORESIGHT_CPU_DEBUG
>   	tristate "CoreSight CPU Debug driver"
>   	depends on ARM || ARM64
> diff --git a/drivers/hwtracing/coresight/Makefile b/drivers/hwtracing/coresight/Makefile
> index 4ba478211b31..1b7869910a12 100644
> --- a/drivers/hwtracing/coresight/Makefile
> +++ b/drivers/hwtracing/coresight/Makefile
> @@ -51,3 +51,4 @@ coresight-cti-y := coresight-cti-core.o	coresight-cti-platform.o \
>   		   coresight-cti-sysfs.o
>   obj-$(CONFIG_ULTRASOC_SMB) += ultrasoc-smb.o
>   obj-$(CONFIG_CORESIGHT_DUMMY) += coresight-dummy.o
> +obj-$(CONFIG_CORESIGHT_CTCU) += coresight-ctcu.o
> diff --git a/drivers/hwtracing/coresight/coresight-ctcu.c b/drivers/hwtracing/coresight/coresight-ctcu.c
> new file mode 100644
> index 000000000000..e1460a627c4d
> --- /dev/null
> +++ b/drivers/hwtracing/coresight/coresight-ctcu.c
> @@ -0,0 +1,268 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2024-2025 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/coresight.h>
> +#include <linux/device.h>
> +#include <linux/err.h>
> +#include <linux/kernel.h>
> +#include <linux/init.h>
> +#include <linux/io.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>
> +
> +#include "coresight-ctcu.h"
> +#include "coresight-priv.h"
> +
> +DEFINE_CORESIGHT_DEVLIST(ctcu_devs, "ctcu");
> +
> +#define ctcu_writel(drvdata, val, offset)	__raw_writel((val), drvdata->base + offset)
> +#define ctcu_readl(drvdata, offset)		__raw_readl(drvdata->base + offset)
> +
> +/*
> + * The TMC Coresight Control Unit uses four ATID registers to control the data
> + * filter function based on the trace ID for each TMC ETR sink. The length of
> + * each ATID register is 32 bits. Therefore, the ETR has a related field in
> + * CTCU that is 128 bits long. Each trace ID is represented by one bit in that
> + * filed.
> + * e.g. ETR0ATID0 layout, set bit 5 for traceid 5
> + *                                           bit5
> + * ------------------------------------------------------
> + * |   |28|   |24|   |20|   |16|   |12|   |8|  1|4|   |0|
> + * ------------------------------------------------------
> + *
> + * e.g. ETR0:
> + * 127                     0 from ATID_offset for ETR0ATID0
> + * -------------------------
> + * |ATID3|ATID2|ATID1|ATID0|
> + */
> +#define CTCU_ATID_REG_OFFSET(traceid, atid_offset) \
> +		((traceid / 32) * 4 + atid_offset)
> +
> +#define CTCU_ATID_REG_BIT(traceid)	(traceid % 32)
> +#define CTCU_ATID_REG_SIZE		0x10
> +
> +struct ctcu_atid_config {
> +	const u32 atid_offset;
> +	const u32 port_num;
> +};
> +
> +struct ctcu_config {
> +	const struct ctcu_atid_config *atid_config;
> +	int num_atid_config;
> +};
> +
> +static const struct ctcu_atid_config sa8775p_atid_cfgs[] = {
> +	{0xf8,  0},
> +	{0x108, 1},
> +};
> +
> +static const struct ctcu_config sa8775p_cfgs = {
> +	.atid_config		= sa8775p_atid_cfgs,
> +	.num_atid_config	= ARRAY_SIZE(sa8775p_atid_cfgs),
> +};
> +
> +static void ctcu_program_atid_register(struct ctcu_drvdata *drvdata, u32 reg_offset,
> +				       u8 bit, bool enable)
> +{
> +	u32 val;
> +
> +	CS_UNLOCK(drvdata->base);
> +	val = ctcu_readl(drvdata, reg_offset);
> +	val = enable? (val | BIT(bit)) : (val & ~BIT(bit));

minor nit: If possible do not use the ternary operator like this. It is 
much better readable as:

	if (enable)
		val |= BIT(bit);
	else
		val &= ~BIT(bit);

> +	ctcu_writel(drvdata, val, reg_offset);
> +	CS_LOCK(drvdata->base);
> +}
> +
> +/*
> + * __ctcu_set_etr_traceid: Set bit in the ATID register based on trace ID when enable is true.
> + * Reset the bit of the ATID register based on trace ID when enable is false.
> + *
> + * @csdev:	coresight_device struct related to the device
> + * @traceid:	trace ID of the source tracer.
> + * @port_num:	port number from TMC ETR sink.
> + * @enable:	True for set bit and false for reset bit.
> + *
> + * Returns 0 indicates success. Non-zero result means failure.
> + */
> +static int __ctcu_set_etr_traceid(struct coresight_device *csdev, u8 traceid, int port_num,
> +				  bool enable)
> +{
> +	struct ctcu_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
> +	u32 atid_offset, reg_offset;
> +	u8 refcnt, bit;
> +
> +	atid_offset = drvdata->atid_offset[port_num];
> +	if (atid_offset == 0)
> +		return -EINVAL;
> +
> +	bit = CTCU_ATID_REG_BIT(traceid);
> +	reg_offset = CTCU_ATID_REG_OFFSET(traceid, atid_offset);
> +	if (reg_offset - atid_offset > CTCU_ATID_REG_SIZE)
> +		return -EINVAL;
> +
> +	guard(raw_spinlock_irqsave)(&drvdata->spin_lock);
> +	refcnt = drvdata->traceid_refcnt[port_num][traceid];
> +	/* Only program the atid register when the refcnt value is 0 or 1 */

A normal trace source won't be enabled more than once (e.g., ETM). The 
only odd one out is the STM, which may be driven by multiple agents.
So this refcounting looks necessary.

> +	if (enable && (++refcnt == 1))
> +		ctcu_program_atid_register(drvdata, reg_offset, bit, enable);
> +	else if (!enable && (--refcnt == 0))
> +		ctcu_program_atid_register(drvdata, reg_offset, bit, enable);

minor nit:

	if ((enable && !refcount++) ||
	    (!enable && --refcount))
		ctcu_program_atid_register(drvdata, reg_offset, bit, enable);


Also, see my comment the bottom for "refcount" being u8 .


> +
> +	drvdata->traceid_refcnt[port_num][traceid] = refcnt;
> +
> +	return 0;
> +}
> +
> +static int ctcu_get_active_port(struct coresight_device *sink, struct coresight_device *helper)
> +{
> +	int i;
> +
> +	for (i = 0; i < sink->pdata->nr_outconns; ++i) {
> +		if (sink->pdata->out_conns[i]->dest_dev)
> +			return sink->pdata->out_conns[i]->dest_port;

Don't we need to make sure it matches the helper ? What if there are 
multiple helpers ? e.g, a CATU connected to the ETR and CTCU ?
Or even try the opposite ? i.e. search the helper and find the port
matching the sink ?

	struct coresight_platform_data *pdata = helper->pdata;

	for (i = 0; i < pdata->nr_inconns; ++i)
		if (pdata->in_conns[i]->dest_dev == sink)
			return pdata->in_conns[i]->src_port;

Not sure if that works with the helper device connection, James ?


> +	}
> +
> +	return -EINVAL;
> +}
> +
> +static int ctcu_set_etr_traceid(struct coresight_device *csdev, struct coresight_path *path,
> +				bool enable)
> +{
> +	struct coresight_device *sink = coresight_get_sink(path);
> +	u8 traceid = path->trace_id;
> +	int port_num;
> +
> +	if ((sink == NULL) || !IS_VALID_CS_TRACE_ID(traceid)) {
> +		dev_err(&csdev->dev, "Invalid parameters\n");
> +		return -EINVAL;
> +	}
> +
> +	port_num = ctcu_get_active_port(sink, csdev);
> +	if (port_num < 0)
> +		return -EINVAL;
> +
> +	dev_dbg(&csdev->dev, "traceid is %d\n", traceid);
> +
> +	return __ctcu_set_etr_traceid(csdev, traceid, port_num, enable);
> +}
> +
> +static int ctcu_enable(struct coresight_device *csdev, enum cs_mode mode,
> +		       void *data)
> +{
> +	struct coresight_path *path = (struct coresight_path *)data;
> +
> +	return ctcu_set_etr_traceid(csdev, path, true);
> +}
> +
> +static int ctcu_disable(struct coresight_device *csdev, void *data)
> +{
> +	struct coresight_path *path = (struct coresight_path *)data;
> +
> +	return ctcu_set_etr_traceid(csdev, path, false);
> +}
> +
> +static const struct coresight_ops_helper ctcu_helper_ops = {
> +	.enable = ctcu_enable,
> +	.disable = ctcu_disable,
> +};
> +
> +static const struct coresight_ops ctcu_ops = {
> +	.helper_ops = &ctcu_helper_ops,
> +};
> +
> +static int ctcu_probe(struct platform_device *pdev)
> +{
> +	int i;
> +	void __iomem *base;
> +	struct device *dev = &pdev->dev;
> +	struct coresight_platform_data *pdata;
> +	struct ctcu_drvdata *drvdata;
> +	struct coresight_desc desc = { 0 };
> +	const struct ctcu_config *cfgs;
> +	const struct ctcu_atid_config *atid_cfg;
> +
> +	desc.name = coresight_alloc_device_name(&ctcu_devs, dev);
> +	if (!desc.name)
> +		return -ENOMEM;
> +
> +	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
> +	if (!drvdata)
> +		return -ENOMEM;
> +
> +	pdata = coresight_get_platform_data(dev);
> +	if (IS_ERR(pdata))
> +		return PTR_ERR(pdata);
> +	dev->platform_data = pdata;
> +
> +	base = devm_platform_get_and_ioremap_resource(pdev, 0, NULL);
> +	if (!base)
> +		return -ENOMEM;
> +
> +	drvdata->apb_clk = coresight_get_enable_apb_pclk(dev);
> +	if (IS_ERR(drvdata->apb_clk))
> +		return -ENODEV;
> +
> +	cfgs = of_device_get_match_data(dev);
> +	if (cfgs) {
> +		if (cfgs->num_atid_config <= ATID_MAX_NUM) {
> +			for (i = 0; i < cfgs->num_atid_config; i++) {
> +				atid_cfg = &cfgs->atid_config[i];
> +				drvdata->atid_offset[i] = atid_cfg->atid_offset;
> +			}
> +		}
> +	}
> +
> +	drvdata->base = base;
> +	drvdata->dev = dev;
> +	platform_set_drvdata(pdev, drvdata);
> +
> +	desc.type = CORESIGHT_DEV_TYPE_HELPER;
> +	desc.subtype.helper_subtype = CORESIGHT_DEV_SUBTYPE_HELPER_CTCU;
> +	desc.pdata = pdata;
> +	desc.dev = dev;
> +	desc.ops = &ctcu_ops;

Please set the desc.access

	desc.access = CSDEV_ACCESS_IOMEM(drvdata->base);

> +
> +	drvdata->csdev = coresight_register(&desc);
> +	if (IS_ERR(drvdata->csdev)) {
> +		if (!IS_ERR_OR_NULL(drvdata->apb_clk))
> +			clk_put(drvdata->apb_clk);
> +
> +		return PTR_ERR(drvdata->csdev);
> +	}
> +
> +	return 0;
> +}
> +
> +static void ctcu_remove(struct platform_device *pdev)
> +{
> +	struct ctcu_drvdata *drvdata = platform_get_drvdata(pdev);
> +
> +	coresight_unregister(drvdata->csdev);
> +	if (!IS_ERR_OR_NULL(drvdata->apb_clk))
> +		clk_put(drvdata->apb_clk);

Why isn't the clock get/put at runtime via pm_runtime calls ?
See coresight-replicator driver for e.g.


> +}
> +
> +static const struct of_device_id ctcu_match[] = {
> +	{.compatible = "qcom,sa8775p-ctcu", .data = &sa8775p_cfgs},
> +	{}
> +};
> +
> +static struct platform_driver ctcu_driver = {
> +	.probe          = ctcu_probe,
> +	.remove         = ctcu_remove,
> +	.driver         = {
> +		.name   = "coresight-ctcu",
> +		.of_match_table = ctcu_match,
> +		.suppress_bind_attrs = true,
> +	},
> +};
> +module_platform_driver(ctcu_driver);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_DESCRIPTION("CoreSight TMC Control Unit driver");
> diff --git a/drivers/hwtracing/coresight/coresight-ctcu.h b/drivers/hwtracing/coresight/coresight-ctcu.h
> new file mode 100644
> index 000000000000..9890c3da5ec8
> --- /dev/null
> +++ b/drivers/hwtracing/coresight/coresight-ctcu.h
> @@ -0,0 +1,24 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2024-2025 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#ifndef _CORESIGHT_CTCU_H
> +#define _CORESIGHT_CTCU_H
> +#include "coresight-trace-id.h"
> +
> +/* Maximum number of supported sink devices for a single CTCU in current projects. */
> +#define ATID_MAX_NUM 	2
> +
> +struct ctcu_drvdata {
> +	void __iomem		*base;
> +	struct clk		*apb_clk;
> +	phys_addr_t		pbase;

Where is this used ?

> +	struct device		*dev;
> +	struct coresight_device	*csdev;
> +	raw_spinlock_t		spin_lock;
> +	u32			atid_offset[ATID_MAX_NUM];
> +	/* refcnt for each traceid of each sink */
> +	u8			traceid_refcnt[ATID_MAX_NUM][CORESIGHT_TRACE_ID_RES_TOP];

Hopefully u8 is sufficient, but is it ? Why don't we check this in 
"enable" path to see if we are going to overflow ?



> +};
> +#endif
> diff --git a/include/linux/coresight.h b/include/linux/coresight.h
> index 03d833a15726..55bb825d509e 100644
> --- a/include/linux/coresight.h
> +++ b/include/linux/coresight.h
> @@ -71,7 +71,8 @@ enum coresight_dev_subtype_source {
>   
>   enum coresight_dev_subtype_helper {
>   	CORESIGHT_DEV_SUBTYPE_HELPER_CATU,
> -	CORESIGHT_DEV_SUBTYPE_HELPER_ECT_CTI
> +	CORESIGHT_DEV_SUBTYPE_HELPER_ECT_CTI,
> +	CORESIGHT_DEV_SUBTYPE_HELPER_CTCU,
>   };
>   
>   /**



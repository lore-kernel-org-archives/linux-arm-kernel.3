Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6053606A328
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 12:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BrmJk1c+;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=XUuW51sz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=DyTF3dyvS5SSGFIBcrhN4ZmURkgy5Sbn/dGYPAONXqM=; b=BrmJk1c+i7uc5U
	kuZ7qaU4xE9BAivAlssA+/Omroixz9FF8ASq7CHGW4Tto0M3GgMMP1Vz5F7SyOW4KFrRd57GrcpA+
	21QpjajuIylE0laVvr54kYrpmYpHiPrIok+UBz9xu8MPWBSnV8uKqseUZ0PysoIehTHq6aYD+oz3j
	ggJXm8B85Ob35IK0JWXa+ghx2wYYMagiIOaaRKUZtv49OeFXOPb4acyLECZMMx7S4l/OC7AhLWMXZ
	BiaVOWpHXzumNXTjdNEYvO5HUu174Mmc7yC3PYnWNUFDqWEf3V8u/IlRYG+/sV0lHDLhrhyD8pKZA
	6N72qWQnIm5iwwxWUlKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOwe1-00000008yGa-2Anj;
	Thu, 05 Nov 2026 12:32:41 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOwdx-00000008yFF-3yTv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 12:32:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7E6DB1516;
	Thu,  5 Nov 2026 04:32:33 -0800 (PST)
Received: from [10.2.197.99] (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 844DC3F673;
	Thu,  5 Nov 2026 04:32:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793881956; bh=sOJfsNiRaIqkJeRVq2myKYTsgRpSmfg+roVcJPV2SFA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XUuW51szJyTqemAxFw9UWx4FPuqHfs88Ikvh66VJhCpcBQt3c+fn7CcTW4XtPaeuJ
	 sZwL9KFCcEgGbpwIHdaCDgak2PeLSLGCPHXRs8p+towqG1qJGhUyDuxxySnrMUDTAH
	 Tyg63Z30AWsRJLHyVUHMN69JnMGqwEyx2pScawsc=
Message-ID: <55e1da04-1e8b-4783-a4db-0f154d8ec10e@arm.com>
Date: Thu, 5 Nov 2026 12:32:33 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 2/7] qcom-tgu: Add TGU driver
To: Songwei Chai <songwei.chai@oss.qualcomm.com>, andersson@kernel.org,
 alexander.shishkin@linux.intel.com, mike.leach@linaro.org,
 konrad.dybcio@oss.qualcomm.com, james.clark@arm.com, krzk+dt@kernel.org,
 conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
 devicetree@vger.kernel.org, gregkh@linuxfoundation.org,
 Jie Gan <jie.gan@oss.qualcomm.com>
References: <20260730080704.2903540-1-songwei.chai@oss.qualcomm.com>
 <20260730080704.2903540-3-songwei.chai@oss.qualcomm.com>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20260730080704.2903540-3-songwei.chai@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_043238_072290_5503D662 
X-CRM114-Status: GOOD (  40.32  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-22.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 30/07/2026 09:06, Songwei Chai wrote:
> Add driver to support device TGU (Trigger Generation Unit).
> TGU is a Data Engine which can be utilized to sense a plurality of
> signals and create a trigger into the CTI or generate interrupts to
> processors. Add probe/enable/disable functions for tgu.
> 
> Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
> Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
>   .../ABI/testing/sysfs-bus-amba-devices-tgu    |   9 +
>   MAINTAINERS                                   |  11 +
>   drivers/Makefile                              |   1 +
>   drivers/hwtracing/Kconfig                     |   2 +
>   drivers/hwtracing/qcom/Kconfig                |  20 ++
>   drivers/hwtracing/qcom/Makefile               |   3 +
>   drivers/hwtracing/qcom/tgu.c                  | 192 ++++++++++++++++++
>   drivers/hwtracing/qcom/tgu.h                  |  51 +++++
>   8 files changed, 289 insertions(+)
>   create mode 100644 Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
>   create mode 100644 drivers/hwtracing/qcom/Kconfig
>   create mode 100644 drivers/hwtracing/qcom/Makefile
>   create mode 100644 drivers/hwtracing/qcom/tgu.c
>   create mode 100644 drivers/hwtracing/qcom/tgu.h
> 
> diff --git a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
> new file mode 100644
> index 000000000000..36ab64f1e301
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
> @@ -0,0 +1,9 @@
> +What:		/sys/bus/amba/devices/<tgu-name>/enable_tgu
> +Date:		August 2026
> +KernelVersion:	7.2
> +Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
> +Description:
> +		(RW) Set/Get the enable/disable status of TGU
> +		Accepts only one of the 2 values -  0 or 1.
> +		0 : disable TGU.
> +		1 : enable TGU.
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ce5c5185c773..4789321cca6d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -22360,6 +22360,17 @@ S:	Maintained
>   F:	Documentation/tee/qtee.rst
>   F:	drivers/tee/qcomtee/
>   
> +QUALCOMM HARDWARETRACING DRIVER
> +M:	Songwei Chai <songwei.chai@oss.qualcomm.com>
> +M:	Jie Gan <jie.gan@oss.qualcomm.com>
> +M:	Suzuki K Poulose <suzuki.poulose@arm.com>
> +L:	linux-arm-msm@vger.kernel.org
> +S:	Maintained
> +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/coresight/linux.git
> +F:	Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
> +F:	Documentation/devicetree/bindings/arm/qcom,tgu.yaml
> +F:	drivers/hwtracing/qcom/
> +
>   QUALCOMM TRUST ZONE MEMORY ALLOCATOR
>   M:	Bartosz Golaszewski <brgl@kernel.org>
>   L:	linux-arm-msm@vger.kernel.org
> diff --git a/drivers/Makefile b/drivers/Makefile
> index 0841ea851847..6a2cbe5b340f 100644
> --- a/drivers/Makefile
> +++ b/drivers/Makefile
> @@ -176,6 +176,7 @@ obj-$(CONFIG_RAS)		+= ras/
>   obj-$(CONFIG_USB4)		+= thunderbolt/
>   obj-$(CONFIG_CORESIGHT)		+= hwtracing/coresight/
>   obj-y				+= hwtracing/intel_th/
> +obj-y				+= hwtracing/qcom/
>   obj-$(CONFIG_STM)		+= hwtracing/stm/
>   obj-$(CONFIG_HISI_PTT)		+= hwtracing/ptt/
>   obj-y				+= android/
> diff --git a/drivers/hwtracing/Kconfig b/drivers/hwtracing/Kconfig
> index 911ee977103c..8a640218eed8 100644
> --- a/drivers/hwtracing/Kconfig
> +++ b/drivers/hwtracing/Kconfig
> @@ -7,4 +7,6 @@ source "drivers/hwtracing/intel_th/Kconfig"
>   
>   source "drivers/hwtracing/ptt/Kconfig"
>   
> +source "drivers/hwtracing/qcom/Kconfig"
> +
>   endmenu
> diff --git a/drivers/hwtracing/qcom/Kconfig b/drivers/hwtracing/qcom/Kconfig
> new file mode 100644
> index 000000000000..5c94c75ffa39
> --- /dev/null
> +++ b/drivers/hwtracing/qcom/Kconfig
> @@ -0,0 +1,20 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +#
> +# QCOM specific hwtracing drivers
> +#
> +menu "Qualcomm specific hwtracing drivers"
> +
> +config QCOM_TGU
> +	tristate "QCOM Trigger Generation Unit driver"
> +	depends on ARCH_QCOM || COMPILE_TEST
> +	depends on ARM_AMBA
> +	help
> +	  This driver provides support for Trigger Generation Unit that is
> +	  used to detect patterns or sequences on a given set of signals.
> +	  TGU is used to monitor a particular bus within a given region to
> +	  detect illegal transaction sequences or slave responses. It is also
> +	  used to monitor a data stream to detect protocol violations and to
> +	  provide a trigger point for centering data around a specific event
> +	  within the trace data buffer.
> +
> +endmenu
> diff --git a/drivers/hwtracing/qcom/Makefile b/drivers/hwtracing/qcom/Makefile
> new file mode 100644
> index 000000000000..5a0a868c1ea0
> --- /dev/null
> +++ b/drivers/hwtracing/qcom/Makefile
> @@ -0,0 +1,3 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +obj-$(CONFIG_QCOM_TGU) += tgu.o
> diff --git a/drivers/hwtracing/qcom/tgu.c b/drivers/hwtracing/qcom/tgu.c
> new file mode 100644
> index 000000000000..9c7dd4a09f02
> --- /dev/null
> +++ b/drivers/hwtracing/qcom/tgu.c
> @@ -0,0 +1,192 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include <linux/amba/bus.h>
> +#include <linux/device.h>
> +#include <linux/err.h>
> +#include <linux/io.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/of.h>
> +#include <linux/pm_runtime.h>
> +
> +#include "tgu.h"
> +
> +static void tgu_write_all_hw_regs(struct tgu_drvdata *drvdata)
> +{
> +	TGU_UNLOCK(drvdata->base);
> +	/* Enable TGU to program the triggers */
> +	writel(1, drvdata->base + TGU_CONTROL);
> +	TGU_LOCK(drvdata->base);
> +}
> +
> +static void tgu_enable(struct tgu_drvdata *drvdata)
> +{
> +	tgu_write_all_hw_regs(drvdata);
> +	drvdata->enabled = true;
> +}
> +
> +static void tgu_disable(struct tgu_drvdata *drvdata)
> +{
> +	TGU_UNLOCK(drvdata->base);
> +	writel(0, drvdata->base + TGU_CONTROL);
> +	TGU_LOCK(drvdata->base);
> +
> +	drvdata->enabled = false;
> +}
> +
> +static ssize_t enable_tgu_show(struct device *dev,
> +			       struct device_attribute *attr, char *buf)
> +{
> +	struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
> +	bool enabled;
> +
> +	scoped_guard(mutex, &drvdata->lock)
> +		enabled = drvdata->enabled;
> +
> +	return sysfs_emit(buf, "%d\n", enabled);
> +}
> +
> +/* enable_tgu_store - Enable or disable the Trigger Generation Unit (TGU). */
> +static ssize_t enable_tgu_store(struct device *dev,
> +				struct device_attribute *attr,
> +				const char *buf,
> +				size_t size)
> +{
> +	struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
> +	unsigned long val;
> +	int ret;
> +
> +	ret = kstrtoul(buf, 0, &val);
> +	if (ret || val > 1)
> +		return -EINVAL;
> +
> +	/*
> +	 * Hold the mutex across the whole check-and-act sequence: the check of
> +	 * drvdata->enabled, the PM runtime reference counting and the state
> +	 * update must be atomic, otherwise concurrent writers could each
> +	 * imbalance the PM runtime usage counter.
> +	 */
> +	guard(mutex)(&drvdata->lock);
> +
> +	if (val) {
> +		if (drvdata->enabled)
> +			return -EBUSY;
> +
> +		ret = pm_runtime_resume_and_get(dev);
> +		if (ret)
> +			return ret;
> +
> +		tgu_enable(drvdata);
> +	} else {
> +		if (!drvdata->enabled)
> +			return -EINVAL;
> +
> +		tgu_disable(drvdata);
> +		pm_runtime_put(dev);
> +	}
> +
> +	return size;
> +}
> +static DEVICE_ATTR_RW(enable_tgu);
> +
> +static struct attribute *tgu_common_attrs[] = {
> +	&dev_attr_enable_tgu.attr,
> +	NULL,
> +};
> +
> +static const struct attribute_group tgu_common_grp = {
> +	.attrs = tgu_common_attrs,
> +};
> +
> +static const struct attribute_group *tgu_attr_groups[] = {
> +	&tgu_common_grp,
> +	NULL,
> +};
> +
> +static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
> +{
> +	struct device *dev = &adev->dev;
> +	struct tgu_drvdata *drvdata;
> +	int ret;
> +
> +	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
> +	if (!drvdata)
> +		return -ENOMEM;
> +
> +	drvdata->dev = &adev->dev;
> +	dev_set_drvdata(dev, drvdata);
> +
> +	drvdata->base = devm_ioremap_resource(dev, &adev->res);
> +	if (IS_ERR(drvdata->base))
> +		return PTR_ERR(drvdata->base);
> +
> +	ret = devm_mutex_init(dev, &drvdata->lock);
> +	if (ret)
> +		return ret;
> +
> +	drvdata->enabled = false;
> +
> +	ret = sysfs_create_groups(&dev->kobj, tgu_attr_groups);
> +	if (ret) {
> +		dev_err(dev, "failed to create sysfs groups: %d\n", ret);
> +		return ret;
> +	}
> +
> +	pm_runtime_put(&adev->dev);
> +
> +	return 0;
> +}
> +
> +static void tgu_remove(struct amba_device *adev)
> +{
> +	struct device *dev = &adev->dev;
> +	struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
> +
> +	sysfs_remove_groups(&dev->kobj, tgu_attr_groups);
> +
> +	/*
> +	 * If the device is still enabled through sysfs, disable the hardware
> +	 * and drop the PM runtime reference taken in enable_tgu_store() so the
> +	 * usage counter stays balanced. Use the synchronous put: the driver core
> +	 * disables runtime PM right after ->remove() returns, and the barrier in
> +	 * pm_runtime_disable() would cancel a still-queued async idle/suspend,
> +	 * leaving the runtime-PM state inconsistent.
> +	 */
> +	scoped_guard(mutex, &drvdata->lock) {
> +		if (drvdata->enabled) {
> +			tgu_disable(drvdata);
> +			pm_runtime_put_sync(dev);
> +		}
> +	}
> +}
> +
> +static const struct amba_id tgu_ids[] = {
> +	{
> +		.id = 0x000f0e00,
> +		.mask = 0x000fffff,
> +	},
> +	{ 0, 0, NULL },
> +};
> +
> +MODULE_DEVICE_TABLE(amba, tgu_ids);
> +
> +static struct amba_driver tgu_driver = {
> +	.drv = {
> +		.name = "qcom-tgu",
> +		.suppress_bind_attrs = true,
> +	},
> +	.probe = tgu_probe,
> +	.remove = tgu_remove,
> +	.id_table = tgu_ids,
> +};
> +
> +module_amba_driver(tgu_driver);
> +
> +MODULE_AUTHOR("Songwei Chai <songwei.chai@oss.qualcomm.com>");
> +MODULE_AUTHOR("Jinlong Mao <jinlong.mao@oss.qualcomm.com>");
> +MODULE_DESCRIPTION("Qualcomm Trigger Generation Unit driver");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/hwtracing/qcom/tgu.h b/drivers/hwtracing/qcom/tgu.h
> new file mode 100644
> index 000000000000..ebba49402a20
> --- /dev/null
> +++ b/drivers/hwtracing/qcom/tgu.h
> @@ -0,0 +1,51 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#ifndef _QCOM_TGU_H
> +#define _QCOM_TGU_H
> +
> +/* Register addresses */
> +#define TGU_CONTROL		0x0000
> +#define TGU_LAR		0xfb0
> +#define TGU_UNLOCK_OFFSET	0xc5acce55
> +
> +static inline void TGU_LOCK(void __iomem *addr)
> +{
> +	do {
> +		/* Wait for things to settle */
> +		mb();
> +		writel_relaxed(0x0, addr + TGU_LAR);
> +	} while (0);
> +}

This is simply replicating the CS_LOCK/CS_UNLOCK.
I don't mind those (and relevant definitions) to be moved into 
include/linux/coresight.h and reused for your driver.

The rest looks fine by me.

Suzuki


> +
> +static inline void TGU_UNLOCK(void __iomem *addr)
> +{
> +	do {
> +		writel_relaxed(TGU_UNLOCK_OFFSET, addr + TGU_LAR);
> +		/* Make sure everyone has seen this */
> +		mb();
> +	} while (0);
> +}
> +
> +/**
> + * struct tgu_drvdata - Data structure for a TGU (Trigger Generation Unit)
> + * @base: Memory-mapped base address of the TGU device
> + * @dev: Pointer to the associated device structure
> + * @lock: Mutex serialising enable/disable and the associated PM runtime
> + *        reference counting against concurrent sysfs access
> + * @enabled: Flag indicating whether the TGU device is enabled
> + *
> + * This structure defines the data associated with a TGU device,
> + * including its base address, device pointer, the lock serialising
> + * enable/disable, and the enable status.
> + */
> +struct tgu_drvdata {
> +	void __iomem *base;
> +	struct device *dev;
> +	struct mutex lock;
> +	bool enabled;
> +};
> +
> +#endif



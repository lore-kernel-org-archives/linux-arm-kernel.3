Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 932F0D767C8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 10:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4J/DpaLX8WmdM2/iv9qNg2caaybbc7EvAWnkhplHjnE=; b=aCuYKDOQ/MDAqXyllMBlYzRPyq
	gGAemqMjaywkkfGtuSNfVZahmWss8mwN3qPGC/hjR7WLuI2/QcIq9tEmUDZnSgzShvTJpaAc3+Sdx
	Ql1wApt7AbSJKgVJ8wPTQI1vIKxJDaRl7UPYlRyce17poVYQrX3H6464BugH5pCyHF8dwCR4ok13Q
	KRqkFZB/FWDRgaCck1cEzeemd9cA3geKRaxFsT7lMy0cl2fGrkxKV8N4DSIumJvx05xJ+uxt2dlw/
	dDbQuYvxGx7dguYoKD02idM0ZimbiaMDezpOWnOn+PzK/l+A6l6bNmZGzYSOLotT0vWqGKFhCx53A
	TlCjrbuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWXnZ-0000000A546-0tcn;
	Fri, 19 Dec 2025 10:33:25 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWXnX-0000000A53M-00sz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 10:33:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AB5F8FEC;
	Fri, 19 Dec 2025 02:33:14 -0800 (PST)
Received: from [10.1.197.1] (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ABD953F5CA;
	Fri, 19 Dec 2025 02:33:20 -0800 (PST)
Message-ID: <ec3804b5-30a1-404b-ae82-0b606a8b5d6a@arm.com>
Date: Fri, 19 Dec 2025 10:33:19 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/3] coresight: tpda: add sysfs node to flush specific
 port
To: Jie Gan <jie.gan@oss.qualcomm.com>, Mike Leach <mike.leach@linaro.org>,
 James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Tao Zhang <tao.zhang@oss.qualcomm.com>
References: <20251219-add_sysfs_nodes_to_configure_tpda-v5-0-ca93ddfe9d30@oss.qualcomm.com>
 <20251219-add_sysfs_nodes_to_configure_tpda-v5-3-ca93ddfe9d30@oss.qualcomm.com>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20251219-add_sysfs_nodes_to_configure_tpda-v5-3-ca93ddfe9d30@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_023323_121783_91A8CA9E 
X-CRM114-Status: GOOD (  19.63  )
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
> Setting bit i in the TPDA_FLUSH_CR register initiates a flush request
> for port i, forcing the data to synchronize and be transmitted to the
> sink device.
> 
> Signed-off-by: Tao Zhang <tao.zhang@oss.qualcomm.com>
> Reviewed-by: James Clark <james.clark@linaro.org>
> Co-developed-by: Jie Gan <jie.gan@oss.qualcomm.com>
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
>   .../ABI/testing/sysfs-bus-coresight-devices-tpda   |  7 ++++
>   drivers/hwtracing/coresight/coresight-tpda.c       | 49 ++++++++++++++++++++++
>   drivers/hwtracing/coresight/coresight-tpda.h       |  1 +
>   3 files changed, 57 insertions(+)
> 
> diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda
> index a7855922328e..ef2804f87d1e 100644
> --- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda
> +++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda
> @@ -41,3 +41,10 @@ Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang <tao.zhang@oss.qu
>   Description:
>   		(RW) Configure the CMB/MCMB channel mode for all enabled ports.
>   		Value 0 means raw channel mapping mode. Value 1 means channel pair marking mode.
> +
> +What:		/sys/bus/coresight/devices/<tpda-name>/port_flush_req
> +Date:		December 2025
> +KernelVersion:	6.19
> +Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang <tao.zhang@oss.qualcomm.com>, Jie Gan <jie.gan@oss.qualcomm.com>
> +Description:
> +		(RW) Configure the bit i to requests a flush operation of port i on the TPDA.
> diff --git a/drivers/hwtracing/coresight/coresight-tpda.c b/drivers/hwtracing/coresight/coresight-tpda.c
> index d378ff8ad77d..5b4a9e41b067 100644
> --- a/drivers/hwtracing/coresight/coresight-tpda.c
> +++ b/drivers/hwtracing/coresight/coresight-tpda.c
> @@ -375,6 +375,45 @@ static ssize_t tpda_trig_sysfs_store(struct device *dev,
>   	return ret;
>   }
>   
> +static ssize_t port_flush_req_show(struct device *dev,
> +				   struct device_attribute *attr,
> +				   char *buf)
> +{
> +	struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
> +	unsigned long val;
> +
> +	if (!drvdata->csdev->refcnt)
> +		return -EINVAL;
> +
> +	guard(spinlock)(&drvdata->spinlock);
> +	val = readl_relaxed(drvdata->base + TPDA_FLUSH_CR);
> +
> +	return sysfs_emit(buf, "0x%lx\n", val);
> +}
> +
> +static ssize_t port_flush_req_store(struct device *dev,
> +				    struct device_attribute *attr,
> +				    const char *buf,
> +				    size_t size)
> +{
> +	struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
> +	u32 val;
> +
> +	if (kstrtou32(buf, 0, &val))
> +		return -EINVAL;
> +
> +	if (!drvdata->csdev->refcnt || !val)
> +		return -EINVAL;
> +
> +	guard(spinlock)(&drvdata->spinlock);
> +	CS_UNLOCK(drvdata->base);
> +	writel_relaxed(val, drvdata->base + TPDA_FLUSH_CR);
> +	CS_LOCK(drvdata->base);
> +
> +	return size;
> +}
> +static DEVICE_ATTR_RW(port_flush_req);
> +
>   static struct attribute *tpda_global_cr_attrs[] = {
>   	tpda_trig_sysfs_rw(global_flush_req, FLREQ),
>   	tpda_trig_sysfs_rw(freq_ts_enable, FREQTS),
> @@ -385,13 +424,23 @@ static struct attribute *tpda_global_cr_attrs[] = {
>   	NULL,
>   };
>   
> +static struct attribute *tpda_attrs[] = {
> +	&dev_attr_port_flush_req.attr,
> +	NULL,
> +};
> +

But why ? Why can't this be a part of the tpda_global_cr_attrs[] ?
For that matter, why is tpda_global_cr_attrs named as such and why not
tpda_attrs ?

Suzuki

>   static struct attribute_group tpda_global_cr_attr_grp = {
>   	.attrs	= tpda_global_cr_attrs,
>   	.name	= "global_cr",
>   };
>   
> +static struct attribute_group tpda_attr_grp = {
> +	.attrs	= tpda_attrs,
> +};
> +
>   static const struct attribute_group *tpda_attr_grps[] = {
>   	&tpda_global_cr_attr_grp,
> +	&tpda_attr_grp,
>   	NULL,
>   };
>   
> diff --git a/drivers/hwtracing/coresight/coresight-tpda.h b/drivers/hwtracing/coresight/coresight-tpda.h
> index 97e2729c15c9..ec93f9cb9648 100644
> --- a/drivers/hwtracing/coresight/coresight-tpda.h
> +++ b/drivers/hwtracing/coresight/coresight-tpda.h
> @@ -10,6 +10,7 @@
>   #define TPDA_Pn_CR(n)		(0x004 + (n * 4))
>   #define TPDA_FPID_CR		(0x084)
>   #define TPDA_SYNCR		(0x08C)
> +#define TPDA_FLUSH_CR		(0x090)
>   
>   /* Cross trigger Global (all ports) flush request bit */
>   #define TPDA_CR_FLREQ		BIT(0)
> 



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97CBCE674AF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 13:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1O/NWQ7G3LeHjqjrkVbwge4Fh2HgmORRQ7Vj/3VJZzM=; b=M6GhddPBpfENeDvOcmB1a7dF3p
	bkDouhMyIyrlRDRH9f4ZPKRwvg9rMHpGqpmjDwbCzhxghexL+HDg0fpzRFAPTpwX20ScxQNa5/tOs
	XxGnrBT7klRLBySUDzoPneQOwnPLeoI+fcDqlY9abZH9wqy0CA6xHKdGYkmeQQPLZpKAsTuNSx3I8
	WqDfimNV6LlBcxWhiG3EF/pK7taRFFXLcoYH0bhV1PUK29zSMnpW3l7NyXMjsJoFIkgcGlfUSKnwL
	ePOn2FBAVzuEEwSMZQtAftSSD3u/lPLjBXyAkmoZiM4kZhdoInQgemGfQzOsBOgpWsJ79J2JyXrWt
	Oy/rdFJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXfiX-0000000DnVZ-1x37;
	Mon, 22 Dec 2025 13:12:53 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXfiU-0000000DnVE-1I9d
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Dec 2025 13:12:51 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 229AC497;
	Mon, 22 Dec 2025 05:12:42 -0800 (PST)
Received: from [10.57.78.114] (unknown [10.57.78.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 85A143F778;
	Mon, 22 Dec 2025 05:12:47 -0800 (PST)
Message-ID: <9899b6c2-2bdf-41b8-9156-dcf1b611da39@arm.com>
Date: Mon, 22 Dec 2025 13:12:45 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/4] coresight: tpda: add sysfs node to flush specific
 port
Content-Language: en-GB
To: Jie Gan <jie.gan@oss.qualcomm.com>, Mike Leach <mike.leach@linaro.org>,
 James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Tao Zhang <tao.zhang@oss.qualcomm.com>
References: <20251222-add_sysfs_nodes_to_configure_tpda-v6-0-b27143d45c86@oss.qualcomm.com>
 <20251222-add_sysfs_nodes_to_configure_tpda-v6-4-b27143d45c86@oss.qualcomm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20251222-add_sysfs_nodes_to_configure_tpda-v6-4-b27143d45c86@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_051250_896982_7C277AE8 
X-CRM114-Status: GOOD (  20.80  )
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

On 22/12/2025 06:02, Jie Gan wrote:
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
>   drivers/hwtracing/coresight/coresight-tpda.c       | 40 ++++++++++++++++++++++
>   drivers/hwtracing/coresight/coresight-tpda.h       |  1 +
>   3 files changed, 48 insertions(+)
> 
> diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda
> index d359d90dca72..df8f03d4b573 100644
> --- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda
> +++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda
> @@ -51,3 +51,10 @@ Description:
>   		mode 0 - COUNT[11:0] value represents the approximate number of bytes moved between two ASYNC packet requests
>   		mode 1 - the bits COUNT[11:7] are used as a power of 2. for example, we could insert an async packet every 8K
>   		         data by writing a value 13 to the COUNT[11:7] field.
> +
> +What:		/sys/bus/coresight/devices/<tpda-name>/port_flush_req
> +Date:		December 2025
> +KernelVersion:	6.19
> +Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang <tao.zhang@oss.qualcomm.com>, Jie Gan <jie.gan@oss.qualcomm.com>
> +Description:
> +		(RW) Configure the bit i to requests a flush operation of port i on the TPDA.

Does this have similar semantics as the "global_flush_req"  for "Read" ? 
i.e., the bit stays set until the request completes ? Otherwise, why 
isn't this Write only ?

I don't see the point of "Reading" this value back.

Suzuki

> diff --git a/drivers/hwtracing/coresight/coresight-tpda.c b/drivers/hwtracing/coresight/coresight-tpda.c
> index 7baa8a0965d3..f79fea4fbb2c 100644
> --- a/drivers/hwtracing/coresight/coresight-tpda.c
> +++ b/drivers/hwtracing/coresight/coresight-tpda.c
> @@ -430,9 +430,49 @@ static ssize_t syncr_mode_store(struct device *dev,
>   }
>   static DEVICE_ATTR_RW(syncr_mode);
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
>   static struct attribute *tpda_attrs[] = {
>   	&dev_attr_global_flush_req.attr,
>   	&dev_attr_syncr_mode.attr,
> +	&dev_attr_port_flush_req.attr,
>   	tpda_trig_sysfs_rw(freq_ts_enable, FREQTS),
>   	tpda_trig_sysfs_rw(trig_freq_enable, FRIE),
>   	tpda_trig_sysfs_rw(trig_flag_ts_enable, FLRIE),
> diff --git a/drivers/hwtracing/coresight/coresight-tpda.h b/drivers/hwtracing/coresight/coresight-tpda.h
> index 1d2de50bb9f9..ef1ce2ce36a9 100644
> --- a/drivers/hwtracing/coresight/coresight-tpda.h
> +++ b/drivers/hwtracing/coresight/coresight-tpda.h
> @@ -10,6 +10,7 @@
>   #define TPDA_Pn_CR(n)		(0x004 + (n * 4))
>   #define TPDA_FPID_CR		(0x084)
>   #define TPDA_SYNCR		(0x08C)
> +#define TPDA_FLUSH_CR		(0x090)
>   
>   /* Cross trigger global (all ports) flush request bit */
>   #define TPDA_CR_FLREQ		BIT(0)
> 



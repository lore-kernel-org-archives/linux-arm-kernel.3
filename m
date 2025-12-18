Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F500D6ACD5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 09:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=evLqch5hNu1iwEnFgKksHFJgUrKxQo7SaheteQpajG0=; b=0pU2vl29e6f1sBgTVEwG9KcmzD
	J4fGVuzd4daFAradNq/WIcj7mQVqfZc3gOiVaBI+HhlX+pwAnoqjWYlAsRdW6qAgZUe+csq3uD/kK
	Y5svTJw9DMR7GFZ8IGbLz0CNBBGiil3mizwjlECjLcCU2FTCGdK2eHtNgM5tvxNxmpwX0lJCVVCG9
	I5tJKYZ6euUjvQYm5GigifueCnrR3nI/Dn2VTziWMAMhPKkceEA4EwmhRzZCUfjUvEjBqSUjxXJO+
	hpr+iKiFMKAbQFlHKj3qCiNrkgWQxfttoOoEAF6WaknyLp3QTCsGkWhjyuTwBa6tynD9vsIofJ7Tw
	ZxOIQGvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWAB3-000000088AB-1VO2;
	Thu, 18 Dec 2025 09:20:05 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWAAv-0000000887Y-2pyM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 09:20:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BFBA7FEC;
	Thu, 18 Dec 2025 01:19:48 -0800 (PST)
Received: from [10.1.197.1] (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B99273F762;
	Thu, 18 Dec 2025 01:19:54 -0800 (PST)
Message-ID: <0ac7f4e3-fec2-4554-99e7-53cf015febbe@arm.com>
Date: Thu, 18 Dec 2025 09:19:53 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] coresight: tpda: add sysfs nodes for tpda
 cross-trigger configuration
To: Jie Gan <jie.gan@oss.qualcomm.com>, Mike Leach <mike.leach@linaro.org>,
 James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Tao Zhang <tao.zhang@oss.qualcomm.com>
References: <20251028-configure_tpda_reg-v4-0-23000805d21d@oss.qualcomm.com>
 <20251028-configure_tpda_reg-v4-1-23000805d21d@oss.qualcomm.com>
 <ea84b279-8d55-4707-b6cf-85006da27456@oss.qualcomm.com>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <ea84b279-8d55-4707-b6cf-85006da27456@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_012000_252896_12899C1D 
X-CRM114-Status: GOOD (  20.48  )
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

On 18/12/2025 06:22, Jie Gan wrote:
> 
> 
> On 10/28/2025 10:02 AM, Jie Gan wrote:
>> From: Tao Zhang <tao.zhang@oss.qualcomm.com>
>>
>> Introduce sysfs nodes to configure cross-trigger parameters for TPDA.
>> These registers define the characteristics of cross-trigger packets,
>> including generation frequency and flag values.
>>
>> Signed-off-by: Tao Zhang <tao.zhang@oss.qualcomm.com>
>> Reviewed-by: James Clark <james.clark@linaro.org>
>> Co-developed-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> ---
>>   .../ABI/testing/sysfs-bus-coresight-devices-tpda   |  43 ++++
>>   drivers/hwtracing/coresight/coresight-tpda.c       | 230 +++++++++++ 
>> ++++++++++
>>   drivers/hwtracing/coresight/coresight-tpda.h       |  27 ++-
>>   3 files changed, 299 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices- 
>> tpda b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda
>> new file mode 100644
>> index 000000000000..80e4b05a1ab4
>> --- /dev/null
>> +++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda
> 
> Gentle reminder.
> 
> Do I need update the date and the kernelVersion of the sysfs node? 
> (target 7.0?)

Leave it with me, I can fix it up. Apologies for missing this out.

Suzuki


> 
> Thanks,
> Jie
> 
> 
>> @@ -0,0 +1,43 @@
>> +What:        /sys/bus/coresight/devices/<tpda-name>/trig_async_enable
>> +Date:        October 2025
>> +KernelVersion:    6.19
>> +Contact:    Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang 
>> <tao.zhang@oss.qualcomm.com>, Jie Gan <jie.gan@oss.qualcomm.com>
>> +Description:
>> +        (RW) Enable/disable cross trigger synchronization sequence 
>> interface.
>> +
>> +What:        /sys/bus/coresight/devices/<tpda-name>/trig_flag_ts_enable
>> +Date:        October 2025
>> +KernelVersion:    6.19
>> +Contact:    Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang 
>> <tao.zhang@oss.qualcomm.com>, Jie Gan <jie.gan@oss.qualcomm.com>
>> +Description:
>> +        (RW) Enable/disable cross trigger FLAG packet request interface.
>> +
>> +What:        /sys/bus/coresight/devices/<tpda-name>/trig_freq_enable
>> +Date:        October 2025
>> +KernelVersion:    6.19
>> +Contact:    Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang 
>> <tao.zhang@oss.qualcomm.com>, Jie Gan <jie.gan@oss.qualcomm.com>
>> +Description:
>> +        (RW) Enable/disable cross trigger FREQ packet request interface.
>> +
>> +What:        /sys/bus/coresight/devices/<tpda-name>/freq_ts_enable
>> +Date:        October 2025
>> +KernelVersion:    6.19
>> +Contact:    Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang 
>> <tao.zhang@oss.qualcomm.com>, Jie Gan <jie.gan@oss.qualcomm.com>
>> +Description:
>> +        (RW) Enable/disable the timestamp for all FREQ packets.
>> +
>> +What:        /sys/bus/coresight/devices/<tpda-name>/global_flush_req
>> +Date:        October 2025
>> +KernelVersion:    6.19
>> +Contact:    Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang 
>> <tao.zhang@oss.qualcomm.com>, Jie Gan <jie.gan@oss.qualcomm.com>
>> +Description:
>> +        (RW) Set global (all ports) flush request bit. The bit 
>> remains set until a
>> +        global flush request sequence completes.
>> +
>> +What:        /sys/bus/coresight/devices/<tpda-name>/cmbchan_mode
>> +Date:        October 2025
>> +KernelVersion:    6.19
>> +Contact:    Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang 
>> <tao.zhang@oss.qualcomm.com>, Jie Gan <jie.gan@oss.qualcomm.com>
>> +Description:
>> +        (RW) Configure the CMB/MCMB channel mode for all enabled ports.
>> +        Value 0 means raw channel mapping mode. Value 1 means channel 
>> pair marking mode.
>> diff --git a/drivers/hwtracing/coresight/coresight-tpda.c b/drivers/ 
>> hwtracing/coresight/coresight-tpda.c
>> index 333b3cb23685..a9a27bcc65a1 100644
>> --- a/drivers/hwtracing/coresight/coresight-tpda.c
>> +++ b/drivers/hwtracing/coresight/coresight-tpda.c
>> @@ -147,9 +147,37 @@ static void tpda_enable_pre_port(struct 
>> tpda_drvdata *drvdata)
>>       u32 val;
>>       val = readl_relaxed(drvdata->base + TPDA_CR);
>> +    val &= ~TPDA_CR_MID;
>>       val &= ~TPDA_CR_ATID;
>>       val |= FIELD_PREP(TPDA_CR_ATID, drvdata->atid);
>> +    if (drvdata->trig_async)
>> +        val |= TPDA_CR_SRIE;
>> +    else
>> +        val &= ~TPDA_CR_SRIE;
>> +    if (drvdata->trig_flag_ts)
>> +        val |= TPDA_CR_FLRIE;
>> +    else
>> +        val &= ~TPDA_CR_FLRIE;
>> +    if (drvdata->trig_freq)
>> +        val |= TPDA_CR_FRIE;
>> +    else
>> +        val &= ~TPDA_CR_FRIE;
>> +    if (drvdata->freq_ts)
>> +        val |= TPDA_CR_FREQTS;
>> +    else
>> +        val &= ~TPDA_CR_FREQTS;
>> +    if (drvdata->cmbchan_mode)
>> +        val |= TPDA_CR_CMBCHANMODE;
>> +    else
>> +        val &= ~TPDA_CR_CMBCHANMODE;
>>       writel_relaxed(val, drvdata->base + TPDA_CR);
>> +
>> +    /*
>> +     * If FLRIE bit is set, set the master and channel
>> +     * id as zero
>> +     */
>> +    if (drvdata->trig_flag_ts)
>> +        writel_relaxed(0x0, drvdata->base + TPDA_FPID_CR);
>>   }
>>   static int tpda_enable_port(struct tpda_drvdata *drvdata, int port)
>> @@ -265,6 +293,206 @@ static const struct coresight_ops tpda_cs_ops = {
>>       .link_ops    = &tpda_link_ops,
>>   };
>> +static ssize_t trig_async_enable_show(struct device *dev,
>> +                      struct device_attribute *attr,
>> +                      char *buf)
>> +{
>> +    struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
>> +
>> +    return sysfs_emit(buf, "%u\n", (unsigned int)drvdata->trig_async);
>> +}
>> +
>> +static ssize_t trig_async_enable_store(struct device *dev,
>> +                       struct device_attribute *attr,
>> +                       const char *buf,
>> +                       size_t size)
>> +{
>> +    struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
>> +    unsigned long val;
>> +
>> +    if (kstrtoul(buf, 0, &val))
>> +        return -EINVAL;
>> +
>> +    guard(spinlock)(&drvdata->spinlock);
>> +    drvdata->trig_async = !!val;
>> +
>> +    return size;
>> +}
>> +static DEVICE_ATTR_RW(trig_async_enable);
>> +
>> +static ssize_t trig_flag_ts_enable_show(struct device *dev,
>> +                    struct device_attribute *attr,
>> +                    char *buf)
>> +{
>> +    struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
>> +
>> +    return sysfs_emit(buf, "%u\n", (unsigned int)drvdata->trig_flag_ts);
>> +}
>> +
>> +static ssize_t trig_flag_ts_enable_store(struct device *dev,
>> +                     struct device_attribute *attr,
>> +                     const char *buf,
>> +                     size_t size)
>> +{
>> +    struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
>> +    unsigned long val;
>> +
>> +    if (kstrtoul(buf, 0, &val))
>> +        return -EINVAL;
>> +
>> +    guard(spinlock)(&drvdata->spinlock);
>> +    drvdata->trig_flag_ts = !!val;
>> +
>> +    return size;
>> +}
>> +static DEVICE_ATTR_RW(trig_flag_ts_enable);
>> +
>> +static ssize_t trig_freq_enable_show(struct device *dev,
>> +                     struct device_attribute *attr,
>> +                     char *buf)
>> +{
>> +    struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
>> +
>> +    return sysfs_emit(buf, "%u\n", (unsigned int)drvdata->trig_freq);
>> +}
>> +
>> +static ssize_t trig_freq_enable_store(struct device *dev,
>> +                      struct device_attribute *attr,
>> +                      const char *buf,
>> +                      size_t size)
>> +{
>> +    struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
>> +    unsigned long val;
>> +
>> +    if (kstrtoul(buf, 0, &val))
>> +        return -EINVAL;
>> +
>> +    guard(spinlock)(&drvdata->spinlock);
>> +    drvdata->trig_freq = !!val;
>> +
>> +    return size;
>> +}
>> +static DEVICE_ATTR_RW(trig_freq_enable);
>> +
>> +static ssize_t freq_ts_enable_show(struct device *dev,
>> +                   struct device_attribute *attr,
>> +                   char *buf)
>> +{
>> +    struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
>> +
>> +    return sysfs_emit(buf, "%u\n", (unsigned int)drvdata->freq_ts);
>> +}
>> +
>> +static ssize_t freq_ts_enable_store(struct device *dev,
>> +                    struct device_attribute *attr,
>> +                    const char *buf,
>> +                    size_t size)
>> +{
>> +    struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
>> +    unsigned long val;
>> +
>> +    if (kstrtoul(buf, 0, &val))
>> +        return -EINVAL;
>> +
>> +    guard(spinlock)(&drvdata->spinlock);
>> +    drvdata->freq_ts = !!val;
>> +
>> +    return size;
>> +}
>> +static DEVICE_ATTR_RW(freq_ts_enable);
>> +
>> +static ssize_t global_flush_req_show(struct device *dev,
>> +                     struct device_attribute *attr,
>> +                     char *buf)
>> +{
>> +    struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
>> +    unsigned long val;
>> +
>> +    if (!drvdata->csdev->refcnt)
>> +        return -EINVAL;
>> +
>> +    guard(spinlock)(&drvdata->spinlock);
>> +    CS_UNLOCK(drvdata->base);
>> +    val = readl_relaxed(drvdata->base + TPDA_CR);
>> +    CS_LOCK(drvdata->base);
>> +    /* Only read value for bit 0 */
>> +    val &= BIT(0);
>> +
>> +    return sysfs_emit(buf, "%lu\n", val);
>> +}
>> +
>> +static ssize_t global_flush_req_store(struct device *dev,
>> +                      struct device_attribute *attr,
>> +                      const char *buf,
>> +                      size_t size)
>> +{
>> +    struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
>> +    unsigned long val;
>> +
>> +    if (kstrtoul(buf, 0, &val))
>> +        return -EINVAL;
>> +
>> +    if (!drvdata->csdev->refcnt || !val)
>> +        return -EINVAL;
>> +
>> +    guard(spinlock)(&drvdata->spinlock);
>> +    CS_UNLOCK(drvdata->base);
>> +    val = readl_relaxed(drvdata->base + TPDA_CR);
>> +    /* Only set bit 0 */
>> +    val |= BIT(0);
>> +    writel_relaxed(val, drvdata->base + TPDA_CR);
>> +    CS_LOCK(drvdata->base);
>> +
>> +    return size;
>> +}
>> +static DEVICE_ATTR_RW(global_flush_req);
>> +
>> +static ssize_t cmbchan_mode_show(struct device *dev,
>> +                 struct device_attribute *attr,
>> +                 char *buf)
>> +{
>> +    struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
>> +
>> +    return sysfs_emit(buf, "%u\n", (unsigned int)drvdata->cmbchan_mode);
>> +}
>> +
>> +static ssize_t cmbchan_mode_store(struct device *dev,
>> +                  struct device_attribute *attr,
>> +                  const char *buf,
>> +                  size_t size)
>> +{
>> +    struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
>> +    unsigned long val;
>> +
>> +    if (kstrtoul(buf, 0, &val))
>> +        return -EINVAL;
>> +
>> +    guard(spinlock)(&drvdata->spinlock);
>> +    drvdata->cmbchan_mode = !!val;
>> +
>> +    return size;
>> +}
>> +static DEVICE_ATTR_RW(cmbchan_mode);
>> +
>> +static struct attribute *tpda_attrs[] = {
>> +    &dev_attr_trig_async_enable.attr,
>> +    &dev_attr_trig_flag_ts_enable.attr,
>> +    &dev_attr_trig_freq_enable.attr,
>> +    &dev_attr_freq_ts_enable.attr,
>> +    &dev_attr_global_flush_req.attr,
>> +    &dev_attr_cmbchan_mode.attr,
>> +    NULL,
>> +};
>> +
>> +static struct attribute_group tpda_attr_grp = {
>> +    .attrs = tpda_attrs,
>> +};
>> +
>> +static const struct attribute_group *tpda_attr_grps[] = {
>> +    &tpda_attr_grp,
>> +    NULL,
>> +};
>> +
>>   static int tpda_init_default_data(struct tpda_drvdata *drvdata)
>>   {
>>       int atid;
>> @@ -280,6 +508,7 @@ static int tpda_init_default_data(struct 
>> tpda_drvdata *drvdata)
>>           return atid;
>>       drvdata->atid = atid;
>> +    drvdata->freq_ts = true;
>>       return 0;
>>   }
>> @@ -323,6 +552,7 @@ static int tpda_probe(struct amba_device *adev, 
>> const struct amba_id *id)
>>       desc.ops = &tpda_cs_ops;
>>       desc.pdata = adev->dev.platform_data;
>>       desc.dev = &adev->dev;
>> +    desc.groups = tpda_attr_grps;
>>       desc.access = CSDEV_ACCESS_IOMEM(base);
>>       drvdata->csdev = coresight_register(&desc);
>>       if (IS_ERR(drvdata->csdev))
>> diff --git a/drivers/hwtracing/coresight/coresight-tpda.h b/drivers/ 
>> hwtracing/coresight/coresight-tpda.h
>> index c6af3d2da3ef..0be625fb52fd 100644
>> --- a/drivers/hwtracing/coresight/coresight-tpda.h
>> +++ b/drivers/hwtracing/coresight/coresight-tpda.h
>> @@ -1,6 +1,6 @@
>>   /* SPDX-License-Identifier: GPL-2.0 */
>>   /*
>> - * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights 
>> reserved.
>> + * Copyright (c) 2023,2025 Qualcomm Innovation Center, Inc. All 
>> rights reserved.
>>    */
>>   #ifndef _CORESIGHT_CORESIGHT_TPDA_H
>> @@ -8,6 +8,19 @@
>>   #define TPDA_CR            (0x000)
>>   #define TPDA_Pn_CR(n)        (0x004 + (n * 4))
>> +#define TPDA_FPID_CR        (0x084)
>> +
>> +/* Cross trigger FREQ packets timestamp bit */
>> +#define TPDA_CR_FREQTS        BIT(2)
>> +/* Cross trigger FREQ packet request bit */
>> +#define TPDA_CR_FRIE        BIT(3)
>> +/* Cross trigger FLAG packet request interface bit */
>> +#define TPDA_CR_FLRIE        BIT(4)
>> +/* Cross trigger synchronization bit */
>> +#define TPDA_CR_SRIE        BIT(5)
>> +/* Packetize CMB/MCMB traffic bit */
>> +#define TPDA_CR_CMBCHANMODE    BIT(20)
>> +
>>   /* Aggregator port enable bit */
>>   #define TPDA_Pn_CR_ENA        BIT(0)
>>   /* Aggregator port CMB data set element size bit */
>> @@ -19,6 +32,8 @@
>>   /* Bits 6 ~ 12 is for atid value */
>>   #define TPDA_CR_ATID        GENMASK(12, 6)
>> +/* Bits 13 ~ 19 is for mid value */
>> +#define TPDA_CR_MID        GENMASK(19, 13)
>>   /**
>>    * struct tpda_drvdata - specifics associated to an TPDA component
>> @@ -29,6 +44,11 @@
>>    * @enable:     enable status of the component.
>>    * @dsb_esize   Record the DSB element size.
>>    * @cmb_esize   Record the CMB element size.
>> + * @trig_async:    Enable/disable cross trigger synchronization 
>> sequence interface.
>> + * @trig_flag_ts: Enable/disable cross trigger FLAG packet request 
>> interface.
>> + * @trig_freq:    Enable/disable cross trigger FREQ packet request 
>> interface.
>> + * @freq_ts:    Enable/disable the timestamp for all FREQ packets.
>> + * @cmbchan_mode: Configure the CMB/MCMB channel mode.
>>    */
>>   struct tpda_drvdata {
>>       void __iomem        *base;
>> @@ -38,6 +58,11 @@ struct tpda_drvdata {
>>       u8            atid;
>>       u32            dsb_esize;
>>       u32            cmb_esize;
>> +    bool            trig_async;
>> +    bool            trig_flag_ts;
>> +    bool            trig_freq;
>> +    bool            freq_ts;
>> +    bool            cmbchan_mode;
>>   };
>>   #endif  /* _CORESIGHT_CORESIGHT_TPDA_H */
>>
> 



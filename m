Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B93E3D6ACE8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 11:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AKQcvhbtqvG7l9x4aUwhZy4KqyaaEWtuI0Y8d6DXWgU=; b=HFqleK6ZAQEZp0epzm9M9yaFvk
	AdSr10H/FkgiruleEUZHgcWyoxnoKrQEqxR8hgya2WlL8jodrijdOqHv78keN9ilT+6Q85OK9LDOz
	7SZZTDngSCqkh0aQwPs5aO/62FVnujUZcOvy/Sa3hMngeR5zv0cNT7hOQlG8Rs4+4dj5paowO66L/
	s1tyv9vjpLlxPmlVFND7V97iA+sQbFUcibgG/n8Fn7pnCSY78CiIEvl1r1+K2ojS0FU9jysxCuJlW
	9WklCNv8cEo4pYe0D+3esLHlhhTns/VqvPiSh5MuLCrhwO5GrGtjOeH1uaz6uH3+bx+b0yFY/0odH
	EwNMtcKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWC3V-00000008JEG-0XyI;
	Thu, 18 Dec 2025 11:20:25 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWC3S-00000008JDE-16ew
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 11:20:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 428F6FEC;
	Thu, 18 Dec 2025 03:20:13 -0800 (PST)
Received: from [10.1.197.1] (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 029453F73F;
	Thu, 18 Dec 2025 03:20:18 -0800 (PST)
Message-ID: <a95dc8ee-0b65-4ab6-966f-b15c31f6c6dc@arm.com>
Date: Thu, 18 Dec 2025 11:20:17 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] coresight: tpda: add sysfs nodes for tpda
 cross-trigger configuration
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: Jie Gan <jie.gan@oss.qualcomm.com>, Mike Leach <mike.leach@linaro.org>,
 James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Tao Zhang <tao.zhang@oss.qualcomm.com>
References: <20251028-configure_tpda_reg-v4-0-23000805d21d@oss.qualcomm.com>
 <20251028-configure_tpda_reg-v4-1-23000805d21d@oss.qualcomm.com>
 <a785ced7-95ae-444b-b8ca-b40aecb35230@arm.com>
Content-Language: en-US
In-Reply-To: <a785ced7-95ae-444b-b8ca-b40aecb35230@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_032022_377694_73500ACB 
X-CRM114-Status: GOOD (  26.50  )
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

On 18/12/2025 11:10, Suzuki K Poulose wrote:
> On 28/10/2025 02:02, Jie Gan wrote:
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
> 
> See, below.
> 
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
> 
> Could we clear all of the bits that are configurable in one go in the
> beginning and set the appropriate ones based on the setting ? i.e.:
> 
> Do we really need to retain any values ? And if not, why not start
> with a fresh set of values and avoid the read ?
> 
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
> 
> 
> 
>> +    return size;
>> +}
>> +static DEVICE_ATTR_RW(trig_async_enable);
> 
> ...
> 
>> +static DEVICE_ATTR_RW(trig_flag_ts_enable);
> 
> ...
> 
>> +static DEVICE_ATTR_RW(trig_freq_enable);
> 
> ...
>> +static DEVICE_ATTR_RW(freq_ts_enable);
> 
> These attribute are boolean and looks like we could save some space on
> code by using dev_ext_attribute.
> see tpdm_simple_dataset_rw()/tpdm_simple_dataset_ro() . You could
> 
> #define TPDA_TRIG_ASYNC        0
> #define TPDA_TRIG_FLAG_TS     1
> #define TPDA_TRIG_FREQ        2
> 
> 
> tpda_trig_sysfs_show/store()
> 
>   bool *ptr;
>   switch (eattr->var) {
>   case TPDA_TRIG_ASYNC:
>      ptr = &drvdata->trig_async;
>      break;
>   case TPDA_TRIG_FLAG_TS:
>      ptr = &drvdata->trig_flag_ts;
>      break;
> ...
> 
>   }
> 
> 
> 

-->8--

Cut here

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
> 
> What is BIT 0 ? Please document it
> 
>> +    writel_relaxed(val, drvdata->base + TPDA_CR);
>> +    CS_LOCK(drvdata->base);
>> +
>> +    return size;
>> +}

Also this, global_flush_req seems to be a separate change from the rest 
of the additions in the patch. Why not split it into a separate patch
with appropriate description of what this is for ?

Suzuki


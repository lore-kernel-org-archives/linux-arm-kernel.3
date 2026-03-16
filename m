Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E50FAF4644F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 11:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jpINPN0smXa/6j308qag3z+U/hC5YHyubfZ8k1reDUg=; b=ZIooTwdcPiiXRZAEZjd7FaLDJ8
	AU+XB5OT7KflG0/wC383WR67SA5oDn+DfgbWYmsv2DgGftdbdVWrN1M65nH/kv9nY1WBOuarZcVe5
	k7sWre1I0Fw8kkcmQeBuW+rivdEPD40s9B5oEE3l47d/sS9HnjsKgqrzg+oXbCYJ3AaL1gtIsSHKz
	6EMDZ8dF9wPQXhq6PhyVxO3/j7Ud14Z42fONIyLI0NK/JGFZMmrZoHIifi5yRvbE9LILlgFcl7gpa
	c7ytzInytMqHytC080/WIkndW3PXwMPoIkglyzXhPfdfFCr2JGZkGSff/98s4lyf3K8eG4t475DTd
	A9X9DyhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w260J-00000003oTW-0gWt;
	Mon, 16 Mar 2026 11:20:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w260G-00000003oT0-33bb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 11:20:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F38FE1477;
	Mon, 16 Mar 2026 04:20:48 -0700 (PDT)
Received: from [10.57.18.169] (unknown [10.57.18.169])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B1E9F3F778;
	Mon, 16 Mar 2026 04:20:53 -0700 (PDT)
Message-ID: <d1d1cbc2-c828-42ff-b4b0-53fced4afb01@arm.com>
Date: Mon, 16 Mar 2026 11:20:52 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] coresight: tpdm: add traceid_show for checking traceid
Content-Language: en-GB
To: Jie Gan <jie.gan@oss.qualcomm.com>, Mike Leach <mike.leach@arm.com>,
 James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260316-add-traceid-show-for-tpdm-v2-1-1dec2a67e4ed@oss.qualcomm.com>
 <a503ecdc-53e9-4c7a-b228-f697fb9c0ac6@arm.com>
 <8f37ae07-f211-4d43-bc01-4ab17a0d1f32@oss.qualcomm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <8f37ae07-f211-4d43-bc01-4ab17a0d1f32@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_042056_867917_8BD114A7 
X-CRM114-Status: GOOD (  25.36  )
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

On 16/03/2026 10:29, Jie Gan wrote:
> 
> Hi Suzuki,
> 
> On 3/16/2026 5:32 PM, Suzuki K Poulose wrote:
>> On 16/03/2026 07:23, Jie Gan wrote:
>>> Save the trace ID in drvdata during TPDM enablement and expose it
>>> to userspace to support trace data parsing.
>>>
>>> The TPDM device’s trace ID corresponds to the trace ID allocated
>>> to the connected TPDA device.
>>>
>>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>>> ---
>>> Changes in V2:
>>> 1. Use sysfs_emit instead of sprintf.
>>> Link to V1 - https://lore.kernel.org/all/20260306-add-traceid-show- 
>>> for-tpdm-v1-1-0658a8edb972@oss.qualcomm.com/
>>
>> Why is this patch required even ? For each TPDM there is a single
> 
> It's taking effort to retrieve the trace ID of the TPDA device because 
> it's not a source device. The trace ID is required to identify the 
> origin of the trace data and is essential for parsing the received data.
> 
>> port in a single TPDA in the system where it can reach and that is
>> fixed for a platform. Can we not get this from there ? Also, there
>> is not TraceID technically for a TPDM, right ? It is all a property
> 
> Yes, we dont allocate trace ID for a TPDM device. The TraceID is 
> allocated to the TPDA device.

Now if you combine both your responses, don't you think they contradict
each other ?

Also, the TraceID we show is *not valid* if the TPDM was never enabled.
So this is inconsistent, isn't it ? Unless we return an error in this case

Suzuki

> 
> Thanks,
> Jie
> 
>> of the TPDA ?
>>
> 
> 
>> Suzuki
>>
>>
>>> ---
>>>   drivers/hwtracing/coresight/coresight-tpdm.c | 31 +++++++++++++++++ 
>>> + +++++++++-
>>>   drivers/hwtracing/coresight/coresight-tpdm.h |  2 ++
>>>   2 files changed, 32 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/hwtracing/coresight/coresight-tpdm.c b/drivers/ 
>>> hwtracing/coresight/coresight-tpdm.c
>>> index da77bdaad0a4..774a63def817 100644
>>> --- a/drivers/hwtracing/coresight/coresight-tpdm.c
>>> +++ b/drivers/hwtracing/coresight/coresight-tpdm.c
>>> @@ -481,7 +481,7 @@ static void __tpdm_enable(struct tpdm_drvdata 
>>> *drvdata)
>>>   static int tpdm_enable(struct coresight_device *csdev, struct 
>>> perf_event *event,
>>>                  enum cs_mode mode,
>>> -               __maybe_unused struct coresight_path *path)
>>> +               struct coresight_path *path)
>>>   {
>>>       struct tpdm_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
>>> @@ -497,6 +497,7 @@ static int tpdm_enable(struct coresight_device 
>>> *csdev, struct perf_event *event,
>>>       }
>>>       __tpdm_enable(drvdata);
>>> +    drvdata->traceid = path->trace_id;
>>>       drvdata->enable = true;
>>>       spin_unlock(&drvdata->spinlock);
>>> @@ -693,6 +694,26 @@ static struct attribute_group tpdm_attr_grp = {
>>>       .attrs = tpdm_attrs,
>>>   };
>>> +static ssize_t traceid_show(struct device *dev,
>>> +                struct device_attribute *attr, char *buf)
>>> +{
>>> +    unsigned long val;
>>> +    struct tpdm_drvdata *drvdata = dev_get_drvdata(dev->parent);
>>> +
>>> +    val = drvdata->traceid;
>>> +    return sysfs_emit(buf, "%#lx\n", val);
>>> +}
>>> +static DEVICE_ATTR_RO(traceid);
>>> +
>>> +static struct attribute *traceid_attrs[] = {
>>> +    &dev_attr_traceid.attr,
>>> +    NULL,
>>> +};
>>> +
>>> +static struct attribute_group traceid_attr_grp = {
>>> +    .attrs = traceid_attrs,
>>> +};
>>> +
>>>   static ssize_t dsb_mode_show(struct device *dev,
>>>                    struct device_attribute *attr,
>>>                    char *buf)
>>> @@ -1367,6 +1388,12 @@ static const struct attribute_group 
>>> *tpdm_attr_grps[] = {
>>>       &tpdm_cmb_patt_grp,
>>>       &tpdm_cmb_msr_grp,
>>>       &tpdm_mcmb_attr_grp,
>>> +    &traceid_attr_grp,
>>> +    NULL,
>>> +};
>>> +
>>> +static const struct attribute_group *static_tpdm_attr_grps[] = {
>>> +    &traceid_attr_grp,
>>>       NULL,
>>>   };
>>> @@ -1425,6 +1452,8 @@ static int tpdm_probe(struct device *dev, 
>>> struct resource *res)
>>>       desc.access = CSDEV_ACCESS_IOMEM(base);
>>>       if (res)
>>>           desc.groups = tpdm_attr_grps;
>>> +    else
>>> +        desc.groups = static_tpdm_attr_grps;
>>
>>  >       drvdata->csdev = coresight_register(&desc);>       if 
>> (IS_ERR(drvdata->csdev))
>>>           return PTR_ERR(drvdata->csdev);
>>> diff --git a/drivers/hwtracing/coresight/coresight-tpdm.h b/drivers/ 
>>> hwtracing/coresight/coresight-tpdm.h
>>> index 2867f3ab8186..befecbb896f4 100644
>>> --- a/drivers/hwtracing/coresight/coresight-tpdm.h
>>> +++ b/drivers/hwtracing/coresight/coresight-tpdm.h
>>> @@ -300,6 +300,7 @@ struct cmb_dataset {
>>>    * @cmb         Specifics associated to TPDM CMB.
>>>    * @dsb_msr_num Number of MSR supported by DSB TPDM
>>>    * @cmb_msr_num Number of MSR supported by CMB TPDM
>>> + * @traceid    trace ID of the path.
>>>    */
>>>   struct tpdm_drvdata {
>>> @@ -313,6 +314,7 @@ struct tpdm_drvdata {
>>>       struct cmb_dataset    *cmb;
>>>       u32            dsb_msr_num;
>>>       u32            cmb_msr_num;
>>> +    u8            traceid;
>>>   };
>>>   /* Enumerate members of various datasets */
>>>
>>> ---
>>> base-commit: b84a0ebe421ca56995ff78b66307667b62b3a900
>>> change-id: 20260316-add-traceid-show-for-tpdm-88d040651f00
>>>
>>> Best regards,
>>
>>
> 



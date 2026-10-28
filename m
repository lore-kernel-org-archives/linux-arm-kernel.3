Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB80E606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 13:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eMhOcu3q;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=EA7JPsY9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=MvumFNp4ir0ZQ0AN2j9JePujNRHtA7/CNuMQF2kMQPk=; b=eMhOcu3qdOtq60
	z5bNE1j+Xd7y8rMMgXF0aTOzunix3bAxnql4Ong6300t76U7+dUfR69xs+v9QQwhyvMBsvHzsIyHa
	+sjXRkEiKRrdU3gtKmXvgMje7RhimjN+wtAtmKxWhCn/nXHv9FdrdPHHKr3fjK3QHMayukXlH9/Ct
	OJRzvqLkFPJhjKVRj7sgMBm+0PolhaS7M+Rmy5ayO90UWp6f3xxvKnziY9se0/4i0ROBETid3Ybi/
	Z/SW4kzVQ4IAhz0msvsdJjv/5roMK7fSxDOlU1SdpXN1UwpZOZO7xH0HiIO/EvPqsF5J2yej9Solo
	bUv/E7xD0Q8TLwxfV6pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM3GQ-000000070Al-0olU;
	Wed, 28 Oct 2026 13:00:22 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM3GN-000000070AJ-45Vk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 13:00:21 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so7459825e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Oct 2026 06:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793192418; x=1793797218; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MvumFNp4ir0ZQ0AN2j9JePujNRHtA7/CNuMQF2kMQPk=;
        b=EA7JPsY9nrediIoFWRrzBJdCQE0/AjtL4mRbBokIwQJf9R0hBHymcFdXIfqd8SPwGA
         kKMG/0ojNb1xvNoRnpWIu1tUZKiz3qDyf3gIMRaoKzLgBiU4T48y81Fq0jDOC8os2Q+r
         qJAEZFsISLDnS4t99Wfpts5sWDeVfLFNmOcWKnqA0PsRT6QYGRIrzrAmxpvS0g1z30Us
         vy5qtIoRgNyk4tkhufhMJsrrqLRUT9f4F9dqesRt+55bBEWqAqV2hLOvr9flsFIAQSZB
         5BkOtYQWN9nKhKbFZoh8KcVRdXiTftQPZB1KnjoDuO4mWkVoWTz+G9jVuGCRM12cxYWh
         miTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793192418; x=1793797218;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MvumFNp4ir0ZQ0AN2j9JePujNRHtA7/CNuMQF2kMQPk=;
        b=DwGlCbDZz7o/5a8SzhsQwMiUXPsRSJziRckynS9GuA0d8jmeGIrj+YrArgCq+FBVwy
         Aaoq7rp8coPAJfiDTCB3t6Kab7vNmrQz+ZOV6SmFQB9rYrDWHalOXI4LRRQd7RE34t72
         7khmBThVe3Il5GMwVOf4INv30cD128y4UCSdquBYvhoCbn4jlbo0Rk3c5l+pQDBAUgan
         nzWr8Zt8qnPSTjWCcw2xRdqGKmnCZ9jjYgpY2uMpUUE0pOgQTZuru4yY3C85KNDsRRP7
         SQbE66EtdtavZwchQBPdgeNj4TbcX0yqHqT7Gy9KwolZ7gdMZ0b/bZHICMMyHkmCNImc
         TrQw==
X-Forwarded-Encrypted: i=1; AKwUvByNjGZu+u37wim03pQKNKOKeU4f0RBNDp15NwyxLCoyipqJu7OFO8pISYxHYqio/sV/laJr5wRpu29KIKyHUNph@lists.infradead.org
X-Gm-Message-State: AFq9FYK5UbCGJsTE+1+rrJCVNEqoLKTpCbXMdGxOFDywLjusVmkUBQcK
	S93exnRYA4gW8q3t/v6jLttdC7Ddsm/A87e6kWQFq/iuPMbRzixkm5alzp2Dlw12aG8=
X-Gm-Gg: AYBFou3ZO53B+J4hU3EBoWyG9q2wlzZcDGu3K06J0AqSd63PLEXevEUxayZgkUV3d7E
	agj2IXe+4humKAmp7KxK4kxl4WUcCJFGLcPoyWVYvPZSGjg72BpFwWHhGd2oeSmksHdgiFcOuWk
	F/7Uk4FFo+lvTG6WfV1ub4mMGYc+zDabcBekfxaHBI9DFMErcZjQGnOM9U8jJ8s4PIPSMvN1Qll
	VcHvdOtC/rCSNzRvbiauqS3BPDgkrvCG/pxEv+CRkSy3nXFK/+RzPaLTxcPFEvVPV614HFaSxlS
	1d70bx1jgLc3+16IDEiPyaQHQ/MSlUCY2zm6lVZm6MXdC5Ni4xvC7V/B/WGMFngLkNd+MddlRdR
	/Lsd3qjh7+u9sFUKVkaGT77kreqKEKVvkbX6CO8aOxKY/1B+nwXZyFIpPK0SiFUw8TC+XRu0mpK
	WLT59PyAP94bMAuCYU35Q2oWvm5fSxmhRn3LLFmHx/Ppj+//5eoqxxs6XainkUBo/z68sWCC3XA
	W/i6HVTSyi15ba3sFgpKUITSq/zmyimbIMunFAD5iDfkIx0L/5H8WtqK3LjedYTsopIrh3HLO1N
	ap6dapo9/Cyf/p6oFmM=
X-Received: by 2002:a05:600c:6085:b0:4a1:e01e:1927 with SMTP id 5b1f17b1804b1-4a996a9e304mr37363745e9.5.1793192417917;
        Wed, 28 Oct 2026 06:00:17 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a977edc20csm39272515e9.3.2026.10.28.06.00.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 06:00:16 -0700 (PDT)
Message-ID: <59d1e508-365a-4960-9938-d4fbc4141590@linaro.org>
Date: Wed, 28 Oct 2026 13:00:14 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/10] coresight: configfs: Don't assume active until
 cscfg_mgr is set
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Qi Liu <liuqi115@huawei.com>, Junhao He <hejunhao3@huawei.com>,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>,
 Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@arm.com>,
 Suyash Mahar <smahar@meta.com>, Yeoreum Yun <yeoreum.yun@arm.com>
References: <20261016-james-cs-multiple-per-threads-v4-0-dedf961aca0e@linaro.org>
 <20261016-james-cs-multiple-per-threads-v4-1-dedf961aca0e@linaro.org>
 <3eda6e99-291f-40b1-9fd8-13ca193b5fa4@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <3eda6e99-291f-40b1-9fd8-13ca193b5fa4@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_060020_065619_DBC16725 
X-CRM114-Status: GOOD (  24.06  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 28/10/2026 10:14, Suzuki K Poulose wrote:
> On 16/10/2026 11:46, James Clark wrote:
>> Perf's etm_setup_aux() calls cscfg_activate_config() and dereferences
>> cscfg_mgr, which can be done after coresight_init() has initialized the
>> Perf PMU but before cscfg_init() has finished while the driver is still
>> loading.
>>
>> Fix it by only assuming cscfg is initialized if cscfg_mgr is set.
>>
> 
> Is this possible though ? The component drivers are dependent on the
> coresight-core being loaded and this is not complete until the coresight
> module has been initialised.

No component drivers are needed for this path. etm_perf_init() creates 
the PMU regardless of whether any sources or sinks exist. Perf can use 
perf_event_open() on it immediately (although it would fail eventually), 
but it would be after hitting this part.

> 
> Or the other way to fix this is delay the etm_perf init after the cscfg
> init, which clearly is the order of dependencies ?

That's what I tried initially, and that's what Leo suggested on V3. But 
cscfg is dependent on the core creating some sysfs files first, so the 
init dependency is currently in the correct order.

> 
> Cheers
> Suzuki
> 
> 
>> Fixes: a0114b4740dd ("coresight: etm-perf: Update to activate selected 
>> configuration")
>> Signed-off-by: James Clark <james.clark@linaro.org>
>> ---
>>   drivers/hwtracing/coresight/coresight-syscfg.c | 11 ++++++++---
>>   1 file changed, 8 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-syscfg.c b/drivers/ 
>> hwtracing/coresight/coresight-syscfg.c
>> index 2bfdd7b45e49..7e3c9844bc00 100644
>> --- a/drivers/hwtracing/coresight/coresight-syscfg.c
>> +++ b/drivers/hwtracing/coresight/coresight-syscfg.c
>> @@ -26,6 +26,11 @@ static DEFINE_MUTEX(cscfg_mutex);
>>   /* only one of these */
>>   static struct cscfg_manager *cscfg_mgr;
>> +static enum cscfg_load_ops cscfg_get_state(void)
>> +{
>> +    return cscfg_mgr ? cscfg_mgr->load_state : CSCFG_UNLOAD;
>> +}
>> +
>>   /* load features and configuations into the lists */
>>   /* get name feature instance from a coresight device list of 
>> features */
>> @@ -581,7 +586,7 @@ int cscfg_load_config_sets(struct 
>> cscfg_config_desc **config_descs,
>>       int err = 0;
>>       mutex_lock(&cscfg_mutex);
>> -    if (cscfg_mgr->load_state != CSCFG_NONE) {
>> +    if (cscfg_get_state() != CSCFG_NONE) {
>>           mutex_unlock(&cscfg_mutex);
>>           return -EBUSY;
>>       }
>> @@ -662,7 +667,7 @@ int cscfg_unload_config_sets(struct 
>> cscfg_load_owner_info *owner_info)
>>       struct cscfg_load_owner_info *load_list_item = NULL;
>>       mutex_lock(&cscfg_mutex);
>> -    if (cscfg_mgr->load_state != CSCFG_NONE) {
>> +    if (cscfg_get_state() != CSCFG_NONE) {
>>           mutex_unlock(&cscfg_mutex);
>>           return -EBUSY;
>>       }
>> @@ -902,7 +907,7 @@ static int _cscfg_activate_config(unsigned long 
>> cfg_hash)
>>       struct cscfg_config_desc *config_desc;
>>       int err = -EINVAL;
>> -    if (cscfg_mgr->load_state == CSCFG_UNLOAD)
>> +    if (cscfg_get_state() == CSCFG_UNLOAD)
>>           return -EBUSY;
>>       list_for_each_entry(config_desc, &cscfg_mgr->config_desc_list, 
>> item) {
>>
> 



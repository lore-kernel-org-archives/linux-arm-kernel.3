Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23F87F53D7F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 17:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1aJLFkmZ8O2W45gAWMpE9JOglV4+l7rhHsNOlx5lSFc=; b=ZJtXVZEkyyibqaiELMZ3DRqn76
	ryj1uDO0oQ9xQSsxzTpoqiz2FvNDB8sOI362ywKLFty6P0WN1kZJ+la45W768bCk0KuRY1k7MId41
	s4j20bhD3xIQuiTggEjHFrBTfU+H9o7qcVTS8oIKmk3QBUsD4fFdErl8D+Hs+QbcAFjdCsfpchI/W
	T7glH6l2r9QJgnABQMMrMMCFAm1Qa2v4FJZnj55yDu4w0dxzmXDntQLX5I8zzLFBC7Fp+gtyjJq1h
	QcNXCzmNnWOKTRZDaV0Hm+AZdMqufosH0yJsYD4RZib+umZQb2cpvLwwH99kj1nVSEX0qKFYnW9yb
	IvynNraQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2C4g-00000004c69-3c7i;
	Mon, 16 Mar 2026 17:49:54 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2C4e-00000004c5k-3cbe
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 17:49:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6D07D1476;
	Mon, 16 Mar 2026 10:49:45 -0700 (PDT)
Received: from [10.57.20.85] (unknown [10.57.20.85])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 86E6F3F73B;
	Mon, 16 Mar 2026 10:49:49 -0700 (PDT)
Message-ID: <4e36cf20-f3c0-4c3d-9bf4-da8228efaa15@arm.com>
Date: Mon, 16 Mar 2026 17:49:47 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 02/19] coresight: Set per-CPU source pointer
Content-Language: en-GB
To: Leo Yan <leo.yan@arm.com>
Cc: Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
 Yeoreum Yun <yeoreum.yun@arm.com>, Mark Rutland <mark.rutland@arm.com>,
 Will Deacon <will@kernel.org>, Yabin Cui <yabinc@google.com>,
 Keita Morisaki <keyz@google.com>, Yuanfang Zhang
 <quic_yuanfang@quicinc.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org
References: <20260305-arm_coresight_path_power_management_improvement-v6-0-eff765d211a9@arm.com>
 <20260305-arm_coresight_path_power_management_improvement-v6-2-eff765d211a9@arm.com>
 <4dd1e996-5098-4b03-af0f-98294fdca908@arm.com>
 <20260316143828.GE8048@e132581.arm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20260316143828.GE8048@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_104952_967639_1022B8CD 
X-CRM114-Status: GOOD (  11.15  )
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

On 16/03/2026 14:38, Leo Yan wrote:
> On Fri, Mar 13, 2026 at 11:18:20AM +0000, Suzuki K Poulose wrote:
> 
> [...]
> 
>>>    static struct coresight_device *coresight_get_source(struct coresight_path *path)
>>>    {
>>>    	struct coresight_device *csdev;
>>> @@ -1401,6 +1452,8 @@ struct coresight_device *coresight_register(struct coresight_desc *desc)
>>>    	mutex_unlock(&coresight_mutex);
>>> +	coresight_set_percpu_source(csdev);
>>> +
>>>    	if (cti_assoc_ops && cti_assoc_ops->add)
>>>    		cti_assoc_ops->add(csdev);
>>> @@ -1427,6 +1480,7 @@ void coresight_unregister(struct coresight_device *csdev)
>>>    	if (cti_assoc_ops && cti_assoc_ops->remove)
>>>    		cti_assoc_ops->remove(csdev);
>>> +	coresight_clear_percpu_source(csdev);
>>
>> Should these be done with the mutex lock held ?
> 
> If so, we will create a locking chain:
> 
>    coresight_mutex -> cpus_read_lock()
> 
> Afterwards in patch 18, it uses cpus_read_lock() to protect sysfs knobs,
> a reversed locking chain will be established:
> 
>    cpus_read_lock() -> coresight_mutex
> 
> LOCKDEP will complain for possible deadlock.  This is why this patch
> avoids to acquire mutex when set / clear per CPU sources.

The question is, what prevents two different CPUs trying to modify the 
"per_cpu_source" data structure when the CPU is not online.


Suzuki

> 
>>>    	mutex_lock(&coresight_mutex);
>>>    	etm_perf_del_symlink_sink(csdev);
>>>    	coresight_remove_conns(csdev);
>>>
>>



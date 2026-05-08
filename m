Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9197ACD342F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 08:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q5gMdLEHVmIhhrT97894lZMvnewFQ98p7avUlqlVx2E=; b=f4IzO2mFhEG+G0WsdD2E9D0A9J
	bml1xeiStaM9o6M+gC0CdFelERWFD4XUM8XmqeUQPjuVeOKa1fZBnYzz8SpSLfZvhauwwmHtTXr8N
	xrDuy/NA2OmjkdZZPL/TGjMMorsfEw+DOZp1TRxN7YvKjPhwUVKi7gF4UgWu9PeT2HOJnLyIfV3o8
	ZJPRlOKfn5PQL5471A187H/gOIP5I8YyksYfCOVaqLM7XkChRw7yAxHN6mXfnNwZg5eKWCsCbDwrl
	rHSbhn+avpFLc+WDV+SNhjduK13vlM4aE0GJ/rX/6JMEWOB46xkADhJAFH3XyukG7PeQ5IjT3OdJB
	Hvz8BWOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLGzj-0000000639O-0EFO;
	Fri, 08 May 2026 08:55:39 +0000
Received: from canpmsgout10.his.huawei.com ([113.46.200.225])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLGzf-0000000637f-2F10
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 08:55:37 +0000
Received: from mail.maildlp.com (unknown [172.19.163.200])
	by canpmsgout10.his.huawei.com (SkyGuard) with ESMTPS id 4gBjSB4p7zz1K97g;
	Fri,  8 May 2026 16:47:54 +0800 (CST)
Received: from kwepemf200017.china.huawei.com (unknown [7.202.181.10])
	by mail.maildlp.com (Postfix) with ESMTPS id 4FE4140563;
	Fri,  8 May 2026 16:55:27 +0800 (CST)
Received: from [10.67.121.58] (10.67.121.58) by kwepemf200017.china.huawei.com
 (7.202.181.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 8 May
 2026 16:55:26 +0800
Message-ID: <a1ac9710-44fb-46e9-857d-2c2e9dff5457@hisilicon.com>
Date: Fri, 8 May 2026 16:55:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] cpufreq: cppc: discard out-of-range delivered_perf
 samples
To: Breno Leitao <leitao@debian.org>
CC: "Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar
	<viresh.kumar@linaro.org>, Lifeng Zheng <zhenglifeng1@huawei.com>, Pierre
 Gondois <pierre.gondois@arm.com>, Sumit Gupta <sumitg@nvidia.com>,
	<linux-pm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<dcostantino@meta.com>, <pjaroszynski@nvidia.com>, <Al.Grant@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <kernel-team@meta.com>, "zhangpengjie
 (A)" <zhangpengjie2@huawei.com>
References: <20260501-cur_freq-fix-v1-1-f84c9a423366@debian.org>
 <26deca86-44e3-4fd5-950e-59f913d9ee37@hisilicon.com>
 <af2cEiouQbdpoavG@gmail.com>
Content-Language: en-US
From: Jie Zhan <zhanjie9@hisilicon.com>
In-Reply-To: <af2cEiouQbdpoavG@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.121.58]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemf200017.china.huawei.com (7.202.181.10)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_015535_741846_1D3BAFF2 
X-CRM114-Status: GOOD (  11.87  )
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



On 5/8/2026 4:17 PM, Breno Leitao wrote:
> Hello Jie,
> 
> On Fri, May 08, 2026 at 11:23:18AM +0800, Jie Zhan wrote:
>> On 5/2/2026 12:32 AM, Breno Leitao wrote:
>>> cppc_cpufreq_get_rate() derives delivered_perf as:
>>>
>>>     delivered_perf = reference_perf * delta_delivered / delta_reference
>>>
>>> over a short udelay()-bounded window between two cppc_get_perf_ctrs()
>>> calls. Per-read latency jitter on the underlying CPC register access
>>> can skew the ratio, occasionally producing delivered_perf >
>>> highest_perf. cppc_perf_to_khz() then linearly extrapolates above
>>> (nominal_perf, nominal_freq), so the value reported via
>>> /sys/.../cpufreq/cpuinfo_cur_freq exceeds cpuinfo_max_freq.
>>>
>>> Observed on an arm64 host (governor=performance,
>>> cpuinfo_max_freq=3339 MHz): 15 back-to-back reads returned values
>>> between 2997 and 4230 MHz.
>> Hi Breno,
>>
>> Frequency sampling discrepancy through 'cpuinfo_cur_freq' in the
>> cppc_cpufreq driver has been an issue discussed for a very long time.
> 
> Thanks for the heads-up.
> 
>> If the CPPC feedback counters are FFH on your platform, can you have a look
>> at [1] and see if that helps?
> 
> Have you forgot to get the [1] link here?
Yeah, totally forgot, sorry!

[1] https://lore.kernel.org/lkml/20260410094145.4132082-1-zhangpengjie2@huawei.com/
> 
> Thanks for looking at this,
> --breno


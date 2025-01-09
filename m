Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BF05E77197
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 12:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bFTopQqg0AYQo54+Ti+T8EKSE0QFycYC4UqsqIdh/JM=; b=fmKZReVX79eIhE/JSo7DYXJ0Kl
	gMwGLbYxgXGoC06reuMJvaATHpeMu7e+6Jg48uJb6wSMb+MK+kQi4VSdSVw1/V5eaHB8fSMe4RsUB
	sprmuSYZ89TiOwrYzdZ7CiSvgYqiGPon7sjbui4qGR5wHr6gLa4TYUBiAW0DBRTMpZGUf5KQRcqoB
	z9JFWG6+Npp/7ehzExAdh4jyfcOqx+/yzXiro1OOYj8zo8ZSCtqI16+CuV07Zh6sEiGQIn5vCcQ+/
	W9zUF9AwcUyGHR3g6eu4OjArs1YZXC9Y5EsU2DIgPa9/cVPgtKjb1m07eFtG+noirusl4SiZL86GM
	i9j4jf2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVra1-0000000BqVY-2LT1;
	Thu, 09 Jan 2025 12:24:05 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVrXG-0000000Bpsc-3y1e
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 12:21:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1638812FC;
	Thu,  9 Jan 2025 04:21:42 -0800 (PST)
Received: from [10.57.32.219] (unknown [10.57.32.219])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B72273F673;
	Thu,  9 Jan 2025 04:21:12 -0800 (PST)
Message-ID: <4f9d2bed-7ce0-429e-83cc-ad6cbcc6085e@arm.com>
Date: Thu, 9 Jan 2025 12:21:11 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] coresight/etm4x: disallow altering config via sysfs
 while enabled
Content-Language: en-GB
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: mike.leach@linaro.org, james.clark@linaro.org,
 alexander.shishkin@linux.intel.com, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20241221165934.1161856-1-yeoreum.yun@arm.com>
 <20241221165934.1161856-2-yeoreum.yun@arm.com>
 <6bbc9b64-3ecb-46c3-8c4e-55dba6301ef3@arm.com>
 <Z3+6kL7OGDX/pNul@e129823.arm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <Z3+6kL7OGDX/pNul@e129823.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_042115_151080_1555D10B 
X-CRM114-Status: GOOD (  13.07  )
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

On 09/01/2025 12:01, Yeoreum Yun wrote:
> Hi Suzuki,
> 
>> Is it not better to have separate "configs" for perf and sysfs ?
>> And etmX driver can populate the "running" config, based on the
>> mode specific config. That way, the configs can be updated
>> independently without affecting the running config or the perf one.
>>
> 
> That was i've tried but I've accepted Mike's opinion that
> it's enough to check whether CS_MODE_DISABLED via coresight_get_mode()
> in *_store().
> 
> "the .._store functions in sysfs should use coresight_get_mode() to ensure
> this is set to CS_MODE_DISABLED before altering the config,
> which ensures that the trace system is inactive.
> We don't' really care about reading the config if trace is running."

There are two issues with that :

1. Sprinkling the get_mode call in each sysfs stor function doesn't look 
good to me.

2. Someone preparing for a sysfs session must not be prevented from 
doing so just because there is a perf session running.


Suzuki


> Thanks.
> 



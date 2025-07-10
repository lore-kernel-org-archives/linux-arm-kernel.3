Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EEDCC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 13:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E8fSY0OISQ7esCo7zv1ndoxEISsPlqWrAE+EA4+w2D8=; b=bGn8yINpVGOqXb29kBShHgr6ad
	eNnZvg03IzPpTeHKULo6uVLW0GVIaZeoS6h+FR1/6SSKO10NT6D/Kr9X0VZZsLJOIUisjrYirqucG
	IPuCeOvFZANKRtk2ebRo/7pLMrGPV8EjjaBDeshbL05rrklERAA3jpAGLYmAPxwwXu2JNts8Yutuy
	SJ4YVFh1xe0EWQX1FcYn7NxoBlgVJMpuQ+PYbKUZ9zXWoLhNO0T54K1mnqduHUZj7aSbVl3lkerct
	80/r30Pe5AmhrhZesc/U95hqgGvNNe+nLHuBgC0ygmJBVrbnN4GY+2bpMqvF5ZKNkvSy2CKKjmmZR
	nsKhTqfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZr0B-0000000BsGR-45P5;
	Thu, 10 Jul 2025 13:07:51 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZpNn-0000000BdE1-1Uvt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 11:24:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AC1C21EA6;
	Thu, 10 Jul 2025 04:23:53 -0700 (PDT)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2F5473F66E;
	Thu, 10 Jul 2025 04:24:03 -0700 (PDT)
Message-ID: <9a1ae272-3128-425b-828d-50b2289a6cb8@arm.com>
Date: Thu, 10 Jul 2025 12:24:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] cacheinfo: Set cache 'id' based on DT data
To: James Morse <james.morse@arm.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, sudeep.holla@arm.com,
 Rob Herring <robh@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 WillDeaconwill@kernel.org
References: <20250704173826.13025-1-james.morse@arm.com>
 <20250704173826.13025-2-james.morse@arm.com>
 <9495df36-053e-49a3-8046-1e6aed63b4af@arm.com>
 <20250707133207.00001b88@huawei.com>
 <89c6f2a2-e084-4899-a6d6-819917eb6324@arm.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <89c6f2a2-e084-4899-a6d6-819917eb6324@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_042407_491522_EBBB7336 
X-CRM114-Status: GOOD (  24.19  )
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

Hi James and Jonathan,

On 7/10/25 12:15, James Morse wrote:
> Hi Ben, Jonathan,
> 
> On 07/07/2025 13:32, Jonathan Cameron wrote:
>> On Mon, 7 Jul 2025 11:27:06 +0100
>> Ben Horgan <ben.horgan@arm.com> wrote:
>>> On 7/4/25 18:38, James Morse wrote:
>>>> From: Rob Herring <robh@kernel.org>
>>>> Use the minimum CPU h/w id of the CPUs associated with the cache for the
>>>> cache 'id'. This will provide a stable id value for a given system. As
>>>> we need to check all possible CPUs, we can't use the shared_cpu_map
>>>> which is just online CPUs. As there's not a cache to CPUs mapping in DT,
>>>> we have to walk all CPU nodes and then walk cache levels.
>>>>
>>>> The cache_id exposed to user-space has historically been 32 bits, and
>>>> is too late to change. This value is parsed into a u32 by user-space
>>>> libraries such as libvirt:
>>>> https://github.com/libvirt/libvirt/blob/master/src/util/virresctrl.c#L1588
>>>>
>>>> Give up on assigning cache-id's if a CPU h/w id greater than 32 bits
>>>> is found.
> 
>>>> diff --git a/drivers/base/cacheinfo.c b/drivers/base/cacheinfo.c
>>>> index cf0d455209d7..df593da0d5f7 100644
>>>> --- a/drivers/base/cacheinfo.c
>>>> +++ b/drivers/base/cacheinfo.c
>>>> @@ -183,6 +184,42 @@ static bool cache_node_is_unified(struct cacheinfo *this_leaf,
>>>>    	return of_property_read_bool(np, "cache-unified");
>>>>    }
>>>>    
>>>> +static bool match_cache_node(struct device_node *cpu,
>>>> +			     const struct device_node *cache_node)
>>>> +{
>>>> +	for (struct device_node *cache __free(device_node) = of_find_next_cache_node(cpu);
>>> Looks like the creation of this helper function has upset the
>>> device_node reference counting. This first __free(device_node) will only
>>> cause of_node_put() to be called in the case of the early return from
>>> the loop. You've dropped the second __free(device_node) which accounts
>>> for 'cache' changing on each iteration.
> 
> Heh, I just took this hunk verbatim. Fixing this up with the __free() magic is tricky as
> the existing patterns all drop the reference to cpu, which we don't want to do here. I
> think at this point the __free() magic is just making this harder to understand. How about
> the old fashioned way:
> 
> | static bool match_cache_node(struct device_node *cpu,
> |                              const struct device_node *cache_node)
> | {
> |         struct device_node *prev, *cache = of_find_next_cache_node(cpu);
> |
> |         while (cache) {
> |                 if (cache == cache_node) {
> |                         of_node_put(cache);
> |                         return true;
> |                 }
> |
> |                 prev = cache;
> |                 cache = of_find_next_cache_node(cache);
> |                 of_node_put(prev);
> |         }
> |
> |         return false;
> | }
Ok with me.
> 
> 
>> Good catch - this behaves differently from many of the of_get_next* type
>> helpers in that it doesn't drop the reference to the previous iteration
>> within the call.
>>
>> Maybe it should?
>>
>> I checked a few of the call sites and some would be simplified if it did
>> others would need some more complex restructuring but might benefit as
>> well.
> 
> If it did, we'd end up dropping the reference to cpu on the way in, which
> of_get_next_cpu_node() in for_each_of_cpu_node() was expecting to do.

Yes, I think the blurring of the lines between a cpu node and cache node 
is at least partially to blame for the confusion here.
> 
> 
> Thanks,
> 
> James

Thanks,

Ben



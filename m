Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1885FC7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 17:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DBlLLbTK1mTA8cSLl7/NxZAXo+sIayjSO6PTZhbXFqc=; b=OhD31wFMC0Dyq4cQCoJ7F4ER26
	xup6dzOsjZttL5/L+ByzhHUnmN85alWaX4T8ag/d9nhz06XojSrn92CtnrcvFoIeoownJgrSvIvEY
	vceIHZMpN6z1v26GkjS8Wa1LWA+iQkcQ00/+dPzmObprMFYt6/V9d1RaEcvrftNqHvjf/06DEFD0B
	QEPdaXjOzjhNtg4pIsjRDVB7yTmIqGL5RsKuSfRLaoRTCwc3cYT9P51oy5GsxKOqKq/lB09snVoVm
	Ryoig0AuNYEH2GY9dduOindHfZ1tMzAKFbfr9uQuKzXscfQUkzpYU9NySbWDu9BW8WizJaIxfBOvB
	Fjvez53w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVDF7-0000000FRxF-0Ah7;
	Fri, 27 Jun 2025 17:52:05 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVC6N-0000000FIxf-0sJH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 16:39:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 966F71A00;
	Fri, 27 Jun 2025 09:38:41 -0700 (PDT)
Received: from [10.1.197.43] (eglon.cambridge.arm.com [10.1.197.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 654E53F58B;
	Fri, 27 Jun 2025 09:38:57 -0700 (PDT)
Message-ID: <e21d05c8-771a-4a2b-8573-76f7d5668a3d@arm.com>
Date: Fri, 27 Jun 2025 17:38:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] cacheinfo: Set cache 'id' based on DT data
To: Rob Herring <robh@kernel.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, sudeep.holla@arm.com,
 Ben Horgan <ben.horgan@arm.com>
References: <20250613130356.8080-1-james.morse@arm.com>
 <20250613130356.8080-2-james.morse@arm.com>
 <20250617170323.00006688@huawei.com>
 <CAL_Jsq+vA1AR+P0se3njU-_P0cjBM1h-4YGAShFZ-gy53SkZfw@mail.gmail.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <CAL_Jsq+vA1AR+P0se3njU-_P0cjBM1h-4YGAShFZ-gy53SkZfw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_093859_333055_BA0C3453 
X-CRM114-Status: GOOD (  37.57  )
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

Hi Jonathan, Rob,

On 23/06/2025 15:18, Rob Herring wrote:
> On Tue, Jun 17, 2025 at 11:03 AM Jonathan Cameron
> <Jonathan.Cameron@huawei.com> wrote:
>> On Fri, 13 Jun 2025 13:03:52 +0000
>> James Morse <james.morse@arm.com> wrote:
>>> From: Rob Herring <robh@kernel.org>
>>>
>>> Use the minimum CPU h/w id of the CPUs associated with the cache for the
>>> cache 'id'. This will provide a stable id value for a given system. As
>>> we need to check all possible CPUs, we can't use the shared_cpu_map
>>> which is just online CPUs. As there's not a cache to CPUs mapping in DT,
>>> we have to walk all CPU nodes and then walk cache levels.
>>
>> Is it ok for these to match for different levels?  I've no idea for
>> these use cases.

> Yes. The 'id' is per level, not globally unique.

Documented here:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/filesystems/resctrl.rst#n482

The values are unique per-level, but also sparse, meaning they could be unique
system-wide. This is what will happen on arm64 ACPI platforms because the PPTT value gets
exposed directly.


>>> The cache_id exposed to user-space has historically been 32 bits, and
>>> is too late to change. Give up on assigning cache-id's if a CPU h/w
>>> id greater than 32 bits is found.

>> Mainly a couple of questions for Rob on the fun of scoped cleanup being
>> used for some of the iterators in a similar fashion to already
>> done for looping over child nodes etc.

This is mostly over my head!


>>> diff --git a/drivers/base/cacheinfo.c b/drivers/base/cacheinfo.c
>>> index cf0d455209d7..9888d87840a2 100644
>>> --- a/drivers/base/cacheinfo.c
>>> +++ b/drivers/base/cacheinfo.c
>>> @@ -183,6 +184,37 @@ static bool cache_node_is_unified(struct cacheinfo *this_leaf,
>>>       return of_property_read_bool(np, "cache-unified");
>>>  }
>>>
>>> +static void cache_of_set_id(struct cacheinfo *this_leaf, struct device_node *np)
>>> +{
>>> +     struct device_node *cpu;
>>> +     u32 min_id = ~0;
>>> +
>>> +     for_each_of_cpu_node(cpu) {
>>
>> Rob is it worth a scoped variant of this one?  I've come across
>> this a few times recently and it irritates me but I didn't feel
>> there were necessarily enough cases to bother.  With one more
>> maybe it is time to do it (maybe 10+ from a quick look)_.
> 
> My question on all of these (though more so for drivers), is why are
> we parsing CPU nodes again? Ideally, we'd parse the CPU and cache
> nodes only once and the kernel would provide the necessary info.
> 
> Take drivers/clk/mvebu/ap-cpu-clk.c for example. The code there really
> just needs to know if there are 2 or 4 possible CPUs or what is the
> max physical CPU id (If CPU #1 could be not present).
> 
>>> +             struct device_node *cache_node __free(device_node) = of_find_next_cache_node(cpu);
>>> +             u64 id = of_get_cpu_hwid(cpu, 0);
>>> +
>>> +             if (FIELD_GET(GENMASK_ULL(63, 32), id)) {
>>> +                     of_node_put(cpu);
>>> +                     return;
>>> +             }
>>> +             while (1) {
>>
>> for_each_of_cache_node_scoped() perhaps?  With the find already defined this would end
>> up something like the following.  Modeled on for_each_child_of_node_scoped.
> 
> That seems like an invitation for someone to parse the cache nodes
> themselves rather than use cacheinfo. Plus, there are multiple ways we
> could iterate over cache nodes. Is it just ones associated with a CPU
> or all cache nodes or all cache nodes at a level?
> 
> That being said, I do find the current loop a bit odd with setting
> 'prev' pointer which is then never explicitly used. We're still having
> to worry about refcounting, but handling it in a less obvious way.
> 
>>         #define for_each_of_cache_node_scoped(cpu, cache) \
>>                 for (struct device_node *cache __free(device_node) = \
>>                      of_find_next_cache_node(cpu); cache != NULL; \
>>                      cache = of_find_next_cache_node(cache))
>>
>>         for_each_of_cpu_node_scoped(cpu) {
>>                 u64 id = of_get_cpu_hwid(cpu, 0);
>>
>>                 if (FIELD_GET(GENMASK_ULL(63, 32), id))
>>                         return;
>>                 for_each_of_cache_node_scoped(cpu, cache_node) {
>>                         if (cache_node == np) {
>>                                 min_id = min(min_id, id);
>>                                 break;
>>                         }
>>                 }
>>         }
>>
>>> +                     if (!cache_node)
>>> +                             break;
>>> +                     if (cache_node == np && id < min_id) {
>>
>> Why do you carry on if id >= min_id?  Id isn't changing.  For that
>> matter why not do this check before iterating the caches at all?
> 
> You're right, no need. There's no need to handle the id in the loop at
> all, we just need to match the cache node. So perhaps just a helper:
> 
> static bool match_cache_node(struct device_node *cpu, const struct
> device_node *cache_node)
> {
>   for (struct device_node *cache __free(device_node) =
>         of_find_next_cache_node(cpu); cache != NULL;
>         cache = of_find_next_cache_node(cache)) {
>     if (cache == cache_node)
>       return true;
>   }
>   return false;
> }
> 
> And then the cpu loop would have:
> 
> if (match_cache_node(cpu, cache_node))
>   min_id = min(min_id, id);
Done,


Thanks!

James


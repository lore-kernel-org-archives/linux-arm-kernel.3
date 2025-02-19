Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39EEBC021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 13:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZuGFwvRuRE8tROLRYOd98WU9vM1uPTV6mc8tqcLzdZA=; b=cjpJrCDCNVAhpCW/8tDcdBO32n
	GHnnZHMJZXXZKrVA/MXvq/og0vlY022/4vTZdEPv6BMIom4p3eJxrMhNHbLfSFI8A/WQVUhGE/eKe
	SZ2hrhQmGQzSZcQXzUbVsdIXs2DMyeD/ItxuV/BwL/GKnmN2MJFOKWIeLawNJr7GZCJkrjHfesfgY
	J1mORXG9h95Yy0UvayA3rRbkH0IVUbscvqeSvRZEWcUyqmxzZpMtyG8pAG/1Co0schvSjhmeOP6A8
	wjo6bJRk/VZN4p3+2UJSk0pQBcZ7gkgvWIOl659zsbHqTMtgxD1E9sgczpX5VwtSr8E/a7yhS5eUZ
	3lhSNBTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkjxo-0000000CuDr-2JHc;
	Wed, 19 Feb 2025 13:18:08 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkjwJ-0000000Cts6-2BeY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 13:16:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DAFC51682;
	Wed, 19 Feb 2025 05:16:35 -0800 (PST)
Received: from [10.57.36.80] (unknown [10.57.36.80])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 038E53F59E;
	Wed, 19 Feb 2025 05:16:15 -0800 (PST)
Message-ID: <a94c0622-ae31-46f1-b51e-a344b86aa47c@arm.com>
Date: Wed, 19 Feb 2025 13:16:13 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] perf/arm-cmn: don't claim resource during ioremap() for
 CMN700 with ACPI
To: YinFengwei <fengwei_yin@linux.alibaba.com>
Cc: will@kernel.org, mark.rutland@arm.com,
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org, jie.li.linux@linux.alibaba.com,
 renyu.zj@linux.alibaba.com
References: <20250218012111.30068-1-fengwei_yin@linux.alibaba.com_quarantine>
 <d5040b5c-564d-4abf-be22-d2aa1183b633@arm.com>
 <hfip42i45jkumuvgdthxm2bk6qylqyqh6erzaq43yiqygvn6uu@dcui675lwtkm>
 <73af368a-52a9-4922-876b-7a6e2d32a94e@arm.com>
 <gfgtxwe3fmh4unleypyrp2qxchrqcz7wqzyoy7om2zjqev6ggf@gnnqnmusecc3>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <gfgtxwe3fmh4unleypyrp2qxchrqcz7wqzyoy7om2zjqev6ggf@gnnqnmusecc3>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_051635_644750_B97FE2AB 
X-CRM114-Status: GOOD (  31.21  )
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

On 2025-02-19 1:50 am, YinFengwei wrote:
> Add Jing Zhang as we will continue discussion in this thread.
> 
> On Tue, Feb 18, 2025 at 12:31:10PM +0800, Robin Murphy wrote:
>> On 2025-02-18 10:58 am, YinFengwei wrote:
>>> On Tue, Feb 18, 2025 at 10:31:42AM +0800, Robin Murphy wrote:
>>>> On 2025-02-18 1:21 am, Yin Fengwei wrote:
>>>>> Currently, arm-cmn PMU driver assumes ACPI claim resource
>>>>> for CMN600 + ACPI. But with CMN700 + ACPI, the device probe
>>>>> failed because of resource claim failes when ioremap() is
>>>>> called:
>>>>> [   10.837300] arm-cmn ARMHC700:00: error -EBUSY: can't request region for resource [mem 0x40000000-0x4fffffff]
>>>>> [   10.847310] arm-cmn ARMHC700:00: probe with driver arm-cmn failed with error -16
>>>>> [   10.854726] arm-cmn ARMHC700:02: error -EBUSY: can't request region for resource [mem 0x40040000000-0x4004fffffff]
>>>>> [   10.865085] arm-cmn ARMHC700:02: probe with driver arm-cmn failed with error -16
>>>>>
>>>>> Let CMN700 + ACPI do same as CMN600 + ACPI to allow CMN700
>>>>> work in ACPI env.
>>>>
>>>> No, the CMN-600 routine is a special case for CMN-600 having two nested
>>>> memory resources of its own. CMN-700 and everything else only have one
>>>> memory resource, so that is not appropriate. What else is claiming the
>>>> region to cause a conflict?
>>> Sorry. Forgot the link for the new proposed fix:
>>> https://lore.kernel.org/all/Z7QYlUP6nfBNMXsv@U-V2QX163P-2032.local/
>>
>> Yes, I saw that. It's a broken diff that won't even compile, with no
>> explanation of what it's supposed to be trying to achieve or why. I'm not
>> sure what you're asking me to comment on.
> My bad. I will attatch the full patch at the end of this mail.
> 
>>
>>> My understanding is that there are two problems here:
>>> 1. ACPI claim the memory range and that's why we see this -EBUSY error
>>>      with correct code path for CMN700 + ACPI table.
>>
>> No, it's fine to claim the exact *same* range that the ACPI companion owns;
>> the identical requests just nest inside each other. I don't have a CMN-700
>> to hand but here's a selection of other drivers doing just that from
>> /proc/iomem on my system:
>>
>> 12600000-12600fff : ARMH0011:00
>>    12600000-12600fff : ARMH0011:00 ARMH0011:00
>> 12610000-12610fff : ARMH0011:01
>>    12610000-12610fff : ARMH0011:01 ARMH0011:01
>> 126b0000-126b0fff : APMC0D0F:00
>>    126b0000-126b0fff : APMC0D0F:00 APMC0D0F:00
>> 126f0000-126f0fff : APMC0D81:00
>>    126f0000-126f0fff : APMC0D81:00 APMC0D81:00
> I believe this works only for parents/children resource node. Otherwise,
> there will be conflict.

I don't understand what you mean by that. The point here is that these
are simple devices with a single memory resource (just like CMN-700),
where in each case, a driver using devm_{platform_}ioremap_resource()
(just like arm-cmn) has happily claimed (2nd line) the same resource
already defined by the ACPI layer (1st line). Admittedly it's a little
unclear since they both use the same name, but still.

>>
>> And I know people are using the CMN-700 PMU on other ACPI systems without
>> issue, so there's nothing wrong with the binding or the driver in general.
>>
>> The resource conflict only arises when a request overlaps an existing region
>> inexactly. Either your firmware is describing the CMN incorrectly, or some
>> other driver is claiming conflicting iomem regions for some reason.
> No. It's not ACPI table problem. The problem is mentioned in comments of
> function arm_cmn600_acpi_probe():
>          /*
>           * Note that devm_ioremap_resource() is dumb and won't let the platform
>           * device claim cfg when the ACPI companion device has already claimed
>           * root within it. But since they *are* already both claimed in the
>           * appropriate name, we don't really need to do it again here anyway.
>           */

Sigh... No, this is unique to CMN-600, because only the CMN-600 ACPI
binding depends on nested resources, such that the resource tree
starts off looking like this:

50000000-5fffffff : ARMHC600:00
   50d00000-50d03fff : ARMHC600:00

If we wanted to, we can still quite happily claim the root node
resource:

--- a/drivers/perf/arm-cmn.c
+++ b/drivers/perf/arm-cmn.c
@@ -2410,6 +2410,8 @@ static int arm_cmn600_acpi_probe(struct platform_device *pdev, struct arm_cmn *c

         if (!resource_contains(cfg, root))
                 swap(cfg, root);
+
+       devm_request_mem_region(cmn->dev, root->start, resource_size(root), "arm-cmn!");
         /*
          * Note that devm_ioremap_resource() is dumb and won't let the platform
          * device claim cfg when the ACPI companion device has already claimed


...which then nests like so:

50000000-5fffffff : ARMHC600:00
   50d00000-50d03fff : ARMHC600:00
     50d00000-50d03fff : arm-cmn!

but what we cannot do is claim the whole 50000000-5fffffff region again
because that cannot nest within the existing 50d00000-50d03fff region.

> So I suppose for ACPI env, we should use devm_ioremap() as cmn600 does.
> And make CMN700 handling follow spec exactly.

As I said, the driver already supports the CMN-700 APCI binding
perfectly well. If your CMN is described correctly then you need to
answer my question of what *other* driver is claiming conflicting
resources and why (and if so, also why that should be specific to ACPI).

Thanks,
Robin.


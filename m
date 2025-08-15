Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AAFACA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 18:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N9lFH7UuH7iHQn6NU/GlGO/bgFV+O6Qr6ij9u5KRxs4=; b=k1/mDfuGO+8nXyOUS7kNHWQMH+
	VDOJ3ZisNTTPLIfSTttlFItwNJMjSdxCTuGEWi1FESAh7RlOIY1P5aauaxjUmClHQ+AFfyMl250PH
	apMNrrUePIOW4LdYDbL1PMS8hGZI73Ae4iI6kS415FAa/aAVVHvhQLWRg2EOxLxUjvXOP07AjnRmc
	R3PBDfXPHHYg62XPwdmVmPKvd5Yxjb0XFNIBHWBkoC9O0huBhmOCWtF/8APGB/iMMS8zjyBDCLi26
	U+7x9eT1CoNR2TTb9wodFII6IUR3s/IX8GbO3uS8emKBn0ln2/r1Od8JvFp//oXOVbfQOv1TXo0T8
	sQSmAGpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umzRW-00000003HB7-491V;
	Fri, 15 Aug 2025 18:46:22 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umxZf-000000030Vo-2aZa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Aug 2025 16:46:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A1EEAFEC;
	Fri, 15 Aug 2025 09:46:28 -0700 (PDT)
Received: from [192.168.20.57] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 585FA3F738;
	Fri, 15 Aug 2025 09:46:36 -0700 (PDT)
Message-ID: <1097a1d1-483d-44b3-b473-4350b5a4b04d@arm.com>
Date: Fri, 15 Aug 2025 11:46:35 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: defconfig: enable CONFIG_SCHED_CLUSTER
To: Sudeep Holla <sudeep.holla@arm.com>,
 "Christoph Lameter (Ampere)" <cl@gentwo.org>
Cc: Huang Shijie <shijie@os.amperecomputing.com>, catalin.marinas@arm.com,
 will@kernel.org, patches@amperecomputing.com,
 Shubhang@os.amperecomputing.com, krzysztof.kozlowski@linaro.org,
 bjorn.andersson@oss.qualcomm.com, geert+renesas@glider.be, arnd@arndb.de,
 nm@ti.com, ebiggers@kernel.org, nfraprado@collabora.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250808025533.6422-1-shijie@os.amperecomputing.com>
 <e47757c3-6091-43b5-ba28-52e11de7d86a@arm.com>
 <cb383a76-8848-44cd-6f32-fd30478d9ebd@gentwo.org>
 <2d9259e4-1b58-435d-bf02-9c4badd52fd9@arm.com>
 <20250813-gifted-nimble-wildcat-6cdf65@sudeepholla>
 <d172f30d-28ad-dd46-1385-f010107bc789@gentwo.org>
 <c45b13b9-52ae-a52b-ce39-77f7ebe09507@gentwo.org> <aJ20imoeRL_tifky@bogus>
 <97278200-b877-47a6-84d4-34ea9dda4e6b@gentwo.org>
 <20250815-pheasant-of-eternal-tact-6f9bbc@sudeepholla>
Content-Language: en-US
From: Jeremy Linton <jeremy.linton@arm.com>
In-Reply-To: <20250815-pheasant-of-eternal-tact-6f9bbc@sudeepholla>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_094639_746963_8EC5BA8B 
X-CRM114-Status: GOOD (  51.02  )
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

Hi,


On 8/15/25 5:48 AM, Sudeep Holla wrote:
> On Thu, Aug 14, 2025 at 09:30:06AM -0700, Christoph Lameter (Ampere) wrote:
>> On Thu, 14 Aug 2025, Sudeep Holla wrote:
>>
>>>    |  Different architectures use different terminology to denominate logically
>>>    |  associated processors, but terms such as package, cluster, module, and
>>>    |  socket are typical examples.
>>>
>>> So how can one use these across architectures ? Package/Socket is quite
>>> standard. Cluster can be group of processors or it can also be group of
>>> processor clusters. One of the Arm vendors call it super cluster or something.
>>> All these makes it super hard for a generic OS to interpret that information.
>>> Just CONFIG_SCHED_CLUSTER was added with one notion of cluster which was soon
>>> realised doesn't match with some other notion of it.
>>
>> What the cluster actually is used for is up to the hardware. The linux
>> scheduler provides this functionality. How and when this feature is used
>> by firmware is a vendor issue. There was never a clear definition.
>>
> 
> Sure, since it is left to architecture to define what it means, it could
> work. But what happens if we have multiple chiplet inside a socket and
> each chiplet has multiple cluster. Do you envision using this SCHED_CLUSTER
> at chiplet level if that works best on the platform ?
> 
> That could work, but we need to document all these with the best of our
> knowledge now so that it is easy to revisit in the future.
> 
>>> We can enable it and I am sure someone will report a regression on their
>>> platform and we need to disable it again. The benchmark doesn't purely
>>> depend on just the "notion" of cluster but it is often related to the
>>> private resource and how they are shared in the system. So even if you
>>> strictly follow the notion of cluster as supported by CONFIG_SCHED_CLUSTER
>>> it will fail on systems where the private resources are shared across the
>>> "cluster" boundaries or some variant configuration.
>>
>> That is not our problem. If the vendor provides clustering information and
>> the scheduler uses that then the vendor can modify the firmware to not
>> enable clustering.
>>
> 
> That is pure wrong. ACPI is describing the hardware. Deciding to put
> clustering information in these tables only if it provides performance or
> not hinder performance seem complete non-sense to me. That covering policy
> in ACPI hardware description. Does ACPI spec mention anything about it ?
> I mean remove some hardware description even if it is 100% accurate if it
> hinders performance on one of the OSPM ? Doesn't sound correct at all.
> 
>> As mentioned before: We could create a blacklist to override the ACPI info
>> from the vendor to ensure that clustering is off.
>>
> 
> Not a bad idea. We can see if allow or blocklist works as we start with one.

 From a distro perspective it makes more sense to me to change it from a 
compile time option to a runtime kernel command line option with the 
default on/off set by this SCHED_CLUSTER flag rather than try to 
maintain a blocklist.


I agree the firmware needs a much clearer way to signal that these nodes 
represent something other than just side effects of the way the table is 
built. If the working group is hesitant to declare additional 
topological flags, maybe this idea of deriving additional topological 
information from nodes without caches is a reasonable spec 
clarification. That way some future 
NODE_IS_A_CLUSTER/DSU/CHIPLET/SUPERCLUSTER/RING/SLICE/WHATEVER doesn't 
turn the existing code into technical debt.

But returning to the original point, its not clear to me that the HW 
'cluster' information is really causing the performance boost vs, just 
having a medium size scheduling domain (aka just picking an arbitrary 
size 4-16 cores) under MC, or simply 'slicing' a L3 in the PPTT such 
that the MC domains are smaller, yields the same effect. I've seen a 
number of cases where 'lying' about the topology yields a better result 
in a benchmark. This is largely what is happening with these Firmware 
toggles that move/remove the NUMA domains too. Being able to manually 
reconfigure some of these scheduling levels at runtime might be useful...




> 
>> What we should not do is disabling clustering for all.
>>
> 
> Not completely against it but I have concerns on how all these scale with
> multiple chiplets within a socket or any such variants.
> 
>>>> We could add a blacklist for those platforms to avoid regressions but we
>>>> should not allow that to hinder us to enable full support for clustering
>>>> on ARM64.
>>>>
>>>
>>> Sure, but we need to improve the "cluster" definition in the ACPI and Arm
>>> specification, get an agreement on what it means for other architecture
>>> first IMO. We don't want to revisit the same topic again without these as
>>> IIRC this is the second time we are discussion around this topic.
>>
>> The vendors need flexibility to use this feature when it makes sense.
>>
> 
> Sure, but too much flexibility might also hinder future changes when adding
> some other feature(chiplet again is one thing I can think of now)
> 
>> Having a clear definition would limit the use of clustering feature and
>> limits innovation. Vendors can control the clustering via ACPI and the
>> firmware they provide with their system.
>>
> 
> Not sure if that should be right direction TBH, but again not against the
> idea of enabling the feature on some platforms if we are going to enable it
> by default.
> 
>> We could change definition but that but that would be a decadelong
>> process which will encounter resistance from vendors that make uses of the
>> clustering feature that does not fall into the stricter definition.
>>
> 
> I understand and get the point, but decadelong is bit of an exaggeration 😉.
> Not discussing these in ACPI or similar forum is not a good idea as we know
> there are new h/w features that are being added and current specification
> may not provide ways to express all of those.
> 



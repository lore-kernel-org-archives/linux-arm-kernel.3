Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21EA5E68946
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 02:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5rkCyTtyjQO4GMp4PfmP1EElR5E54HWYX9jbZSmVx0Q=; b=LYC0cT+jCjYjetSCv0b81OnMYh
	2aA0ndVrStv4YczkXwnhMzH4/dEsc3ulBYZH+FpjH+Mw3+QK9q1EB9VdY2IOCzap/Gfr65ND8rQ3L
	b4WmeNlnktbAVxnQ82rLWMHRgx7xB7v8QQ8CoVS+DhZ0EHbL3LSbj+crp7PjvENcD5rO/Pz1opOxw
	KhQizZv6z+w6sDLc9gQi3wHzPetdk13mh+EU1tWvc1Sqo8RWYibECMBi2Bou3TnB9E9xAxc0CoD+c
	wuAMrDfTETb2w6ljODnffO/kqQItO/lZqWZ7JNIL3NJRWmS2KjD+ORzla148e1ryHpgXnG7m03hyb
	pZl0Q7fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6Kdx-00000002KQ2-2Bwh;
	Thu, 31 Oct 2024 02:10:37 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6KcH-00000002KFg-2uuL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 02:08:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3ECDD1063;
	Wed, 30 Oct 2024 19:09:21 -0700 (PDT)
Received: from [10.0.0.145] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0AF693F73B;
	Wed, 30 Oct 2024 19:08:50 -0700 (PDT)
Message-ID: <86b2aef1-8926-47c8-8a33-9f02e3dd7d72@arm.com>
Date: Wed, 30 Oct 2024 21:08:50 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: rsi: Add automatic arm-cca-guest module loading
To: Gavin Shan <gshan@redhat.com>, linux-arm-kernel@lists.infradead.org
Cc: steven.price@arm.com, suzuki.poulose@arm.com, catalin.marinas@arm.com,
 will@kernel.org, sami.mujawar@arm.com, linux-kernel@vger.kernel.org
References: <20241029141114.7207-1-jeremy.linton@arm.com>
 <32211eb5-eed5-4c71-b62a-362d32e1af47@redhat.com>
 <b62b9ba4-eaf9-4533-9a97-7d5e2929b1e8@arm.com>
 <98b47e47-9014-45d1-86c7-4b78ff36bf54@redhat.com>
Content-Language: en-US
From: Jeremy Linton <jeremy.linton@arm.com>
In-Reply-To: <98b47e47-9014-45d1-86c7-4b78ff36bf54@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_190853_846795_2FC266EF 
X-CRM114-Status: GOOD (  24.24  )
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

On 10/30/24 5:48 PM, Gavin Shan wrote:
> Hi Jeremy,
> 
> On 10/31/24 1:16 AM, Jeremy Linton wrote:
>> On 10/29/24 7:23 PM, Gavin Shan wrote:
>>> On 10/30/24 12:11 AM, Jeremy Linton wrote:
>>>> The TSM module provides both guest identification as well as
>>>> attestation when a guest is run in CCA mode. Lets assure by creating a
>>>> dummy platform device that the module is automatically loaded during
>>>> boot. Once it is in place it can be used earlier in the boot process
>>>> to say decrypt a LUKS rootfs.
>>>>
>>>> Signed-off-by: Jeremy Linton <jeremy.linton@arm.com>
>>>> ---
>>>>   arch/arm64/include/asm/rsi.h                    |  2 ++
>>>>   arch/arm64/kernel/rsi.c                         | 15 +++++++++++++++
>>>>   drivers/virt/coco/arm-cca-guest/arm-cca-guest.c |  7 +++++++
>>>>   3 files changed, 24 insertions(+)
>>>>
>>>
>>> I don't understand how the TSM module is automatically loaded and 
>>> arm_cca_guest_init()
>>> is triggered because of the newly introduced platform device. Could 
>>> you please provide
>>> more details? Apart from it, some nick-picks as below.
>>
>> I think your asking how the module boilerplate here works, AKA how the 
>> standard uevent/udev/modalias/kmod stuff works? The short version is 
>> that the platform bus uevents an add device with a modalias and 
>> userspace udev + kmod finds matching modules, and their dependencies, 
>> and loads them which triggers the module_init() calls.
>>
>> The suse folks have a detailed description of how this works:
>> https://doc.opensuse.org/documentation/leap/reference/html/book- 
>> reference/cha-udev.html#sec-udev-kernel
>>
>> So, this is a fairly common misuse of the platform bus, in this case 
>> to avoid needing a HWCAP. Assuring the module exists in the initrd 
>> will then result in it being loaded along any other modules required 
>> for the rootfs pivot.
>>
>>
> 
> Thanks for the explanation and details. The module won't be 
> automatically loaded if
> udev daemon isn't in place or the DEV_ADD event is ignored for whatever 
> reasons. For
> example the corresponding ACTION for DEV_ADD of this particular device 
> is null in the
> udev rules. So it's not guranteed that the module can be automatically 
> loaded until udev
> is in place and udev rules have been configured properly. It's a best- 
> effort attempt
> if I don't miss anything.

This functionality has been standard in all but the most deeply 
enmbedded linux systems for a couple decades now (AFAIK). The platform 
and modalias logic should largely just work everywhere that its 
appropriate to be building this as a module. And to be clear that is 
without updating any of the existing rules.

> 
> Could you please update the change log to mention the automatic module 
> loading depends
> on udev and its rules? In this way, readers will know it's a best-effort 
> attempt at least.
> 
> Thanks,
> Gavin
> 



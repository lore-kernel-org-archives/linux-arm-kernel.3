Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28A03C5AD7B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 18:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6uocWMUyq10tTXQPMowB6SxGjrMyb7a+x9LfRaICKnM=; b=qJaJh88MGCwaxNz1tXNJydDmFo
	od+mDVuaUk/yBwb045Fd/uYsD3xXW9/Fk44GO5PhkaPMTl5s8X5+swmyuH2qQ6epVmQkpWpsJMjmu
	jXoI67sk5woyaTpRfb0xAqnUwvux06x3DfNrGKpdRknj+iZcxQ2Q5XH4BuMfCEIUlYXzlLgk8akXM
	YmN9Z8BQMfglppNnwS0/6D1m/4EQwiIYMvYRvkFfuCOljNinQlCBp1lrZYgm7wOB2cilCXTRF3Zb1
	opLMdwDelb3NpeXul+5jQvLhEVgn+mpZHTMFsGuGZPyMCdiHf6ukxsp2wgkjp40wW1XVr33FjXXz0
	MKkl+UUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtULS-0000000Ca7P-3y3q;
	Mon, 10 Aug 2026 18:03:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtULQ-0000000Ca6I-17e6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 18:03:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2326A14BF;
	Mon, 10 Aug 2026 11:03:21 -0700 (PDT)
Received: from [10.2.212.23] (e121345-lin.cambridge.arm.com [10.2.212.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 569D43F86F;
	Mon, 10 Aug 2026 11:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786385005; bh=iqkN+MCW+ZeceZp70Va10kFXV0Ae5WHVvuwaPIe0BHo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=uV1lkrJpi27dsmHgqVdZoC6YQCyQqxSaQ4yha6qZ7KhlAJxrIDRQ7I0y21VRFW17J
	 RBEcQdiTYv/CD02/lNqrWcMPmlupTvriCJENfZLQutIB80r7ao1/vEYQqcRn9psAX2
	 3XCJGvAL0qtR7C89llo/aN1FRO+uKq9uZRsjOnZU=
Message-ID: <530dbb40-e7e2-4121-a5eb-5f16152fd11b@arm.com>
Date: Mon, 10 Aug 2026 19:03:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Add arm-smmu-v3 support for instcfg data override
 feature
To: Rob Herring <robh@kernel.org>, Peter Griffin <peter.griffin@linaro.org>
Cc: Will Deacon <will@kernel.org>, "Joerg Roedel (AMD)" <joro@8bytes.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Pranjal Shrivastava <praan@google.com>,
 Daniel Mentz <danielmentz@google.com>, Mostafa Saleh <smostafa@google.com>,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel-team@android.com, tudor.ambarus@linaro.org, andre.draszik@linaro.org,
 willmcvicker@google.com, jyescas@google.com
References: <20260724-arm-smmu-v3-instcfg-override-v1-0-e7acf4a8a525@linaro.org>
 <amYIuhYenP4-qHyV@willie-the-truck>
 <0b7c0272-5506-4aee-82b3-76a78f2b39dc@arm.com>
 <CADrjBPqZFDvyLFpDy1YP9qrMNUCtZYtJhiaDd0iTnmB4ZYO8GQ@mail.gmail.com>
 <20260807224745.GA2180415-robh@kernel.org>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20260807224745.GA2180415-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_110328_511493_5662904A 
X-CRM114-Status: GOOD (  22.14  )
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

On 07/08/2026 11:47 pm, Rob Herring wrote:
> On Fri, Aug 07, 2026 at 04:25:11PM +0100, Peter Griffin wrote:
>> Hi Will & Robin,
>>
>> Thank you both for your review feedback.
>>
>> On Mon, 27 Jul 2026 at 11:53, Robin Murphy <robin.murphy@arm.com> wrote:
>>>
>>> On 26/07/2026 2:16 pm, Will Deacon wrote:
>>>> On Fri, Jul 24, 2026 at 01:39:41PM +0100, Peter Griffin wrote:
>>>>> These two patches add support for a new "arm,instdata-override" DT property
>>>>> that enables the override of the instruction/data attribute of incoming
>>>>> traffic to Data by setting the INSTCFG override bits.
>>>>>
>>>>> It is intended to be specified when the smmu can't guarantee that these
>>>>> attributes are provided correctly from the client device.
>>>>
>>>> This is going to need an in-tree user and a much more detailed
>>>> description of what is being worked around before we consider this for
>>>> inclusion.
>>
>> Regarding an in-tree user, I haven't sent the Device Tree (DT) patch
>> yet for Laguna SoC which adds the smmu nodes and this property because
>> 1) I want to land the initial SoC/board DT first
>> 2) I want agreement on the DT property name. Currently I used
>> "arm,instdata-override" which is what downstream used. However, since
>> this is intended to work around silicon errata something like
>> "google,lga-instcfg-data-override" might be more appropriate?
> 
> Shrug.
> 
> Really, this is why we want SoC specific compatibles so work-arounds can
> be added without DT updates. But we've generally avoided doing that for
> SMMU for whatever reasons. Just make the property clearly sound like a
> mistake, not a feature you might want to use. I'd keep the arm prefix
> just so the next vendor thinks they can't use 'google' and creates the
> same property with their vendor prefix.

I dunno, I'd be inclined to keep it more vendor/SoC-specific and tied to 
the problem more than one (of potentially several) specific workaround - 
if we did ever want to support using the INSTCFG/PRIVCFG/MEMCFG 
overrides per their full architectural intent, they are per-StreamID 
controls so as such would really want to be encoded in an additional 
#iommu-cell (or at worst maybe a property on the client device node).

Frankly for a workaround condition to just blanket-apply to every SMMU 
instance in a particular SoC, I'm honestly thinking that just whacking 
an of_machine_is_compatible() in the driver isn't necessarily the worst 
idea either - after all we do already have the ACPI equivalent of that 
for some of the HiSilicon stuff, it's just hidden in the IORT code (and 
OK it's used for the SMMU PMUs rather than the actual SMMU devices 
themselves, but still...)

Thanks,
Robin.


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8BE8C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 13:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wb/i0JLoZQAVn9vRHeKNzODf6wclEm+hQW8lX4qy6iw=; b=o+Zql7Wa7JI9Tnon0SFDxB6mRs
	CBKwwh5dpPwEFhOHB4jpcFQKuQsLKB2RpHH16EsfQUtOvI0DI4OldCZ/9i7UpR2dze13pxpUrdgxH
	6/N5sFmwzNDXi/KzIbc9vlZj4P9nLCNGoVqk7vyrM0uvaJKDD/MZbGzUeZTrFq+VqGWcfobS24TLX
	NF445Cf2aPrIVjEX74fZgZ+FZD00acH69k58ZB9BJYB0nngEzzb1gTgh0C63fbPbQ6c4lQt6UJ/wT
	UZjlui6vNbvgAZCHT8bBMQYNHJLFEg283CBWtIyIp9PBETdMo2EdhAvwiNiboYUIn73Bn2jNjRNOK
	VkV4y+cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7aXZ-0000000Ai5W-1aa4;
	Wed, 23 Apr 2025 13:53:29 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7aAI-0000000AbyJ-24gH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 13:29:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9A0761063;
	Wed, 23 Apr 2025 06:29:19 -0700 (PDT)
Received: from [10.57.74.63] (unknown [10.57.74.63])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5D0473F66E;
	Wed, 23 Apr 2025 06:29:23 -0700 (PDT)
Message-ID: <b7557def-d0a1-4035-9586-a2651e28ab24@arm.com>
Date: Wed, 23 Apr 2025 14:29:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dmaengine: ARM_DMA350 should depend on ARM/ARM64
To: Vinod Koul <vkoul@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <50dbaf4ce962fa7ed0208150ca987e3083da39ec.1745345400.git.geert+renesas@glider.be>
 <b1f19b31-3535-4bb5-bcef-6f17ad2a0ee6@arm.com>
 <CAMuHMdVJKA8zYETKJTRAwg6=+EuTq4YqbFO32K4+py9YNsD1Gw@mail.gmail.com>
 <aAjTg8dgvxqLQOwQ@vaman>
 <CAMuHMdXQKG0qptWMi169MVBL1S3hPo1TsaOSxWspoHAwRd+fug@mail.gmail.com>
 <aAjaPV/2DSyPAGRB@vaman>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <aAjaPV/2DSyPAGRB@vaman>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_062926_603269_801E700B 
X-CRM114-Status: GOOD (  16.85  )
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

On 2025-04-23 1:17 pm, Vinod Koul wrote:
> On 23-04-25, 14:13, Geert Uytterhoeven wrote:
>> Hi Vinod,
>>
>> On Wed, 23 Apr 2025 at 13:48, Vinod Koul <vkoul@kernel.org> wrote:
>>> On 23-04-25, 13:11, Geert Uytterhoeven wrote:
>>>> On Wed, 23 Apr 2025 at 12:59, Robin Murphy <robin.murphy@arm.com> wrote:
>>>>> On 2025-04-22 7:11 pm, Geert Uytterhoeven wrote:
>>>>>> The Arm DMA-350 controller is only present on Arm-based SoCs.
>>>>>
>>>>> Do you know that for sure? I certainly don't. This is a licensable,
>>>>> self-contained DMA controller IP with no relationship whatsoever to any
>>>>> particular CPU ISA - our other system IP products have turned up in the
>>>>> wild paired with non-Arm CPUs, so I don't see any reason that DMA-350
>>>>> wouldn't either.
>>>>
>>>> The dependency can always be relaxed later, when the need arises.
>>>> Note that currently there are no users at all...

Huh? There is now an upstream DT binding, and DTs using that binding 
most certainly already exist - not least the one I have, but I'm not the 
only one. We don't have a requirement that bindings must have 
upstream-supported consumers.

>>> True, but do we have any warnings generated as a result, if there are no
>>> dependency should we still limit a driver to an arch?
>>
>> I am not aware of any warnings (I built it on MIPS yesterday ;-).
>> It is just one more question that pops up during "make oldconfig",
>> and Linus may notice and complain, too...

Well, yeah? It's a new driver for some (relatively) new hardware; every 
release always adds loads of new drivers for things I don't personally 
care about, so I press "n" a lot when updating my config, just like I 
imagine most other people do, Linus included.

> True, give there are no users, lets pick this and drop if we get a non
> arm user

Well by that logic surely it should just depend on COMPILE_TEST, because 
there are no ARM or ARM64 "users" either?

FWIW the not-quite-upstream platform I developed on (a custom build of 
fvp-base-revc with a DMA-350 component added) did happen to be ARM64, as 
are some other Arm-internal designs and one available SoC that I do know 
of containing DMA-350; I am not aware of any Linux-capable 32-bit 
platforms to justify an ARM dependency, so I'd consider that just as 
arbitrarily pulled out of thin air.

But then to pick another example at random, XILINX_DMA equally has no 
"users", so please make that depend on something arbitrary as well for 
consistency; it's only fair.

Thanks,
Robin.


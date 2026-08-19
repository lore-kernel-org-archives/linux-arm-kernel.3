Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 439BAC5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 16:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zUx1G2KSDwiV0LDJF+v66bIuwtdyfEEgYWvHJn/5jbo=; b=U9mVBbTc+1/qEAN7LpEjDANzRC
	mK+qe9kI8SE7xjqqeyWVuOPRP86lhV89nm2Yyy3ZadvnYpENSAfnyJ2bCg8x7iLv4hrn5M04n8JT1
	g8/8ccAHUtXnzn4OTTBipejyoaR2KQb5uEJQPRSeUlf11lnl7SATrJ7l0R3UtGnUKqaodOih6f6Zx
	shOrqjByISavXe0fL9XzcK+enP7bgI0m0hD+WyBtoTKEUEw7+HXnfm3YxwnB7Hb2oQYVPCI/5r5K8
	oheHHZ183rHiaptFO6KnSV5gzV+G6ib05PtiA8IOHZrx1u55j0pN/4gZVTzPKT8Ml4VOAnfwsLpJy
	3uU8Jm/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwiqZ-0000000A9Tu-0it3;
	Wed, 19 Aug 2026 16:08:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwiqX-0000000A9Ta-0kvV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 16:08:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9AE5E14BF;
	Wed, 19 Aug 2026 09:08:50 -0700 (PDT)
Received: from [10.1.35.171] (XHFQ2J9959-5.cambridge.arm.com [10.1.35.171])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C2F113F85F;
	Wed, 19 Aug 2026 09:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787155734; bh=XG84UH3RQZg2UeE7vWMtQSQJ/dku9/H6In5UidNXvys=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=EFXKvPu9vzhvy58CEvgMafkir9tK66WaEt8NNFK31KYSSvTNl4wx9U0iRKwi2RrLW
	 +PfvmX/S9+RS5GhiHpWi/nvCR5GemEBm2415+KKDRrbuA0E+FyFRDC+kPZUso6bKQN
	 VnwKQR1UCyO4prPGm16MC3MqjWqB06FKn+45R8gg=
Message-ID: <eb9507c6-dcac-4135-83b3-445414b94345@arm.com>
Date: Wed, 19 Aug 2026 17:08:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v1 8/8] misc/arm-cla: Add userspace interface
Content-Language: en-GB
To: Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Jean-Philippe Brucker <jpb@kernel.org>,
 Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org
References: <20260717104759.123203-1-ryan.roberts@arm.com>
 <20260717104759.123203-9-ryan.roberts@arm.com>
 <404d2c6d-4a18-40c2-9da9-fb030c39536f@app.fastmail.com>
 <5012970d-a0f0-461c-b0b6-61823e0aab2d@arm.com>
 <59d0c4d5-af53-410d-9bf8-8dd2ba17f697@app.fastmail.com>
 <2a69d96e-d37e-4e3d-8eaa-3ea31caf3893@arm.com>
 <ec998612-c527-4294-837b-5aa375b81cc1@app.fastmail.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <ec998612-c527-4294-837b-5aa375b81cc1@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_090857_401396_86E99F95 
X-CRM114-Status: GOOD (  36.57  )
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

Hi Arnd,

Sorry for the delayed response here - I thought I had replied to everything then
went off for holiday. Now I'm back and I noticed I missed this...


On 17/07/2026 21:11, Arnd Bergmann wrote:
> On Fri, Jul 17, 2026, at 18:21, Ryan Roberts wrote:
>> On 17/07/2026 16:31, Arnd Bergmann wrote:
>>>
>>> Without concrete implementation examples, I find it hard to imagine
>>> how granular the CLA and accelerator blocks are. What I'm interested
>>> in is separating things into special character devices when they
>>> refer to units that you want to manage separately in userspace.
>>>
>>> If you have e.g. one accelerator for tensor operations and one for
>>> handling gzip, I would very much want to see those have a separate
>>> chardev nodes so a local administrator can give permissions to each
>>> one separately, and have device names that are sensible to the
>>> functionality underneath.
>>
>> Unfortunately this doesn't map well to the HW: the MMIO is for the
>> CLA interface (each CPU has 1 CLA).
> 
> I'm sure you mentioned it in the documentation, but I missed that
> there are never multiple CLA instances.
> 
> If the CLA is defined only in terms of its MMIO/DMA interface
> and listening to TLB broadcast operations, is having a single
> instance actually required by the design, or just an implementation
> choice?

The CLA spec states that there is 1 CLA per CPU. But there is nothing inherrent
about the design that would prevent it from being extended to support multiple
CLAs per CPU AFAICT. The approach I've taken in the RFC would naturally work
under this (unlikely) possibility.

> 
>> Once you have access to that interface, you can
>> communicate with all of the accelerators that are connected to the CLA. We could
>> potentially use the availability masking control to only expose a single
>> accelerator for a given context (which would be chosen based on which file you
>> opened), but it wouldn't be possible for (e.g.) 2 different processes to access
>> the different accelerators concurrently - they would have to be subject to the
>> time slice model.
> 
> Right, that sounds a bit awkward. It sounds like this would also get
> simpler with a model that ensures the current CLA ttbr0 matches the
> CPU ttbr0 and the iotlb_mm setting, since you would never have concurrent
> uses of a single CLA from multipel tasks. On the other hand, that
> model would make it harder to use multiple accelerators from a
> single task, if they have to go through multiple file descriptors
> but could be accessed on a single mapping.
> 
>>> If you have separate accelerators for AES encryption and decryption,
>>> or a large set of identical accelerators that can run concurrently,
>>> those would of course get managed as a single device file.
>>>
>>> Most importantly, I don't think a global /dev/cla device node
>>> is a sensible interface from a management perspective as that
>>> would give unprivileged userspace direct control to something
>>> that is essentially arbitrary (or buggy) vendor firmware
>>> with DMA permissions.
>>
>> OK I see your point.
>>
>> While the interface supports up to 8 connected accelerators, we anticpate there
>> only being a single compute accelerator in practice. We decided to keep the
>> driver interface generic given the CLA spec, but perhaps it would be more
>> straightforward to limit the driver implementation to only permitting a single
>> accelerator?
> 
> Probably, yes. From a kernel perspective, I think we're a bit better
> off with an abstraction like
> 
> - One CLA MMIO range per /type/ of accelerator on a given CPU
> - One firmware node per CLA, possibly spanning multiple CPUs
>   if the accelerators behind them are shared.
> - One character device per firmware node, named according to the
>   type of CLA
> - Possibly multiple CLA nodes on a given CPU if multiple
>   unrelated accelerators are present
> - optionally multiple related accelerators on the eight ports of
>   a CLA, if that makes sense for that device type
> 
> Not sure how far that is off from what you currently have in
> the hardware design.

I've spent some time thinking about this today with Jean-Philippe and I believe
we have a proposal that addresses your concerns, (although I confess I haven't
understood exactly what you mean in all of your above bullets).

I think the aim is to allow a sysadmin to disable a class of accelerators
without having to disable any other class of accelerators?

Let's start with an example topology:
- System has 3 CLAs:
   - CLA1 has 2 accelerators:
      - ACC1: type=compute
      - ACC2: type=aes
   - CLA2 has 2 accelerators:
      - ACC3: type=compute
      - ACC4: type=compute
   - CLA3 has 1 accelerator:
      - ACC5: type=compute

We have 1 char device per accelerator type; so in this case, 2 files:
- compute
- aes

When "compute" is mmap'ed, it will contain 3 CLAs; CLA1, CLA2, CLA3. When
queried, it will report that CLA1 has 1 accelerator (ACC1), CLA2 has 2
accelerators (ACC3, ACC4) and CLA3 has 1 accelerator (ACC5). When CLA1, CLA2 and
CLA3 are assigned to the process via this context, their availability masks will
be set so that ACC2 can't be accessed.

When "aes" is mmap'ed, it will contain 1 CLA; CLA1. When queried, it will report
that CLA1 has 1 accelerator (ACC2). When CLA1 is assigned to the process via
this context, its availability mask will be set so that ACC1 can't be accessed.

This scheme wouldn't allow different accelerator types to occupy the same
context, but that could be addressed in future by adding an operation to allow
the user to move an accelerator into a shared context. I don't see a need for
this right now though.

In practice, the kernel driver would infer the accelerator type from it's IIDR
(and possibly DEVARCH and REVIDR) register(s) and group them based on that.

For a system that only has 1 type of accelerator (the expected common case) we
end up with something very similar to what we have in the RFC (a single device
file). But for the case where we have multiple accelerator types, a sysadmin can
easily disable a specific class of accelerators if found to be buggy.

What do you think?

Thanks,
Ryan


> 
>        Arnd



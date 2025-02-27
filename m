Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66C3EC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 14:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gve341c4MtwAxnVIeHWRvtQwTa8aD0Q7X4a/H6VslyI=; b=e+ltjzQDTnqaFz
	VDpNwAs4irEJqOH+fgPTEIq0OL3GHk69qZ7B1EWIIufvOiN2NWJrkfYwXuNIxeVH8MXVGf+fG2syZ
	TLo9wS5xG5+HNFGZendaArHXLyVbKoJP0w4pi4cV4DHNOfFa+3wlDOmqnto8DgwFO3MkdY4bhMC6N
	/6NENYX+ElOz3Sxk/2vk/iyeE219YYw+UWjrSOHn3JSlZkPYELxIZRVNrLurX2pI/eh/MAORczN/2
	NKb81iRyt7EdwEXC6Pwb93oQUHFByD7pZxhqXbE+oaNMmgVlGfRCCgq+RbrjDUg1M1T5L0fwEjqEo
	L1PuPciP48R4q77TI89w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnf56-00000007mzt-0vZP;
	Thu, 27 Feb 2025 14:41:44 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tneiG-00000007gmm-2FZx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 14:18:10 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 4FFBBA0A38;
	Thu, 27 Feb 2025 15:17:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=Gve341c4MtwAxnVIeHWR
	vtQwTa8aD0Q7X4a/H6VslyI=; b=GhrulTfSFfOwpfdYBS/q4qhnm70YikZAXxys
	mcGK3sg7vs2kBi7gIzBBJi+a/rmZmtbeWrFm1HAxwIokNzWnp9C9u8rzplSd2mg2
	j4gQi9vdBqyHn5c9wyj2Rlliekk72u+uGYNUN2iRzieJAMa159KTN0fh0kqabDdR
	+TXs61WD5OpDxyfKrol9VWcFcVHETK87mfOI1ZawEePHuBtBMujOUX82AdNs09CR
	c7J/YzQsJ+LPIwEJ8nqOPxZ531hH/9yeSJXgHXVr7znsIuKuGwMItcZQsFs7uS9Z
	0hqbbY8cUlA4O9p9lYh3DFwVArtrO09BSfz7C+72JADErBOHKSv4aB7DbAwmu/g/
	BdV395GLBlcirSuswvXvHp3VSXbq62wzW2CVThH18+oYBEo9wwJrVqHZoIVye9CU
	BPjjFt+sxEG9ZMcQq8Wq7Bo01Ha6qtTJZLueT4K55NiT/1Gglf9S9jpXKGKihQT+
	gAIH3i5sa7Jfs3rzA/aK48Nxe50741WxLZCn+PXO9NQ6Ao3eOZ7HdJcmDYeBpA40
	+QZDPUMn17ED7Vsr1Z+DDs3R+JYkZQmZgtgOnqqZoKgMCgtsqxZVUwkJgeZPbgPP
	rIsXME3O2XnY6bWpuCLYAKrFBCYgDMy80WctMJbA0+1YptGDDoNmWEhbLfGkSCaB
	uvy7dAk=
Message-ID: <7c9941e0-1169-46cd-95b0-785e8f72eb34@prolan.hu>
Date: Thu, 27 Feb 2025 15:17:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/2] microchip-tcb-capture: Add Capture, Compare,
 Overflow etc. events
To: William Breathitt Gray <wbg@kernel.org>, Kamel Bouhara
	<kamel.bouhara@bootlin.com>
References: <20250211151914.313585-3-csokas.bence@prolan.hu>
 <Z7h0AXV1zlgp9Nw-@ishi> <8fb9f188-3065-4fdc-a9f1-152cc5959186@prolan.hu>
 <Z7vihBqOgP3fBUVq@ishi> <bfa70e78-3cc3-4295-820b-3925c26135cb@prolan.hu>
 <Z7_xTQeTzD-RH3nH@ishi>
Content-Language: en-US, hu-HU
From: =?UTF-8?B?Q3PDs2vDoXMgQmVuY2U=?= <csokas.bence@prolan.hu>
In-Reply-To: <Z7_xTQeTzD-RH3nH@ishi>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.254.7.14]
X-ClientProxiedBy: ATLAS.intranet.prolan.hu (10.254.0.229) To
 ATLAS.intranet.prolan.hu (10.254.0.229)
X-EsetResult: clean, is OK
X-EsetId: 37303A2980D94852637760
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_061809_044988_DA019015 
X-CRM114-Status: GOOD (  37.71  )
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
Cc: linux-iio@vger.kernel.org, Ludovic Desroches <ludovic.desroches@microchip.com>, linux-kernel@vger.kernel.org, Dharma.B@microchip.com, Jonathan Cameron <jic23@kernel.org>, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi,

On 2025. 02. 27. 5:59, William Breathitt Gray wrote:
>> Isn't it better to keep API header changes in the same commit as the
>> implementation using them? That way if someone bisects/blames the API
>> header, they get the respective implementation as well.
> 
> Fair enough, we'll keep the header together with the implementation.

I ended up splitting the actual creation of the file (the change to 
MAINTAINERS, along with the new header file containing the include guard 
and the doc-comment) to a new commit, and added the `enum 
counter_mchp_event_channels` to it in the commit containing the IRQ 
handler. I'll send that shortly.

>>> and it looks like this chip has
>>> three timer counter channels described in section 54. Currently, the
>>> microchip-tcb-capture module is exposing only one timer counter channel
>>> (as Count0), correct? Should this driver expose all three channels (as
>>> Count0, Count1, and Count2)?
>>
>> No, as this device is actually instantiated per-channel, i.e. in the DT,
>> there are two TCB nodes (as the SoC has two peripherals, each with 3
>> channels), and then the counter is a sub-node with `reg = <0/1/2>`,
>> specifying which timer channel to use. Or, in quadrature decode mode, you'd
>> have two elements in `reg`, i.e. `reg = <0>, <1>`.
> 
> So right now each timer counter channel is exposed as an independent
> Counter device? That means we're exposing the timer counter blocks
> incorrectly.
> 
> You're not at fault Bence, so you don't need to address this problem
> with your current patchset, but I do want to discuss it briefly here so
> we can come up with a plan for how to resolve it for the future. The
> Generic Counter Interface was nascent at the time, so we likely
> overlooked this problem at the time. I'm CCing some of those present
> during the original introduction of the microchip-tcb-capture driver so
> they are aware of this discussion.
> 
> Let me make sure I understand the situation correctly. This SoC has two
> Timer Counter Blocks (TCB) and each TCB has three Timer Counter Channels
> (TCC); each TCC has a Counter Value (CV) and three general registers
> (RA, RB, RC); RA and RB can store Captures, and RC can be used for
> Compare operations.

That seems to be an accurate description.

> If that is true, then the correct way for this hardware to be exposed is
> to have each TCB be a Counter device where each TCC is exposed as a
> Count. So for this SoC: two Counter devices as counter0 and counter1;
> count0, count1, and count2 as the three TCC; i.e. counter0/count{0,1,2}
> and counter1/count{0,1,2}.

And how would the extensions fit into this? 
`capture{0..6}`/`compare{0..3}? For me, the status quo fits better.

> With that setup, configurations that affect the entire TCB (e.g. Block
> Mode Register) can be exposed as Counter device components. Furthermore,
> this would allow users to set Counter watches to collect component
> values for the other two Counts while triggering off of the events of
> any particular one, which wouldn't be possible if each TCC is isolated
> to its own Counter device as is the case right now.

TCCs are pretty self-contained though. BMR only seems to be used

> Regardless, the three TCC of each TCB should be grouped together
> logically as they can represent related values. For example,  when using
> the quadrature decoder TTC0 CV can represent Speed/Position while TTC1
> CV represents rotation, thus giving a high level of precision on motion
> system position as the datasheet points out.

 From what I gathered from looking at the code, the quadrature mode uses 
a hardware decoder that gives us processed values already. Though I 
don't use it, so I don't know any specifics.

One more thing, as Kamel pointed it out, the current implementation 
allows channels of a TCB to perform different functions, e.g. one used 
for PWM, one for clocksource and a third for counter capture. Whether 
that works in practice, I cannot tell either, we only use TCB0 channel 0 
for clocksource and TCB1 channel 1 for the counter.

>>>> The `mchp_tc_count_function_write()` function already disables PWM mode by
>>>> clearing the `ATMEL_TC_WAVE` bit from the Channel Mode Register (CMR).
>>>
>>> So capture mode is unconditionally set by mchp_tc_count_function_write()
>>> which means the first time the user sets the Count function then PWM
>>> mode will be disabled. However, what happens if the user does not set
>>> the Count function? Should PWM mode be disabled by default in
>>> mchp_tc_probe(), or does that already happen?
>>
>> You're right, and it is a problem I encounter regularly: almost all HW
>> initialization happens in `mchp_tc_count_function_write()`, the probe()
>> function mostly just allocates stuff. Meaning, if you want to do anything
>> with the counter, you have to set the "increase" function first (even
>> though, if you `cat function`, it will seem like it's already in "increase"
>> mode). I don't know if it was deliberate, or what, but again, that would be
>> a separate bugfix patch.
> 
> That does seem like an oversight that goes back to the original commit
> 106b104137fd ("counter: Add microchip TCB capture counter"). I'll submit
> a bug fix patch later separately to address this and we can continue
> discussions about the issue there.

Thank you, squashing this annoyance would be appreciated.

> William Breathitt Gray

Bence



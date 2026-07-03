Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37ABDC43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 13:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SYg5rG2HPKPWthdUihGR59FRhOsM4oileXM6pJLxo/c=; b=l0UbE3mh85BBGWIjXkat/KG3o7
	n7lNqB8V9fGALLepPCyiMWC1PWjNe/nnspu73nIrWGIELmuzslXsdL2RHI70hTCyTpdOCVksPXTXz
	SE0M5nwZ6agL1QcPx4LFIRGjUsFtHnuKMVBGCyPmspxSTXw97uWcWrTTdMMcXr+/uDHBVbXCQHoxZ
	lpty/b8sNA2fWP2elc7D3nPdBD0Xd3ZjobeuBwhxq99N1VfMWD6A4xqI3Ykx0b7RXO4ZutKUpEOk4
	8ORtdOSjD5lTImO3MtF1DkFSRCwsH2TY6AZHmodODZAM7TtDpZtwL0gGd8F7OnMSW5xiQ6XOZ1/PO
	mxUjmFjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfeKD-00000007AS2-1PPa;
	Fri, 03 Jul 2026 13:53:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfeKB-00000007ART-2QAx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 13:53:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6A3801570;
	Fri,  3 Jul 2026 06:52:54 -0700 (PDT)
Received: from [192.168.178.24] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C78843F85F;
	Fri,  3 Jul 2026 06:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783086778; bh=Me6gmkaDjGZ/schb+RcR4K/Q/82u1DCsmp9vVOmmDmM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fZrIn5XfQIvAcd0b69t8CmMai85U02ASBX0X/4as/KCW8Jodcldpa/pH5V10eQgHq
	 9auHzyf8i2oM6zFGh8cV2I8qCTmcq5p4qHfBFzB7TbCG+cdRRlSNnjHTJTsDmbUhWf
	 7RPvEds2OQQYqzxgTEbpq8Efep2fU3R2hTVIuI/k=
Message-ID: <72ccedfb-742c-4af7-8439-0f37fff2853d@arm.com>
Date: Fri, 3 Jul 2026 15:52:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] pinctrl: sunxi: convert to GPIO_GENERIC
To: Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 Icenowy Zheng <uwu@icenowy.me>, Jerome Brunet <jbrunet@baylibre.com>
References: <20260313000652.11470-1-andre.przywara@arm.com>
 <a4cfb10e4701da0649ef648136496a962be5870d.camel@icenowy.me>
 <20260315014205.471d6834@ryzen.lan>
 <CAMRc=MeorQJvA8TBosjnDU+x-FD6GhkbXwXOjCD0nmCs16ERfQ@mail.gmail.com>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <CAMRc=MeorQJvA8TBosjnDU+x-FD6GhkbXwXOjCD0nmCs16ERfQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_065259_709136_320D98C3 
X-CRM114-Status: GOOD (  28.42  )
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

Hi Bartosz, Linus,

so I wanted to come back to this, posting a A733 v2, with this patch 
included, and was wondering what the consensus on this matter would be?

...

On 3/16/26 09:57, Bartosz Golaszewski wrote:
> On Sun, 15 Mar 2026 01:42:05 +0100, Andre Przywara
> <andre.przywara@arm.com> said:
>> On Sat, 14 Mar 2026 13:14:25 +0800
>> Icenowy Zheng <uwu@icenowy.me> wrote:
>>
>>> 在 2026-03-13五的 01:06 +0100，Andre Przywara写道：
>>>> Allwinner SoCs combine pinmuxing and GPIO control in one device/MMIO
>>>> register frame. So far we were instantiating one GPIO chip per
>>>> pinctrl
>>>> device, which covers multiple banks of up to 32 GPIO pins per bank.
>>>> The
>>>> GPIO numbers were set to match the absolute pin numbers, even across
>>>> the
>>>> typically two instances of the pinctrl device.
>>>>
>>>> Convert the GPIO part of the sunxi pinctrl over to use the
>>>> gpio_generic
>>>> framework. This alone allows to remove some sunxi specific code,
>>>> which
>>>> is replaced with the existing generic code. This will become even
>>>> more
>>>> useful with the upcoming A733 support, which adds set and clear
>>>> registers for the output.
>>>> As a side effect this also changes the GPIO device and number
>>>> allocation: Each bank is now represented by its own gpio_chip, with
>>>> only
>>>> as many pins as there are actually implemented. The numbering is left
>>>> up
>>>
>>> Ah, is this a userspace API break?

So to summarise: yes, the user visible number in /sys/class/gpio would 
change. For a start, there would be up to a dozen gpiochip's now, 
instead of the just two before. But at the moment they are somewhat 
inconsistently named: the current labels are just <addr>.pinctrl, you 
would need to know that 300b000 is the primary controller. This is of 
course SoC specific, and DOES differ between generations of Allwinner 
chips. With this patch we get the bank number appended to the label, so 
it becomes something like: 300b000.pinctrl-PD, which is grep-able even.

As for users being affected by this change: that's hard to say, there 
seem to be a lot of silent users there (not being visible in mainline 
discussions), also a lot of people using these boards in a very embedded 
way. My hunch is that still quite some people use the sysfs interface, 
because it's so convenient to use from the shell, and many compile their 
own kernels. At the same time I am sure those people could adapt to any 
new scheme.

>> Was that ever a guaranteed user space API? Or just something
>> that everyone relied on because it was always the same (until it
>> wasn't)? Similar to /dev/mmcblk0 being the SD card?


>> And ignoring the ill-fated old-style sysfs interface for now, how does
>> this work with libgpiod? Would it still use the absolute pin numbers?
>>
>> I mean looking at that warning about the forced GPIO numbering we
>> get, using base = -1 seems to be the recommended way?
>>
> 
> My view is this: for libgpiod, there are no absolute GPIO numbers and the
> ordering of GPIO chip character devices is not guaranteed.
> 
> For sysfs: userspace may rightfully expect the global numbering to stay the
> same. I don't like it but this is the kernel policy.

Does it matter anyhow that this interface is deprecated, and even hidden 
behind CONFIG_EXPERT?

> Here however, there's another thing: the fact that a single GPIO chips is now
> split into several. I don't mind it but if someone complains, it would have
> to be reverted.

Who would care, and are there other effects outside of the sysfs 
numbering? I mean we always had two GPIO chips before (because of two 
instances of pinctrl IP in most Allwinner SoCs), one with one or two 
banks, one with up to 11. Now it's at least consistently one bank per 
chip, without gaps.

So personally I am leaning towards doing the change: most users can 
typically adapt - or they don't care because they don't update their 
kernels (beyond stable revisions). And to address the naming 
ambiguities, we could push for more gpio-line-names. That would make 
finding a GPIO much safer and easier, and works either way.

But if this patch's ABI breakage is a showstopper, I would need to know, 
so that I can rebase the A733 pinctrl patches without this one being the 
first patch in the series.

Cheers,
Andre



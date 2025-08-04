Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54B8EC87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Aug 2025 15:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CHTeyM1hNQlNrZsb1BL37mzYzJui6GuglfhenOVIKn0=; b=G0bxeopCFt2EqC7en/V3vw39oy
	AHepyBlEmF6qo4StoXtCQd2ycBQCSg4pHo8gFKGM9C/mTsXnqlGqCZV2lmh2O8LywlnRuDjib5U0S
	/0exo8LfSV0+wiO36P9GHLp2TXGWaGn0ZIBAmP/4+T1ZRRkoT/sqKk6BWNQ/2UKdh4zsIM+ZGkhwM
	0MzcsKggo9/RzXdpUFXM9ZctWU3L0fI34kyQNVb3U/zbVT3lwwBU9i3m5/Il1P1zXgNHZkAU7Nuip
	feLDfAdxNPsM7mG1ym4K1XQfMJ37gyOCkcSeV+jQUz8njKxld2YVRqYCpcKYxcI1tG/PMLyMmKqba
	AIXtx7Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uix78-0000000AnLq-1nUW;
	Mon, 04 Aug 2025 15:28:38 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiwG9-0000000AgN8-3WLY;
	Mon, 04 Aug 2025 14:33:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 00AC2601FD;
	Mon,  4 Aug 2025 14:33:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AEE6C4CEE7;
	Mon,  4 Aug 2025 14:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754318032;
	bh=BxJgaOKe6Tk/0KuMbw7KhSOpDJuDqbXWbDVAWr4BkYs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hDccK1XXfHHOPEncrfomlcVlIRGiUT9lAsapWMFIznJIE0PQOZiE3jZhEmPhe5Cqe
	 uc7H2TsCA33UyEDJ3xYn4LuarwnMPHi38jocb2SrTIGbWcRaP7Sd17ti3/IQepXquD
	 6k1/1ngrWbBAa0Tlgm73VWrVijjsZRx+m7EZVgyK7UACoqaljeFiIHpqzwgvk/VhIb
	 MWds0G+6MzBcwwfTzi0rX5ee3ckyyQgYUWWAjvvPkP5fu/lcYtIgj1+tQPbe04hZSe
	 smaVUo2Hlbiv8CNEivm5mE7uce9YwYzHr6sKIxJIJZsDfgmW3eRzP5Nd6HjzKw2LOX
	 0xnbTQlaWoYSw==
Message-ID: <0fe4165d-f198-42cc-9c2f-f1e51bd96716@kernel.org>
Date: Mon, 4 Aug 2025 16:33:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/27] dt-bindings: clock: mediatek: Describe MT8196
 clock controllers
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Laura Nao <laura.nao@collabora.com>, wenst@chromium.org
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org,
 guangjie.song@mediatek.com, kernel@collabora.com, krzk+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, mturquette@baylibre.com, netdev@vger.kernel.org,
 nfraprado@collabora.com, p.zabel@pengutronix.de, richardcochran@gmail.com,
 robh@kernel.org, sboyd@kernel.org
References: <fbe7b083-bc3f-4156-8056-e45c9adcb607@kernel.org>
 <20250804083540.19099-1-laura.nao@collabora.com>
 <373f44c3-8a6a-4d52-ba6b-4c9484e2eac1@kernel.org>
 <1db77784-a59a-49bd-89b5-9e81e6d3bafc@collabora.com>
 <e9ee33b0-d6b0-4641-aeeb-9803b4d1658a@kernel.org>
 <00a12553-b248-4193-8017-22fea07ee196@collabora.com>
 <2555e9fe-3bc0-4f89-9d0b-2f7f946632e7@kernel.org>
 <ed0884fc-e43a-4f5b-8701-3645c406b37d@kernel.org>
 <3a499702-ba75-4d8a-b38d-222a62bffb34@collabora.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <3a499702-ba75-4d8a-b38d-222a62bffb34@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 04/08/2025 16:31, AngeloGioacchino Del Regno wrote:
> Il 04/08/25 16:19, Krzysztof Kozlowski ha scritto:
>> On 04/08/2025 15:58, Krzysztof Kozlowski wrote:
>>>>
>>>> So, what should we do then?
>>>>
>>>> Change it to "mediatek,clock-hw-refcounter", and adding a comment to the binding
>>>> saying that this is called "Hardware Voter (HWV)" in the datasheets?
>>>>
>>>> Or is using the "interconnect" property without any driver in the interconnect API
>>>> actually legit? - Because to me it doesn't look like being legit (and if it is, it
>>>> shouldn't be, as I'm sure that everyone would expect an interconnect API driver
>>>> when encountering an "interconnect" property in DT), and if so, we should just add
>>>
>>> Why you would not add any interconnect driver for interconnect API?
>>> Look, the current phandle allows you to poke in some other MMIO space
>>> for the purpose of enabling the clock FOO? So interconnect or power
>>> domains or whatever allows you to have existing or new driver to receive
>>> xlate() and, when requested resources associated with clock FOO.
>>
>> Something got here cut. Last sentence is supposed to be:
>>
>> "So interconnect or power
>> domains or whatever allows you to have existing or new driver to receive
>> xlate() and, when requested, toggle the resources associated with clock
>> FOO."
>>
>>>
>>> Instead of the FOO clock driver poking resources, you do
>>> clk_prepare_enable() or pm_domain or icc_enable().
>>
>> I looked now at the driver and see your clock drivers poking via regmap
>> to other MMIO. That's exactly usecase of syscon and exactly the pattern
>> *we are usually discouraging*. It's limited, non-scalable and vendor-driven.
>>
> 
> If the HWV wasn't BROKEN, I'd be the first one to go for generic stuff, but
> since it is what it is, adding bloat to generic, non vendor-driven APIs would
> be bad.
> 
>> If this was a power domain provider then:
>> 1. Your clock drivers would only do runtime PM.
> 
> The clock drivers would have to get a list of power domain that is *equal to*
> (in their amount) the list of clocks.
> But then those are not power domains, as those registers in the MCU are ONLY
> ungating a clock and nothing else in the current state of the hardware.
> 
>> 2. Your MCU would be the power domain controller doing whatever is
>> necessary - toggling these set/clr bits - when given clock is enabled.
> 
> That MCU does support power domain voting (for two power domains in the main
> PD Controller, and for all power domains in the multimedia PD controller), and
> this is something completely separated from the *clock* controllers.
> 
> Just to make the picture complete for you: the power domains that this MCU can
> manage are not in any way related to the clocks that it can manage. At all.


OK, thanks for explanations. Please rephrase commit msg and property
description in v4. I am fine in using "hardware voter" terminology in
some places, so it will match datasheet, but I want to make it clear
that it is not voting for resources how we usually understand it. It's
just syscon stuff, poking in other system-like device registers because
hardware is like that.


Best regards,
Krzysztof


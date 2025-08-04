Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAD70C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Aug 2025 13:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7GXZ13TgXPh4Djh573h8yZGLAaR1/M9uecEvviVUYkU=; b=e77vpyUlC3G5P6OdSdcQEAmXQu
	5JeaHv4zdwdfbzlupTvDeYHwUObZFh1JOmnELeaFAMf5JHtLDD6k1QtVbQcT/fkgHIQR2jLEj8d8z
	LHsKJFwDitE3Yax8a9CSVm71Wp1gCTVZ+UCbzAVFxEqbVsEw/95BVwcAXitpsiyto1VhhQFQ5ovfY
	B/uxo96A6izZkts5P28M+aglJWoZ3Whgz2e5FyoDe6g9+d66MaAYRd6FfDlpZhha/EXTwrFY3Lp3A
	0BfcjCnrQOwIPbts82il3R1tDAOPyPbNNe2rKF5enKtXDC0dKaFb7Qa6DGLLC/hxOKOxWdscJfyFV
	0Fqyq+OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uivgC-0000000Ab5M-2jXr;
	Mon, 04 Aug 2025 13:56:44 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uivDa-0000000AX1O-2wYg;
	Mon, 04 Aug 2025 13:27:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1754314028;
	bh=HdvT5261gzhE4aRSmJHv+tFzObgX93mplUmVc06GufI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=EyfmxvdXZ+NzDsRzzPqikBca7aExVvjMxp9273QrCTmQDt5W03Ujk77tESdn04Cko
	 0xSGbdjRQJHSijFEarIcVioaWZakdnvAoCCaSPc/gxCt1hPn64sI47ckjYMeHCmtw/
	 VRfHcDkV2IjUclj1M2UBJ8IwGDrns57lcScN4xdZbM0UwsciK4xIrPk7151HRdQlmx
	 lZT6iYkRYJZVLKZq40Ihoygwa70YWtTLZ75HCHrewFFF7J1RtLmn4tIg5xD1HgGJBU
	 XP2U1JXD+JLDo8+oFCuob8guMEtN+qP5Wn4fxuCJOx727NVTWfCtWG0nC5xNkuFeIC
	 m42FsuLYnQlzQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7A25817E01CC;
	Mon,  4 Aug 2025 15:27:07 +0200 (CEST)
Message-ID: <00a12553-b248-4193-8017-22fea07ee196@collabora.com>
Date: Mon, 4 Aug 2025 15:27:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/27] dt-bindings: clock: mediatek: Describe MT8196
 clock controllers
To: Krzysztof Kozlowski <krzk@kernel.org>, Laura Nao
 <laura.nao@collabora.com>, wenst@chromium.org
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
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <e9ee33b0-d6b0-4641-aeeb-9803b4d1658a@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_062710_956138_4700A37D 
X-CRM114-Status: GOOD (  36.35  )
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

Il 04/08/25 13:01, Krzysztof Kozlowski ha scritto:
> On 04/08/2025 11:27, AngeloGioacchino Del Regno wrote:
>> Il 04/08/25 11:16, Krzysztof Kozlowski ha scritto:
>>> On 04/08/2025 10:35, Laura Nao wrote:
>>>> Hi,
>>>>
>>>> On 8/3/25 10:17, Krzysztof Kozlowski wrote:
>>>>> On 01/08/2025 15:57, Rob Herring wrote:
>>>>>>> +  reg:
>>>>>>> +    maxItems: 1
>>>>>>> +
>>>>>>> +  '#clock-cells':
>>>>>>> +    const: 1
>>>>>>> +
>>>>>>> +  '#reset-cells':
>>>>>>> +    const: 1
>>>>>>> +    description:
>>>>>>> +      Reset lines for PEXTP0/1 and UFS blocks.
>>>>>>> +
>>>>>>> +  mediatek,hardware-voter:
>>>>>>> +    $ref: /schemas/types.yaml#/definitions/phandle
>>>>>>> +    description:
>>>>>>> +      On the MT8196 SoC, a Hardware Voter (HWV) backed by a fixed-function
>>>>>>> +      MCU manages clock and power domain control across the AP and other
>>>>>>> +      remote processors. By aggregating their votes, it ensures clocks are
>>>>>>> +      safely enabled/disabled and power domains are active before register
>>>>>>> +      access.
>>>>>>
>>>>>> I thought this was going away based on v2 discussion?
>>>>>
>>>>> Yes, I asked to drop it and do not include it in v3. There was also
>>>>> discussion clarifying review.
>>>>>
>>>>> I am really surprised that review meant nothing and code is still the same.
>>>>>
>>>>
>>>> This has been re-submitted as-is, following the outcome of the discussion
>>>> here: https://lore.kernel.org/all/242bf682-cf8f-4469-8a0b-9ec982095f04@collabora.com/
>>>>
>>>> We haven't found a viable alternative to the current approach so far, and
>>>> the thread outlines why other options don’t apply. I'm happy to continue
>>>> the discussion there if anyone has further suggestions or ideas on how
>>>> to address this.
>>>>
>>>
>>> And where is any of that resolution/new facts in the commit msg? You
>>> must clearly reflect long discussions like that in the commit msg.
>>
>> On that, I agree. That's a miss.
>>
>>>
>>> There was no objection from Chen to use clocks or power domains as I
>>> requested.
>>
>> Sorry Krzysztof, but now I really think that you don't understand the basics of
>> MediaTek SoCs and how they're split in hardware - and I'm sorry again, but to me
>> it really looks like that you're not even trying to understand it.
> 
> There is no DTS here. No diagrams or some simplified drawings to help me
> understand.
> 
>>
>>> The objection was about DUPLICATING interfaces or nodes.
>>
>> I don't see that duplication. The interface to each clock controller for each
>> of the hardware subdomains of each controller is scattered all around the (broken
>> by hardware and by concept, if you missed that in the discussion) HW Voter MMIO.
>>
>> There are multiple clock controllers in the hardware.
>> Each of those has its own interface to the HWV.
>>
>> And there are some that require you to write to both its HWV interface and to the
>> clock controller specific MMIO at the same time for the same operation. I explained
>> that in the big discussion that Laura linked.
> 
> That's not what property description says. I discussed that part. Your
> description says - to aggregate votes.
> 

Yes. That is what the datasheets say, but read down there.

> Above you say that control is split between two different MMIO blocks.
> 

Also yes.

> Aggregating votes is exactly what we discussed last time and you should
> not use custom phandle for it.
> 

We discussed about aggregating votes, yes, in software - this instead is a
*broken* hardware that does the aggregation internally and does not require
nor want external drivers to do the aggregation.

> Maybe it is just the name, so avoid all the confusing "votes" if this is
> not voting system. If this is a voting system, then don't use custom
> phandles.

Being it fundamentally *broken*, this being a voting system is what the hardware
initially wanted to be - but effectively, since it requires YOU to:
  - Make sure that power supplies are turned on, if not, turn them on by "touching"
    HW registers (so, without any assistance from the voter MCU), if any;
  - Turn on parent clocks manually, if any, before using the "voter mcu" to try
    to ungate that clock; and
    - Enable the "FENC" manually, after the mcu says that the clock was ungated.

in the current state, it is just an hardware managed refcounting system and
nothing else, because the MCU seems to be unfinished, hence, again, b r o k e n.

Note that by "manually" I always mean "with direct writes to a clock controller's
registerS, and without any automation/assistance from the HWV MCU".

We're using the "hardware-voter" name because this is how MediaTek calls it in the
datasheets, and no it doesn't really *deserve* that name for what it is exactly in
MT8196 and MT6991.

And mind you - if using the "interconnect" property for this means that we have to
add an interconnect driver for it, no, we will not do that, as placing a software
vote that votes clocks in a a voter MCU that does exactly what the interconnect
driver would do - then requiring virtual/fake clocks - is not a good solution.

So, what should we do then?

Change it to "mediatek,clock-hw-refcounter", and adding a comment to the binding
saying that this is called "Hardware Voter (HWV)" in the datasheets?

Or is using the "interconnect" property without any driver in the interconnect API
actually legit? - Because to me it doesn't look like being legit (and if it is, it
shouldn't be, as I'm sure that everyone would expect an interconnect API driver
when encountering an "interconnect" property in DT), and if so, we should just add
a new "hw-interconnect" or "interconnect-hw" instead to not create confusion.

Regards,
Angelo

> 
> Best regards,
> Krzysztof




Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DF40C8302D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 09:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v2u//fd4EFcpaBS/IQkVtJyRd3I9pwXSI+lEMjRiApI=; b=q9I6c3q0W5AEqyPv2ExSVLtD1/
	i6AOW+aNO2FVpOXC2GabaXsE/j7xx3pNp/YjiTOGdEBXBn1EGbm/vyz+h7RN6+LI/B/nicXUAPhAq
	St1pTls3wwn2g4TZqBqMAZTWAhQuZbHytnNa0SpOHxAJ+HxoQi5AvOiIrpL8WTQGIZdnl6XWlfBye
	fTNNVGbDprVqHMMKqDQTEOKFG6Hc++c5opKphasrEmpwzTBmARaHV9mh9XV0tphPA1bnLLrfCQUUb
	GtsA3+puzG1NFec8bTwfNeB99K0r34SaK0DYxhsJ8onKQ/YFUzAlClwVhTP89dW3swYahx8LsDf04
	fSabXhPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWAls-00000001kRr-1wiC;
	Mon, 30 Jun 2025 09:25:52 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWAhP-00000001jsp-1STM;
	Mon, 30 Jun 2025 09:21:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1751275273;
	bh=FaC7ng9Vooo+/dQhWvHrAnu4R1uEUjUTJTh9ZaIqjFk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=K9NFrjwweh31n6a9Rkoh7wwZfpCuW4G6LnI9IymM+aLCgtxrZKmcRrC600glBSS3z
	 6QHlHpq35WFTGhdBnkPAdjKg/BSQB1k96+fp78+KkOpnbuT9JFgYbv913lqFpnw8yy
	 WxJ2i1qaoQd0/+fyNxMdlSm0DLWXKjXe2Wb38z9Ud0/fQOAjGN5vsXHbfIsr4chLGu
	 8pXgGjLrvmP6Vm8FnpAbugBLbXyi9kTMIBdmWI6J+l/TSheIB/mcfsH7a0OHXMFjE8
	 ltP2IFkV3tIgDdNf0sfBrQM/MtVmY6xIWNREP1GvU3SdaCzcSimiljRxWcOneEQm57
	 mWtpUmjgMpmdg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 66DFB17E0286;
	Mon, 30 Jun 2025 11:21:12 +0200 (CEST)
Message-ID: <d3f4d826-b5d4-4ae8-8232-bf0a7fdad2fa@collabora.com>
Date: Mon, 30 Jun 2025 11:21:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/29] dt-bindings: clock: mediatek: Describe MT8196
 peripheral clock controllers
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Laura Nao <laura.nao@collabora.com>, mturquette@baylibre.com,
 sboyd@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, p.zabel@pengutronix.de, richardcochran@gmail.com,
 guangjie.song@mediatek.com, wenst@chromium.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org, kernel@collabora.com
References: <20250624143220.244549-1-laura.nao@collabora.com>
 <20250624143220.244549-10-laura.nao@collabora.com>
 <7dfba01a-6ede-44c2-87e3-3ecb439b48e3@kernel.org>
 <284a4ee5-806b-45f9-8d57-d02ec291e389@collabora.com>
 <0870a2ba-936b-4eb2-a570-f2c9dea471b8@kernel.org>
 <9fc32523-5009-4f48-8d82-6c3fd285801d@collabora.com>
 <29eeae4f-59ed-4781-88b1-4fd76714ecb6@kernel.org>
 <312f321f-2e49-48ac-bc41-a741f5e3b3a5@collabora.com>
 <20250627-ingenious-tourmaline-wapiti-fa7676@krzk-bin>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250627-ingenious-tourmaline-wapiti-fa7676@krzk-bin>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_022115_760746_63F5899A 
X-CRM114-Status: GOOD (  50.33  )
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

Il 27/06/25 10:37, Krzysztof Kozlowski ha scritto:
> On Wed, Jun 25, 2025 at 02:42:15PM +0200, AngeloGioacchino Del Regno wrote:
>> Il 25/06/25 13:05, Krzysztof Kozlowski ha scritto:
>>> On 25/06/2025 11:45, AngeloGioacchino Del Regno wrote:
>>>> Il 25/06/25 10:57, Krzysztof Kozlowski ha scritto:
>>>>> On 25/06/2025 10:20, AngeloGioacchino Del Regno wrote:
>>>>>> Il 24/06/25 18:02, Krzysztof Kozlowski ha scritto:
>>>>>>> On 24/06/2025 16:32, Laura Nao wrote:
>>>>>>>> +  '#reset-cells':
>>>>>>>> +    const: 1
>>>>>>>> +    description:
>>>>>>>> +      Reset lines for PEXTP0/1 and UFS blocks.
>>>>>>>> +
>>>>>>>> +  mediatek,hardware-voter:
>>>>>>>> +    $ref: /schemas/types.yaml#/definitions/phandle
>>>>>>>> +    description:
>>>>>>>> +      On the MT8196 SoC, a Hardware Voter (HWV) backed by a fixed-function
>>>>>>>> +      MCU manages clock and power domain control across the AP and other
>>>>>>>> +      remote processors. By aggregating their votes, it ensures clocks are
>>>>>>>> +      safely enabled/disabled and power domains are active before register
>>>>>>>> +      access.
>>>>>>>
>>>>>>> Resource voting is not via any phandle, but either interconnects or
>>>>>>> required opps for power domain.
>>>>>>
>>>>>> Sorry, I'm not sure who is actually misunderstanding what, here... let me try to
>>>>>> explain the situation:
>>>>>>
>>>>>> This is effectively used as a syscon - as in, the clock controllers need to perform
>>>>>> MMIO R/W on both the clock controller itself *and* has to place a vote to the clock
>>>>>> controller specific HWV register.
>>>>>
>>>>> syscon is not the interface to place a vote for clocks. "clocks"
>>>>> property is.
>>>>>
>>>>>>
>>>>>> This is done for MUX-GATE and GATE clocks, other than for power domains.
>>>>>>
>>>>>> Note that the HWV system is inside of the power domains controller, and it's split
>>>>>> on a per hardware macro-block basis (as per usual MediaTek hardware layout...).
>>>>>>
>>>>>> The HWV, therefore, does *not* vote for clock *rates* (so, modeling OPPs would be
>>>>>> a software quirk, I think?), does *not* manage bandwidth (and interconnect is for
>>>>>> voting BW only?), and is just a "switch to flip".
>>>>>
>>>>> That's still clocks. Gate is a clock.
>>>>>
>>>>>>
>>>>>> Is this happening because the description has to be improved and creating some
>>>>>> misunderstanding, or is it because we are underestimating and/or ignoring something
>>>>>> here?
>>>>>>
>>>>>
>>>>> Other vendors, at least qcom, represent it properly - clocks. Sometimes
>>>>> they mix up and represent it as power domains, but that's because
>>>>> downstream is a mess and because we actually (at upstream) don't really
>>>>> know what is inside there - is it a clock or power domain.
>>>>>
>>>>
>>>> ....but the hardware voter cannot be represented as a clock, because you use it
>>>> for clocks *or* power domains (but at the same time, and of course in different
>>>> drivers, and in different *intertwined* registers).
>>>>
>>>> So the hardware voter itself (and/or bits inside of its registers) cannot be
>>>> represented as a clock :\
>>>>
>>>> In the context of clocks, it's used for clocks, (and not touching power domains at
>>>> all), but in the context of power domains it's used for power domains (and not
>>>> touching clocks at all).
>>>
>>> I don't understand this. Earlier you mentioned "MUX-GATE and GATE
>>> clocks", so these are clocks, right? How these clocks are used in other
>>> places as power domains?
>>
>> I think you've misread, or I've explained badly enough to make you misread...
>> let me describe some more to try to let you understand this properly.
>>
>> The hardware voter is a unit that is used to vote for "flipping various switches",
>> in particular, you can vote for, *either*:
>>   - Enabling or disabling a *clock*; or
>>   - Enabling or disabling a *power domain*.
>>
>> There may be multiple (by hardware, in-silicon) copies of the Hardware Voter; in
>> the specific case of the MediaTek Dimensity 9400 MT6991 and of the MediaTek MT8196
>> Chromebook SoC, there is only one instance.
> 
> Everything so far very similar to qcom... They do exactly like that.
> 
>>
>> The Hardware Voter, there, is located in the SCPSYS macro-block.
>>
>> The SCPSYS macro-block contains:
>>   - A system controller
>>   - A Hardware Voter IP (new in MT6991/MT8196)
>>   - A power domains controller
>>   - Other hardware that is not relevant for this discussion
>>
>> The HWV is MMIO-accessible, and there is one (small, for now) set of registers,
>> allowing to vote for turning on/off one (or maybe multiple too, not sure about
>> that as there's no documentation and when I tried with multi-votes it didn't work)
>> clk/pd at a time.
> 
> Sure, the only difference against qcom is interface - qcom uses
> remoteprocs channels, here you have MMIO. The interface does not matter
> though.
> 
>>
>> Probably not important but worth mentioning: the HWV can vote for clocks or for
>> power domains in macro-blocks outside of its own (so, outside of the SCPSYS block,
>> for example - it can vote to turn on a clock or a power domain in HFRPSYS as well).
> 
> Same for qcom.
> 
>>
>> The register set in the HWV is *not* split between clock voters and PDs voters,
>> in the sense that the register set of clock voters is *not contiguous*; trying
>> to be as clear as possible, you have something like (mock register names ahead):
>>   0x0 - CLOCK_VOTER_0 (each bit is a clock)
>>   0x4 - PD_VOTER_0 (each bit is a power domain)
>>   0x8 - SECURE_WORLD_CLOCK_VOTER_1
>>   0xc - PD_VOTER_1
>>   0x10 - SECURE_WORLD_PD_VOTER_0
>>
>> ...etc etc.
> 
> OK
> 
>>
>>>> If they are, this either has to be fixed or
>>> apparently this is a power domain and use it as power domain also here.
>>
>> So no, clocks are not used as power domains, and power domains are not used as
>> clocks; we are talking purely about something that aggregates votes internally
> 
> OK
> 
>> and decides to turn on/off "whatever thing it is" (one of the clocks, or one of
>> the power domains) - and to do that, you flip a bit in a register, and then you
>> read another two registers to know the status of the internal state machine....
> 
> Sure. This is 100% not syscon, though. You must not do it via syscon,
> because you will be flopping bits of other devices in this driver.
> What's more, the actual implementation - registers for voting - is
> irrelevant to this device here. This device here wants:
> power domain
> or
> clock
> 
> Hm... don't we have bindings for this? Wait, we have!
> 
>>
>> ....and you do that atomically, this can't sleep, the system has to lock up
>> until HWV is done (I think I know what you're thinking, and yes, it's really
>> like this) otherwise you're surely racing.
> 
> Sure, no problems here.
> 
>>
>>>
>>> Really, something called as hardware voter is not that uncommon and it
>>> does fit existing bindings.
>>>
>>
>> Do you mean the interconnect/qcom/bcm-voter.c?
> 
> This and many others - all rpm/rpmh/rsc are for that.
> 
>>
>> That one seems to aggregate votes in software to place a vote in a hardware voter
>> (the Bus Clock Manager) and I see it as being really convoluted.
> 
> I do not say that drivers are example to follow. Actually, I do not
> recommend even DT bindings!
> 
>>
>> For MediaTek's HWV, you don't need to aggregate anything - actually, the HWV itself
>> is taking care of aggregating requests internally...
>>
>> Also, checking sdx75 and x1e80100 DTs, I see a virtual clock controller described,
>> placing votes through the bcm-voter, and with clocks that looks like being kind
>> of disguised/faked as interconnects?
> 
> Don't remember exactly, but I don't think it matters. What matters is
> you need to choose appropriate representation for your votes.
>>
>> That's a bit unclear, and even if I'm wrong about those being disguised as icc,
>> and not virtual, purely looking at the usage of the clk_virt and bcm-voters, I
>> seriously don't think that any similar structure with interconnect would fit
>> MediaTek SoCs in any way...
> 
> 
>>
>>>>
>>>> I'm not sure what qcom does - your reply makes me think that they did it such that
>>>> the clocks part is in a MMIO and the power domains part is in a different MMIO,
>>>> without having clock/pd intertwined voting registers...
>>>
>>> No, you just never have direct access to hardware. You place votes and
>>> votes go to the firmware. Now depending on person submitting it or
>>> writing internal docs, they call it differently, but eventually it is
>>> the same. You want to vote for some specific signal to be active or
>>> running at some performance level.
>>>
>>
>> Okay then there is one similarity, but it's different; MTK HWV is only arbitering
>> a on/off request; Nothing else.
> 
> Does not matter, still the same concept.
> 
> In 2026 or 2027 you will do other votes as well...
> 

Yeah, okay I think I got your point.

Now that I can understand the sense I think I can come up with some nicer solution.

Thanks for all :-)
Angelo

>>
>> No RATE votes.
>> No performance levels.
>> Literally, that's it.
> 
> Best regards,
> Krzysztof
> 



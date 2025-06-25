Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 598A5C7115C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 12:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FkI6wheyoM7qp04MAt7wghDDstcSeE9ta3Zpr2NHOjw=; b=Gwb2sa+eFmdwoVeRV4UQRsHd61
	WulPwDcRp/afly8Yb19RrQCMkXQBwjywXXoO8h2orpKIRborHPYb4llO35uaH4jcxRxmwZVe3cyeN
	oel+23RAszlOglg45hHuszFEWCVMMymVzbGyqHf2Ef3hXwj1HgsiRALkLwuz8ExAy7TGeaYuRyzBd
	pA/3RzaD+kpONvWIp7uWbTb/hYNswcJagMrIhFmiMUBxTHxFwuM5rGC4ujGBn0/GH5toyIaOhx9O5
	OsVRQF1IWSFnGyND4m1P4ZpeBf8P/xTY2Awp+FQPwPxveh5rv0+tNuC6IOH/g9kGgrXvX2ilIb6Ff
	+lQLy85g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUPaC-00000008g4B-1ZfX;
	Wed, 25 Jun 2025 12:50:32 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUMhJ-00000008Apl-3Id0;
	Wed, 25 Jun 2025 09:45:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750844739;
	bh=WGq9BnLFRlvgaj6JRyQGZWMVZ81/AYyKEllbs2pFfUQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GBU4AKGca8KnCekeyVnEecyJmPoVJ7wlpqhQnR8iWTyHHoOmXtft89FJs/f+zClQV
	 hbB+VfZY7un9VwtAeD07AeKh1UjGVKVG0FXBySpj02ixuj48s0NNREvPRmj0d9EPD7
	 hSIJOAuxT7B8J5+oGL74kB+VAGj6Ot/Aizw8daZNKJV66x8egWZH/vgxHYgxIcSZaa
	 WmI79YohY/fz4whCsSj0MdwFqEGHo978IvhMhR13I0Nov+bqXurBJuTpdWIgcPj42X
	 3v82NQL/5x4kqHRLDpAuyf0qYvJ43Ib9grHcg+NmAWGMum2+fmyXCcLkwX19utj+VX
	 As/O7jLCKPSbg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B9EBB17E0CE3;
	Wed, 25 Jun 2025 11:45:38 +0200 (CEST)
Message-ID: <9fc32523-5009-4f48-8d82-6c3fd285801d@collabora.com>
Date: Wed, 25 Jun 2025 11:45:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/29] dt-bindings: clock: mediatek: Describe MT8196
 peripheral clock controllers
To: Krzysztof Kozlowski <krzk@kernel.org>, Laura Nao
 <laura.nao@collabora.com>, mturquette@baylibre.com, sboyd@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, p.zabel@pengutronix.de, richardcochran@gmail.com
Cc: guangjie.song@mediatek.com, wenst@chromium.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
 kernel@collabora.com
References: <20250624143220.244549-1-laura.nao@collabora.com>
 <20250624143220.244549-10-laura.nao@collabora.com>
 <7dfba01a-6ede-44c2-87e3-3ecb439b48e3@kernel.org>
 <284a4ee5-806b-45f9-8d57-d02ec291e389@collabora.com>
 <0870a2ba-936b-4eb2-a570-f2c9dea471b8@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <0870a2ba-936b-4eb2-a570-f2c9dea471b8@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_024541_998127_C156D67F 
X-CRM114-Status: GOOD (  22.85  )
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

Il 25/06/25 10:57, Krzysztof Kozlowski ha scritto:
> On 25/06/2025 10:20, AngeloGioacchino Del Regno wrote:
>> Il 24/06/25 18:02, Krzysztof Kozlowski ha scritto:
>>> On 24/06/2025 16:32, Laura Nao wrote:
>>>> +  '#reset-cells':
>>>> +    const: 1
>>>> +    description:
>>>> +      Reset lines for PEXTP0/1 and UFS blocks.
>>>> +
>>>> +  mediatek,hardware-voter:
>>>> +    $ref: /schemas/types.yaml#/definitions/phandle
>>>> +    description:
>>>> +      On the MT8196 SoC, a Hardware Voter (HWV) backed by a fixed-function
>>>> +      MCU manages clock and power domain control across the AP and other
>>>> +      remote processors. By aggregating their votes, it ensures clocks are
>>>> +      safely enabled/disabled and power domains are active before register
>>>> +      access.
>>>
>>> Resource voting is not via any phandle, but either interconnects or
>>> required opps for power domain.
>>
>> Sorry, I'm not sure who is actually misunderstanding what, here... let me try to
>> explain the situation:
>>
>> This is effectively used as a syscon - as in, the clock controllers need to perform
>> MMIO R/W on both the clock controller itself *and* has to place a vote to the clock
>> controller specific HWV register.
> 
> syscon is not the interface to place a vote for clocks. "clocks"
> property is.
> 
>>
>> This is done for MUX-GATE and GATE clocks, other than for power domains.
>>
>> Note that the HWV system is inside of the power domains controller, and it's split
>> on a per hardware macro-block basis (as per usual MediaTek hardware layout...).
>>
>> The HWV, therefore, does *not* vote for clock *rates* (so, modeling OPPs would be
>> a software quirk, I think?), does *not* manage bandwidth (and interconnect is for
>> voting BW only?), and is just a "switch to flip".
> 
> That's still clocks. Gate is a clock.
> 
>>
>> Is this happening because the description has to be improved and creating some
>> misunderstanding, or is it because we are underestimating and/or ignoring something
>> here?
>>
> 
> Other vendors, at least qcom, represent it properly - clocks. Sometimes
> they mix up and represent it as power domains, but that's because
> downstream is a mess and because we actually (at upstream) don't really
> know what is inside there - is it a clock or power domain.
> 

....but the hardware voter cannot be represented as a clock, because you use it
for clocks *or* power domains (but at the same time, and of course in different
drivers, and in different *intertwined* registers).

So the hardware voter itself (and/or bits inside of its registers) cannot be
represented as a clock :\

In the context of clocks, it's used for clocks, (and not touching power domains at
all), but in the context of power domains it's used for power domains (and not
touching clocks at all).

I'm not sure what qcom does - your reply makes me think that they did it such that
the clocks part is in a MMIO and the power domains part is in a different MMIO,
without having clock/pd intertwined voting registers...

Still not sure what to do here, then...

Cheers,
Angelo


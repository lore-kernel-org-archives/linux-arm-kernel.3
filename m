Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61A4FC83F07
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 10:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9gFXTtBGwP+WW8mfW0YfSedT8ICQ4K2D4zUIbNAJw50=; b=HO80RjpPKdZM2gz3IiF/IGB4WW
	feMCTJ6fbq46u/Lr+3R31nzzJ4Rppw5dB1VjrdI+dKVI4Waby8YS/24Aqbc07fQrQP3EfjTpt0y/t
	qbBRN5yWmZg+pU8tyAmaNGXFevNRt/eiah9nCJjgAo70VR3AN9KU2qpwo8xxSThrAX1tETgXOXXoX
	OZ2u4DTwIIbUAMyqrUYp4wQDlHBKyjgEblS4mwS2Flafs6Nf+6XM+G+mkslYiIkFuLFYqNb38pwyh
	rntneZIV8RG2z249FY0CAtRcTYoBmgC32qtAn8fhDRAyue6T8nmnNQtJOZKU+0gdKi4gGoBOkWfYb
	GLD8cDRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYjHe-00000002BNZ-11t4;
	Mon, 07 Jul 2025 10:41:14 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYije-000000025kD-1Suq;
	Mon, 07 Jul 2025 10:06:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1751882764;
	bh=T8iIMPb9brgtZdi72SAWfhA8roPO7vUHjVTHHnOQNVI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Nyz3P/mVFjxZfpeCi+JHgh8VJSn0xoox1dJhCSYXuFxwdM0sNvNwafLR/zAZnTyb5
	 G312aUFagNYKNK6E1I1kbqOBbGEQkEaPk40y50SsokLo9okJt1SW3p3dOjBTz8bjv2
	 Wky154Wu8MeJEVP0vKR5wGEm2/jwK6+2GqTN0ztwuL7vAUWf4ynz1JywSUZ+P8mrze
	 6w8T8cHr3PtE+/HkwOM7xpiDiZ/Mj812jWdPqEYXBopHPpm4vjZUl1FlU/tTZY1Euk
	 7RxWXNpMj991IsirfIg5/V1rgvS+ANZm9yFs7dZ88Ag05O5oT3IDfGNEQODCHAOFaZ
	 EgqL5tUpvw0nQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3BAA017E07C9;
	Mon,  7 Jul 2025 12:06:03 +0200 (CEST)
Message-ID: <90a3191f-882d-4302-afd5-e73e751b5b95@collabora.com>
Date: Mon, 7 Jul 2025 12:06:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 02/16] dt-bindings: net: mediatek,net: allow up to 8
 IRQs
To: Frank Wunderlich <linux@fw-web.de>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Georgi Djakov <djakov@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Johnson Wang <johnson.wang@mediatek.com>, =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?=
 <arinc.unal@arinc9.com>, Landen Chao <Landen.Chao@mediatek.com>,
 DENG Qingfang <dqfext@gmail.com>, Sean Wang <sean.wang@mediatek.com>,
 Daniel Golle <daniel@makrotopia.org>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Felix Fietkau <nbd@nbd.name>, Frank Wunderlich <frank-w@public-files.de>,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20250706132213.20412-1-linux@fw-web.de>
 <20250706132213.20412-3-linux@fw-web.de>
 <20250707-modest-awesome-baboon-aec601@krzk-bin>
 <B875B8FF-FEDB-4BBD-8843-9BA6E4E89A45@fw-web.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <B875B8FF-FEDB-4BBD-8843-9BA6E4E89A45@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_030606_542992_5BF494D6 
X-CRM114-Status: GOOD (  24.95  )
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

Il 07/07/25 09:30, Frank Wunderlich ha scritto:
> Am 7. Juli 2025 08:31:11 MESZ schrieb Krzysztof Kozlowski <krzk@kernel.org>:
>> On Sun, Jul 06, 2025 at 03:21:57PM +0200, Frank Wunderlich wrote:
>>> From: Frank Wunderlich <frank-w@public-files.de>
>>>
>>> Increase the maximum IRQ count to 8 (4 FE + 4 RSS/LRO).
>>
>> Because? Hardware was updated? It was missing before?
> 
> There is no RSS support in driver yet,so IRQs were not added to existing DTS yet.
> 

That's the problem. It's the hardware that you should've described, not the driver.

In short, you should've allowed the interrupts from the get-go, and you wouldn't
be in this situation now :-)

>>>
>>> Frame-engine-IRQs (max 4):
>>> MT7621, MT7628: 1 IRQ
>>> MT7622, MT7623: 3 IRQs (only two used by the driver for now)
>>> MT7981, MT7986, MT7988: 4 IRQs (only two used by the driver for now)
>>
>> You updated commit msg - looks fine - but same problem as before in your
>> code. Now MT7981 has 4-8 interrupts, even though you say here it has only
>> 4.
> 
> Ethernet works with 4,but can be 8 for MT798x.
> I cannot increase the MinItems here as it will
> throw error because currently only 4 are defined in DTS.same for MT7986.
>>>
>>> Mediatek Filogic SoCs (mt798x) have 4 additional IRQs for RSS and/or
>>> LRO.
>>
>> Although I don't know how to treat this. Just say how many interrupts
>> are there (MT7981, MT7986, MT7988: 4 FE and 4 RSS), not 4 but later
>> actually 4+4.
> 
> First block is for Frame Engine IRQs and second for RSS/LRO. Only mention total count
> across all SoCs is imho more confusing.
> 
>> I also do not understand why 7 interrupts is now valid... Are these not
>> connected physically?
> 
> 7 does not make sense but i know no way to allow 8 with min 4 without between (5-7).
> 
>> Best regards,
>> Krzysztof
> 
> Hi
> 
> Thanks for taking time for review again.
> 
> First block are the frame engine IRQs which are max 4 and on all SoCs.
> The RSS IRQs are only valid on Filogic (MT798x),so there a total of 8, but on
> MT7981 and MT7986 not yet added as i prepare the RSS/LRO driver in background.
> We just want to add the IRQs for MT7988 now.
> regards Frank

Again, it's not the driver but the hardware that you're describing.

As long as you are fixing the description of the hardware, even for all three,
I am personally even fine with breaking the ABI, because the hardware description
has been wrong for all that time.

Just don't send those as Fixes commits, but next time you upstream something you
must keep in mind that in bindings/dts you're describing hardware - the driver is
something that should not drive any decision in what you write in bindings.

We're humans, so stuff like this happens - I'm not saying that you shall not make
mistakes - but again please, for the next time, please please please keep in mind
what I just said :-)

Now the options are two:
  - Break the ABI; or
  - Allow 4 or 8 interrupts (not 5, not 6, not 7)

and that - not just on MT7988 but also on 81 and 86 in one go.

Not sure if the second one is feasible, and I'm considering the first option only
because of that; if the second option can be done, act like I never ever considered
the first.

Cheers,
Angelo


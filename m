Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0EECCCD193
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 10:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=903Ah5njHI+DyOMowclwhZasZKSXxvGT0A3XgQ5V5e0=; b=tNdgTEh6vXmp3sSghsxTHhqGku
	egxHT5nyrAe4vPlZWEd64R3pdKpEUqXjDqQLv//aqIO6kyv9sqsZ7jmhlwrRSpEKUzDGsLT07PrO4
	5wt/O0lBic4INUlXQQ1Hm4P+Bf7hIwY6mgURdJqzco2ZMkOHWEoh5G3O1RuuCZsRto7Km/4J5jaa0
	etdUB218yQXBJ+LFgxKn5262x4octRKZPbdDKindsd5Y18f27L44nlg7RMBw9qi4ndj5ghzmNAugr
	W37AZu+shdn2tn1MqJbwPc6qoJeBKKc0lbmi+2Tyn1ljaFnb2jqqjbOk6oT++5VA8etgIhr9/YTm6
	JqZvSW3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAn2w-0000000Cqaf-33hz;
	Mon, 20 Oct 2025 10:23:22 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAn2t-0000000CqZ5-20cJ;
	Mon, 20 Oct 2025 10:23:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1760955796;
	bh=OxzG71sDwuES4H6I4qFPGwWEW0NNXV3gRKLkV68zpaE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XH//neKq+w5ZgmjiqKKIco53S1kTKoUN8zlzWGaHQ8eqMxEhNaqwvK724JMy91qct
	 SqKfpex0IJtdEjSv88RB15h0kV/JycwfSC8bTA9LFfHIQZ10PQ0ES8GNIIQxrZ5snr
	 JC939XvsPv0CDkgO+8enjSZ0MeRrXJ8axcyu5SVnYUQCPZJo4aiiXMCUE2ZvWpDXp/
	 /crTyWIfJAIkew8Hpq8q2uyIhqben3OMy18dM0yJ/3dpAn3KiSJym0YV91fopaPvOR
	 AEYNXvHbCVg4i4NP3th6xaoTA5npM+/tS1btPBBSuu+/OVxIOjV1hSX+EOX8JAWqT0
	 E8WFxFyEYHcoQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 462D917E04DA;
	Mon, 20 Oct 2025 12:23:15 +0200 (CEST)
Message-ID: <82594ce7-f093-4753-b808-cd234845aed8@collabora.com>
Date: Mon, 20 Oct 2025 12:23:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/15] arm64: dts: mediatek: mt7981b-openwrt-one:
 Configure UART0 pinmux
To: Daniel Golle <daniel@makrotopia.org>
Cc: Sjoerd Simons <sjoerd@collabora.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Ryder Lee <ryder.lee@mediatek.com>, Jianjun Wang
 <jianjun.wang@mediatek.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Lee Jones <lee@kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Felix Fietkau <nbd@nbd.name>,
 kernel@collabora.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-pci@vger.kernel.org,
 linux-phy@lists.infradead.org, netdev@vger.kernel.org,
 Bryan Hinton <bryan@bryanhinton.com>
References: <20251016-openwrt-one-network-v1-0-de259719b6f2@collabora.com>
 <20251016-openwrt-one-network-v1-2-de259719b6f2@collabora.com>
 <aPDnT4tuSzNDzyAE@makrotopia.org>
 <5f430ff9-d701-426a-bf93-5290e6912eb4@collabora.com>
 <aPEfUBl6fMe6QYdY@makrotopia.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <aPEfUBl6fMe6QYdY@makrotopia.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_032320_025513_527D4A8D 
X-CRM114-Status: GOOD (  28.06  )
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

Il 16/10/25 18:37, Daniel Golle ha scritto:
> On Thu, Oct 16, 2025 at 04:29:14PM +0200, AngeloGioacchino Del Regno wrote:
>> Il 16/10/25 14:38, Daniel Golle ha scritto:
>>> On Thu, Oct 16, 2025 at 12:08:38PM +0200, Sjoerd Simons wrote:
>>>> Add explicit pinctrl configuration for UART0 on the OpenWrt One board,
>>>>
>>>> Signed-off-by: Sjoerd Simons <sjoerd@collabora.com>
>>>> ---
>>>>    arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dts | 11 +++++++++++
>>>>    1 file changed, 11 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dts b/arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dts
>>>> index 968b91f55bb27..f836059d7f475 100644
>>>> --- a/arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dts
>>>> +++ b/arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dts
>>>> @@ -22,6 +22,17 @@ memory@40000000 {
>>>>    	};
>>>>    };
>>>> +&pio {
>>>> +	uart0_pins: uart0-pins {
>>>> +		mux {
>>>> +			function = "uart";
>>>> +			groups = "uart0";
>>>> +		};
>>>> +	};
>>>> +};
>>>> +
>>>>    &uart0 {
>>>> +	pinctrl-names = "default";
>>>> +	pinctrl-0 = <&uart0_pins>;
>>>>    	status = "okay";
>>>>    };
>>>
>>> As there is only a single possible pinctrl configuration for uart0,
>>> both the pinmux definition as well as the pinctrl properties should go
>>> into mt7981b.dtsi rather than in the board's dts.
>>
>> If there's really one single possible pin configuration for the UART0 pins,
>> as in, those pins *do not* have a GPIO mode, then yes I agree.
>>
>> If those pins can be as well configured as GPIOs, this goes to board DTS.
> 
> I respectfully disagree and will explain below.
> 

Thanks a lot for taking the time to write all this - explains everything,
and even too much :) :)

Though, there's something funny here! The following snippet of "main" text
does explain stuff that is interesting, but that I (not other people, so
thanks again for saying all this) know already, but.....

> All pinmux pins on the MediaTek platform also allow being configured as
> GPIOs. However, if you configure those as GPIOs the consequence is that
> you cannot use UART0 any more at all. So using UART0 at all always
> implies using exactly those pins, there is no alternative to that.
> 
> Hence every board with every possible uses of pins 32 and 33 (there is
> only RX and TX for UART0, RTS/CTS flow-control is not possible) can be
> represented without needing to configure the pinctrl for uart0 on the
> board level. There isn't going to be any variation on the board-level
> when it comes to uart0. Either it is enabled (status = "okay";), and
> that will always imply using the 'uart0' group in mode 'uart', or, in
> case any of the two pins of uart0 is used for something else that means
> uart0 cannot be enabled. Simple as that.
> 
> Hence there is no need to duplicate that pinctrl settings on each and
> every board, as controlling the 'status' property on the board-level
> already gives 100% freedom.
> 

...all of this is not justifying your point.

> (Sidenote: As even the BootROM already uses those two pins as UART for
> debug output,

Funny thing is, your side note is what *fully* justifies your disagreement
and it's also what triggers me to say that you're right, lol :)

Okay then, I am fine with this commit now and I can renew my

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Cheers!
Angelo

> it is very unlikely that anyone would actually use them
> for anything else in production. Apart from being used as GPIOs you can
> also use pins 32 and 33 as an I2C target for external debug access to the
> registers of either the sgmii0_phy, sgmii1_phy or u3_phy. However, that
> doesn't matter in terms of the debate above, as the crucial point there
> is that using uart0 always implies using group 'uart0' in 'uart' mode.)




Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94899EA8121
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Feb 2026 14:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W5BmBKQGZHRzMCT4xcdzCoe+GS+zosQu7wPnyizMGTQ=; b=N7grHl/gd3gKtvFUW06LRbzfa7
	fvjxmSTlAFAlIZJpCihm3lgWKoG5aqZzHBTUoi+fGfxEoxW+kPHzEolZ4n4L5AGmiDnrRRp6m4Imw
	EswAHjJ/E7GGA+KE3lCawqJoBgTP25dCMNFKAxXj553G1jia+4DxvG/vZezRbssRHOg3aT392axpd
	WSF9ydFPCheyN88ijTeGdN8MzTmQlLhwaFe5ZdZHp0VGScBrUbzANn91oltp0XyeSMPCkr/rPb3UY
	kHZCpzjTOXMStxmQ5wSc77IUzAOf0Sv6o+56pY79v3tXPctVdlybi4GwxDnszyKoo6NFPo+moY/uI
	LuoYD1RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpohR-0000000H2uB-08bN;
	Tue, 10 Feb 2026 14:26:45 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpohO-0000000H2tl-1LqV;
	Tue, 10 Feb 2026 14:26:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1770733599;
	bh=QGAAPOqoXjq3zO9UajDHq/5xENhohgjwkPuEOq5nNwY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Cs0EcsPqRI8P6aRyv/zuZz2mmEQMZqGWDd4Qq3DcbKwcDeHS6FXG+FssABy4Yu+Jn
	 H+3c2rsmdu4I9PQmWZvATKNdl5GsKTuKVeB/Idke31sYVKSGlE55W0wqFwOVJtrI6a
	 w7p9bAo1CPyS1b+atTpEz369LowVivNyQFFuK2gR6OrestjoGNgLu3VWE/uCM1ZL4h
	 UynDQny0NN68d4xvulR+m9OpsjxX6C7vDLcr5GciMNYYXRWOG+ujJRZmTSOeQVM/os
	 qt+ZMdHnhsV4w8EInlflu8D7Wl5DMF148VfNpM5iQKC6MVrjPF59gXRltWZZ2W/DYT
	 kUpx7uq9Dsn3w==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A520417E1305;
	Tue, 10 Feb 2026 15:26:38 +0100 (CET)
Message-ID: <b6180be5-5ae6-4671-8a2f-68ffa35dadbe@collabora.com>
Date: Tue, 10 Feb 2026 15:26:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: mediatek: mt8189: Add pinmux macro header
 file
To: wens@kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: David Lechner <david@lechnology.com>, Cathy Xu
 <ot_cathy.xu@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Yong Mao <yong.mao@mediatek.com>, Wenbin Mei <Wenbin.Mei@mediatek.com>,
 Axe Yang <Axe.Yang@mediatek.com>, Lei Xue <Lei.Xue@mediatek.com>
References: <20250919020525.7904-1-ot_cathy.xu@mediatek.com>
 <1b092f9c-d0b1-47df-a83e-a99d7491a32b@lechnology.com>
 <7ed7a5e3-0c83-44e8-b7d2-e93e0b686df8@collabora.com>
 <CAGb2v66eSZUVk8_CXDMn6jmEJeC9QqJcz1eO-wVT-9OxrkU6Aw@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <CAGb2v66eSZUVk8_CXDMn6jmEJeC9QqJcz1eO-wVT-9OxrkU6Aw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_062642_543929_1A414BA5 
X-CRM114-Status: GOOD (  42.89  )
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

Il 10/02/26 13:48, Chen-Yu Tsai ha scritto:
> On Tue, Feb 10, 2026 at 7:03 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
>> Il 09/02/26 22:48, David Lechner ha scritto:
>>> On 9/18/25 9:03 PM, Cathy Xu wrote:
>>>> Add the pinctrl header file on MediaTek mt8189.
>>>>
>>>> Signed-off-by: Cathy Xu <ot_cathy.xu@mediatek.com>
>>>> ---
>>>> This patch is base on the patch series:
>>>> https://patchwork.kernel.org/project/linux-mediatek/list/?series=981475
>>>> [1] dt-bindings: pinctrl: mediatek: Add support for mt8189
>>>> [2] arm64: dts: mediatek: mt8189: Add pinmux macro header file
>>>> [3] pinctrl: mediatek: Add pinctrl driver on mt8189
>>>> Since patch [1] and [3] of the series have already been merged, this
>>>> patch(patch [2]) is being resent individually after modifications.
>>>> ---
>>>>    arch/arm64/boot/dts/mediatek/mt8189-pinfunc.h | 1125 +++++++++++++++++
>>>>    1 file changed, 1125 insertions(+)
>>>>    create mode 100644 arch/arm64/boot/dts/mediatek/mt8189-pinfunc.h
>>>>
>>>> diff --git a/arch/arm64/boot/dts/mediatek/mt8189-pinfunc.h b/arch/arm64/boot/dts/mediatek/mt8189-pinfunc.h
>>>> new file mode 100644
>>>> index 000000000000..df69f50c267a
>>>> --- /dev/null
>>>> +++ b/arch/arm64/boot/dts/mediatek/mt8189-pinfunc.h
>>>
>>> General question:
>>>
>>> Why do we have similar files in two different places different places?
>>>
>>> $ ls arch/arm64/boot/dts/mediatek/*-pin*
>>> arch/arm64/boot/dts/mediatek/mt2712-pinfunc.h
>>> arch/arm64/boot/dts/mediatek/mt6878-pinfunc.h
>>> arch/arm64/boot/dts/mediatek/mt6893-pinfunc.h
>>> arch/arm64/boot/dts/mediatek/mt8167-pinfunc.h
>>> arch/arm64/boot/dts/mediatek/mt8173-pinfunc.h
>>> arch/arm64/boot/dts/mediatek/mt8196-pinfunc.h
>>> arch/arm64/boot/dts/mediatek/mt8516-pinfunc.h
>>>
>>> $ ls include/dt-bindings/pinctrl/mt*
>>> include/dt-bindings/pinctrl/mt65xx.h
>>> include/dt-bindings/pinctrl/mt6779-pinfunc.h
>>> include/dt-bindings/pinctrl/mt6795-pinfunc.h
>>> include/dt-bindings/pinctrl/mt6797-pinfunc.h
>>> include/dt-bindings/pinctrl/mt7623-pinfunc.h
>>> include/dt-bindings/pinctrl/mt8135-pinfunc.h
>>> include/dt-bindings/pinctrl/mt8183-pinfunc.h
>>> include/dt-bindings/pinctrl/mt8186-pinfunc.h
>>> include/dt-bindings/pinctrl/mt8192-pinfunc.h
>>> include/dt-bindings/pinctrl/mt8195-pinfunc.h
>>> include/dt-bindings/pinctrl/mt8365-pinfunc.h
>>>
>>>
>>> Plus one different naming pattern.
>>>
>>> $ ls include/dt-bindings/pinctrl/mediatek,*
>>> include/dt-bindings/pinctrl/mediatek,mt8188-pinfunc.h
>>>
>>>
>>>
>>> Which one is preferred?
>>>
>>>
>> The MediaTek pinctrl must gain compatibility with standard pinctrl bindings. Until
>> then, bindings maintainers decided that these headers must go to the dts/mediatek
>> folder.
>>
>> It is my desire to (but lack of time on my side hits hard) do the right thing and
>> make the MediaTek pinctrl drivers to actually "understand" standard bindings.
> 
> The headers encode the pin numbers and mux values in a way that the
> "pinmux" property requires, all the while giving them meaningful names.
> 
> I suppose you could consider them part of the binding, as the pin controller
> binding assembles all the individual PIO blocks in the SoC to produce one
> unified view of all the pins. How they are ordered is important.
> 
> Plus the datasheets are horrible to read, as the pins aren't always numbered,
> but are referred to using symbolic names like I2S2_MCLK.
> 
>> I'd be - of course - happy if anyone else beats me on time (which wouldn't be hard
>> really) and pushes a series to fix this situation.
>>
>> Just to be clear - right now, the MTK pinctrl DT looks like:
>>
>>          panel_default_pins: panel-default-pins {
>>                  pins-rst {
>>                          pinmux = <PINMUX_GPIO108__FUNC_GPIO108>;
>>                          output-high;
>>                  };
>>
>>                  pins-en {
>>                          pinmux = <PINMUX_GPIO48__FUNC_GPIO48>;
>>                          output-low;
>>                  };
>>          };
>>
>>          spi1_pins: spi1-pins {
>>                  pins {
>>                          pinmux = <PINMUX_GPIO136__FUNC_SPIM1_CSB>,
>>                                   <PINMUX_GPIO137__FUNC_SPIM1_CLK>,
>>                                   <PINMUX_GPIO138__FUNC_SPIM1_MO>,
>>                                   <PINMUX_GPIO139__FUNC_SPIM1_MI>;
>>                          bias-disable;
>>                  };
>>          };
> 
> To be fair, the above is one valid kind of generic pinmux description.
> 
>  From Documentation/devicetree/bindings/pinctrl/pinmux-node.yaml :
> 
> While not required to be used, there are 3 generic forms of pin muxing nodes
> which pin controller devices can use.
> 
> For hardware where pin multiplexing configurations have to be specified for
> each single pin the number of required sub-nodes containing "pin" and
> "function" properties can quickly escalate and become hard to write and
> maintain.
> 
> For cases like this, the pin controller driver may use the pinmux helper
> property, where the pin identifier is provided with mux configuration settings
> in a pinmux group. A pinmux group consists of the pin identifier and mux
> settings represented as a single integer or an array of integers.
> 
> The pinmux property accepts an array of pinmux groups, each of them describing
> a single pin multiplexing configuration.
> 
>   - end quote -
> 
> So Mediatek is following one of the generic pinmux bindings. It's not the
> only one using this scheme either. STM32 and some of the Renesas platforms
> also follow it.
> 

Not saying that MediaTek is the only one that uses such bindings style, at all.

I admit I was too tough about that, but as of the current state, the *binding*
is not generic, and it's strictly tied to the GPIO Controller IP version of one
specific SoC.

While this style is generic, the actual pinmux *definitions* in the header are
not generic - that's what I wanted to say, and I admit I went a bit too vague
with words that are easy to misunderstand.

>> ....but the driver should gain compatibility with nodes which would look like:
>>
>>          panel_default_pins: panel-default-pins {
>>                  pins-rst {
>>                          pins = "gpio108";
>>                          function = "gpio";
>>                          output-high;
>>                  };
>>
>>                  pins-en {
>>                          pins = "gpio48";
>>                          function = "gpio";
>>                          output-low;
>>                  };
>>          };
>>
>>          spi1_pins: spi1-pins {
>>                  pins-bus {
>>                          pins = "gpio136", "gpio137", "gpio138", "gpio139",
>>                          function = "spi_m1";
> 
> Why is it "spi_m1", not "spi1"?
> 

PINMUX_GPIO138__FUNC_SPIM1_MO -> s/PINMUX_GPIO138__FUNC_//g/ and s/_MO//g

M1 stands for "Master 1" - that's because technically there could be a different
pinfunc for SPI "Slave 1" function.

That's SoC-specific anyway, not all of them have SPIS1, not all of them need
a different function, and... you get the point, I'm sure :-)

> 
> Honestly you likely don't want this, or rather you don't want a huge table
> of pins and pinmux values and strings in the kernel. It takes a lot of time
> to write, even more time to review, and takes up a lot of space for each
> pinctrl driver. And those are generally built-in.
> 
> The Allwinner platform has gone in the reverse direction: instead of having
> a huge table, we put the mux value in the DT using a custom property.
> See the following for discussions:
> 
> https://patchwork.ozlabs.org/project/linux-gpio/cover/20171113012523.2328-1-andre.przywara@arm.com/
> https://patchwork.ozlabs.org/project/linux-gpio/patch/20171113012523.2328-2-andre.przywara@arm.com/
> 
> And this is what finally landed:
> 
> https://lore.kernel.org/linux-gpio/20250306235827.4895-7-andre.przywara@arm.com/
> 
> Has it caused a bit of trouble? Perhaps. I was working on various peripherals
> on a new board and put in the wrong mux value and didn't notice for a couple
> days.
> 

Then we must find a way to decouple hardware-specific information from the actual
header I think?

Alternatively - that's what I have understood - and if I've understood that wrong,
this needs clarification from the bindings maintainers, and why they wanted the
MediaTek pinctrl bindings to get moved to arch/arm64/boot/dts/mediatek/ instead of
include/dt-bindings/pinctrl/

Bindings maintainers, any word on this?

Did I misunderstand anything in past reviews ... from krzk if I remember correctly?

Cheers,
Angelo

> 
> 
> ChenYu
> 
>>                          bias-disable;
>>                  };
>>          };
>>
>> .... or
>>
>>          spi1_pins: spi1-pins {
>>                  pins-bus {
>>                          function = "spi_m1";
>>                          groups = "spi_m1_pins";
>>                          bias-disable;
>>                  };
>>          };
>>
>> That's the entire situation.
>>
>> Cheers,
>> Angelo
>>




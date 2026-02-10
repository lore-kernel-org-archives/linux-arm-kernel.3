Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8DAAEA3F3A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Feb 2026 11:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lBmEgMIptVlCuVVHV6leI7Oo3PJ0HPQ1OFiQ619YKvY=; b=tZ5mBUoEBQdPZaJn0Q0nBVRLs7
	MjbkwLMQocabQbwGtI5JxREBBEXeDFE3xJeyyhZCW9wToV0/oIXFOgCPgYskhvI0zl9rk+9saQMbz
	SmenvDy+EX8sXRY/cnm8KLqxbZhf5mC5xq0X6WOKS84KvW/uXOtFFcvWPbmD8GrJ296xyaEkXp/qQ
	+9BvQx6yeSYTAgT3DLLVRXYX6EMtGQyWi3ejvufztoXpyW28TJIxqOVW2XA3Rq6FhYqQoOR/s0FWK
	qSlXBqyaYHUQnYh0DJNWrKEMj/DxrC9UmGkBmskTzFXuiz/4WahUE+qL745ezgKf8yTq2KVYk9ikJ
	KN7rGSBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vplWo-0000000GruW-1Aok;
	Tue, 10 Feb 2026 11:03:34 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vplWk-0000000Gru7-3fHp;
	Tue, 10 Feb 2026 11:03:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1770721407;
	bh=8RIiVCpyFFw4VXvzN2L61UAywu/cwAgjZhkbdvtX+sY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=aB05hZVCJpcC42+sI9c+F5DCGrJRaakAxgzQDTapKHCtvTiPp/guU4Hw4gwGbxR+v
	 i2L0TnPdM4uRf+WQjaWm66PoLiDLnCls0e2KYI1e9jNemqBbSM85apDLX+uZxdEC7S
	 B6fq6m+TsAjf8l/MM6jt3NE5qJvh/3MrMNmEwqfZZwkaJ2nuvAGJnv9KIgBM3PCDqg
	 RyqoCxWivzj0rtcaFAU0AldJb2zNdrhoFAwLAP/sechw5pyLlLGi5riugCxpb6FU7C
	 Sk6IJDr2ldf8D7bCWbEzPwp/zakzcvzlZVQW4bzXYYx6YKa9liiDFP28E1V2NXnjbn
	 RKrEEBuIhX5EQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EBCFC17E0E90;
	Tue, 10 Feb 2026 12:03:26 +0100 (CET)
Message-ID: <7ed7a5e3-0c83-44e8-b7d2-e93e0b686df8@collabora.com>
Date: Tue, 10 Feb 2026 12:03:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: mediatek: mt8189: Add pinmux macro header
 file
To: David Lechner <david@lechnology.com>, Cathy Xu
 <ot_cathy.xu@mediatek.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Yong Mao <yong.mao@mediatek.com>, Wenbin Mei <Wenbin.Mei@mediatek.com>,
 Axe Yang <Axe.Yang@mediatek.com>, Lei Xue <Lei.Xue@mediatek.com>
References: <20250919020525.7904-1-ot_cathy.xu@mediatek.com>
 <1b092f9c-d0b1-47df-a83e-a99d7491a32b@lechnology.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <1b092f9c-d0b1-47df-a83e-a99d7491a32b@lechnology.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_030331_116308_B13ACFAB 
X-CRM114-Status: GOOD (  16.47  )
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

Il 09/02/26 22:48, David Lechner ha scritto:
> On 9/18/25 9:03 PM, Cathy Xu wrote:
>> Add the pinctrl header file on MediaTek mt8189.
>>
>> Signed-off-by: Cathy Xu <ot_cathy.xu@mediatek.com>
>> ---
>> This patch is base on the patch series:
>> https://patchwork.kernel.org/project/linux-mediatek/list/?series=981475
>> [1] dt-bindings: pinctrl: mediatek: Add support for mt8189
>> [2] arm64: dts: mediatek: mt8189: Add pinmux macro header file
>> [3] pinctrl: mediatek: Add pinctrl driver on mt8189
>> Since patch [1] and [3] of the series have already been merged, this
>> patch(patch [2]) is being resent individually after modifications.
>> ---
>>   arch/arm64/boot/dts/mediatek/mt8189-pinfunc.h | 1125 +++++++++++++++++
>>   1 file changed, 1125 insertions(+)
>>   create mode 100644 arch/arm64/boot/dts/mediatek/mt8189-pinfunc.h
>>
>> diff --git a/arch/arm64/boot/dts/mediatek/mt8189-pinfunc.h b/arch/arm64/boot/dts/mediatek/mt8189-pinfunc.h
>> new file mode 100644
>> index 000000000000..df69f50c267a
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/mediatek/mt8189-pinfunc.h
> 
> General question:
> 
> Why do we have similar files in two different places different places?
> 
> $ ls arch/arm64/boot/dts/mediatek/*-pin*
> arch/arm64/boot/dts/mediatek/mt2712-pinfunc.h
> arch/arm64/boot/dts/mediatek/mt6878-pinfunc.h
> arch/arm64/boot/dts/mediatek/mt6893-pinfunc.h
> arch/arm64/boot/dts/mediatek/mt8167-pinfunc.h
> arch/arm64/boot/dts/mediatek/mt8173-pinfunc.h
> arch/arm64/boot/dts/mediatek/mt8196-pinfunc.h
> arch/arm64/boot/dts/mediatek/mt8516-pinfunc.h
> 
> $ ls include/dt-bindings/pinctrl/mt*
> include/dt-bindings/pinctrl/mt65xx.h
> include/dt-bindings/pinctrl/mt6779-pinfunc.h
> include/dt-bindings/pinctrl/mt6795-pinfunc.h
> include/dt-bindings/pinctrl/mt6797-pinfunc.h
> include/dt-bindings/pinctrl/mt7623-pinfunc.h
> include/dt-bindings/pinctrl/mt8135-pinfunc.h
> include/dt-bindings/pinctrl/mt8183-pinfunc.h
> include/dt-bindings/pinctrl/mt8186-pinfunc.h
> include/dt-bindings/pinctrl/mt8192-pinfunc.h
> include/dt-bindings/pinctrl/mt8195-pinfunc.h
> include/dt-bindings/pinctrl/mt8365-pinfunc.h
> 
> 
> Plus one different naming pattern.
> 
> $ ls include/dt-bindings/pinctrl/mediatek,*
> include/dt-bindings/pinctrl/mediatek,mt8188-pinfunc.h
> 
> 
> 
> Which one is preferred?
> 
> 
The MediaTek pinctrl must gain compatibility with standard pinctrl bindings. Until
then, bindings maintainers decided that these headers must go to the dts/mediatek
folder.

It is my desire to (but lack of time on my side hits hard) do the right thing and
make the MediaTek pinctrl drivers to actually "understand" standard bindings.

I'd be - of course - happy if anyone else beats me on time (which wouldn't be hard
really) and pushes a series to fix this situation.

Just to be clear - right now, the MTK pinctrl DT looks like:

	panel_default_pins: panel-default-pins {
		pins-rst {
			pinmux = <PINMUX_GPIO108__FUNC_GPIO108>;
			output-high;
		};

		pins-en {
			pinmux = <PINMUX_GPIO48__FUNC_GPIO48>;
			output-low;
		};
	};

	spi1_pins: spi1-pins {
		pins {
			pinmux = <PINMUX_GPIO136__FUNC_SPIM1_CSB>,
				 <PINMUX_GPIO137__FUNC_SPIM1_CLK>,
				 <PINMUX_GPIO138__FUNC_SPIM1_MO>,
				 <PINMUX_GPIO139__FUNC_SPIM1_MI>;
			bias-disable;
		};
	};

....but the driver should gain compatibility with nodes which would look like:

	panel_default_pins: panel-default-pins {
		pins-rst {
			pins = "gpio108";
			function = "gpio";
			output-high;
		};

		pins-en {
			pins = "gpio48";
			function = "gpio";
			output-low;
		};
	};

	spi1_pins: spi1-pins {
		pins-bus {
			pins = "gpio136", "gpio137", "gpio138", "gpio139",
			function = "spi_m1";
			bias-disable;
		};
	};

.... or

	spi1_pins: spi1-pins {
		pins-bus {
			function = "spi_m1";
			groups = "spi_m1_pins";
			bias-disable;
		};
	};

That's the entire situation.

Cheers,
Angelo


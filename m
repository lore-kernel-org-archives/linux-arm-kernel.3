Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CAA8CCD183
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 11:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tqjFs/IyP2PWeKlRmbAAWPZkIsNKkvhn10LBbn1RWTU=; b=ElihuwqsbdSTpq6rgf9ze8Dr1T
	2kevzLLHA/7NQ6X42fEY8ldTqZhfQNQH5MUh515M1HU/CfJ8qZ5Lpo4VaU3bhWJ+6G508b216ckUy
	xkWxdh04YC5ueYt7YDOfxzf2XUP52jYKcB39CApyJq9dPPeemM9Ma6ydxpTVpax6X9vfULjlnXQml
	Nb9tlFpB2+6xp6iuzBuGbVDhpMM0ZwCDbBFlndRvoaMzwnrA9tNJqpyoGrTsfRRA71q/M2tF1IRps
	/iRaukI/egLsE4lRYKGIQHVk28yn3IhUdNoJEw2VdyyKYsydBe5omHq+0XWHmkuYJuysoTXc4TgyN
	fWLSeZQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8HDN-0000000D3xU-2HeW;
	Mon, 13 Oct 2025 11:59:45 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8HDL-0000000D3uV-2XWx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 11:59:45 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 98F251A133A;
	Mon, 13 Oct 2025 11:59:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5FDF5606C6;
	Mon, 13 Oct 2025 11:59:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 71A00102F225F;
	Mon, 13 Oct 2025 13:59:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760356774; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=tqjFs/IyP2PWeKlRmbAAWPZkIsNKkvhn10LBbn1RWTU=;
	b=GFYlkLtBUG+G9nLgkwz6eL7aoFEq9bwW/Eg1h/WvwIYZ9LVvbeHyaHRBLe385PaWd3s8h5
	UETY1QeZcjfoijCgm1DDKE2p2dFQClNkVyRAe7ofxOwWpmIoB1Y/SP5XklpP7KQsj0fTTU
	gUTyHV4zR8cPJm+zwhRuxuHCWP6430R3QBFkM7zQVXsexur57Mf+lPX8Q9bUuPdLB+FPin
	iw4IscQJ0+fIwa8x9vHS+79DPs3ya2WRoJ7FBffSU+U5uAtIle7bDpD87Cd+c1qBWSf8zD
	agAHGAs6+aJ11TmN61BBMWAn2CanGdaZAd4xBZGzFMLSmeCDbH+wzuV126URRQ==
Message-ID: <893f8b18-265e-4351-8d91-bd81f04c6eed@bootlin.com>
Date: Mon, 13 Oct 2025 13:59:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/15] arm64: dts: allwinner: h616: add NAND controller
To: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>
Cc: Wentao Liang <vulab@iscas.ac.cn>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20251010084042.341224-1-richard.genoud@bootlin.com>
 <20251010084042.341224-4-richard.genoud@bootlin.com>
 <4682810.LvFx2qVVIh@jernej-laptop>
From: Richard GENOUD <richard.genoud@bootlin.com>
Content-Language: en-US, fr
Organization: Bootlin
In-Reply-To: <4682810.LvFx2qVVIh@jernej-laptop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_045943_770964_23A93458 
X-CRM114-Status: GOOD (  16.72  )
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

Le 11/10/2025 à 12:33, Jernej Škrabec a écrit :
> Dne petek, 10. oktober 2025 ob 10:40:30 Srednjeevropski poletni čas je Richard Genoud napisal(a):
>> The H616 has a NAND controller quite similar to the A10/A23 ones, but
>> with some register differences, more clocks (for ECC and MBUS), more ECC
>> strengths, so this requires a new compatible string.
>>
>> This patch adds the NAND controller node and pins in the device tree.
>>
>> Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
>> ---
>>   .../arm64/boot/dts/allwinner/sun50i-h616.dtsi | 50 +++++++++++++++++++
>>   1 file changed, 50 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
>> index ceedae9e399b..60626eba7f7c 100644
>> --- a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
>> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
>> @@ -278,6 +278,37 @@ ir_rx_pin: ir-rx-pin {
>>   				function = "ir_rx";
>>   			};
>>   
>> +			nand_pins: nand-pins {
>> +				pins = "PC0", "PC1", "PC2", "PC5", "PC8", "PC9",
>> +				       "PC10", "PC11", "PC12", "PC13", "PC14",
>> +				       "PC15", "PC16";
>> +				function = "nand0";
>> +			};
>> +
>> +			nand_cs0_pin: nand-cs0-pin {
>> +				pins = "PC4";
>> +				function = "nand0";
>> +				bias-pull-up;
>> +			};
>> +
>> +			nand_cs1_pin: nand-cs1-pin {
>> +				pins = "PC3";
>> +				function = "nand0";
>> +				bias-pull-up;
>> +			};
>> +
>> +			nand_rb0_pin: nand-rb0-pin {
>> +				pins = "PC6";
>> +				function = "nand0";
>> +				bias-pull-up;
>> +			};
>> +
>> +			nand_rb1_pin: nand-rb1-pin {
>> +				pins = "PC7";
>> +				function = "nand0";
>> +				bias-pull-up;
>> +			};
>> +
>>   			mmc0_pins: mmc0-pins {
>>   				pins = "PF0", "PF1", "PF2", "PF3",
>>   				       "PF4", "PF5";
>> @@ -440,6 +471,25 @@ mmc2: mmc@4022000 {
>>   			#size-cells = <0>;
>>   		};
>>   
>> +		nfc: nand-controller@4011000 {
> 
> Nodes are sorted by memory address. So this one should be moved before
> mmc2 and possibly others.
Indeed.
I'll fix that.

> 
>> +			compatible = "allwinner,sun50i-h616-nand-controller";
>> +			reg = <0x04011000 0x1000>;
>> +			interrupts = <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>;
>> +			clocks = <&ccu CLK_BUS_NAND>, <&ccu CLK_NAND0>,
>> +				<&ccu CLK_NAND1>, <&ccu CLK_MBUS_NAND>;
>> +			clock-names = "ahb", "mod", "ecc", "mbus";
>> +			resets = <&ccu RST_BUS_NAND>;
>> +			reset-names = "ahb";
>> +			dmas = <&dma 10>;
>> +			dma-names = "rxtx";
>> +			pinctrl-names = "default";
>> +			pinctrl-0 = <&nand_pins>, <&nand_cs0_pin>,
>> +				<&nand_cs1_pin>, <&nand_rb0_pin>,
>> +				<&nand_rb1_pin>;
> 
> Are you sure that each nand device will use exactly this pin configuration?
> IIUC, not all chips will have two CS and two RB pins. If so, pinctrl nodes
> should be moved to device DT and pins subnodes should be marked with
> /omit-if-no-ref/.

You're right, all pins may not be used.

Thanks!

> 
> Best regards,
> Jernej
> 
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +		};
>> +
>>   		uart0: serial@5000000 {
>>   			compatible = "snps,dw-apb-uart";
>>   			reg = <0x05000000 0x400>;
>>

-- 
Richard Genoud, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


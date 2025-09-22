Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60DDCCAC5A8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 13:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MpMAU6ePTT3stEVrXmR+KZ4X7JkHWkrBjGiR3cqGNDo=; b=N85OHdQRZQ74RjEl5WXA4VigSF
	PJOM+8TGTnks4ngu+YLLCbtKPMHPxuv/N5OqeTlSa0DMhwzeZf8bKOSIybkZDQmm7vBwQ69W51RuV
	hRNG2VLNdhvzUFrgQ1ZMLBj2eg80vF7q3M1FxWZv0CZnbSiu3brkl0uczHykM0cLQcgYBQaLPF9Zp
	39Cd6n66Dgco/veIF0YgsVCIdqo7QSqbjju/HpWpdI3Rntngo0J3TApNE8axTL1DTS0WNUffDVwno
	GcKc9MrBJaL11xU2GmEIxWMEjV0AJ3/RbQq6ZvDSPASNG3zB2uySH4P9nNRh4X/oU66JB0HBwthTl
	0w8tMoZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0geX-0000000AWAR-1UYf;
	Mon, 22 Sep 2025 13:32:25 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0geU-0000000AW9x-2kX2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 13:32:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1758547942; x=1790083942;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=TDh5kMQItLeCtCYOhniYG9SE9N6xkw1ryWAXikH5CKc=;
  b=03e+Zhr0GU924QPJGH7ZfNTZUO8d/I2WZpXpvNbLYMLTSvcSsSJSPwR1
   +BUY/4bzYYrQ5Z51xR/5sHnzTB99q99INvpVOM3ujzAl82iA49SdBEwBF
   cu5PYxOUcw4UT9mwEJAPMc2X5Qo6Q6ZZ4ZuQo79hcuh3lFz667LHBV4bn
   gLdFOh8GPH8x4tR999dxMUo9o8GOjsYQhH4sFMLc7eqr7Pha7wh6kOeRU
   OkIWxQRFgUI4NlUI67sLNfhbrarwMANhGy1ZuaM9+Pwp3pyZA6BS8u5P4
   hyzpn0ABSIJgIDm5yHTc7EYMV8KgpuO2oatWoWWJKnWDribcExNm36EDB
   A==;
X-CSE-ConnectionGUID: TCpADp6USuqlHeFWAhCzYw==
X-CSE-MsgGUID: g6s7rN8HROqtzWL3QVKHcQ==
X-IronPort-AV: E=Sophos;i="6.18,285,1751266800"; 
   d="scan'208";a="46235453"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 22 Sep 2025 06:32:20 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Mon, 22 Sep 2025 06:31:47 -0700
Received: from [10.159.245.205] (10.10.85.11) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Mon, 22 Sep 2025 06:31:45 -0700
Message-ID: <bc2278a2-387f-4e66-b275-8429bcb45db1@microchip.com>
Date: Mon, 22 Sep 2025 15:31:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: microchip: sam9x7: Add qspi controller
To: Dharma Balasubiramani <dharma.b@microchip.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <20250915-sam9x7-qspi-dtsi-v1-1-1cc9adba7573@microchip.com>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Content-Language: en-US, fr
Organization: microchip
In-Reply-To: <20250915-sam9x7-qspi-dtsi-v1-1-1cc9adba7573@microchip.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_063222_760897_EF61327F 
X-CRM114-Status: GOOD (  15.10  )
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

On 15/09/2025 at 11:13, Dharma Balasubiramani wrote:
> Add support for QSPI controller.
> 
> Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>

Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>
And queued in at91-dt branch.

> ---
> Driver and Doc support
> https://lore.kernel.org/lkml/20250908-microchip-qspi-v2-0-8f3d69fdd5c9@microchip.com/

Thanks for the reference to the (accepted) binding and driver changes!

Best regards,
   Nicolas

> ---
>   arch/arm/boot/dts/microchip/sam9x7.dtsi | 21 +++++++++++++++++++++
>   1 file changed, 21 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/microchip/sam9x7.dtsi b/arch/arm/boot/dts/microchip/sam9x7.dtsi
> index 66c07e642c3e..46dacbbd201d 100644
> --- a/arch/arm/boot/dts/microchip/sam9x7.dtsi
> +++ b/arch/arm/boot/dts/microchip/sam9x7.dtsi
> @@ -271,6 +271,27 @@ AT91_XDMAC_DT_PERID(38))>,
>   			status = "disabled";
>   		};
>   
> +		qspi: spi@f0014000 {
> +			compatible = "microchip,sam9x7-ospi";
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <0xf0014000 0x100>, <0x60000000 0x20000000>;
> +			reg-names = "qspi_base", "qspi_mmap";
> +			interrupts = <35 IRQ_TYPE_LEVEL_HIGH 7>;
> +			dmas = <&dma0
> +				(AT91_XDMAC_DT_MEM_IF(0) | AT91_XDMAC_DT_PER_IF(1) |
> +				AT91_XDMAC_DT_PERID(26))>,
> +				<&dma0
> +				(AT91_XDMAC_DT_MEM_IF(0) | AT91_XDMAC_DT_PER_IF(1) |
> +				AT91_XDMAC_DT_PERID(27))>;
> +			dma-names = "tx", "rx";
> +			clocks = <&pmc PMC_TYPE_PERIPHERAL 35>, <&pmc PMC_TYPE_GCK 35>;
> +			clock-names = "pclk", "gclk";
> +			assigned-clocks = <&pmc PMC_TYPE_GCK 35>;
> +			assigned-clock-parents = <&pmc PMC_TYPE_CORE PMC_PLLADIV2>;
> +			status = "disabled";
> +		};
> +
>   		i2s: i2s@f001c000 {
>   			compatible = "microchip,sam9x7-i2smcc", "microchip,sam9x60-i2smcc";
>   			reg = <0xf001c000 0x100>;
> 
> ---
> base-commit: 590b221ed4256fd6c34d3dea77aa5bd6e741bbc1
> change-id: 20250915-sam9x7-qspi-dtsi-a4844266b17d
> 
> Best regards,



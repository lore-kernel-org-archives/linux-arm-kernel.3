Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EB02C4452B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 19:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NVfPL7VX2mQ3uu7iB5fH/zzpnC1hWFDGeUkNw9mk3Xo=; b=hl54Mq06CthT6bFsU81zvsxgGb
	leUuXPO79UDXRzbXGgW+6JWYyzv39QvkYV01H1E4WvQbn00jQDhB7KGjaKSWtl7N2i8CDYyx7hpj+
	fodyBIII5tGacuw1SH2tBgHLjy1C+vJo0b7DV8xlXwpi9orWTGqFyQBczeCbh1Hi0L802iY/vbIi2
	F4dzQViuGrC47eaqPB0kmoKy+1/u7WF/KqgCnPwQNLu3ys8Mc+/Xxe0jecnPFIBZHNXyHHYvWebDC
	l7deKrBYKbqI7PN5HBoY5A0kZsqiwismq2G5tmxhCStSvCa6zdkQY1NaNu3M9b0UpVkBxqRws++H/
	GZVmSYCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmGCh-0000000AI96-1gQL;
	Tue, 21 Jul 2026 19:32:35 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmGCg-0000000AI8z-2aHh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 19:32:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2EEC64163C;
	Tue, 21 Jul 2026 19:32:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EA501F00A3D;
	Tue, 21 Jul 2026 19:32:29 +0000 (UTC)
Message-ID: <a11988db-7861-4fb5-ba7e-e2be56b2d323@tuxon.dev>
Date: Tue, 21 Jul 2026 22:32:27 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/13] ARM: dts: microchip: sama7d65: Add ADC node
To: Varshini Rajendran <varshini.rajendran@microchip.com>,
 ehristev@kernel.org, jic23@kernel.org, dlechner@baylibre.com,
 nuno.sa@analog.com, andy@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, srini@kernel.org, marcelo.schmitt@analog.com,
 jorge.marques@analog.com, mazziesaccount@gmail.com,
 Jonathan.Santos@analog.com, jishnu.prakash@oss.qualcomm.com,
 antoniu.miclaus@analog.com, duje@dujemihanovic.xyz,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260630093603.38663-1-varshini.rajendran@microchip.com>
 <20260630093603.38663-9-varshini.rajendran@microchip.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260630093603.38663-9-varshini.rajendran@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

Hi, Varshini,

On 6/30/26 12:35, Varshini Rajendran wrote:
> Add node for the ADC controller in sama7d65 SoC. Add the vddout25 fixed
> regulator node which provides the 2.5V reference voltage for the ADC.
> 
> Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
> ---
>   arch/arm/boot/dts/microchip/sama7d65.dtsi | 29 +++++++++++++++++++++++
>   1 file changed, 29 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/microchip/sama7d65.dtsi b/arch/arm/boot/dts/microchip/sama7d65.dtsi
> index 94d49e20dc79..ba775459a816 100644
> --- a/arch/arm/boot/dts/microchip/sama7d65.dtsi
> +++ b/arch/arm/boot/dts/microchip/sama7d65.dtsi
> @@ -11,6 +11,7 @@
>   #include <dt-bindings/clock/at91.h>
>   #include <dt-bindings/dma/at91.h>
>   #include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/iio/adc/at91-sama5d2_adc.h>
>   #include <dt-bindings/interrupt-controller/arm-gic.h>
>   #include <dt-bindings/interrupt-controller/irq.h>
>   #include <dt-bindings/mfd/at91-usart.h>
> @@ -95,6 +96,16 @@ slow_xtal: clock-slowxtal {
>   		};
>   	};
>   
> +	vddout25: fixed-regulator-vddout25 {
> +		compatible = "regulator-fixed";
> +

This line could be dropped.

> +		regulator-name = "VDDOUT25";
> +		regulator-min-microvolt = <2500000>;
> +		regulator-max-microvolt = <2500000>;
> +		regulator-boot-on;
> +		status = "disabled";
> +	};
> +
>   	ns_sram: sram@100000 {
>   		compatible = "mmio-sram";
>   		reg = <0x100000 0x20000>;
> @@ -296,6 +307,24 @@ can4: can@e0838000 {
>   			status = "disabled";
>   		};
>   
> +		adc: adc@e1000000 {
> +			compatible = "microchip,sama7d65-adc";
> +			reg = <0xe1000000 0x200>;
> +			interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&pmc PMC_TYPE_GCK 25>;
> +			assigned-clocks = <&pmc PMC_TYPE_GCK 25>;
> +			assigned-clock-rates = <100000000>;
> +			clock-names = "adc_clk";

clock-names usually goes after clocks.

> +			dmas = <&dma0 AT91_XDMAC_DT_PERID(0)>;
> +			dma-names = "rx";
> +			atmel,min-sample-rate-hz = <200000>;
> +			atmel,max-sample-rate-hz = <20000000>;
> +			atmel,trigger-edge-type = <IRQ_TYPE_EDGE_RISING>;
> +			atmel,startup-time-ms = <4>;
> +			#io-channel-cells = <1>;

This could be moved before vendor specific properties since it's standard.

I can address all these while applying, if any.

Thank you,
Claudiu

> +			status = "disabled";
> +		};
> +
>   		dma2: dma-controller@e1200000 {
>   			compatible = "microchip,sama7d65-dma", "microchip,sama7g5-dma";
>   			reg = <0xe1200000 0x1000>;



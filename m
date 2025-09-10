Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6479ECA101F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 06:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YzWEaq7fc9RZr840kPRXsnWFetoKfBv/D8xt+yJ4/m0=; b=sKe+Cw4VnPq7lrg+ZQIcr1//Fj
	+/DnsT8cnum9N8l4zBP4mn9Q7x3hTAx+ZqLqI6nS5hztVYR6QYjR2C/ax8bol2R9l/ZwpjUJ5YtAh
	eglUXXwPB+D9uCL+rF0Tf/e7DEjewgSZ+dNnGq2sJfWV3X/tf2zy8Cw7hZYIBz5J2GMMAJvFjpklO
	DvCZqy1EPVWD2Yl9yS2PPZJ/4NA+SpmhksRMxSm3NDwhv6KxtrC6n+3vYh9OX8K1gmfHONLLH0WQT
	MvUckC9VZVRL1GH6ZvgggQdGgJAxE2jvpopPoJbwmVOH4+GtSSN6uoETbyA+TdKdIqdeUmLEtpmhH
	HSjrjZgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwECC-0000000CGpK-1jsV;
	Wed, 10 Sep 2025 06:20:44 +0000
Received: from mail.thorsis.com ([2003:a:e28:26e4::10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwEC8-0000000CGo3-1SXb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 06:20:42 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CC0AA148625E;
	Wed, 10 Sep 2025 08:20:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1757485234; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=YzWEaq7fc9RZr840kPRXsnWFetoKfBv/D8xt+yJ4/m0=;
	b=Wxrpa7B4yLX38x0eHaGOBvhBP8zgjpKgAmymznTrEEINHHmzs/6cH+rr/UCWjlLw99ye0n
	PY0YQUb0CeQ1ZLEPbSU5FOgl1darrlVde4qvytBwDAp/WCuIzj/sc1NEgQL1/BDQGY+V0p
	5r2CFv3Pnxz5PrAUWJf9MPs0BkM7PoGBWoKphz891fRQVpq7BRsOMygUYtL0Nc9M9KJfSe
	xxjpewAOHzMZUPmlXJomz8UtepPTMd/iQR2T8ygsBaOzO0ZdgH0kJX/xLksxNy8u1D8rDR
	n6Oq10xvUlopELrrqh5Gdk7rEEf2lx8RteATdOWswheCNNi0nVfEgUhl5SiWWA==
Date: Wed, 10 Sep 2025 08:20:28 +0200
From: Alexander Dahl <ada@thorsis.com>
To: Ryan.Wanner@microchip.com
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: microchip: sama7d65: Add GPIO buttons and LEDs
Message-ID: <20250910-retake-attic-ac1fe3429a1e@thorsis.com>
Mail-Followup-To: Ryan.Wanner@microchip.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250909160842.392075-1-Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250909160842.392075-1-Ryan.Wanner@microchip.com>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_232040_855842_F67800E1 
X-CRM114-Status: GOOD (  17.04  )
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

Hello Ryan,

Am Tue, Sep 09, 2025 at 09:08:38AM -0700 schrieb Ryan.Wanner@microchip.com:
> From: Ryan Wanner <Ryan.Wanner@microchip.com>
> 
> Add the USER button as a GPIO input as well as add the LEDs and enable
> the blue LED as a heartbeat.
> 
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
>  .../dts/microchip/at91-sama7d65_curiosity.dts | 49 +++++++++++++++++++
>  1 file changed, 49 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts b/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts
> index f091cc40a9f0..2fe34c59d942 100644
> --- a/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts
> +++ b/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts
> @@ -11,6 +11,7 @@
>  #include "sama7d65-pinfunc.h"
>  #include "sama7d65.dtsi"
>  #include <dt-bindings/mfd/atmel-flexcom.h>
> +#include <dt-bindings/input/input.h>
>  #include <dt-bindings/pinctrl/at91.h>
>  
>  / {
> @@ -26,6 +27,42 @@ chosen {
>  		stdout-path = "serial0:115200n8";
>  	};
>  
> +	gpio-keys {
> +		compatible = "gpio-keys";
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_key_gpio_default>;
> +
> +		button {
> +			label = "PB_USER";
> +			gpios = <&pioa PIN_PC10 GPIO_ACTIVE_LOW>;
> +			linux,code = <KEY_PROG1>;
> +			wakeup-source;
> +		};
> +	};
> +
> +	leds {
> +		compatible = "gpio-leds";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_led_gpio_default>;
> +
> +		led-red {
> +			label = "red";
> +			gpios = <&pioa PIN_PB17 GPIO_ACTIVE_HIGH>; /* Conflict with pwm. */
> +		};
> +
> +		led-green {
> +			label = "green";
> +			gpios = <&pioa PIN_PB15 GPIO_ACTIVE_HIGH>; /* Conflict with pwm. */
> +		};
> +
> +		led-blue {
> +			label = "blue";
> +			gpios = <&pioa PIN_PA21 GPIO_ACTIVE_HIGH>;
> +			linux,default-trigger = "heartbeat";
> +		};
> +	};

The label property is deprecated.  Please use the properties "color"
and "function" for new boards.  See devicetree binding documentation
for LEDs.

Thanks and greetings
Alex

> +
>  	memory@60000000 {
>  		device_type = "memory";
>  		reg = <0x60000000 0x40000000>;
> @@ -352,6 +389,18 @@ pinctrl_i2c10_default: i2c10-default {
>  		bias-pull-up;
>  	};
>  
> +	pinctrl_key_gpio_default: key-gpio-default {
> +		pinmux = <PIN_PC10__GPIO>;
> +		bias-pull-up;
> +	};
> +
> +	pinctrl_led_gpio_default: led-gpio-default {
> +		pinmux = <PIN_PB15__GPIO>,
> +			 <PIN_PB17__GPIO>,
> +			 <PIN_PA21__GPIO>;
> +		bias-pull-up;
> +	};
> +
>  	pinctrl_sdmmc1_default: sdmmc1-default {
>  		cmd-data {
>  			pinmux = <PIN_PB22__SDMMC1_CMD>,
> -- 
> 2.43.0
> 
> 


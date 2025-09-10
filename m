Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDA0FCA101F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 06:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i2tkSNOBdYBLXot+Ags84Au0XUzpcxSTIhWXOCdWJ0E=; b=lZ26dcc3xo7pVVOWDPEzLfzIMR
	uhwE2Jdr55gnD/PNo9HnU1ILkpKqcakYiMBGV+z9Db/p0gvfsZ4OIwMfFtqfLaHTZTgtknMvI8tri
	53hQ3Hh9fioBOx9yJy2/zFVvxh0INDd/z6gw8ycEwI5/fgpinPpV53Yx/5J1PqosCVNmb0W5ULhDk
	oEAMiIE9qsphZ98nxWxEbp1nbri5z7jXuaXQLKtPeXJciZgRNhlHhToglhFoU/FyAsVtaM3rFqLgR
	/F8IC+aFlmCw+j0TPILXc7AF/ZhCzF6e1NrYL8dxyBToXOQXTWMkSrDGMy9Xdee4SArn3LEGkIq9h
	dNR7kVAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwEGf-0000000CHD7-0X6p;
	Wed, 10 Sep 2025 06:25:21 +0000
Received: from mail.thorsis.com ([217.92.40.78])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwEGd-0000000CHCi-1QdX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 06:25:20 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E4E371486248;
	Wed, 10 Sep 2025 08:25:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1757485516;
	h=from:subject:date:message-id:to:mime-version:content-type:in-reply-to:
	 references; bh=i2tkSNOBdYBLXot+Ags84Au0XUzpcxSTIhWXOCdWJ0E=;
	b=uOdpXvC7UsrRyFATUUsCuRvATr0NDjk+gRDkI/nvOQSVIvqekr0BndRJjhqWkc0CSSNXdk
	ikUUrjEbbKq2g3d4d9fCG6nW52KwmIruRs4N/Q40Jnqs4roLqNT1GoxH9U8T3/IaTOtYPa
	UWnPdajUd55RxyWpXkDGrhAxXmXYuX8ZTADFq2AgsQLyQ55c79spMR9bTRZfIhRSWPye1D
	HgWIyNamntDlegi4iVKtKizgsuMxN+DR6aFZABcf8Vo1OEB7Y73A9lgz9cu38z1sKtV5UJ
	J8JZ+OVg8MOPr50w6UEQfV/AZ4PeI+J+fChrEXtaLd5LywBLiGoWi16ECpsj3g==
Date: Wed, 10 Sep 2025 08:25:14 +0200
From: Alexander Dahl <ada@thorsis.com>
To: Ryan.Wanner@microchip.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: microchip: sama7d65: Add GPIO buttons and LEDs
Message-ID: <20250910-alkalize-overtime-930a59a7d169@thorsis.com>
Mail-Followup-To: Ryan.Wanner@microchip.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250909160842.392075-1-Ryan.Wanner@microchip.com>
 <20250910-retake-attic-ac1fe3429a1e@thorsis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250910-retake-attic-ac1fe3429a1e@thorsis.com>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_232519_552232_790D2A4F 
X-CRM114-Status: GOOD (  21.07  )
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

Am Wed, Sep 10, 2025 at 08:20:28AM +0200 schrieb Alexander Dahl:
> Hello Ryan,
> 
> Am Tue, Sep 09, 2025 at 09:08:38AM -0700 schrieb Ryan.Wanner@microchip.com:
> > From: Ryan Wanner <Ryan.Wanner@microchip.com>
> > 
> > Add the USER button as a GPIO input as well as add the LEDs and enable
> > the blue LED as a heartbeat.
> > 
> > Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> > ---
> >  .../dts/microchip/at91-sama7d65_curiosity.dts | 49 +++++++++++++++++++
> >  1 file changed, 49 insertions(+)
> > 
> > diff --git a/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts b/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts
> > index f091cc40a9f0..2fe34c59d942 100644
> > --- a/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts
> > +++ b/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts
> > @@ -11,6 +11,7 @@
> >  #include "sama7d65-pinfunc.h"
> >  #include "sama7d65.dtsi"
> >  #include <dt-bindings/mfd/atmel-flexcom.h>
> > +#include <dt-bindings/input/input.h>
> >  #include <dt-bindings/pinctrl/at91.h>
> >  
> >  / {
> > @@ -26,6 +27,42 @@ chosen {
> >  		stdout-path = "serial0:115200n8";
> >  	};
> >  
> > +	gpio-keys {
> > +		compatible = "gpio-keys";
> > +
> > +		pinctrl-names = "default";
> > +		pinctrl-0 = <&pinctrl_key_gpio_default>;
> > +
> > +		button {
> > +			label = "PB_USER";
> > +			gpios = <&pioa PIN_PC10 GPIO_ACTIVE_LOW>;
> > +			linux,code = <KEY_PROG1>;
> > +			wakeup-source;
> > +		};
> > +	};
> > +
> > +	leds {
> > +		compatible = "gpio-leds";
> > +		pinctrl-names = "default";
> > +		pinctrl-0 = <&pinctrl_led_gpio_default>;
> > +
> > +		led-red {
> > +			label = "red";
> > +			gpios = <&pioa PIN_PB17 GPIO_ACTIVE_HIGH>; /* Conflict with pwm. */
> > +		};
> > +
> > +		led-green {
> > +			label = "green";
> > +			gpios = <&pioa PIN_PB15 GPIO_ACTIVE_HIGH>; /* Conflict with pwm. */
> > +		};
> > +
> > +		led-blue {
> > +			label = "blue";
> > +			gpios = <&pioa PIN_PA21 GPIO_ACTIVE_HIGH>;
> > +			linux,default-trigger = "heartbeat";
> > +		};
> > +	};
> 
> The label property is deprecated.  Please use the properties "color"
> and "function" for new boards.  See devicetree binding documentation
> for LEDs.

From a quick glance, this seems to be an RGB-LED, so I would suggest
to not model it as three distinct LEDs, but make use of the
"leds-group-multicolor" feature, example:

 59         multi-led {
 60                 compatible = "leds-group-multicolor";
 61                 color = <LED_COLOR_ID_RGB>;
 62                 function = LED_FUNCTION_INDICATOR;
 63                 leds = <&led_red>, <&led_green>, <&led_blue>;
 64         };

Greets
Alex

> 
> Thanks and greetings
> Alex
> 
> > +
> >  	memory@60000000 {
> >  		device_type = "memory";
> >  		reg = <0x60000000 0x40000000>;
> > @@ -352,6 +389,18 @@ pinctrl_i2c10_default: i2c10-default {
> >  		bias-pull-up;
> >  	};
> >  
> > +	pinctrl_key_gpio_default: key-gpio-default {
> > +		pinmux = <PIN_PC10__GPIO>;
> > +		bias-pull-up;
> > +	};
> > +
> > +	pinctrl_led_gpio_default: led-gpio-default {
> > +		pinmux = <PIN_PB15__GPIO>,
> > +			 <PIN_PB17__GPIO>,
> > +			 <PIN_PA21__GPIO>;
> > +		bias-pull-up;
> > +	};
> > +
> >  	pinctrl_sdmmc1_default: sdmmc1-default {
> >  		cmd-data {
> >  			pinmux = <PIN_PB22__SDMMC1_CMD>,
> > -- 
> > 2.43.0
> > 
> > 
> 


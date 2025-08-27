Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52F41C8303F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 07:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qMxDqcO10CQjtqMyM0nhgxsy6XVaXNzX5ZNKBhwX5EE=; b=I7VV71ULKgRivK2siWdJFnE5dG
	BNDXDGrAMzKpnc9vCwTXeylQztQnhbbolPCLVkuRlUxAPT8n+oWXVBXQUGI8haqN64pOpTo0Qxz3d
	nSVQjV88yzDmnxKBMWRWrURSmRkKcGnwK5XNrBDlMQF0L8mNL5Xawy5/DElEyoJlk6AD20XvpR96P
	Ok3Uwp/TLixWrh7XOZCioQHtlIWuCL+FmvNFOGwAUnS7KKSTJWoAsrDJENJEa+nPkbJhbQS9kAam2
	/H40ocwaiofBny1zz/LSkdlKn5AV3MdZx9ABdgSb60Ed3TvZHnBdSkRWOQQlbOgKcfX3Hu0VuWNq9
	GY70VaXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urAq3-0000000ETeV-3Lz2;
	Wed, 27 Aug 2025 07:44:59 +0000
Received: from mail.thorsis.com ([2003:a:e28:26e4::10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urAli-0000000ESqj-3Zhh;
	Wed, 27 Aug 2025 07:40:32 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 72CED1486D83;
	Wed, 27 Aug 2025 09:40:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1756280425; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=qMxDqcO10CQjtqMyM0nhgxsy6XVaXNzX5ZNKBhwX5EE=;
	b=MIoeDUY0bHvT9/EGh+S8MX5ao+f4UgDTS15BKzwXl/CJi0KT0eUVTF55jYcJ4Bh2ONggfM
	ODcAIKfvYC/BlwBwywHeb4OKOKNcnzAziBkWJBu+nSBq4LA3Ba3XPv6itIupAmbc2ndOEI
	bL9eANLD5NJ5LHOHhDQ8cXbcutGI3hjmbX/fUaVgZjifWE9qo7D5LqmOjHxzsO0DguPnYy
	Ga83w5aiTOqVYF9qW4sc72gWPX4tj99WBPuttYp7iZoGofkPzMvH2sUM+wHZQp5YhWUhgo
	5N30Jf/kA0RrOUguoUW08kydVEG+Sv8HctxboELf+WFzJEqIQoNCGaY/b5ovNQ==
Date: Wed, 27 Aug 2025 09:40:17 +0200
From: Alexander Dahl <ada@thorsis.com>
To: Julien Massot <julien.massot@collabora.com>
Cc: kernel@collabora.com, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 3/3] arm64: dts: mediatek: mt8395-nio-12l: add support
 for blue and red LEDs
Message-ID: <20250827-psychic-exclusive-be9758124693@thorsis.com>
Mail-Followup-To: Julien Massot <julien.massot@collabora.com>,
	kernel@collabora.com, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
References: <20250826-radxa-nio-12-l-gpio-v2-0-7f18fa3fbfc8@collabora.com>
 <20250826-radxa-nio-12-l-gpio-v2-3-7f18fa3fbfc8@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250826-radxa-nio-12-l-gpio-v2-3-7f18fa3fbfc8@collabora.com>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_004031_349072_84490934 
X-CRM114-Status: GOOD (  16.32  )
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

Hello Julien,

Am Tue, Aug 26, 2025 at 04:01:54PM +0200 schrieb Julien Massot:
> The Radxa NIO 12L board has an RGB LED, of which only red and blue
> are controllable.
> 
> Red and blue LEDs: no need to choose, both are enabled.
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Julien Massot <julien.massot@collabora.com>
> ---
>  .../boot/dts/mediatek/mt8395-radxa-nio-12l.dts     | 31 ++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts b/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
> index fd596e2298285361ad7c2fb828feec598d75a73e..12288ad4d2932b7f78c96c0efe366a046721f919 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
> @@ -10,6 +10,7 @@
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/input/input.h>
>  #include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/leds/common.h>
>  #include <dt-bindings/pinctrl/mt8195-pinfunc.h>
>  #include <dt-bindings/regulator/mediatek,mt6360-regulator.h>
>  #include <dt-bindings/spmi/spmi.h>
> @@ -73,6 +74,28 @@ button-volume-up {
>  		};
>  	};
>  
> +	gpio-leds {
> +		compatible = "gpio-leds";
> +		pinctrl-0 = <&gpio_leds_pins>;
> +		pinctrl-names = "default";
> +
> +		/*
> +		 * This board has a RGB LED, of which only R and B
> +		 * are controllable.
> +		 */
> +		led-0 {
> +			label = "rgb-blue";
> +			color = <LED_COLOR_ID_BLUE>;
> +			gpios = <&pio 6 GPIO_ACTIVE_HIGH>;
> +		};
> +
> +		led-1 {
> +			label = "rgb-red";
> +			color = <LED_COLOR_ID_RED>;
> +			gpios = <&pio 7 GPIO_ACTIVE_HIGH>;
> +		};

The label property is deprecated, and if I'm not mistaken not
recommended for new boards.  Do you have a reason to set it?
If so, it might be worth adding in the commit message.

Greets
Alex

> +	};
> +
>  	wifi_vreg: regulator-wifi-3v3-en {
>  		compatible = "regulator-fixed";
>  		regulator-name = "wifi_3v3_en";
> @@ -647,6 +670,14 @@ pins {
>  		};
>  	};
>  
> +	gpio_leds_pins: gpio-leds-pins {
> +		pins {
> +			pinmux = <PINMUX_GPIO6__FUNC_GPIO6>,
> +				 <PINMUX_GPIO7__FUNC_GPIO7>;
> +			output-low;
> +		};
> +	};
> +
>  	i2c2_pins: i2c2-pins {
>  		pins-bus {
>  			pinmux = <PINMUX_GPIO12__FUNC_SDA2>,
> 
> -- 
> 2.50.1
> 
> 


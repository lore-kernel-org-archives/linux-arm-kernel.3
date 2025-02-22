Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF6BCC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Feb 2025 19:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PK6nhumwEa8qfufAAd/8nTxtim8pVFn24vKEFq4IzAo=; b=P8FZObfsgMPxxn8RyThJJ8/kVF
	8bw2z1K4ToUxRd7KZIjt+Vr8vu9i7lxnMSYQ+IzUMoqsTZ+o/6KxStgA6jkixPoJRu6eSBJ3ytPcI
	wuvYgStPPJIlfNDV4537rsy1P3aAeWw3V9B6sgWEWBR1zOm7ZBJGJ72KkmooR/SU2TpHNoKsOp2QX
	rO7YWc+P+2bcf2vujGMI5zLMVT6uy9tFkRCgTH4G5ZBuvzPfTQcBR/6r+2qDeEvuxc+npju94kt8E
	9nvE16ePlp0Kr/lZE0zopntxaizv0JIdD46cMlq5QTRcXb3seRzBZKzm+STj9IWT3Zw6jFkC/Jsoc
	nWXSHBvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlurw-00000008ZoG-0Sr0;
	Sat, 22 Feb 2025 19:08:56 +0000
Received: from out.bound.email ([141.193.244.10])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tluqS-00000008Zd4-05Tf;
	Sat, 22 Feb 2025 19:07:25 +0000
Received: from mail.sventech.com (localhost [127.0.0.1])
	by out.bound.email (Postfix) with ESMTP id DBE678A312A;
	Sat, 22 Feb 2025 11:02:20 -0800 (PST)
Received: by mail.sventech.com (Postfix, from userid 1000)
	id C37D0160036F; Sat, 22 Feb 2025 11:02:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=erdfelt.com;
	s=default; t=1740250940;
	bh=PK6nhumwEa8qfufAAd/8nTxtim8pVFn24vKEFq4IzAo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ulhrDdKQC0RybuRsiOb0oCZysoTjgaZtZmCEg22IbJIaddd/elxKnfPCO2lf0RXMz
	 gCLvaWPsw+t0rL8wz8m4/HHaVKL7+CDQgWLG4qTwU2pksPQ8360zAsy0k35e4XyHTz
	 fRffFa94RJ47MIVRttCHyn9RkXhZqSDuZ21Ixqps=
Date: Sat, 22 Feb 2025 11:02:20 -0800
From: Johannes Erdfelt <johannes@erdfelt.com>
To: Jimmy Hon <honyuenkwun@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v6 3/5] arm64: dts: rockchip: Add Orange Pi 5 Ultra board
Message-ID: <20250222190220.GX16911@sventech.com>
References: <20250222172752.6254-1-honyuenkwun@gmail.com>
 <20250222172752.6254-4-honyuenkwun@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250222172752.6254-4-honyuenkwun@gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250222_110724_179619_78356D32 
X-CRM114-Status: GOOD (  11.26  )
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

On Sat, Feb 22, 2025, Jimmy Hon <honyuenkwun@gmail.com> wrote:
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-ultra.dts b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-ultra.dts
> new file mode 100644
> index 000000000000..fa975c5db0ae
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-ultra.dts
> @@ -0,0 +1,33 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/pinctrl/rockchip.h>
> +#include "rk3588-orangepi-5-compact.dtsi"
> +
> +/ {
> +	model = "Xunlong Orange Pi 5 Ultra";
> +	compatible = "xunlong,orangepi-5-ultra", "rockchip,rk3588";
> +};
> +
> +&led_blue_pwm {
> +	pwms = <&pwm4 0 25000 PWM_POLARITY_INVERTED>;
> +};
> +
> +&led_green_pwm {
> +	pwms = <&pwm5 0 25000 PWM_POLARITY_INVERTED>;
> +};
> +
> +&pinctrl {
> +
> +	usb {
> +		usb_otg_pwren: usb-otg-pwren {
> +			rockchip,pins = <4 RK_PB1 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +	};
> +};
> +
> +&vcc5v0_usb30_otg {
> +	gpios = <&gpio4 RK_PB1 GPIO_ACTIVE_HIGH>;
> +};

Error: arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-ultra.dts:58.24-25
syntax error
FATAL ERROR: Unable to parse input tree

I think you may need to include <dt-bindings/pwm/pwm.h>

JE



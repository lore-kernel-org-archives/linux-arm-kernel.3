Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84CE5C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 07:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g3H13LtSgQj1P8RdnugkkMSydyZVAi3d+H2HGvnEnuk=; b=jVK+7vUkT1LMH/g27uDS+luh4s
	VtGEtV6ZMzGbTN9lscDStDrVF+Fyijqc1BY6BC7d/UJldUqlIwhkm2sIrC7CKJ2FlEprwphImC5zW
	D/RBSCMSZAQgK4IDN7SD6cPDGBFKHQodDJPxplcT3SYzfFmx2OKPO/el1bNX0h5floU8/m3NGFh8a
	MmqqAtGUX5mx0RO11jCkFvUEvLCvWtPr9U/EuAFwWgfrft2Ln4StULQc65fkfrTId9fAX90NEGGXE
	JFBJ2/vGeS6jcRwQ8YPWdOOaP4hfT5122gspVpxErfI6VZBzftARmF9fNMrg1XSbg1b2YwfB9X/uR
	AaakWHeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWs7q-00000007WdK-1WT6;
	Wed, 02 Jul 2025 07:43:26 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWs5V-00000007WKn-23EO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 07:41:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=g3H13LtSgQj1P8RdnugkkMSydyZVAi3d+H2HGvnEnuk=; b=Kcys7Ugp8rQKNiCWyTG7s6sUVv
	QlBDGrO0b/gCjZt2iBE4wlc6AKF/POB7eBKUT2vgJ+DdhOKyXYqOvD5PR3go1d0Jfv80adtrfx9Ye
	kYIBvINgOa/LvHawepNQhG6C2RxWjlMzJ/cmZ00gEXD2rgOWJkqnhXzvtURYNreVhX5w=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uWs5A-00HYLu-BX; Wed, 02 Jul 2025 09:40:40 +0200
Date: Wed, 2 Jul 2025 09:40:40 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: rentao.bupt@gmail.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	Tao Ren <taoren@meta.com>
Subject: Re: [PATCH 5/5] ARM: dts: aspeed: Add Facebook Darwin (AST2600) BMC
Message-ID: <a6f6966b-50ee-4b4f-9422-96c6ac9391a2@lunn.ch>
References: <20250702050421.13729-1-rentao.bupt@gmail.com>
 <20250702050421.13729-6-rentao.bupt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250702050421.13729-6-rentao.bupt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_004101_529498_7AAB6E85 
X-CRM114-Status: GOOD (  19.84  )
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

On Tue, Jul 01, 2025 at 10:04:16PM -0700, rentao.bupt@gmail.com wrote:
> From: Tao Ren <rentao.bupt@gmail.com>
> 
> Add initial device tree for the Meta (Facebook) Darwin AST2600 BMC.
> 
> Darwin is Meta's rack switch platform with an AST2600 BMC integrated for
> health monitoring purpose.
> 
> Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
> ---
>  arch/arm/boot/dts/aspeed/Makefile             |  1 +
>  .../dts/aspeed/aspeed-bmc-facebook-darwin.dts | 92 +++++++++++++++++++
>  2 files changed, 93 insertions(+)
>  create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-darwin.dts
> 
> diff --git a/arch/arm/boot/dts/aspeed/Makefile b/arch/arm/boot/dts/aspeed/Makefile
> index 2e5f4833a073..debbfc0151f8 100644
> --- a/arch/arm/boot/dts/aspeed/Makefile
> +++ b/arch/arm/boot/dts/aspeed/Makefile
> @@ -20,6 +20,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
>  	aspeed-bmc-facebook-bletchley.dtb \
>  	aspeed-bmc-facebook-catalina.dtb \
>  	aspeed-bmc-facebook-cmm.dtb \
> +	aspeed-bmc-facebook-darwin.dtb \
>  	aspeed-bmc-facebook-elbert.dtb \
>  	aspeed-bmc-facebook-fuji.dtb \
>  	aspeed-bmc-facebook-galaxy100.dtb \
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-darwin.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-darwin.dts
> new file mode 100644
> index 000000000000..f902230dada3
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-darwin.dts
> @@ -0,0 +1,92 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +// Copyright (c) 2021 Facebook Inc.
> +
> +/dts-v1/;
> +
> +#include "ast2600-facebook-netbmc-common.dtsi"
> +
> +/ {
> +	model = "Facebook Darwin BMC";
> +	compatible = "facebook,darwin-bmc", "aspeed,ast2600";
> +
> +	aliases {
> +		serial0 = &uart5;
> +		serial1 = &uart1;
> +		serial2 = &uart2;
> +		serial3 = &uart3;
> +	};
> +
> +	chosen {
> +		stdout-path = &uart5;
> +	};
> +
> +	iio-hwmon {
> +		compatible = "iio-hwmon";
> +		io-channels = <&adc0 0>, <&adc0 1>, <&adc0 2>, <&adc0 3>,
> +			      <&adc0 4>, <&adc0 5>, <&adc0 6>, <&adc0 7>,
> +			      <&adc1 0>, <&adc1 1>, <&adc1 2>, <&adc1 3>,
> +			      <&adc1 4>, <&adc1 5>, <&adc1 6>, <&adc1 7>;
> +	};
> +
> +	spi_gpio: spi {
> +		num-chipselects = <1>;
> +		cs-gpios = <&gpio0 ASPEED_GPIO(X, 0) GPIO_ACTIVE_LOW>;
> +	};
> +};
> +
> +/*
> + * BMC's "mac3" controller is connected to BCM53134P's IMP_RGMII port
> + * directly (fixed link, no PHY in between).
> + * Note: BMC's "mdio0" controller is connected to BCM53134P's MDIO
> + * interface, and the MDIO channel will be enabled in dts later (when
> + * "bcm53xx" driver's probe failure is solved on the platform).
> + */
> +&mac3 {
> +	status = "okay";
> +	phy-mode = "rgmii";

How do RGMII delays work? Connections to switches have to be handled
different to PHYs, to avoid double delays. But is there extra long
clock lines? Or are you expecting the switch to add the delays?

      Andrew


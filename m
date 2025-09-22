Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3F66CA100F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 20:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GbfWI5VgTCv69gvfXGCnl3FrrsHZpD1DeQLmU9ztvhE=; b=YGBOK1RlDmi8D9fOq1nTuZJgkM
	iIc5r6aVFel5HZO+wowUrPVZagpqnR/CD+KSrLnAViC0DKgcCh5K4AIsqE0eWg1uZV3Iq0o1MqwzN
	Ztuz57Heba6uf77NzPDW7laH2w6YXmgvAWfqUZkjBXKUHvyPvGrjQhZWCSXMb7lWp2qJ2CJ2oZjy3
	0iUKbxr6O7LWVNJt+LpTqSbxkvhW/U2Q0ej9t19DnvflmtZCRfdeCjIdIrSB99dWGrVPvbzkmqAgK
	/qUtP3YcZrXM6BiVqzILQ/dOSKedVj0tzJjm7qKsilTrOGL4EG2NsM7w4V/v5Du1UW6qrybQ1DelJ
	HBTouENQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0mp3-0000000BPlU-3Rcf;
	Mon, 22 Sep 2025 20:07:41 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0mp3-0000000BPkz-00KC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 20:07:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3EF876023D;
	Mon, 22 Sep 2025 20:07:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3E0DC4CEF0;
	Mon, 22 Sep 2025 20:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758571660;
	bh=gtKQtJ/YDcC6QiYeZV6qf7suqJhBgfA3Ye1KfJV9y9M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=monluQecJyK0YMI7Arhl/QJKcH/Sl5qAvE49lBKMiiNRTEcsRbHVSI6tfR2nrB5Mp
	 M1mtmvsGAb+4wriRQ7y4QP9+xxnGAXxgCAwjdB3KByeTtGLjBvCaBYeo6qvBerWL1C
	 x3+c9h+fVcrml7zamn/EPGmGbkIvK4Ogh4ltSLrdrU3nGY1BTRYUWYudIQHCvfUOPG
	 aMZWTIVIVnHT6xyxSyD/sIP+/dt4Rdft4QGCafqd+GBQZ07JdadR18cBcnJy17p6z1
	 LwW7IBHzoQgYqrMiyXWY7iLnSE8wa65PEqu/3t9TN+ovogrg1umBsLCJHHrR+FS6ok
	 lU82jti4gwd8Q==
Date: Mon, 22 Sep 2025 15:07:38 -0500
From: Rob Herring <robh@kernel.org>
To: Tan Siewert <tan@siewert.io>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] ARM: dts: aspeed: add asrock x470d4u bmc
Message-ID: <20250922200738.GA1124791-robh@kernel.org>
References: <20250919185621.6647-1-tan@siewert.io>
 <20250919185621.6647-3-tan@siewert.io>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250919185621.6647-3-tan@siewert.io>
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

On Fri, Sep 19, 2025 at 08:56:18PM +0200, Tan Siewert wrote:
> The ASRock Rack X470D4U X470D4U is a single-socket X470-based microATX
> motherboard for Ryzen processors with an AST2500 BMC and either 32MB or
> 64MB SPI flash.
> 
> This mainboard exists in three known "flavors" which only differ in the
> used host NIC, the BMC SPI size and some parts that may be un-populated.
> 
> To keep the complexity low with the BMC SPI, use the 32MB layout
> regardless of the used SPI or mainboard flavor.
> 
> Signed-off-by: Tan Siewert <tan@siewert.io>
> ---
>  arch/arm/boot/dts/aspeed/Makefile             |   1 +
>  .../dts/aspeed/aspeed-bmc-asrock-x470d4u.dts  | 345 ++++++++++++++++++
>  2 files changed, 346 insertions(+)
>  create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x470d4u.dts
> 
> diff --git a/arch/arm/boot/dts/aspeed/Makefile b/arch/arm/boot/dts/aspeed/Makefile
> index aba7451ab749..fae97b5183e5 100644
> --- a/arch/arm/boot/dts/aspeed/Makefile
> +++ b/arch/arm/boot/dts/aspeed/Makefile
> @@ -13,6 +13,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
>  	aspeed-bmc-asrock-e3c256d4i.dtb \
>  	aspeed-bmc-asrock-romed8hm3.dtb \
>  	aspeed-bmc-asrock-spc621d8hm3.dtb \
> +	aspeed-bmc-asrock-x470d4u.dtb \
>  	aspeed-bmc-asrock-x570d4u.dtb \
>  	aspeed-bmc-asus-x4tf.dtb \
>  	aspeed-bmc-bytedance-g220a.dtb \
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x470d4u.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x470d4u.dts
> new file mode 100644
> index 000000000000..bae2b521f708
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x470d4u.dts
> @@ -0,0 +1,345 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/dts-v1/;
> +
> +#include "aspeed-g5.dtsi"
> +#include <dt-bindings/gpio/aspeed-gpio.h>
> +#include <dt-bindings/leds/common.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
> +
> +/ {
> +	model = "Asrock Rack X470D4U-series BMC";
> +	compatible = "asrock,x470d4u-bmc", "aspeed,ast2500";
> +
> +	aliases {
> +		serial4 = &uart5;
> +	};
> +
> +	chosen {
> +		stdout-path = &uart5;
> +	};
> +
> +	iio-hwmon {
> +		compatible = "iio-hwmon";
> +		io-channels = <&adc 0>, <&adc 1>, <&adc 2>, <&adc 3>, <&adc 4>,
> +			<&adc 5>, <&adc 6>, <&adc 7>, <&adc 8>, <&adc 9>,
> +			<&adc 10>, <&adc 11>, <&adc 12>;
> +	};
> +
> +	leds {
> +		compatible = "gpio-leds";
> +
> +		heartbeat {

led-0

This should have given you a warning. You did run "make dtbs_check" 
check the warnings, right?

Use "function" to define the function.

> +			/* led-heartbeat-n */
> +			gpios = <&gpio ASPEED_GPIO(H, 6) GPIO_ACTIVE_LOW>;
> +			linux,default-trigger = "timer";
> +		};
> +
> +		systemfault {

led-1

> +			/* led-fault-n */
> +			gpios = <&gpio ASPEED_GPIO(Z, 2) GPIO_ACTIVE_LOW>;
> +			panic-indicator;
> +		};
> +
> +		identify {

led-2

> +			/* led-identify-n */
> +			gpios = <&gpio ASPEED_GPIO(D, 6) GPIO_ACTIVE_LOW>;
> +		};
> +	};
> +


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B21E9C43602
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 06:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oECIqmbpPuUnxJXuxcvDW0bVvqzjgpMBsSKXYPT0Sb4=; b=ToSwjW+zaQRtz4m1/eLfiLIDqT
	snEvrJ4SvJKd6jLwzjuhvBotQH41tDpsUbRia4rA30IF99hDSrMS1q94g/1/JUHP2dNST6WuCB3C+
	cwJ1yfPk8rUM2hguO+sbzgTF2KnupUs1343eD9N5/PhT6yZlsGfNbXdYqwqe2cvDpxVqK3Zg59a35
	k+TmDsXTuY5p/2sQRsIVHZXWnJNDqe2R9O7gFaq/17Cy/SyPA6nh+r1HlOCyrkYrfUu81i1y7lvaj
	syheb1N88ODboyyBH6EEDGWozjx9VhBErqG11bUze0q+pcWJBw3aW6C3kn63AOaCZ7C79ku7ak1Su
	7luRJ7FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgzlf-0000000EHFu-2xR1;
	Tue, 07 Jul 2026 06:58:55 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgzle-0000000EHFP-0MXy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 06:58:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 87692601DE;
	Tue,  7 Jul 2026 06:58:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D8021F000E9;
	Tue,  7 Jul 2026 06:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783407533;
	bh=oECIqmbpPuUnxJXuxcvDW0bVvqzjgpMBsSKXYPT0Sb4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VX2MP6MItrVnTTtaRG7rzMhBWmfb0oUEM1Hv35dAe27iXY0QdLGeB5kzbK4Ixb6JY
	 /iQnv154TY6FOc9LMMeCakmx3OJ7g+BsAt+/u0vAaOwBJOMnFtz6YohUzGRFVVM92I
	 ILStdV89OycXyQu4hxEy86RhGKT4eLJdEfZpxqwtU/ba1nh6ZDZpeE4Dssb+/gdJuH
	 2sHqhlR7oLuoK1s7rRtrians/q7H8mdW4JrUKDJTDFQtShIm0k9LgZHO2ihud3cazw
	 9+VB2F3L06zkkFJLSt/NrQ0JsegSNzYe6kDfqhxK+FI05PXI0ONKkvKXE00Cz7fIOS
	 Co6LRIxrO/axw==
Date: Tue, 7 Jul 2026 08:58:49 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Swark Yang <syang@axiado.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Harshit Shah <hshah@axiado.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: axiado: Add initial support for
 AX3005 SoC and eval board
Message-ID: <20260707-quixotic-cobalt-guillemot-6b1aee@quoll>
References: <20260705-upstream-axiado-ax3005-upstream-v2-0-2dfbd1448f81@axiado.com>
 <20260705-upstream-axiado-ax3005-upstream-v2-2-2dfbd1448f81@axiado.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260705-upstream-axiado-ax3005-upstream-v2-2-2dfbd1448f81@axiado.com>
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

On Sun, Jul 05, 2026 at 11:39:06PM -0700, Swark Yang wrote:
> +		cpu3: cpu@3 {
> +			compatible = "arm,cortex-a53";
> +			device_type = "cpu";
> +			reg = <0x0 0x3>;
> +			enable-method = "spin-table";
> +			cpu-release-addr = <0x0 0x80002fa0>;
> +			d-cache-size = <0x8000>;
> +			d-cache-line-size = <64>;
> +			d-cache-sets = <128>;
> +			i-cache-size = <0x8000>;
> +			i-cache-line-size = <64>;
> +			i-cache-sets = <256>;
> +			next-level-cache = <&l2>;
> +		};
> +
> +		l2: l2-cache0 {

l2-cache

> +			compatible = "cache";
> +			cache-unified;
> +			cache-size = <0x100000>;
> +			cache-line-size = <64>;
> +			cache-sets = <1024>;
> +			cache-level = <2>;
> +		};
> +	};
> +
> +	timer {

Odd node sorting.

> +		compatible = "arm,armv8-timer";
> +		interrupt-parent = <&gic500>;
> +		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
> +			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
> +			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
> +			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
> +	};
> +

...

> +			compatible = "axiado,ax3000-gpio", "cdns,gpio-r1p02";
> +			reg = <0x0 0x33080000 0x0 0x100>;
> +			clocks = <&pclk>;
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			interrupt-parent = <&gic500>;
> +			interrupts = <GIC_SPI 184 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +			status = "disabled";
> +		};
> +
> +		gpio2: gpio-controller@33100000 {
> +			compatible = "axiado,ax3000-gpio", "cdns,gpio-r1p02";
> +			reg = <0x0 0x33100000 0x0 0x100>;
> +			clocks = <&pclk>;
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			interrupt-parent = <&gic500>;
> +			interrupts = <GIC_SPI 185 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +			status = "disabled";
> +		};
> +
> +		gpio3: gpio-controller@33180000 {
> +			compatible = "axiado,ax3000-gpio", "cdns,gpio-r1p02";
> +			reg = <0x0 0x33180000 0x0 0x100>;
> +			clocks = <&pclk>;
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			interrupt-parent = <&gic500>;
> +			interrupts = <GIC_SPI 186 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +			status = "disabled";
> +		};
> +
> +		gpio4: gpio-controller@33200000 {
> +			compatible = "axiado,ax3000-gpio", "cdns,gpio-r1p02";

Here...

> +		spi6: spi@333a0000 {
> +			compatible = "snps,dwc-ssi-1.01a";
> +			reg = <0x0 0x333a0000 0x0 0x10000>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			interrupt-parent = <&gic500>;
> +			interrupts = <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&spiclk>;
> +			num-cs = <1>;
> +			reg-io-width = <4>;
> +			status = "disabled";
> +		};
> +
> +		uart0: serial@33020000 {
> +			compatible = "axiado,ax3000-uart", "cdns,uart-r1p12";

and here: wrong compatible, this is ax3005 SoC, no?

Best regards,
Krzysztof


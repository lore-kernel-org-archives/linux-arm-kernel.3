Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86493E92FCB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Dec 2025 18:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ICh1WIs14/72JBYekVxgqDTz4f7l5ZEA7Hy4pPqFp3w=; b=aUNsAag1VGyozFSZAQEf2N4JGh
	D6L0dmH6DMstKTYMtms0Ish3Pf+LNZ5U/QZt86w0ERYmyUfLcMLT3D2UmuTAAlwu/lqF8kQay528J
	SWsX+Dv8JJfuAiPxIF1rkK/Fg8FUyGDQn/tOxWXdvZFGNQHJNeYQ08hqQhJZsBy6QC3CRHIloADi2
	t7huDgz75zwzxrJtNxSBc4X1VLp6iebrSKvu5vTVYBNAsIl6ZpNZ4+BCas1jPGiF5kB3GU0MXQArw
	5jCyM3kw5QpAzvEyutmeQfELMpQqeqxqeHbPOrDjP+9dqSrESWwUVOqce3lzZlsN2JD0P0CZQ+yi1
	2mMd9vdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaHri-00000003weE-1RmE;
	Mon, 29 Dec 2025 18:21:10 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaHrc-00000003wdf-2Zj8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Dec 2025 18:21:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=ICh1WIs14/72JBYekVxgqDTz4f7l5ZEA7Hy4pPqFp3w=; b=pJ4qwmDBpJ94/ihnp+k4AIsvSD
	e/f3b0J59vsh4Gz7ArprL3pwsk+sxNdnEBakuuG7zzbo7bpm4/iJNok4bHzGjYDGvRldRIamZgXjL
	WZoEteTcB786+dG6gG4oVJNGIAKRiP93RCWF8sE6BWFgYlw+e1QcDd2RRud3TnSgZduc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vaHr9-000ofX-UP; Mon, 29 Dec 2025 19:20:35 +0100
Date: Mon, 29 Dec 2025 19:20:35 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Primoz Fiser <primoz.fiser@norik.com>,
	Yannic Moog <y.moog@phytec.de>,
	Markus Niebel <Markus.Niebel@tq-group.com>,
	Josua Mayer <josua@solid-run.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1 2/3] arm64: dts: freescale: Add support for Variscite
 DART-MX95
Message-ID: <b8349d9c-7a18-43bb-baaa-7e2ec62218b2@lunn.ch>
References: <20251229150421.57616-1-stefano.r@variscite.com>
 <20251229150421.57616-3-stefano.r@variscite.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251229150421.57616-3-stefano.r@variscite.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251229_102104_677194_9C12F819 
X-CRM114-Status: UNSURE (   8.99  )
X-CRM114-Notice: Please train this message.
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

> +&enetc_port0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_enetc0>;
> +	phy-handle = <&ethphy0>;
> +	/*
> +	 * The required RGMII TX and RX 2ns delays are implemented directly
> +	 * in hardware via passive delay elements on the SOM PCB.
> +	 * No delay configuration is needed in software via PHY driver.
> +	 */
> +	phy-mode = "rgmii";
> +	status = "okay";
> +};

> +&netc_emdio {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_emdio>, <&pinctrl_phy0res>;
> +	status = "okay";
> +
> +	ethphy0: ethernet-phy@0 {
> +		reg = <0>;
> +		compatible = "ethernet-phy-ieee802.3-c22";
> +		reset-gpios = <&gpio5 16 GPIO_ACTIVE_LOW>;
> +		reset-assert-us = <10000>;
> +		reset-deassert-us = <100000>;
> +
> +		leds {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			led@0 {
> +				reg = <0>;
> +				color = <LED_COLOR_ID_YELLOW>;
> +				function = LED_FUNCTION_LAN;
> +				linux,default-trigger = "netdev";
> +			};
> +
> +			led@1 {
> +				reg = <1>;
> +				color = <LED_COLOR_ID_GREEN>;
> +				function = LED_FUNCTION_LAN;
> +				linux,default-trigger = "netdev";
> +			};
> +		};
> +	};
> +};

For these two nodes only:

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew


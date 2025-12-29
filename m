Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7955E92FD0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Dec 2025 18:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G6OFf6qhaZUZaSxhy68zC+vqqr64ZivU7vCX7ZbM4a4=; b=e22UG6rg9NNIl//VKxUz1LWt8p
	q5UAKnINn7h9PHthKUq5mshfVBn15P9DWpxz4ienWX26WTWiSoQHKmj0xGRkNk0snBELI3AEJnqC3
	DkrTUhf2LXh3oTWSPhdo6Ji1gq6SxORi87JOsllu5KmiwuRTTJm5+Nugv8X/sD245unmRJ1AucWwB
	iEEKdHDu5cTPCPxAKdcJ/5c8DokHtNGtEvxYkODFAmA1AFIoo71ECdlzNFPfJff/ePFQvr0vvsv0X
	7tHCd15dcdSuE9e+ipjDYFFy+lVCKvCuZdvvy3Eeh+70z0lMF1HCaaGJ7NmcY91T6H9vOg/FL+EpW
	6oMt0f5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaHvW-00000003wp5-09NF;
	Mon, 29 Dec 2025 18:25:06 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaHvU-00000003woi-0GE8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Dec 2025 18:25:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=G6OFf6qhaZUZaSxhy68zC+vqqr64ZivU7vCX7ZbM4a4=; b=dScYmoVu2rUO1D2Qr8lmxofk3c
	IVcMp2uBfLTgDyuzVrpND5X5YQkuLdzzf8Trxdfi+73qhcrv0pA1LojXYskM2Yh2LoTHlcPiLa4KQ
	aQRn2YdcnsuobBwpMq5vOSvKlMmgxdKe9jgkuOum2SAycVTZBjeQBcMYTEEQJqJrj1rI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vaHvG-000ogh-NL; Mon, 29 Dec 2025 19:24:50 +0100
Date: Mon, 29 Dec 2025 19:24:50 +0100
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
Subject: Re: [PATCH v1 3/3] arm64: dts: imx95-var-dart: Add support for
 Variscite Sonata board
Message-ID: <0afc0945-af65-410d-8556-1d09792981cb@lunn.ch>
References: <20251229150421.57616-1-stefano.r@variscite.com>
 <20251229150421.57616-4-stefano.r@variscite.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251229150421.57616-4-stefano.r@variscite.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251229_102504_123912_801DCD9B 
X-CRM114-Status: GOOD (  10.94  )
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

> +&enetc_port1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_enetc1>;
> +	phy-handle = <&ethphy1>;
> +	/*
> +	 * The required RGMII TX and RX 2ns delays are implemented directly
> +	 * in hardware via passive delay elements on the SOM PCB.
> +	 * No delay configuration is needed in software via PHY driver.
> +	 */
> +	phy-mode = "rgmii";
> +	status = "okay";
> +};

This node is O.K, thanks for the comment.

> +
> +&enetc_port2 {
> +	phy-mode = "10gbase-r";
> +	status = "okay";
> +
> +	fixed-link {
> +		speed = <10000>;
> +		full-duplex;
> +		link-gpios = <&pca9534 1 GPIO_ACTIVE_LOW>;
> +	};
> +};

What is this ethernet connected to? In the commit message you mention
an SFP? So i would expect a phandle pointing to the SFP cage node,
which follows:

Documentation/devicetree/bindings/net/sff,sfp.yam

	Andrew


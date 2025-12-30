Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A88DE95A6D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Dec 2025 10:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RvrIXXtJkwQLpKLNYX+FQY6pO76+th3R8O23dDJCL7Y=; b=vaus0mK8BI+HlEHRdU9+QkV6aX
	JlWjykVs0SyZpiIGa+uy3tF/K+6Es/JLSXF7CR58sF4Za15RB+dRpXbgHlCW/Vt+8S7I596tRCLsp
	OeCIWJ8We98d9UjqQhRgP1lh1n2Mj5IDvm9z6NAsbnPuawuM9mr03rLAuZQSpaxz3dBljOd4AKNlG
	sJEJ5iBLEk/oI9TDe19RXpkrT3nFnX3irVxowwMm863KvS+P2/jYwA7DICMg01MloB7LVcYPoYBkh
	9wI9AwXfJF7FGSyZtP7dc9m4+c4//QZaVW8Q6fCs7mj+NojklM5/9ie/Rwxum73W+q/foRP+6myLH
	m84nVTyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaXMH-00000004jVd-3y3c;
	Tue, 30 Dec 2025 10:53:48 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaXM4-00000004jUz-0PpN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Dec 2025 10:53:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=RvrIXXtJkwQLpKLNYX+FQY6pO76+th3R8O23dDJCL7Y=; b=VF9GFn1+aPe5Sxe33P/Kxgmtza
	6sKw4xc5OUnR5WrTwjMLpMwF+Su7o9Yg1chE/E0HgIL9PXbmPwAC5RRjfJUVJjoGh/Q9VgfWTqevN
	MdRvAQ3AgTN/6x8xJZoQj+21QpMm1DS4lbrNtgIXleh17Kf/GndrGNAOFwRSBcPQeCuo=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vaXLp-000rca-IT; Tue, 30 Dec 2025 11:53:17 +0100
Date: Tue, 30 Dec 2025 11:53:17 +0100
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
	Yannic Moog <y.moog@phytec.de>,
	Primoz Fiser <primoz.fiser@norik.com>,
	Markus Niebel <Markus.Niebel@tq-group.com>,
	Josua Mayer <josua@solid-run.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 3/3] arm64: dts: imx95-var-dart: Add support for
 Variscite Sonata board
Message-ID: <138b59d1-e001-4c9b-bf8b-a5af703d747a@lunn.ch>
References: <20251229213726.79374-1-stefano.r@variscite.com>
 <20251229213726.79374-4-stefano.r@variscite.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251229213726.79374-4-stefano.r@variscite.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_025332_139297_B2F6C309 
X-CRM114-Status: UNSURE (   9.92  )
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

> +	sfp0: sfp {
> +		compatible = "sff,sfp";
> +		i2c-bus = <&lpi2c3>;
> +		los-gpios = <&pca9534 1 GPIO_ACTIVE_HIGH>;

Minimalist for GPIOs, but O.K.

> +		maximum-power-milliwatt = <2000>;
> +	};
> +};
> +
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
> +
> +&enetc_port2 {
> +	phy-mode = "10gbase-r";
> +	sfp = <&sfp0>;
> +	status = "okay";
> +
> +	fixed-link {
> +		speed = <10000>;
> +		full-duplex;
> +	};
> +};

The fixed link is not needed. phylink will ask the SFP plugged into
the cage what it is, and then configure the MAC as needed, 10GBase-R,
5GBase-X, 2.5BaseX, 1000BaseX, SGMII etc.

	Andrew


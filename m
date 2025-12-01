Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFC73D116F3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Dec 2025 13:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eAKJcwb4xUIoD3fQ+tNAoCXDMNOYAe8cY5ilwthWLuk=; b=mBtBOyPiCruzuctEs29i1ZQadG
	/CAEJWjAuWikz4ttWcE712ZGUX3rYtKR41xQ/d4nDl83x8FEh7h2UEnR5LcXmPNxB33XeSaZ6lpCe
	7sZLFPf8M6y6sI0SO7T4R9rRdh3gFtD4w/TYeEFHgJixo2XNfOQa0t+6WbtN69e0gFeOwLoeeLumy
	Uy1+kDU/C6T7s571T8hA8XeOTpbjD0OZA2pcd9Lm9KJ7vfJJHa7/+yy3iifCHr/dhTq5dO1iVD4yp
	WXpmHV2GbJ8rrX7unfiYglafOha9vwCQ7WS0JgA2sHk6mPCImIqmZ68yj04xuHzNqQxVP2hyJ/k+W
	SFLOVJ+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ4HI-000000042jj-3V3d;
	Mon, 01 Dec 2025 13:49:20 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ4HG-000000042j4-1y1r
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Dec 2025 13:49:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=eAKJcwb4xUIoD3fQ+tNAoCXDMNOYAe8cY5ilwthWLuk=; b=w4QavFHUpcuRdBcUGocCypwemT
	HzccrGFLUh7EGnR/bpKrwpHWgUzKWBARj+3UzCD5u5OayoCCUpIlcwb8MAUKx5glS4v/vN+Af9UiF
	BwEL9QmR9cCzUff/njpKay/ughXu//SmyuptfFIq1yhAFFCl+rkQ2jRnDzehPC2/HwSo=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vQ4H4-00FZsO-Lv; Mon, 01 Dec 2025 14:49:06 +0100
Date: Mon, 1 Dec 2025 14:49:06 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Josua Mayer <josua@solid-run.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Jon Nettleton <jon@solid-run.com>,
	Mikhail Anikin <mikhail.anikin@solid-run.com>,
	Yazan Shhady <yazan.shhady@solid-run.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 7/8] arm64: dts: add description for solidrun
 solidsense-n8 board
Message-ID: <c06e5a6b-6150-4771-8ff6-b2cda0863a21@lunn.ch>
References: <20251201-imx8mp-hb-iiot-v4-0-53a4cd6c21bf@solid-run.com>
 <20251201-imx8mp-hb-iiot-v4-7-53a4cd6c21bf@solid-run.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251201-imx8mp-hb-iiot-v4-7-53a4cd6c21bf@solid-run.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_054918_512598_4E1D1FDA 
X-CRM114-Status: GOOD (  11.52  )
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

> +&fec1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&fec1_pins>;
> +	phy-mode = "rgmii-id";
> +	phy-handle = <&phy4>;
> +	local-mac-address = [00 00 00 00 00 00];
> +	fsl,magic-packet;

Has WoL been tested, or is this copy/paste from the binding
documentation?

> +	status = "okay";
> +
> +	mdio {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		/*
> +		 * Depending on board revision two different phys are used:
> +		 * - v1.1: atheros phy at address 4
> +		 * - v1.2+: analog devices phy at address 0
> +		 * Configure first version by default.
> +		 * On v1.2 and later, U-Boot will enable the correct phy
> +		 * based on runtime detection and patch dtb accordingly.
> +		 */
> +
> +		/* ADIN1300 */
> +		phy0: ethernet-phy@0 {
> +			reg = <0>;
> +			reset-gpios = <&gpio3 19 GPIO_ACTIVE_LOW>;
> +			reset-assert-us = <10>;
> +			reset-deassert-us = <5000>;
> +			interrupt-parent = <&gpio1>;
> +			interrupts = <10 IRQ_TYPE_LEVEL_LOW>;

The analog devices PHY has interrupts, so can it implement WoL? Has
this been tested?

> +		/* AR8035 */
> +		phy4: ethernet-phy@4 {
> +			reg = <4>;
> +			reset-gpios = <&gpio3 19 GPIO_ACTIVE_LOW>;
> +			reset-assert-us = <10000>;
> +			status = "okay";

The Atheros PHY does not interrupts, so i assume it cannot support
WoL? You only have MAC WoL?

     Andrew


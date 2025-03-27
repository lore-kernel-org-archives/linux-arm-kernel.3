Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0DA5C3600B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Mar 2025 14:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+m0Ulp+iyZSTL8Hc3fHL+e5d9ZfjycSRNPvxPdSsDN4=; b=oO+1o+BE06ZZ8zIT3yduH7pdKi
	m+m9hk/hgrNqUC5OJhjaWEq+TxRrmcG3S2EA/pz4vTquE9kiCKwc774zEfhVOzNEaHOS/l8O/QX2F
	VESOqwK8Fu91/4VChfG9eFpfICArgphVNKywFeyKTmjfmBW9e+u1l3MtoNN2z6CFtVIIj+1el9jgl
	6NHm1dXO1A3ew2sXAPDqIRBKX9pV/gkAoRgLba9Ni1KDTBqYJEhqE4EQQFaybXupZfh6r/g4fb0Fk
	CQqpLc16PcqgeSWggQneZb+2Ao0zp88M8rhCccgw8PRPfZqMvapN9GFi5CrOaclAWyVyaw4s0Kfco
	J+LGQNIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txoCl-0000000BCkh-2ok1;
	Thu, 27 Mar 2025 14:27:35 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txoB2-0000000BCZE-0pQh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Mar 2025 14:25:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=+m0Ulp+iyZSTL8Hc3fHL+e5d9ZfjycSRNPvxPdSsDN4=; b=0EX3l78VIC/2SYqvnQIGHuE3fx
	MzNifBjKPpaF9Ouvha9QKVGjoS82mavtDzOLBbkgnK1VMie/dXk6DyiNIEMaRIpU9IJvM0zIoBRbh
	1XrbWab7NGSjUusNnwBtrshEAuh/xM6FfcytDoLQAVZPL0m/G/nAK2SjCECGxsw1HE90=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1txoAs-007IAg-Gr; Thu, 27 Mar 2025 15:25:38 +0100
Date: Thu, 27 Mar 2025 15:25:38 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Martyn Welch <martyn.welch@collabora.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, kernel@collabora.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] arm64: dts: imx8mp: Add device tree for Nitrogen8M
 Plus ENC Carrier Board
Message-ID: <cf525617-b895-4d58-8455-a5c7fa9bbeab@lunn.ch>
References: <20250327123907.542132-1-martyn.welch@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250327123907.542132-1-martyn.welch@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_072548_233877_C89DEA51 
X-CRM114-Status: UNSURE (   9.79  )
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

> +++ b/arch/arm64/boot/dts/freescale/imx8mp-nitrogen-som.dtsi
> @@ -0,0 +1,415 @@
> +&eqos {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_eqos>;
> +	phy-handle = <&ethphy0>;
> +	phy-mode = "rgmii-id";
> +	status = "okay";
> +
> +	mdio {
> +		compatible = "snps,dwmac-mdio";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		ethphy0: ethernet-phy@4 {

Just conformation, the PHY is on the SOM? Are the magnetics and RJ45
socket on the SOM, or the carrier?

> +			compatible = "ethernet-phy-ieee802.3-c22";
> +			reg = <4>;
> +			eee-broken-1000t;

> +#if 0
> +			interrupts-extended = <&gpio3 2 IRQ_TYPE_LEVEL_LOW>;
> +			reset-gpios = <&gpio3 16 GPIO_ACTIVE_LOW>;
> +#endif

Please don't have disabled properties.

> +			reg-mask = <0x90>;

What does this property do? It is not one i recognise.

     Andrew


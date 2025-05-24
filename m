Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EA8FC54F30
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 May 2025 17:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ooNZFNesDamgJmBUO308M7JMOnZukel6+UrLmdW/7ag=; b=p70/+L530fVLlmuEW24G3h4ILS
	yyqmpauMAGMmdnU3jAoPsJn0RswFg1SrN5OkU88j7eFNHwPCFuIIbuJhQzulmhor2AJXPq3d+UGQz
	x5CjyySn/6SoiwVRmQvuqY/obSNigKrYasoia/aGHvCvXQUVJum2zeOcv2n7HoI0JJFWZjZrVYHs/
	PhZBdhJ8UXaZCRx65hK9QNvNQh/CqRNiW3k8C0wddp225EPuFJ2W6PDivH8A3uocghFhGNv2qj0/q
	k3LPLRjt7kGN9ilh3m2+A4F4uKSGV1zwhulyqzvym0cHLahoRKY4J5jqXSWbWgWx3orbQtrErDGD0
	xdVm2QIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIsxN-000000063Cf-0xnj;
	Sat, 24 May 2025 17:46:49 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIsvI-0000000634c-3d3M
	for linux-arm-kernel@lists.infradead.org;
	Sat, 24 May 2025 17:44:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=ooNZFNesDamgJmBUO308M7JMOnZukel6+UrLmdW/7ag=; b=Jr0iAPFVZj7M98iaizRYZqW0t2
	HFuQMZMIhVeRJpTTsHH70QsW/qID6h8BDVOlf2Hc+TrBFqvNbwoaDHJ+Qvd3DWN0oAIqYhaaaK3c5
	128hXJEGA/XqAP1vogm4qOGDXo+q8+bFEQutgtcLu4QUOGiLkjXfGf1uBKnMUeaW2hkc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uIsv7-00Dh4H-Qj; Sat, 24 May 2025 19:44:29 +0200
Date: Sat, 24 May 2025 19:44:29 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Christoph Stoidner <c.stoidner@phytec.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, upstream@lists.phytec.de
Subject: Re: [PATCH v3] arm64: dts: freescale: imx93-phycore-som: Delay the
 phy reset by a gpio
Message-ID: <047c963e-f24d-4995-aea0-4a8cf8e343f5@lunn.ch>
References: <20250524112315.695376-1-c.stoidner@phytec.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250524112315.695376-1-c.stoidner@phytec.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250524_104440_903822_5DF338AC 
X-CRM114-Status: GOOD (  10.25  )
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

> diff --git a/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi b/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
> index 88c2657b50e6..b481097f08a4 100644
> --- a/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
> @@ -68,6 +68,8 @@ mdio: mdio {
>  		ethphy1: ethernet-phy@1 {
>  			compatible = "ethernet-phy-ieee802.3-c22";
>  			reg = <1>;
> +			reset-gpios = <&gpio4 23 GPIO_ACTIVE_HIGH>;
> +			reset-assert-us = <30>;

Is there anything in the datasheet about needing a delay after the
reset? There is a DT property for this:

  reset-deassert-us:
    description:
      Delay after the reset was deasserted in microseconds. If
      this property is missing the delay will be skipped.

Anyway:

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD3C9CA5FF0
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Oct 2026 21:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iUejQ+v6arYz/jqDfYBOnzUc6H9Odh9nWzIu8FiM4MM=; b=HEGqTJ+ck8lggQ0Nbn5+OiTEN2
	AgxUapWnKPmlSvMXsAZdAZfBToG+Dg1/ie0UjD4hYQVTsQi+b+KoQjb9WNh5J6rEBWG4oI6poZ0mn
	qkcoGmpHAYCVmFTgp48dQtN+fTRLySCjVzax/59kBTfyBWaf/Lu6IBFmmhGIS3hJhz8b1j4qdrxSd
	3ZCiw2E7obceuzUEk3epK9OE4YD4we0THdScPms0ULTwS4OvNHK05r4e26lq1e1RVB158q2jtI8tg
	4aUtaWIUjibz8jyuQX3zlaTuy6hdXb1nmJuvHywdxABUWsR2RPN4LYGuWT9uGUOjLwK2xrjr3Pk/b
	uNxyIBcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDTeN-0000000FLjD-04dO;
	Sun, 04 Oct 2026 21:21:39 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDTeK-0000000FLiv-0PDY
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 Oct 2026 21:21:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=iUejQ+v6arYz/jqDfYBOnzUc6H9Odh9nWzIu8FiM4MM=; b=aKYofYFWg58gvgwIsDdSSAXOfc
	eywD5t2A0lofStpkskMl+2kuzBYUjz3jambXevnEMEOg08qy++uMVt9MZYTVmyT4bs7aCU3Fpc+YW
	ydx6kP7TeNNdmApt63uRzuYWL+FUhutho+GV7YBB0/RHes5u+MH090Tq/FC7NxwUu6dk=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xDTeB-008wYQ-QX; Sun, 04 Oct 2026 23:21:27 +0200
Date: Sun, 4 Oct 2026 23:21:27 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Dawid Glazik <dawid.glazik@linux.intel.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	maciej.lawniczak@intel.com
Subject: Re: [PATCH 4/4] ARM: dts: aspeed: add Intel JNCRP BMC
Message-ID: <d303c2a1-f262-412f-84b5-71e27c76e7c1@lunn.ch>
References: <cover.1790344811.git.dawid.glazik@linux.intel.com>
 <bf582c24cc3222aca1b7d78a32439fd3505dfe20.1790344811.git.dawid.glazik@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bf582c24cc3222aca1b7d78a32439fd3505dfe20.1790344811.git.dawid.glazik@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261004_142136_157204_83991AE1 
X-CRM114-Status: UNSURE (   6.68  )
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

> +&mdio1 {
> +	status = "okay";
> +
> +	ethphy1: ethernet-phy@0 {
> +		compatible = "ethernet-phy-id001c.c916";
> +		reg = <0>;
> +		reset-gpios = <&gpio0 ASPEED_GPIO(C, 1) GPIO_ACTIVE_LOW>;
> +		reset-assert-us = <10000>;
> +		reset-deassert-us = <50000>;
> +	};
> +};
> +
> +&mac1 {
> +	status = "okay";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_rgmii2_default>;
> +	clocks = <&syscon ASPEED_CLK_GATE_MAC2CLK>,
> +		 <&syscon ASPEED_CLK_MAC2RCLK>;
> +	clock-names = "MACCLK", "RCLK";
> +	phy-mode = "rgmii-id";
> +	phy-handle = <&ethphy1>;
> +};

For these two nodes only:

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew


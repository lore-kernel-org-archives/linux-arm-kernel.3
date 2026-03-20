Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57DE21098782
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 13:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KPEmOBrzJQ5lJjApNclCXD+tVOjngOyNohE76noQaxY=; b=HylSuHdVnqGrvJDwKhMEIONBY/
	4YNJEAdxUcek/p878E77Hefoq1LIb4AnI0KDj8+66hBYHuogGlxnlKO35zs3Z0dn7v5EEcmvIJTu2
	yOevmKmx9ZDxnGqCyix8bYIp/Hu4cP72/fJBpGAEkIhGWKTW5RWLK9JEXW2Vn4oPDJQVfjFkT3Vke
	YeOgR9vStU0aBpyWooMfJIwpCRewRhQegIGl3t4stWEQKQYywKeJgr9kSgURnRw/tWioFjQayzWUc
	HBTSkydyRMB3XdIjdpEh0hVoWQM5dXTUyX06nUAcZ9IlFrJBZOnPMYeu86c+n7FNyii3HfL7P3RZ/
	GNnhyHzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Zvf-0000000CrGY-3LgD;
	Fri, 20 Mar 2026 13:30:19 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Zvc-0000000CrGA-3uht
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 13:30:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=KPEmOBrzJQ5lJjApNclCXD+tVOjngOyNohE76noQaxY=; b=fLm+T28ZNDiK0i9piqLnCiMh7t
	Jh/tkhITAG24PpexF47gsPCC+d17/moI3bicAbShxZZvlE3bWbqVprDNLBBa++Qo+vMXPPpQ7ICvt
	Y2EAKSa94KAGnKgS9fp0ezD/6FPxushXDUNoAyXlrK5eQ8nda9pN+jrFxwI63/aEHQU8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1w3ZvS-00CYvA-49; Fri, 20 Mar 2026 14:30:06 +0100
Date: Fri, 20 Mar 2026 14:30:06 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Joy Zou <joy.zou@nxp.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Ye Li <ye.li@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>, Peng Fan <peng.fan@nxp.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] arm64: dts: freescale: add i.MX91 9x9 QSB basic
 support
Message-ID: <43d91381-4f11-47b6-b37d-7c624402af5b@lunn.ch>
References: <20260319-b4-imx91-qsb-dts-v1-0-2eedc01d8af0@nxp.com>
 <20260319-b4-imx91-qsb-dts-v1-2-2eedc01d8af0@nxp.com>
 <4124e5ae-52a2-405c-a02d-7a1f48aa2b57@lunn.ch>
 <abzmpBHDRrsd/Mvr@shlinux89>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abzmpBHDRrsd/Mvr@shlinux89>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_063016_998884_5955B15B 
X-CRM114-Status: GOOD (  12.23  )
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

On Fri, Mar 20, 2026 at 02:18:31PM +0800, Peng Fan wrote:
> On Thu, Mar 19, 2026 at 04:43:40PM +0100, Andrew Lunn wrote:
> >> +&eqos {
> >> +	phy-handle = <&ethphy1>;
> >> +	phy-mode = "rgmii-id";
> >> +	pinctrl-0 = <&pinctrl_eqos>;
> >> +	pinctrl-names = "default";
> >> +	status = "okay";
> >> +
> >> +	mdio {
> >> +		compatible = "snps,dwmac-mdio";
> >> +		#address-cells = <1>;
> >> +		#size-cells = <0>;
> >> +		clock-frequency = <5000000>;
> >
> >Is that a valid property for "snps,dwmac-mdio"?
> 
> It is a valid property in 
> Documentation/devicetree/bindings/net/mdio.yaml

Yes, it is in general a valid property. But does snps,dwmac-mdio
actually implement it?

The danger here is, it is currently ignored, and the MDIO bus is
clocked at 2.5MHz, and your board works. But sometime in the future,
somebody actually implements it, your board jumps to 5MHz, and stops
working.

That is not the usual definition of a regression, so i guess we will
leave your board broken.

So you need to accept the risk. Or remove the property. Or actually
implement the property.

   Andrew


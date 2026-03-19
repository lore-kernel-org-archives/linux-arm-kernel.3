Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 065A81090220
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 13:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ICmpwB6fh0A2b0UPMsVtdQowQ3NwvZk/ZYuBrQL7xLU=; b=4245t5zRzn6RzHgZgV5OdS81Ud
	MZ67VBmL6ZePhg1Nd8RvxI19JRBxmlyyZB2wgdnRMgh0esSW7ncPTNTsfpIj4ZpZAx/N96w//AEFN
	vSFB6mSksl8omVnCCEXYXGTpkocrvfrZZbyRsJ4b6y6Ou09N1HLlsr+srs6ZO3YOJzGYl1zTZ4Baw
	0Z/lOirWj7mkT2EGh0N6EffpwCVRV11bxXYSJjdqgi0Ag50AxvxW22WkgRh0uivTLI8j8RJm5YI63
	IwUJm3eaCeZ9sspZrc04bs55wiZ56x036hcoBfs7VHrGRCs+eQkvQ7FGD2p0AbShR87ssyhbJjg+m
	CzgGMQBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3DSY-0000000AguP-3Nmm;
	Thu, 19 Mar 2026 13:30:46 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3DSU-0000000AgtH-2on3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 13:30:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=ICmpwB6fh0A2b0UPMsVtdQowQ3NwvZk/ZYuBrQL7xLU=; b=xW
	MwkOVARasJTlAwliM6ZawizqVt4PFeUf14ARuA+C51I+kWFt0bZckt8s57fDBxNmUdtXzyPTSmm7q
	MJ4vDl34CMg6TQLbKllfsO6/jAVLYn0SnKtP7sGgIu2Ao5lZhrRJYrKCn6epW9PpKKQbPciFC18IJ
	P+Knr+mgYvtL6po=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1w3DSJ-00COBb-6c; Thu, 19 Mar 2026 14:30:31 +0100
Date: Thu, 19 Mar 2026 14:30:31 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Martin Schmiedel <Martin.Schmiedel@tq-group.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com
Subject: Re: [PATCH 2/3] arm64: dts: freescale: add initial device tree for
 TQMa93xx/MBa93xxLA-MINI
Message-ID: <16102fa9-4b6e-4e40-98b2-2f138ad75ecd@lunn.ch>
References: <20260317111704.1075938-1-alexander.stein@ew.tq-group.com>
 <20260317111704.1075938-3-alexander.stein@ew.tq-group.com>
 <d67fafc1-4261-4818-8b58-7f3a874613e4@lunn.ch>
 <2259293.irdbgypaU6@steina-w>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2259293.irdbgypaU6@steina-w>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_063042_707091_35673DC8 
X-CRM114-Status: GOOD (  13.65  )
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

On Thu, Mar 19, 2026 at 12:25:11PM +0100, Alexander Stein wrote:
> Hi Andrew,
> 
> Am Mittwoch, 18. März 2026, 15:49:38 CET schrieb Andrew Lunn:
> > On Tue, Mar 17, 2026 at 12:17:01PM +0100, Alexander Stein wrote:
> > > +	mdio {
> > > +		compatible = "snps,dwmac-mdio";
> > > +		#address-cells = <1>;
> > > +		#size-cells = <0>;
> > > +
> > > +		ethphy_eqos: ethernet-phy@0 {
> > > +			compatible = "ethernet-phy-ieee802.3-c22";
> > > +			reg = <0>;
> > > +			pinctrl-names = "default";
> > > +			pinctrl-0 = <&pinctrl_eqos_phy>;
> > > +			interrupt-parent = <&gpio3>;
> > > +			interrupts = <26 IRQ_TYPE_EDGE_FALLING>;
> > 
> > Hi Alexander
> > 
> > Haven't we been here before? EDGE interrupts are generally wrong for
> > PHYs.
> 
> Whoops. Sorry, this slipped in from the downstream kernel. Will fix that.

You might want to fix your downstream as well, since this is not a
Mainline thing.

> > > +&fec {
> > > +	pinctrl-names = "default";
> > > +	pinctrl-0 = <&pinctrl_fec>;
> > > +	phy-mode = "rgmii-id";
> > > +	phy-handle = <&ethphy_fec>;
> > > +	fsl,magic-packet;
> > 
> > Has WoL been tested?
> 
> Yes, it works for both interfaces. &eqos doesn't need that property though.

Great. For the next year or two, i might be asking this all the time,
so maybe call it out in the commit message.

   Andrew


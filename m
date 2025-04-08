Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48E5CC369A5
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 16:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iHamA6MmAQln3g+ph5RzN9L5CgRNW7XpNoZqh01YomM=; b=cmGSDAUCG7FiFguzaAxyP6oVMk
	qioSduhC2Zv3l0Mm40scSXeHrJCMhBGH2yrDOCgBXiSmUQo6kuX9sbB8GXPnbaBpAeynifVPe+fjn
	6sOmYyIJzr1qZkJYpFfiNbTVRZcGtb8jO5dHzXFK6IJG+EfdBWpM2hQskfIRLQRDm2ISRd1EKVVOG
	gDf81qCsEaKjy4OqFekwhhG7qgSxGA76tFQRmiTOwi81l6RJV8if/0tNWDHzD+NFcy5/Yf8xnK6n2
	dHuWOe5FBuYTy4gxBHdXLJ4kTW3olPoekcqAytURh76MKiyr1tm2LGwyfRW/GxfyMpAALzPKr57VO
	RDZKXKPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Bbi-00000004mG9-10ha;
	Tue, 08 Apr 2025 16:15:26 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2BZf-00000004lnf-3aui
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 16:13:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=iHamA6MmAQln3g+ph5RzN9L5CgRNW7XpNoZqh01YomM=; b=xQHDKD9ZXptDaSK+dQASAxx790
	Ybh87tS1nZ3FusAZGh77bUylZwpxjm6ICZWRNMCCbeK3BDFf+XrZwIaTUeNHNl2mncQZsxLkl7Acq
	FR96apk9s3xS4f0APOr0XRJuOag3yS2jFyDzyK/zpm+y9Y37zDhSdhTY1OCd/dS4J8es=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1u2BZW-008QBU-Ty; Tue, 08 Apr 2025 18:13:10 +0200
Date: Tue, 8 Apr 2025 18:13:10 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Martyn Welch <martyn.welch@collabora.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, kernel <kernel@collabora.com>,
	devicetree <devicetree@vger.kernel.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	imx <imx@lists.linux.dev>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2] arm64: dts: imx8mp: Add device tree for Nitrogen8M
 Plus ENC Carrier Board
Message-ID: <22e7df8e-51a2-4549-ad80-0e7fd256de0a@lunn.ch>
References: <20250327123907.542132-1-martyn.welch@collabora.com>
 <cf525617-b895-4d58-8455-a5c7fa9bbeab@lunn.ch>
 <196162332ff.b61ad5b5564260.8672918780815538746@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <196162332ff.b61ad5b5564260.8672918780815538746@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_091319_894184_8287A2D7 
X-CRM114-Status: GOOD (  13.43  )
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

On Tue, Apr 08, 2025 at 05:02:07PM +0100, Martyn Welch wrote:
>  ---- On Thu, 27 Mar 2025 14:25:38 +0000  Andrew Lunn <andrew@lunn.ch> wrote --- 
>  > > +++ b/arch/arm64/boot/dts/freescale/imx8mp-nitrogen-som.dtsi
>  > > @@ -0,0 +1,415 @@
>  > > +&eqos {
>  > > +    pinctrl-names = "default";
>  > > +    pinctrl-0 = <&pinctrl_eqos>;
>  > > +    phy-handle = <&ethphy0>;
>  > > +    phy-mode = "rgmii-id";
>  > > +    status = "okay";
>  > > +
>  > > +    mdio {
>  > > +        compatible = "snps,dwmac-mdio";
>  > > +        #address-cells = <1>;
>  > > +        #size-cells = <0>;
>  > > +
>  > > +        ethphy0: ethernet-phy@4 {
>  > 
>  > Just conformation, the PHY is on the SOM? Are the magnetics and RJ45
>  > socket on the SOM, or the carrier?
>  > 
> 
> The PHY is on the SOM, the magnetics and RJ45 socket are on the carrier.

Thanks. So phy-mode is in the right place.

> 
>  > > +            compatible = "ethernet-phy-ieee802.3-c22";
>  > > +            reg = <4>;

and the reg value is fixed.

    Andrew


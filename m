Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80DA2C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Jun 2025 03:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cV9SrJmogHgdqp4OM5LO/TrDDsTxFCLEWXVRiXEZlrs=; b=vtxuoutZJjrJc7gNS2DIIMBrcp
	lQ9kss9AxX5FcOeFYPWjBTWQ/sl0jvbkHyiIYMG3ed5lsKCdrY9ZfHkVKMl4SHyq64mQCYZ8xiHDS
	W1uWRiMXywH1M7Q8+QSJTTPasboHdXqlOEjlpsyg4t02HlkbZkxGoAUWSGYq7+Mvbck/WOIXiWnII
	ptz/g13OrosEwh5a9cTbAPs15e4LcmFYPbGnFxifHLBDpo61fjOTkCxQOdXgtrj2yarzRVLFkhjaE
	8sr7zRCoxgEIRuV8pawu/aIgXFCWkAOLke4FRu/MGs4Ct322PJ1ULleUGaQwt8hxGLgUsqdKPbx9l
	SF3A8sPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMfB2-0000000CTxx-0gnx;
	Wed, 04 Jun 2025 03:52:32 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMcms-0000000CAxJ-2c9z
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Jun 2025 01:19:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=cV9SrJmogHgdqp4OM5LO/TrDDsTxFCLEWXVRiXEZlrs=; b=oo6Jqa1ctxJH/SN3B9yqYBwcf7
	1zJIYbwtwEdRmedulYru49ATTBeL+amP1rXxOnfVdMvusb3xfjHLQCwOEmqoUBVGc2tZHpy0FsYBM
	3lqUC5fS5ofiKGm8PYwgPrcVJAJ+uWTvhJEfmA59cfE12A0TkqvN3J8w7lHotpHKoUGI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uMcmi-00EdFl-Rg; Wed, 04 Jun 2025 03:19:16 +0200
Date: Wed, 4 Jun 2025 03:19:16 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [v1] arm64: dts: freescale: imx93-var-som: update eqos support
 for MaxLinear PHY
Message-ID: <54c4a279-a528-4657-8319-c9374add54b7@lunn.ch>
References: <20250603221416.74523-1-stefano.radaelli21@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250603221416.74523-1-stefano.radaelli21@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_181926_658647_25AA243C 
X-CRM114-Status: UNSURE (   8.63  )
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

>  &eqos {
> @@ -39,6 +26,7 @@ &eqos {
>  	pinctrl-0 = <&pinctrl_eqos>;
>  	phy-mode = "rgmii";

I know this is not in the scope of what you are trying to do, but this
is probably wrong:

https://elixir.bootlin.com/linux/v6.15/source/Documentation/devicetree/bindings/net/ethernet-controller.yaml#L287

	Andrew


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DB7ACAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Oct 2025 21:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/6Rur6gixXsDEoixWjixyoLRwodxgAENpdcVDzOam5o=; b=HVI6GVQUxv/LeAKpZik35CkOUz
	NCgsZ5y+BjnM/4UZPbF1862/QNxC+Yu4+XlucKICmW2RZmsYLjOElK3Tvd9sVHGXfcrOEQ3bRtS6N
	tUNekwd1lWalL7nBP3EqRtQ7wDF4ECGUI/NuT+lfnWwvzV0Cm4wTVF68gAlp9A9SjDHsb3wlk7kZE
	NlN85D1oCUoDOnxzDNAWfXIidWdFzz1nESFqZxbJ5kECbFHZNIGhwh6M5ejAFJfbenA15mFF8iIbl
	ylJ2sPH7N0gXw2CMuYIHyzYF5ZS5rtvRNT3/9M71ubgR9YBnaSl2EFqHiMf+bqyMplB/LgrDqdTUc
	xlk+B+QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v446Y-000000091gf-2fFO;
	Wed, 01 Oct 2025 21:11:18 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v446W-000000091fr-34C3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Oct 2025 21:11:18 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 6FA4C316;
	Wed,  1 Oct 2025 23:09:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1759352983;
	bh=DtQDevFoSt04iSsMW/iJhc0ExZPMJSGfdtsTL4hnWOY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vsa7/HwAqyl5xjRWRovRZUTnpIz4rheVZUUzl5odP7t9SMgtVDSKYSfBZvHhmvyTA
	 Lk387NRoE5RNrEjJQEmCq7VP8171inACQ8JiqcYxmKbB4MQO+UvM/VxMZgsRScohl3
	 bQTuTUwHr04VlbyB3zxqhjl8jnrno76krLqRRxIc=
Date: Thu, 2 Oct 2025 00:11:07 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jonas Rebmann <jre@pengutronix.de>
Cc: "Rob Herring (Arm)" <robh@kernel.org>, netdev@vger.kernel.org,
	"David S. Miller" <davem@davemloft.net>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>, linux-sound@vger.kernel.org,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	imx@lists.linux.dev, Vladimir Oltean <olteanv@gmail.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
	David Jander <david@protonic.nl>,
	Lucas Stach <l.stach@pengutronix.de>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Fabio Estevam <festevam@gmail.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Mark Brown <broonie@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v3 0/3] Mainline Protonic PRT8ML board
Message-ID: <20251001211107.GC25098@pendragon.ideasonboard.com>
References: <20250924-imx8mp-prt8ml-v3-0-f498d7f71a94@pengutronix.de>
 <175876283065.3268812.10851892974485151512.robh@kernel.org>
 <3a0ba202-23e5-41d1-8b0c-5501a6d73bb4@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <3a0ba202-23e5-41d1-8b0c-5501a6d73bb4@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_141116_911130_6EDBE3E3 
X-CRM114-Status: GOOD (  12.27  )
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

On Thu, Sep 25, 2025 at 05:10:43PM +0200, Jonas Rebmann wrote:
> Hi,
> 
> Regarding the warnings:
> 
> On 2025-09-25 03:18, Rob Herring (Arm) wrote:
> > arch/arm64/boot/dts/freescale/imx8mp-prt8ml.dtb: codec@11 (asahi-kasei,ak4458): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
> > 	from schema $id: http://devicetree.org/schemas/sound/asahi-kasei,ak4458.yaml#
> 
> Updated bindings have already been applied to broonie/sound for-next.
> 
> > arch/arm64/boot/dts/freescale/imx8mp-prt8ml.dtb: isp@32e10000 (fsl,imx8mp-isp): 'power-domain-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
> > 	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> > arch/arm64/boot/dts/freescale/imx8mp-prt8ml.dtb: isp@32e10000 (fsl,imx8mp-isp): power-domains: [[77, 6], [77, 1]] is too long
> > 	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> > arch/arm64/boot/dts/freescale/imx8mp-prt8ml.dtb: isp@32e20000 (fsl,imx8mp-isp): 'power-domain-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
> > 	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> > arch/arm64/boot/dts/freescale/imx8mp-prt8ml.dtb: isp@32e20000 (fsl,imx8mp-isp): power-domains: [[77, 6], [77, 4]] is too long
> > 	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> 
> This is an issue in imx8mp.dtsi, introduced in commit 9c60bc7f10d0
> ("arm64: dts: imx8mp: Add pclk clock and second power domain for the
> ISP").

The corresponding changes for the DT bindings have been applied to the
linux-media tree and included in a pull request for v6.18 ([1]).

https://lore.kernel.org/all/20251001172511.2d0514ec@sal.lan/

-- 
Regards,

Laurent Pinchart


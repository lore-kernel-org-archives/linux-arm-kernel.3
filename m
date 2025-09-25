Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B199CAC5B1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 15:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9W1CpRiutP9wWL+4gQFGdPyf10PwQbpULElVleNGMjU=; b=CbcwyZKd6D/lbXIdHw4QzTvX8e
	915Bz+GjrX8xk5Iu91WZ6IDi5yC5rC6cnjf6yrEt/3dW5xv1/1WD0qUhiSqZBglebOmXnv9BVnju2
	/+X49Cn/6U5eHpcvPq0XhZJQp9vee6I06gg/87IOWSrLBiPtM9dfaDZPiV52E/JDI0xD3oIqM6s4S
	rzy6BrOSypiDUrhfynwfBA1TqY5TUpkFI6xO/r+UREW+zVjFmhvsrdd3ap1Ll7ImysHlsiVkr1gX3
	trYSND2CiTXhQ2y2400wDw342Q6hZwL/OeZwstzHOxDZnlvkeDwMhDjSSi18X5UPcBu+0itidB6lT
	Q8k4PhpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1ncv-0000000ATer-3Brl;
	Thu, 25 Sep 2025 15:11:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1ncu-0000000ATdW-2X1V
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 25 Sep 2025 15:11:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=9W1CpRiutP9wWL+4gQFGdPyf10PwQbpULElVleNGMjU=; b=i0zLmMAZUA4rfXWoUL+fCbul2z
	2FqRlDaRYJKTQyNogMkWsv80zIJ5kHsiCjWj8YXifTL9bND92qQVUwfT30m3ovK31VnrvdJTI0nVk
	irvKSVANb9Xr+L8fhmYg6+WSXXgp9XnCKntwM5cxZP5+4NeLEuNcuTDXcMv11mL0LiDdDDJ6Tl+X5
	MB8UCRSs29QzYyDaWV6WhKti76XuvwPXUlcJwu0pU6+neDoZn08h++ygrtDakXpx93ZCpfqwgPXMO
	nTEUGyBhIdBowl5KhwzMhGE1/zhcziHP8kZkTezv6gL5xQg1rJE/r3a15xcinfTfkPBkG4SLwI/DP
	HbgqREyQ==;
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1ncq-00000009Idc-1iUc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 15:11:19 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <jre@pengutronix.de>)
	id 1v1ncM-0003PJ-O1; Thu, 25 Sep 2025 17:10:46 +0200
Message-ID: <3a0ba202-23e5-41d1-8b0c-5501a6d73bb4@pengutronix.de>
Date: Thu, 25 Sep 2025 17:10:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] Mainline Protonic PRT8ML board
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-sound@vger.kernel.org, Oleksij Rempel <o.rempel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 imx@lists.linux.dev, Vladimir Oltean <olteanv@gmail.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>, Conor Dooley
 <conor+dt@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 David Jander <david@protonic.nl>, Lucas Stach <l.stach@pengutronix.de>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Fabio Estevam <festevam@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Shengjiu Wang <shengjiu.wang@nxp.com>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Mark Brown <broonie@kernel.org>,
 Andrew Lunn <andrew@lunn.ch>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20250924-imx8mp-prt8ml-v3-0-f498d7f71a94@pengutronix.de>
 <175876283065.3268812.10851892974485151512.robh@kernel.org>
Content-Language: en-US
From: Jonas Rebmann <jre@pengutronix.de>
In-Reply-To: <175876283065.3268812.10851892974485151512.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: jre@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_161116_612922_544B5865 
X-CRM114-Status: UNSURE (   7.47  )
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

Hi,

Regarding the warnings:

On 2025-09-25 03:18, Rob Herring (Arm) wrote:
> arch/arm64/boot/dts/freescale/imx8mp-prt8ml.dtb: codec@11 (asahi-kasei,ak4458): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
> 	from schema $id: http://devicetree.org/schemas/sound/asahi-kasei,ak4458.yaml#

Updated bindings have already been applied to broonie/sound for-next.

> arch/arm64/boot/dts/freescale/imx8mp-prt8ml.dtb: isp@32e10000 (fsl,imx8mp-isp): 'power-domain-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
> 	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> arch/arm64/boot/dts/freescale/imx8mp-prt8ml.dtb: isp@32e10000 (fsl,imx8mp-isp): power-domains: [[77, 6], [77, 1]] is too long
> 	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> arch/arm64/boot/dts/freescale/imx8mp-prt8ml.dtb: isp@32e20000 (fsl,imx8mp-isp): 'power-domain-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
> 	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
> arch/arm64/boot/dts/freescale/imx8mp-prt8ml.dtb: isp@32e20000 (fsl,imx8mp-isp): power-domains: [[77, 6], [77, 4]] is too long
> 	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#

This is an issue in imx8mp.dtsi, introduced in commit 9c60bc7f10d0
("arm64: dts: imx8mp: Add pclk clock and second power domain for the
ISP").

Regards,
Jonas


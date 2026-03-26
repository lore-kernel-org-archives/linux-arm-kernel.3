Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8D8E106F309
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 08:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MgYZsqPeVPVKfUUPMM70E5V+cxb3qXURl6czzM6KnCc=; b=vFAEuGe3kOycWrrS29gO0QR0BE
	6m4EKJ5FFb47ernA/JOF38bkuoltW/ceRel8shDjR1a14e5W/QFQcmzwtjlU9BxUOmdgmrzT67Vi1
	pD3OisciBaJMXRTa1jDiIPc96l05lau9huEyxDSaPqySvCgfnZwOnzcwT6gtmuDhgDw7CT3WTI08h
	T51fPwqMnps4Y6OhkHJwvnbhSTu78yI/pPM9214n4Yw1Fpuu/giSihEI0Xmcx3E3dXhgLkVPis6Gx
	N8TM4mLg4xNL6n0z8e9a+PajSaFGntnp8NdUyoUGiCaeGuwwbYtCp0oN/6A+yvwhkDJrvc9Fk8eFh
	2sWCgspA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5gXr-000000055IV-086F;
	Thu, 26 Mar 2026 08:58:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5gXp-000000055Hj-3E1M
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 26 Mar 2026 08:58:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=MgYZsqPeVPVKfUUPMM70E5V+cxb3qXURl6czzM6KnCc=; b=h8GyL0A6ewvtMNhqxlSlTclkdL
	Bn4VBWcFZOlfLG2iC7v+CR56MzuVkqezutBGwnrKA9wkTnG/CS2V7QelOp4QD6aBL7ZT18HCnbziL
	SbMxmW1kT+op+7/8GbY/jBZQ6gBlUZ8Y26z3WkjIOqcfZ5gpHmMEvWLnNW3IPgR3tm/+aBvwmpW7Y
	ieeI6we6hXKSQhOOjyxPcScIdH61lfPoDAdFrjDy5tlECGckgWgOFwImA5QoFqqMH6WHYUsDWktfh
	gSuXQbXxeJIWGDktpvi8+7T3k8D/TEyy8BAbJLj9tSV/SrgUngHIDlguziMkRogQwUuViNgawLX99
	2kPpGptQ==;
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5gXm-00000007ocl-3jco
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 08:58:24 +0000
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id CECCAF90;
	Thu, 26 Mar 2026 09:57:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1774515423;
	bh=Q2z7nIl9Zoe/83NJvE1/x3WCuB6ACYFQkU+mBKqbubU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vkKVLOOlHLE3wSuMiYkfrrBCYD3tc+A0g2WIsGFOY7JCZMxsqpolgMrhXVdb0x4+r
	 SMp/DGTgBsYtx9TbFzol6XviLPVgJx+w9hlBtyHCyWgHgIdplETSXdBrgXEaT3V1eD
	 qDIEoQBl8EJrbwbPDY12yMEX8gEsuiWQQP2wBVxs=
Date: Thu, 26 Mar 2026 10:58:20 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Gilles Talis <gilles.talis@gmail.com>,
	Viorel Suman <viorel.suman@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Jagan Teki <jagan@amarulasolutions.com>,
	Manoj Sai <abbaraju.manojsai@amarulasolutions.com>,
	Matteo Lisi <matteo.lisi@engicam.com>,
	Ray Chang <ray.chang@technexion.com>,
	Richard Hu <richard.hu@technexion.com>, Heiko Schocher <hs@denx.de>,
	Martyn Welch <martyn.welch@collabora.com>,
	Josua Mayer <josua@solid-run.com>,
	Goran =?utf-8?B?UmHEkWVub3ZpxIc=?= <goran.radni@gmail.com>,
	=?utf-8?B?QsO2cmdlIFN0csO8bXBmZWw=?= <boerge.struempfel@gmail.com>,
	Christoph Niedermaier <cniedermaier@dh-electronics.com>,
	Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel@dh-electronics.com,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v2 09/12] arm64: dts: imx8mp-sr-som: Correct PAD settings
 for PMIC_nINT
Message-ID: <20260326085820.GA2770072@killaraus.ideasonboard.com>
References: <20260326-imx8mp-dts-fix-v2-v2-0-62c4ce727448@nxp.com>
 <20260326-imx8mp-dts-fix-v2-v2-9-62c4ce727448@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260326-imx8mp-dts-fix-v2-v2-9-62c4ce727448@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_085823_243207_8030667C 
X-CRM114-Status: GOOD (  16.63  )
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

On Thu, Mar 26, 2026 at 03:28:13PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> With commit 5d0efaf47ee90 ("regulator: pca9450: Correct interrupt type"),
> there might be interrupt storm for this board. Need to set PAD PUE and PU
> together to make pull up work properly.
> 
> Fixes: a009c0c66ecb4 ("arm64: dts: add description for solidrun imx8mp som and cubox-m")
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8mp-sr-som.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-sr-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-sr-som.dtsi
> index 3cdb0bc0ab721709fc892931ea00a538ec6216ff..c3f7daa773eaf335deb6cc976a5e120abdae5967 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-sr-som.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-sr-som.dtsi
> @@ -174,7 +174,7 @@ pmic: pmic@25 {
>  		pinctrl-0 = <&pmic_pins>;
>  		pinctrl-names = "default";
>  		interrupt-parent = <&gpio1>;
> -		interrupts = <3 GPIO_ACTIVE_LOW>;
> +		interrupts = <3 IRQ_TYPE_LEVEL_LOW>;

This is a good change, but it should be mentioned in the commit message,
or split to a separate patch. Same for other patches in this series
where you make the same change.

>  		nxp,i2c-lt-enable;
>  
>  		regulators {
> @@ -417,7 +417,7 @@ MX8MP_IOMUXC_SAI1_RXD1__GPIO4_IO03		0x160
>  
>  	pmic_pins: pinctrl-pmic-grp {
>  		fsl,pins = <
> -			MX8MP_IOMUXC_GPIO1_IO03__GPIO1_IO03		0x41
> +			MX8MP_IOMUXC_GPIO1_IO03__GPIO1_IO03		0x1c0
>  		>;
>  	};
>  

-- 
Regards,

Laurent Pinchart


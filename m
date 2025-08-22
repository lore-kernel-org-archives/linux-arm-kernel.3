Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3A8ACA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 06:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jm48ar9BAtvm3zqn8o6TigamJX1MWix9DePHULJWZEY=; b=XW9xNiAXJLQLirGV70HalM55WE
	vGBQ1RbhNFXKkI+MiUqD9NE8JEpqvRcp3kx3CrnHNZsqAvOeTbLX+trIngFAqjSznADewssWFlkZK
	o9ryAWHojZYf3jMH+6BFePRlawBAPm5Y5Ly/hOBxBFfCHyn95/OaaEGUgTvAaW9fWJDX8epFI3wmA
	xZVoMcf+QFa4XIbprJ8ivUpeNFOYGFnXmbkOGss62mOTTzbYVU6fYQTbwtEOGqCobVa/vtVigXiap
	TJDftSHC7lGDuDKeHGtYb2vSTZt6TCEs3CnjpnrxExKUm1ppzSHG6CyqCu0hRvgEMNleTtzjCywlZ
	cpfEd7AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uphqk-000000045fy-0RYC;
	Sat, 23 Aug 2025 06:35:38 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upSA2-00000002g7O-0DVR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 13:50:31 +0000
Received: from ideasonboard.com (unknown [IPv6:2a00:6020:448c:6c00:7c3d:a283:5570:ad9a])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 269E411D5;
	Fri, 22 Aug 2025 15:49:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755870566;
	bh=zTC9rggl0i3t5XLpEsqcM+WQni9LhEviNLZmk+YbRV4=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=OvB+D9nrGBSqzWfJeElOujCqVeuxE5UDvoDaJBLWCYyWtEIkC/xkY0aGB2C80d15Z
	 RpFE/FOCNVTRYSM8bXsYqmEq/X4WAWPaL5JKpeJc8/JizCspnqhaUaJ6RdMg2i0SsP
	 U6USyZTmJ/9KgJwp+OhpgrWi+MbX4OUCaLjX43P4=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250821000944.27849-13-laurent.pinchart@ideasonboard.com>
References: <20250821000944.27849-1-laurent.pinchart@ideasonboard.com> <20250821000944.27849-13-laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v2 12/12] arm64: dts: imx8mp: Specify the number of channels for CSI-2 receivers
From: Stefan Klug <stefan.klug@ideasonboard.com>
Cc: Isaac Scott <isaac.scott@ideasonboard.com>, Rui Miguel Silva <rmfrfs@gmail.com>, Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>, Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-media@vger.kernel.org
Date: Fri, 22 Aug 2025 15:50:22 +0200
Message-ID: <175587062299.3267892.13323129258755005337@localhost>
User-Agent: alot/0.12.dev8+g2c003385c862.d20250602
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_065030_230710_4C1EE934 
X-CRM114-Status: GOOD (  10.55  )
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

Hi Laurent,

Thank you for the patch.=20

Quoting Laurent Pinchart (2025-08-21 02:09:44)
> The CSI-2 receivers in the i.MX8MP have 3 output channels. Specify this
> in the device tree, to enable support for more than one channel in
> drivers.
>=20
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Stefan Klug <stefan.klug@ideasonboard.com>
Tested-by: Stefan Klug <stefan.klug@ideasonboard.com>

Cheers,
Stefan

> ---
>  arch/arm64/boot/dts/freescale/imx8mp.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/=
dts/freescale/imx8mp.dtsi
> index bb24dba7338e..1e52840078df 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> @@ -1764,6 +1764,7 @@ mipi_csi_0: csi@32e40000 {
>                                 assigned-clock-parents =3D <&clk IMX8MP_S=
YS_PLL2_250M>,
>                                                          <&clk IMX8MP_CLK=
_24M>;
>                                 power-domains =3D <&media_blk_ctrl IMX8MP=
_MEDIABLK_PD_MIPI_CSI2_1>;
> +                               fsl,num-channels =3D <3>;
>                                 status =3D "disabled";
> =20
>                                 ports {
> @@ -1799,6 +1800,7 @@ mipi_csi_1: csi@32e50000 {
>                                 assigned-clock-parents =3D <&clk IMX8MP_S=
YS_PLL2_250M>,
>                                                          <&clk IMX8MP_CLK=
_24M>;
>                                 power-domains =3D <&media_blk_ctrl IMX8MP=
_MEDIABLK_PD_MIPI_CSI2_2>;
> +                               fsl,num-channels =3D <3>;
>                                 status =3D "disabled";
> =20
>                                 ports {
> --=20
> Regards,
>=20
> Laurent Pinchart
>=20
>


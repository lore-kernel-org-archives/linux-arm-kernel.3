Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 908FBFEC0EA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 17:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PFKuzD9y4GLEmphg2H3+HKILiqSg6/H8M9dGrbITRP8=; b=fiEl4MqkpYn8QTrItToURnaPbs
	SoLfziFTGktMI9ONFPsTfTx0NYP8mpJsQs8uGX2pBSQOZ/e3HFZQx69aFbFWRGMVBOwa3WYYs2uqM
	OoMN/1qYK84ZfDxrIWd1joCsLBK6RJqq4SSGI0x0SG0N41bFI9Umt1a8oTqDgHdXlw/+O2FdQLqRW
	RPdaB1zIRO9S6N1SmpE6oqGJddenaraUsHBGe2+gzzPMseKLE882GhCKvSiSr9NG68aRUd0PdKgvP
	dgQl2UYy6854xAwCzcVYvlQP17D3BCtYJii2/rVR0pMkd3mno6zcwIAqX6dViprFkhsmbZsJNdl6f
	mDwC5pnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w55hw-000000020ZU-1r5h;
	Tue, 24 Mar 2026 17:38:24 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w55ht-000000020Yv-2cca
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 17:38:22 +0000
Received: from monstersaurus.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 781DB591;
	Tue, 24 Mar 2026 18:36:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1774373819;
	bh=G2U9jNXmGKQiFMUboZ/K8HyiyQY8sASuGrzJTEeTpk4=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=bkYxSQnRHZNwVybn0Mi8RYNhlURfQy+F44xIZzsgyQ3tzGNqRkXZ3EcOk+63VJKbM
	 2AOH31q9iECurxobS0cnUs58b4cQ9bHelYUx/3Ul6eAZ2+0mHohMAE8DXd6xpQcKbc
	 ZDMS04OA7iLtCoMWJpfbY02S1C++mlz+jNzNtl/E=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260324093850.GA2351719@killaraus.ideasonboard.com>
References: <20260324-imx8mp-dts-fix-v1-1-df0eb2f62543@nxp.com> <20260324093850.GA2351719@killaraus.ideasonboard.com>
Subject: Re: [PATCH] arm64: dts: imx8mp-debix-model-a: Correct PAD settings for pmicirqgrp
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Marco Felsch <m.felsch@pengutronix.de>, Daniel Scally <dan.scally@ideasonboard.com>, devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>, Stefan Klug <stefan.klug@ideasonboard.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Date: Tue, 24 Mar 2026 17:38:14 +0000
Message-ID: <177437389415.1230693.16040948368071205395@ping.linuxembedded.co.uk>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_103821_830064_0B5E4484 
X-CRM114-Status: GOOD (  24.56  )
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

Quoting Laurent Pinchart (2026-03-24 09:38:50)
> Hi Peng,
>=20
> Thank you for the patch.
>=20
> On Tue, Mar 24, 2026 at 11:16:13AM +0800, Peng Fan (OSS) wrote:
> > From: Peng Fan <peng.fan@nxp.com>
> >=20
> > With commit 5d0efaf47ee90 ("regulator: pca9450: Correct interrupt type"=
),
> > there is interrupt storm for i.MX8MP DEBIX Model A. Per schematic, there
> > is no on board PULL-UP resistors for GPIO1_IO03, so need to set PAD
> > PUE and PU together to make pull up work properly.
> >=20
> > Fixes: c86d350aae68e ("arm64: dts: Add device tree for the Debix Model =
A Board")
> > Reported-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Closes: https://lore.kernel.org/all/20260323105858.GA2185714@killaraus.=
ideasonboard.com/
> > Signed-off-by: Peng Fan <peng.fan@nxp.com>
>=20
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Tested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>=20
> Frank, would you be able to handle this as a v7.0 regression fix ?
>=20
> I think the same is needed for imx8mp-debix-som-a.dtsi, but I can't
> confirm it as I don't have the schematics for the SoM, neither do I have
> access to the board.
>=20
> Dan, Kieran, Stefan, could one of you check if you get an interrupt
> storm from the PMIC on v7.0 ?

Confirmed:
 35:      83626          0          0          0 gpio-mxc   3 Level     pca=
9450-irq

 and

200:     270180          0          0          0    GICv3  67 Level     30a=
20000.i2c
...
200:     400925          0          0          0    GICv3  67 Level     30a=
20000.i2c
...

increasing rapidly on the debix-som.

I started out on the linux-media branches which were 7.0-rc2 based, and
this didn't happen but cherry-picking in 5d0efaf47ee90 certainly causes
this issue to occur on my board.

--
Kieran


>=20
> > ---
> >  arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dts | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dts b/a=
rch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dts
> > index 9422beee30b29c5a551b08476c80fbff96af3439..df7489587e48ed0c678f112=
91f6f2b77082ade95 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dts
> > +++ b/arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dts
> > @@ -440,7 +440,7 @@ MX8MP_IOMUXC_SAI5_RXC__I2C6_SDA                    =
               0x400001c3
> > =20
> >       pinctrl_pmic: pmicirqgrp {
> >               fsl,pins =3D <
> > -                     MX8MP_IOMUXC_GPIO1_IO03__GPIO1_IO03              =
               0x41
> > +                     MX8MP_IOMUXC_GPIO1_IO03__GPIO1_IO03              =
               0x000001c0
> >               >;
> >       };
> > =20
> >=20
> > ---
> > base-commit: 09c0f7f1bcdbc3c37a5a760cbec76bf18f278406
> > change-id: 20260324-imx8mp-dts-fix-512530fe4dcd
>=20
> --=20
> Regards,
>=20
> Laurent Pinchart


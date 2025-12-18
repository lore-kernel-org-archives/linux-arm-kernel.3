Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F13ABD6ACF5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 13:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WcCQUyAanMiEYrvNq9iAStk9tcLUZRd/bBACBVUca8c=; b=Kt6ElvGo2ihQG4xCklWP7mXdz2
	ldACx0PP8oqqp2isTI1/Wp1Ws3zDlbMkWGJ6Oq5hnx3uW7IbuzOpOFWJ9xIUb6161LFeMry0WWM12
	qQQfeW7doxV/BPuT6W9vBG9iHlV3Fbsjd3OPPuAIA4Xo8VBTyNpPL6EdpUQXzE3i73CKtNKn5YCw5
	x6ZCBkVOWxUovkpQtFbUBtoK63DTEvmvyyAKegHM+HckWUZTn+fVBiIlW8wB4deKcPF65mAVAzKcB
	1M6nGwKSeFt3HGOt6wriBKMC8O1HIR7OgQtwrcwl3N2oR+L9qOdk1ymWNWnlViyxNHK8j0tFXoIfO
	hO/msIcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWDn1-00000008VRY-4Bb9;
	Thu, 18 Dec 2025 13:11:32 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWDn0-00000008VR7-138b
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 13:11:31 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[IPv6:::1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <f.pflug@pengutronix.de>)
	id 1vWDme-0004ey-0I; Thu, 18 Dec 2025 14:11:08 +0100
Message-ID: <e15437918fc2e162eec92985e8f11f8e0de91246.camel@pengutronix.de>
Subject: Re: [PATCH v4 0/2] Add devicetree for NXP i.MX93 FRDM board
From: Fabian Pflug <f.pflug@pengutronix.de>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo
	 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, Lei Xu
 <lei.xu@nxp.com>, 	linux-kernel@vger.kernel.org, Krzysztof Kozlowski
 <krzk@kernel.org>, Haidong Zheng <haidong.zheng@nxp.com>, Daniel Baluta
 <daniel.baluta@nxp.com>, Danwei Luo	 <danwei.luo@nxp.com>,
 linux-arm-kernel@lists.infradead.org
Date: Thu, 18 Dec 2025 14:11:07 +0100
In-Reply-To: <9a96f664-00ba-4589-b3b8-a04355c0ad0b@pengutronix.de>
References: <20251218-fpg-nxp-imx93-frdm-v4-0-cd3a9f6ac89a@pengutronix.de>
	 <9a96f664-00ba-4589-b3b8-a04355c0ad0b@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: f.pflug@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_051130_313397_CA63D53A 
X-CRM114-Status: GOOD (  25.54  )
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

Hello Ahmad,

On Thu, 2025-12-18 at 13:52 +0100, Ahmad Fatoum wrote:
> Hello Fabian,
>=20
> On 12/18/25 12:39 PM, Fabian Pflug wrote:
> > Signed-off-by: Fabian Pflug <f.pflug@pengutronix.de>
> > ---
> > Changes in v4:
> > - remove it6263 block in i2c1, since it is not finished
> > - remove usdhc3 pwrsequence, since WLAN is not tested on my board
> > - remove eee-broken-1000t on phy2, since it is not broken
> > - update min/max-microvlt on buck converters
>=20
> I know you changed this due to reviewer feedback, but it was wrong
> advice. The Linux driver already has information about the minimum and
> maximum range support for the PMIC, what you need to write here is the
> actual board-level constraints.

Yeah, I know, that why I only updated the other two rails and changed to mi=
nimum for CPU 0.64 to 0.61V for core.
And 1.06 to 1.14V for DRAM, as it is the settings allowed by the CPU.

VCC3.3 and VCC1.8 were not changed, due to them being connected to multiple=
 devices and I did not want to make them
flexible, as it would be a hassle in the drivers.

Kind regards
Fabian

>=20
> I don't think the board will like VDD_3V3 at 1.62V or VDD_1V8 at 3.4V.
> For the fixed voltage rails just set min =3D max =3D fixed voltage.
>=20
> Thanks,
> Ahmad
>=20
> > - Link to v3: https://lore.kernel.org/r/20251022-fpg-nxp-imx93-frdm-v3-=
0-03ec40a1ccc0@pengutronix.de
> >=20
> > Changes in v3:
> > - Add Signed-off for original NXP contributors.
> > - Fixed whitespace errors (Thanks Francesco Valla)
> > - Added mu1 with status okay (Thanks Francesco Valla)
> > - Removed address cells from lpi2c3 (Thanks Frank Li)
> > - Configure pin for watchdog (Thanks Peng Fan)
> > - Updated regulator config
> > - Configure i2c0
> > - Link to v2: https://lore.kernel.org/r/20250526-fpg-nxp-imx93-frdm-v2-=
0-e5ad0efaec33@pengutronix.de
> >=20
> > Changes in v2:
> > - 1/2: remove CAN node, as it has not been tested.
> > - 1/2: ran dt-format (Thanks Frank Li)
> > 	But also reordered some nodes afterwards again to have
> > 	regulator-min before regulator-max, have the pinmux at the end
> > 	of the file, and have the regulator-name as the first node
> > 	inside the regulators.
> > 	Re-added comments, that were deleted.
> > - 1/2: changes subjet to ar64:dts (Thanks Fabio Estevan)
> > - 1/2: removed reg_vdd_12v (Tanks Fabio Estevan)
> > - 1/2: added aliases for rtc, emmc, serial (Thanks Fabio Estevan)
> > - reordered the series to have documentation before dts. (Thanks
> > =C2=A0 Krzystof Kozlowski)
> > - Link to v1: https://lore.kernel.org/r/20250523-fpg-nxp-imx93-frdm-v1-=
0-546b2d342855@pengutronix.de
> >=20
> > ---
> > Fabian Pflug (2):
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dt-bindings: arm: fsl: add i.MX93 11x11 =
FRDM board
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 arm64: dts: freescale: add support for N=
XP i.MX93 FRDM
> >=20
> > =C2=A0Documentation/devicetree/bindings/arm/fsl.yaml=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0=C2=A0 1 +
> > =C2=A0arch/arm64/boot/dts/freescale/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
> > =C2=A0arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts | 620 ++++++++=
+++++++++++++
> > =C2=A03 files changed, 622 insertions(+)
> > ---
> > base-commit: ea1013c1539270e372fc99854bc6e4d94eaeff66
> > change-id: 20250523-fpg-nxp-imx93-frdm-5cc180a1fda9
> >=20
> > Best regards,


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E63D4C44539
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 12:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8GUJifulnF9NKKvYooKjAvGy9FNr/AbbrtaqS1uKmFA=; b=N2G6bzQFVO93LGPUaifoAIQVdw
	P1NOGVjap6bRVKyGpAgkMuJNpm2h43pPjzpEVxBaZVS5Coj+L6BF060cUBbH5Azn3uT3dzdH1p3lb
	FUzQdfbJrFAaoRGxPg2BnKdRECQFX97pqr2SQ5UIyBbH5+k/MobeqxClwfv9l2inQNlkjAhGaLiBF
	TXMeEHOIO0l9pev4bqy/oFcjAUutKIHKWt6imbCRjywuNIIPc2obxHsd1Tr/S1YACToBYwUNipiY3
	AkttPKVQbldF0JhtNaPsEZmLpTBQi60VBkESIZWEKaNCvg16tqqG98SB9XqbvINADdXdsz9GydGU4
	SKC3QM2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmVvx-0000000BkGY-3VC8;
	Wed, 22 Jul 2026 12:20:21 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmVvu-0000000BkES-3WxR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 12:20:20 +0000
Received: from monstersaurus.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 34698447;
	Wed, 22 Jul 2026 14:19:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1784722756;
	bh=OR3C+MZQvvsJuOWJcFo5RnW0WVeS2gXhbaRmc10Nc0s=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=QnLtmuoqSRVW2RE4pWzzl2zfoCHKnNf4wS5ejRLNBzCXqZc2+HvRhttqGshbHEhhr
	 Hy9uicCJ6lyKN8MNEDwvaHBny+Wp9iBWq8p/wR0eQhIRP24sKvS+JsouJayamGKz13
	 rZI71iNII6zxmDUM3NYsxmT1UHZQ7CRjPVFfHiH4=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260722105914.GA72270@francesco-nb>
References: <20260713-v1-verdin-imx8mm-dtbos-v1-0-4acd63db4504@toradex.com> <20260713-v1-verdin-imx8mm-dtbos-v1-6-4acd63db4504@toradex.com> <al5mDqeFE8QVbUd9@lizhi-Precision-Tower-5810> <3ak4ffamwvdrtgw3bivzvrbtkmyh7g3lvuk4xwvdiuzizi3iu3@uxqvyif7rvpx> <178471622928.2174993.5439033710284861967@ping.linuxembedded.co.uk> <20260722105914.GA72270@francesco-nb>
Subject: Re: [PATCH 6/8] arm64: dts: freescale: imx8mm-verdin: Add Toradex OV5640 CSI Cameras
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Ernest Van Hoecke <ernestvanhoecke@gmail.com>, Frank Li <Frank.li@oss.nxp.com>, Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Francesco Dolcini <francesco.dolcini@toradex.com>, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
To: Francesco Dolcini <francesco@dolcini.it>, Francesco Dolcini <francesco.dolcini@toradex.com>
Date: Wed, 22 Jul 2026 13:20:13 +0100
Message-ID: <178472281366.2174993.11700327197935285507@ping.linuxembedded.co.uk>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_052019_028938_09457807 
X-CRM114-Status: GOOD (  28.47  )
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

Hi Francesco,

Quoting Francesco Dolcini (2026-07-22 11:59:14)
> Hello Kieran,
>=20
> On Wed, Jul 22, 2026 at 11:30:29AM +0100, Kieran Bingham wrote:
> > Quoting Ernest Van Hoecke (2026-07-22 10:27:32)
> > > On Mon, Jul 20, 2026 at 02:16:46PM -0400, Frank Li wrote:
> > > > On Mon, Jul 13, 2026 at 05:06:27PM +0200, Ernest Van Hoecke wrote:
> > > > > From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> > > > >
> > > > > Add device tree overlays for the Toradex OV5640 CSI Camera on Ver=
din CSI_1.
> > > > >
> > > > > The default overlay describes the current CSI Camera Set 5MP OV56=
40 with a
> > > > > 27 MHz on-board oscillator. Add a separate 24 MHz overlay for the=
 legacy
> > > > > camera module.
> > > > >
> > > > > Link: https://developer.toradex.com/hardware/accessories/cameras/=
csi-camera-module-5mp-ov5640-arducam
> > > > > Link: https://www.toradex.com/accessories/csi-camera-ov5640
> > > > > Link: https://developer.toradex.com/hardware/legacy-products/othe=
r/csi-camera-module-5mp-ov5640/
> > > > > Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> > > > > ---
> > > > >  arch/arm64/boot/dts/freescale/Makefile             |  6 ++
> > > > >  .../dts/freescale/imx8mm-verdin-ov5640-24mhz.dtso  | 17 +++++
> > > > >  .../boot/dts/freescale/imx8mm-verdin-ov5640.dtsi   | 78 ++++++++=
++++++++++++++
> > > > >  .../boot/dts/freescale/imx8mm-verdin-ov5640.dtso   | 18 +++++
> > > > >  4 files changed, 119 insertions(+)
> ...
> > I think with the Toradex ecosystem there would be some value in
> > supporting or helping with the ongoing dt-connectors or dt-addons topics
> > so that we can abstract the hardware which is being 'added'.
> >=20
> > I think it's important that we tackle the problem of combinatorial
> > explosions of overlays when we can add a component to multiple
> > platforms.
> >=20
> > For example, your OV5640 camera could be added to many different boards
> > - and each board could have many different cameras - in different ports.
> >=20
> > We should not be copy/pasting overlays for each combination, or we'll
> > have 'thousands' of identical overlays.
>=20
> I see your point, and I agree that it would be valuable to move this
> topic forward. I will raise it internally at Toradex and see how we can
> contribute.
>=20
> At the same time, quoting Marex (https://lore.kernel.org/all/dec2a7f6-80f=
d-4692-8936-969f8837a555@nabladev.com/):
>=20
>  | DT connectors have been discussed for the last 10 or so years and thre=
e=20
>  | is still no real progress.
>  |=20
>  | I would be happy to send a follow up patchset which would convert the =

>  | DTOs to whatever connector implementation format lands in the future, =

>  | but I am concerned that waiting for DT connectors will block this=20
>  | patchset from landing for a long time.

Indeed, it's been around for a long time - and yet the problem persists,
and that's why it worries me here. It won't be fixed until someone works
on it or supports the development.

Marex is an independent community developer - without someone buying produc=
ts
to support his development. It wouldn't be fair to push back on him
personnally. He has no mechanism to support the development required.

--
Kieran


>=20
>=20
> Francesco
>


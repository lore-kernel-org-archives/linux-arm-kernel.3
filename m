Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7751D5B16C
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Dec 2025 18:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zdiQTkAOufiIvzEhYaWnGreg+5cG/Js0Yz3ZDHwcCpI=; b=Jt6nUMjtxUc7gxOMv2w8eSJHLp
	kNwgDQN9a61VMCegRu1eg6dAeW1PZwteEcN5Z4wcXVKR1vqeVVnYA7mOfNulpYr5CJDPnKrRa1dQW
	TjUKTpDWhQpsXmZqhrCpxozI3kpJjm0iTW9tPWOL23F8o8S70DlFzQ9wOB1qUWXWL80UHmGy5uQDM
	o/KeefULsbvYcrETLlgq9vEqVl+W49ACp0B45JHVGFkr+RxJc2G0qSfTHsJJ4FB5g5hB1M8wGXOV2
	59UIx84qv9FVEduzSAddIQojAtk0SBMoq/rvK0Q+zDmKEmOxXKKwwNa3LNq9hEMRosxX2vl0ud/QI
	cOl2XFNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUrIi-00000002fDw-3tvz;
	Sun, 14 Dec 2025 18:58:36 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUrIc-00000002fD4-2qba
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Dec 2025 18:58:34 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1vUrI0-0002HV-1N; Sun, 14 Dec 2025 19:57:52 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1vUrHy-005enG-16;
	Sun, 14 Dec 2025 19:57:50 +0100
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1vUrHy-00786O-0Y;
	Sun, 14 Dec 2025 19:57:50 +0100
Date: Sun, 14 Dec 2025 19:57:50 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: Rob Herring <robh@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, barebox@lists.infradead.org,
	frieder.schrempf@kontron.de, annette.kobou@kontron.de,
	oualid.derouiche@kontron.de, eberhard.stoll@kontron.de
Subject: Re: [PATCH] ARM: dts: nxp/imx6: Drop unused .dtsi
Message-ID: <20251214185750.tzt6jf4zg5gtex63@pengutronix.de>
References: <20251212203226.458694-5-robh@kernel.org>
 <20251213181324.u32ztfblkknfpz44@pengutronix.de>
 <CAL_JsqK9OREenZjBHrDh7AqsyUXYOzTOhY4e0qHGzYkX8tacWQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAL_JsqK9OREenZjBHrDh7AqsyUXYOzTOhY4e0qHGzYkX8tacWQ@mail.gmail.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251214_105830_794584_C33AE060 
X-CRM114-Status: GOOD (  26.80  )
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

On 25-12-14, Rob Herring wrote:
> On Sat, Dec 13, 2025 at 12:13 PM Marco Felsch <m.felsch@pengutronix.de> wrote:
> >
> > Hi Rob,
> >
> > On 25-12-12, Rob Herring (Arm) wrote:
> > > These .dtsi files are not included anywhere in the tree and can't be
> > > tested.
> >
> > not in the tree but by other projects, please see below.
> >
> > > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> > > ---
> > >  .../dts/nxp/imx/imx6dl-kontron-samx6i.dtsi    | 12 -----
> > >  .../dts/nxp/imx/imx6q-kontron-samx6i.dtsi     | 12 -----
> > >  .../boot/dts/nxp/imx/imx6qdl-pico-dwarf.dtsi  | 45 ----------------
> > >  .../boot/dts/nxp/imx/imx6qdl-pico-nymph.dtsi  | 54 -------------------
> > >  4 files changed, 123 deletions(-)
> > >  delete mode 100644 arch/arm/boot/dts/nxp/imx/imx6dl-kontron-samx6i.dtsi
> > >  delete mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-kontron-samx6i.dtsi
> > >  delete mode 100644 arch/arm/boot/dts/nxp/imx/imx6qdl-pico-dwarf.dtsi
> > >  delete mode 100644 arch/arm/boot/dts/nxp/imx/imx6qdl-pico-nymph.dtsi
> > >
> > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-kontron-samx6i.dtsi b/arch/arm/boot/dts/nxp/imx/imx6dl-kontron-samx6i.dtsi
> > > deleted file mode 100644
> > > index 5a9b819d7ee8..000000000000
> > > --- a/arch/arm/boot/dts/nxp/imx/imx6dl-kontron-samx6i.dtsi
> > > +++ /dev/null
> > > @@ -1,12 +0,0 @@
> > > -// SPDX-License-Identifier: GPL-2.0 OR X11
> > > -/*
> > > - * Copyright 2019 (C) Pengutronix, Marco Felsch <kernel@pengutronix.de>
> > > - */
> > > -
> > > -#include "imx6dl.dtsi"
> > > -#include "imx6qdl-kontron-samx6i.dtsi"
> > > -
> > > -/ {
> > > -     model = "Kontron SMARC-sAMX6i Dual-Lite/Solo";
> > > -     compatible = "kontron,imx6dl-samx6i", "fsl,imx6dl";
> > > -};
> > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-kontron-samx6i.dtsi b/arch/arm/boot/dts/nxp/imx/imx6q-kontron-samx6i.dtsi
> > > deleted file mode 100644
> > > index e76963436079..000000000000
> > > --- a/arch/arm/boot/dts/nxp/imx/imx6q-kontron-samx6i.dtsi
> > > +++ /dev/null
> > > @@ -1,12 +0,0 @@
> > > -// SPDX-License-Identifier: GPL-2.0 OR X11
> > > -/*
> > > - * Copyright 2019 (C) Pengutronix, Marco Felsch <kernel@pengutronix.de>
> > > - */
> > > -
> > > -#include "imx6q.dtsi"
> > > -#include "imx6qdl-kontron-samx6i.dtsi"
> > > -
> > > -/ {
> > > -     model = "Kontron SMARC-sAMX6i Quad/Dual";
> > > -     compatible = "kontron,imx6q-samx6i", "fsl,imx6q";
> > > -};
> >
> > I can't speak for the other two .dtsi files but both kontron .dtsi files
> > are used by barebox:
> >
> >  - https://elixir.bootlin.com/barebox/v2025.11.0/source/arch/arm/dts/imx6dl-samx6i.dts#L8
> >  - https://elixir.bootlin.com/barebox/v2025.11.0/source/arch/arm/dts/imx6q-samx6i.dts#L8
> >
> > Removing them here will cause a regression for barebox.
> 
> Please upstream something that uses the .dtsi. Other than the
> undocumented barebox property, no reason these can't be.

My intention wasn't to point to the barebox-only
"barebox,disable-deep-probe" property. I was refering to the include
line.

The two .dtsi files we're talking about are SoM .dtsi files. We don't
have access to the Kontron EVK baseboard which uses this SoM.

I've added a few Kontron devs which may can add the missing baseboard
support.

+Cc: frieder.schrempf@kontron.de
+Cc: annette.kobou@kontron.de
+Cc: oualid.derouiche@kontron.de
+Cc: eberhard.stoll@kontron.de

I could also add the imx6dl-samx6i.dts and imx6q-samx6i.dts like we do
in barebox. But as said, this would be a devicetree for a SoM which
makes sense for the bootloader but not for the kernel.

Regards,
  Marco


> 
> Rob
> 

-- 
#gernperDu 
#CallMeByMyFirstName

Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | https://www.pengutronix.de/ |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-9    |


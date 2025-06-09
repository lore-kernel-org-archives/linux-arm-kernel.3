Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D91A2C5B552
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 15:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x+smXdzbnTzkipKZ/URNR/f2iTlhGoSY2Qlkjkw+Pk8=; b=ILn7/1cuTbl7p9tHp0Ti9kZrUk
	4HEgeUkL6XXcAeYpaEqdcTUiJlJcfqV06Dm36u9gQqAyhPYEA7t2VZWzE7l7YBivjowOOLxT08zzN
	VkEY35CWrRtw5vqJPM1d88B+iJ2JWbP4+H9EmVC4kN2g/BLkbOtlFQETNAgc/apG2yYSbDyOomKi4
	tIbGYMnV5p+gCcpYsUoZCdqlh3dNvEglY7OJuthygyrPJm1zZQEnQu3mb9NlF9am/IlKvyzKnwad5
	xetGgQyQdomhXD4i/sON+5ef7Frhf8MlZz8OHISKdOozf9qxpk69oQtod5P8FCApNUHb6baqxknR+
	tNtkuCfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOeXl-00000004XbU-2sFD;
	Mon, 09 Jun 2025 15:36:13 +0000
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOe6r-00000004T8D-0VZJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Jun 2025 15:08:26 +0000
Received: by mail-yb1-xb33.google.com with SMTP id 3f1490d57ef6-e694601f624so3149460276.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Jun 2025 08:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1749481704; x=1750086504; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x+smXdzbnTzkipKZ/URNR/f2iTlhGoSY2Qlkjkw+Pk8=;
        b=hg8zVH0slKhGZSs8Lfr3q+YjJ3SvwZ3QNUx5KKIbizik09x2HESxhW3KGkEv4o1oPo
         HYngqysja8mBPVNqsrcaFnRc74QCO6HVRHOKC6NAR3cU8/Uycdn/ooflBc/bQ4sAXvEu
         dQNXWs0ToIC99QL7PJl1cQYOOp/Pz8ErPS+4o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749481704; x=1750086504;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x+smXdzbnTzkipKZ/URNR/f2iTlhGoSY2Qlkjkw+Pk8=;
        b=QnMGdiySe7tojkY7XK9ZY8ONuHoyfw/OJIXqQq2pM/++9+z8JuKFcC1C2ZFcOrQsux
         9HaeR3XWDeFqGhH1E9pKTtgTYioq8hNANBkmuRIRpLQHuXrEsOgCMjAByDd61D7pvZBD
         QR+gsxDRQfAUpDmrOPumZg7xYgLL50wT07UNwT72u9MZURmeCFGjxcKBrWEga1IO6Bh0
         HIeQiRRR/jXv59aMyNgXgEPsx7ryBU1JKivduD5zQd2qzCvATb2nOV+N6LXo5eAbpw3x
         Dbj86dEuqouivho2PLUETPcSak65pifSBEUY5QFfwXzD79vp3IexVAr3BlIBPavJR1KL
         kCHw==
X-Forwarded-Encrypted: i=1; AJvYcCV4P010qRnuENxnQ+M7bwCQbpBGOOxXcuizRy7cFmUzv8lWb3f+Mz954BAPQ4YfcbdIv3ckWB+8VgRo8SSCKHJ6@lists.infradead.org
X-Gm-Message-State: AOJu0YxlStAkRdxAq+6geIBuH3wd811qY1QcVqr2xtFD9nXDlxhgASum
	U2r4Cu1Tfv8RsKlOk8I2IbkuAgBwzmsYUcZbYymtgPgO7BrcxMWLc63msFNpIfsxhKZSPEauLeM
	RhGTsWJFFqcAORuZKyWXxa3gc1IMkv1/Mtv2ui3sGYw==
X-Gm-Gg: ASbGncstnDyHhLbfB4yW0S+QEzexKdF+SlDFdUdz/cTR3ztwIz88RAr0nPEyQNFARaW
	x+b4n6c6ifGlToDMlnZpnwbZjo0lEZwvhvb8arBGutkYcl0+0y2r8AMAHoVvTVDVnR29H80Ylwv
	YDgopzOTPbaCJ3fBBoLorUp7MifDy/BA==
X-Google-Smtp-Source: AGHT+IGWeHbdh3O/z4F1SRgYEltcGRfcEHSD7V4hOn6ole1VQ4KjcZtPvIWPOt0TiMXPWHw0tvG0AyUJrHsqEFKBpiA=
X-Received: by 2002:a05:6902:1546:b0:e7d:8eee:ae8f with SMTP id
 3f1490d57ef6-e81a22b0e19mr21079312276.19.1749481704110; Mon, 09 Jun 2025
 08:08:24 -0700 (PDT)
MIME-Version: 1.0
References: <20250609101637.2322809-1-dario.binacchi@amarulasolutions.com> <174948105106.2282643.172324663412189128.robh@kernel.org>
In-Reply-To: <174948105106.2282643.172324663412189128.robh@kernel.org>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Mon, 9 Jun 2025 17:08:12 +0200
X-Gm-Features: AX0GCFu7PzsfDvF842eUkzXyordNhd1acsYRKIzmAppp3qtvrKjzob8AA4_bZEY
Message-ID: <CABGWkvpv-0QjAgz_j3QMJvSO0gpzxY07GpkT0SWL1zEY0Y_ufg@mail.gmail.com>
Subject: Re: [PATCH v2 00/10] Support Engicam MicroGEA boards
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>, Andreas Kemnade <andreas@kemnade.info>, 
	Peng Fan <peng.fan@nxp.com>, Russell King <linux@armlinux.org.uk>, 
	Frieder Schrempf <frieder.schrempf@kontron.de>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, Marek Vasut <marex@denx.de>, 
	Dmitry Baryshkov <lumag@kernel.org>, Stefan Eichenberger <stefan.eichenberger@toradex.com>, 
	Alexander Stein <alexander.stein@ew.tq-group.com>, Eric Biggers <ebiggers@google.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Fabio Estevam <festevam@denx.de>, 
	Matteo Lisi <matteo.lisi@engicam.com>, 
	Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>, 
	Primoz Fiser <primoz.fiser@norik.com>, Max Merchel <Max.Merchel@ew.tq-group.com>, 
	Michael Walle <mwalle@kernel.org>, Tim Harvey <tharvey@gateworks.com>, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	Markus Niebel <Markus.Niebel@tq-group.com>, linux-amarula@amarulasolutions.com, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Francesco Dolcini <francesco.dolcini@toradex.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_080825_172836_00535EC5 
X-CRM114-Status: GOOD (  27.72  )
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

Hi Rob,

On Mon, Jun 9, 2025 at 5:01=E2=80=AFPM Rob Herring (Arm) <robh@kernel.org> =
wrote:
>
>
> On Mon, 09 Jun 2025 12:15:33 +0200, Dario Binacchi wrote:
> > The series adds support for Engicam MicroGEA boards:
> >
> > - BMM
> > - RMM
> > - GTW
> >
> > based on MicroGEA-MX6UL SoM.
> >
> > Changes in v2:
> > - Change local-mac-address to 00 00 00 00 00 00. The actual value will
> >   be set by the bootloader. The previous one was assigned to Freescale
> >   Semiconductor.
> > - Move iomuxc and iomuxc_snvs nodes to the end of the DTS files.
> > - Drop an extra blank line from the DTS file.
> >
> > Dario Binacchi (10):
> >   dt-bindings: arm: fsl: support Engicam MicroGEA BMM board
> >   ARM: dts: imx6ul: support Engicam MicroGEA-MX6UL SoM
> >   ARM: dts: imx6ul: support Engicam MicroGEA BMM board
> >   ARM: imx_v6_v7_defconfig: cleanup mxs_defconfig
> >   ARM: imx_v6_v7_defconfig: select CONFIG_INPUT_PWM_BEEPER
> >   dt-bindings: arm: fsl: support Engicam MicroGEA RMM board
> >   ARM: dts: imx6ul: support Engicam MicroGEA RMM board
> >   dt-bindings: arm: fsl: support Engicam MicroGEA GTW board
> >   ARM: dts: imx6ul: support Engicam MicroGEA GTW board
> >   ARM: imx_v6_v7_defconfig: select CONFIG_USB_HSIC_USB3503
> >
> >  .../devicetree/bindings/arm/fsl.yaml          |   9 +
> >  arch/arm/boot/dts/nxp/imx/Makefile            |   3 +
> >  .../nxp/imx/imx6ull-engicam-microgea-bmm.dts  | 305 +++++++++++++++
> >  .../nxp/imx/imx6ull-engicam-microgea-gtw.dts  | 163 ++++++++
> >  .../nxp/imx/imx6ull-engicam-microgea-rmm.dts  | 362 ++++++++++++++++++
> >  .../dts/nxp/imx/imx6ull-engicam-microgea.dtsi |  96 +++++
> >  arch/arm/configs/imx_v6_v7_defconfig          |  27 +-
> >  7 files changed, 944 insertions(+), 21 deletions(-)
> >  create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-=
bmm.dts
> >  create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-=
gtw.dts
> >  create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-=
rmm.dts
> >  create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea.=
dtsi
> >
> > --
> > 2.43.0
> >
> > base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
> > branch: imx6ull-engicam-microgea
> >
> >
>
>
> My bot found new DTB warnings on the .dts files added or changed in this
> series.
>
> Some warnings may be from an existing SoC .dtsi.

Yes, these warnings are generated by included .dtsi files and also appear i=
n
other boards that have already been merged into mainline.
IMHO I have already addressed and fixed the warnings introduced by my board=
s
during the tests executed before submitting the series.

Thanks and regards,
Dario

> Or perhaps the warnings
> are fixed by another series. Ultimately, it is up to the platform
> maintainer whether these warnings are acceptable or not. No need to reply
> unless the platform maintainer has comments.
>
> If you already ran DT checks and didn't see these error(s), then
> make sure dt-schema is up to date:
>
>   pip3 install dtschema --upgrade
>
>
> This patch series was applied (using b4) to base:
>  Base: using specified base-commit 19272b37aa4f83ca52bdf9c16d5d81bdd13544=
94
>
> If this is not the correct base, please add 'base-commit' tag
> (or use b4 which does this automatically)
>
> New warnings running 'make CHECK_DTBS=3Dy for arch/arm/boot/dts/nxp/' for=
 20250609101637.2322809-1-dario.binacchi@amarulasolutions.com:
>
> arch/arm/boot/dts/nxp/imx/imx6ull-colibri-aster.dtb: cpu@0 (arm,cortex-a7=
): Unevaluated properties are not allowed ('fsl,soc-operating-points', 'soc=
-supply' were unexpected)
>         from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
> arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-bmm.dtb: cpu@0 (arm,co=
rtex-a7): Unevaluated properties are not allowed ('fsl,soc-operating-points=
', 'soc-supply' were unexpected)
>         from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
> arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-bmm.dtb: nand-controll=
er@1806000 (fsl,imx6q-gpmi-nand): Unevaluated properties are not allowed ('=
nand-ecc-mode', 'nand-ecc-step-size', 'nand-ecc-strength', 'nand-on-flash-b=
bt' were unexpected)
>         from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml=
#
> arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-rmm.dtb: cpu@0 (arm,co=
rtex-a7): Unevaluated properties are not allowed ('fsl,soc-operating-points=
', 'soc-supply' were unexpected)
>         from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
> arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-rmm.dtb: nand-controll=
er@1806000 (fsl,imx6q-gpmi-nand): Unevaluated properties are not allowed ('=
nand-ecc-mode', 'nand-ecc-step-size', 'nand-ecc-strength', 'nand-on-flash-b=
bt' were unexpected)
>         from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml=
#
> arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-gtw.dtb: cpu@0 (arm,co=
rtex-a7): Unevaluated properties are not allowed ('fsl,soc-operating-points=
', 'soc-supply' were unexpected)
>         from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
> arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-gtw.dtb: nand-controll=
er@1806000 (fsl,imx6q-gpmi-nand): Unevaluated properties are not allowed ('=
nand-ecc-mode', 'nand-ecc-step-size', 'nand-ecc-strength', 'nand-on-flash-b=
bt' were unexpected)
>         from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml=
#
>
>
>
>
>


--=20

Dario Binacchi

Senior Embedded Linux Developer

dario.binacchi@amarulasolutions.com

__________________________________


Amarula Solutions SRL

Via Le Canevare 30, 31100 Treviso, Veneto, IT

T. +39 042 243 5310
info@amarulasolutions.com

www.amarulasolutions.com


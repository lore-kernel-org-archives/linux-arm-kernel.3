Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 694A0D29C35
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 14:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AsvQ2zJ7s3smC+R/QqXVjJF4VqszKAjpYjPROPGYE4Q=; b=Qt9wvej8AS88sCQXMFigp3UqK5
	gdZIunY0HZva9vM652rJIZFtYxn3Fpc5tVyt/hta3ZhdlJ88PEPNtkIWb/B65V4iQL6xE4Dam+Uxp
	JuHEglIEu8Xs9Z2lgHWGk6XuafO9ftrkJoBNc7/5SWdqELKYerP2L0tSpWTri2ZVEmkIyd+DV4EoM
	6w6ePkvvRhEi4rPTscJktLZg/iTqRvm/x6ETfmUq/Vu+F1N8DXF3RGLMbCpc8Lx/udXj7j/R7ggEQ
	a44mJ0oyFT9dVgrMOVrbIl3y8Yr6vwLPeof2s58teaqHrginjVYaQH4kl6gy3vhzDQ1UD8RJp4zXA
	LjjnAC4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhqSl-00000002Hgr-3GYm;
	Mon, 19 Jan 2026 14:42:39 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhqSi-00000002HgI-3cXi;
	Mon, 19 Jan 2026 14:42:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=AsvQ2zJ7s3smC+R/QqXVjJF4VqszKAjpYjPROPGYE4Q=; b=cn1seQWzl/iLfmmO6+CMpmb350
	VHnVMD9ksyl1/5DHJeogTzxTX6H1plvLzU996/2yup/mq03j0vmGQU4RfV0xCHVKPCK0RWCaY8sXL
	KN1n4nHe9rDKaruXEaFZes4OZruJTdi+AkXkTGBPNcIwWNag/jOQ9mnnDK8Y0wLK+767QKAhD2meb
	Weeww8Yh/1zIZKULoE6GPb4hoUqqLHyf2q9Digx6Mo1y7C7G4Iw2EdzwraSAOKeWIRfXkiW8ldTBr
	unRZ7xWhcF1WvI+FmEdegEA7uIc3N3aluN/76kK/C7cCePseM0SuwfgaTspHpOZiIbkjZlJ6IK0+S
	tw2Y4G1w==;
Received: from i53875a9c.versanet.de ([83.135.90.156] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vhqSW-0036qc-2O; Mon, 19 Jan 2026 15:42:24 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Quentin Schulz <quentin.schulz@cherry.de>,
 Alexey Charkov <alchark@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Shawn Lin <shawn.lin@rock-chips.com>,
 Manivannan Sadhasivam <mani@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: Explicitly request UFS reset pin on RK3576
Date: Mon, 19 Jan 2026 15:42:23 +0100
Message-ID: <8960787.MhkbZ0Pkbq@diego>
In-Reply-To: <CABjd4YympEqbiN9-Kwv40YtaCh6bu=3PBQPyvvGgKCQbLeZmZw@mail.gmail.com>
References: <20260119-ufs-rst-v1-1-c8e96493948c@gmail.com>
 <d3b5f622-36ec-42ea-90da-3c056e1b6461@cherry.de>
 <CABjd4YympEqbiN9-Kwv40YtaCh6bu=3PBQPyvvGgKCQbLeZmZw@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_064237_136253_02A7732A 
X-CRM114-Status: GOOD (  50.09  )
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

Am Montag, 19. Januar 2026, 15:05:16 Mitteleurop=C3=A4ische Normalzeit schr=
ieb Alexey Charkov:
> On Mon, Jan 19, 2026 at 5:58=E2=80=AFPM Quentin Schulz <quentin.schulz@ch=
erry.de> wrote:
> >
> > Hi Alexey,
> >
> > On 1/19/26 2:43 PM, Alexey Charkov wrote:
> > > Hi Quentin,
> > >
> > > On Mon, Jan 19, 2026 at 3:08=E2=80=AFPM Quentin Schulz <quentin.schul=
z@cherry.de> wrote:
> > >>
> > >> Hi Alexey,
> > >>
> > >> On 1/19/26 10:22 AM, Alexey Charkov wrote:
> > >>> Rockchip RK3576 UFS controller uses a dedicated pin to reset the co=
nnected
> > >>> UFS device, which can operate either in a hardware controlled mode =
or as a
> > >>> GPIO pin.
> > >>>
> > >>> Power-on default is GPIO mode, but the boot ROM reconfigures it to a
> > >>> hardware controlled mode if it uses UFS to load the next boot stage.
> > >>>
> > >>> Given that existing bindings (and rk3576.dtsi) expect a GPIO-contro=
lled
> > >>> device reset, request the required pin config explicitly.
> > >>>
> > >>> This doesn't appear to affect Linux, but it does affect U-boot:
> > >>>
> > >>> Before:
> > >>> =3D> md.l 0x2604b398
> > >>> 2604b398: 00000011 00000000 00000000 00000000  ................
> > >>> < ... snip ... >
> > >>> =3D> ufs init
> > >>> ufshcd-rockchip ufshc@2a2d0000: [RX, TX]: gear=3D[3, 3], lane[2, 2]=
, pwr[FASTAUTO_MODE, FASTAUTO_MODE], rate =3D 2
> > >>> =3D> md.l 0x2604b398
> > >>> 2604b398: 00000011 00000000 00000000 00000000  ................
> > >>>
> > >>> After:
> > >>> =3D> md.l 0x2604b398
> > >>> 2604b398: 00000011 00000000 00000000 00000000  ................
> > >>> < ... snip ...>
> > >>> =3D> ufs init
> > >>> ufshcd-rockchip ufshc@2a2d0000: [RX, TX]: gear=3D[3, 3], lane[2, 2]=
, pwr[FASTAUTO_MODE, FASTAUTO_MODE], rate =3D 2
> > >>> =3D> md.l 0x2604b398
> > >>> 2604b398: 00000010 00000000 00000000 00000000  ................
> > >>>
> > >>> (0x2604b398 is the respective pin mux register, with its BIT0 drivi=
ng the
> > >>> mode of UFS_RST: unset =3D GPIO, set =3D hardware controlled UFS_RS=
T)
> > >>>
> > >>> This helps ensure that GPIO-driven device reset actually fires when=
 the
> > >>> system requests it, not when whatever black box magic inside the UF=
SHC
> > >>> decides to reset the flash chip.
> > >>>
> > >>> Cc: stable@vger.kernel.org
> > >>> Fixes: c75e5e010fef ("scsi: arm64: dts: rockchip: Add UFS support f=
or RK3576 SoC")
> > >>> Reported-by: Quentin Schulz <quentin.schulz@cherry.de>
> > >>> Signed-off-by: Alexey Charkov <alchark@gmail.com>
> > >>> ---
> > >>> This has originally surfaced during the review of UFS patches for U=
=2Dboot
> > >>> at [1], where it was found that the UFS reset line is not requested=
 to be
> > >>> configured as GPIO but used as such. This leads in some cases to th=
e UFS
> > >>> driver appearing to control device resets, while in fact it is the
> > >>> internal controller logic that drives the reset line (perhaps in
> > >>> unexpected ways).
> > >>>
> > >>> Thanks Quentin Schulz for spotting this issue.
> > >>>
> > >>> [1] https://lore.kernel.org/u-boot/259fc358-f72b-4a24-9a71-ad90f208=
1335@cherry.de/
> > >>> ---
> > >>>    arch/arm64/boot/dts/rockchip/rk3576-pinctrl.dtsi | 7 +++++++
> > >>>    arch/arm64/boot/dts/rockchip/rk3576.dtsi         | 2 +-
> > >>>    2 files changed, 8 insertions(+), 1 deletion(-)
> > >>>
> > >>> diff --git a/arch/arm64/boot/dts/rockchip/rk3576-pinctrl.dtsi b/arc=
h/arm64/boot/dts/rockchip/rk3576-pinctrl.dtsi
> > >>> index 0b0851a7e4ea..20cfd3393a75 100644
> > >>> --- a/arch/arm64/boot/dts/rockchip/rk3576-pinctrl.dtsi
> > >>> +++ b/arch/arm64/boot/dts/rockchip/rk3576-pinctrl.dtsi
> > >>> @@ -5228,6 +5228,13 @@ ufs_rst: ufs-rst {
> > >>>                                /* ufs_rstn */
> > >>>                                <4 RK_PD0 1 &pcfg_pull_none>;
> > >>>                };
> > >>> +
> > >>> +             /omit-if-no-ref/
> > >>> +             ufs_rst_gpio: ufs-rst-gpio {
> > >>> +                     rockchip,pins =3D
> > >>> +                             /* ufs_rstn */
> > >>> +                             <4 RK_PD0 RK_FUNC_GPIO &pcfg_pull_non=
e>;
> > >>
> > >> The SoC default is pull-down according to the TRM. Can you check ple=
ase?
> > >> For example, the Rock 4D doesn't seem to have a hardware pull-up or
> > >> pull-down on the line and the UFS module only seems to have a deboun=
cer
> > >> (capacitor between the line and ground). So except if the chip itself
> > >> has a PU/PD, this may be an issue?
> > >
> > > The SoC default is indeed pull-down (as stated both in the TRM and in
> > > the reference schematic from RK3576 EVB1). Which I believe means that
> > > the attached device should be held in a reset state until the driver
> > > takes over the control of the GPIO line (which, in turn, is consistent
> > > with the observed behavior when reset handling is not enabled in the
> > > driver but the reset pin is in GPIO mode).
> > >
> > > Are you concerned that the chip might unintentionally go in or out of
> > > reset between the moment the pinctrl subsystem claims the pin and the
> > > moment the driver starts outputting a state it desires? This hasn't
> >
> > Exactly that.
> >
> > Imagine for some reason the driver EPROBE_DEFER, there can be a lot of
> > time between the original pinconf/pinmux and the time the GPIO is
> > actually driven.
> >
> > At the same time.. I guess it may not matter much if the UFS chip gets
> > out of reset temporarily as (I assume) when the UFS controller probes
> > properly, it'll do a full reset of the UFS chip via the reset GPIO.
> > Don't know anything about UFS, so maybe there could be damage if the UFS
> > chip gets out of reset if its supplies or IO lines are in an illegal st=
ate?
> >
> > > caused any observable issues in my testing, but I guess we could
> > > explicitly set it to &pcfg_pull_down for more predictable behavior in
> > > line with what's printed on the schematic.
> > >
> >
> > s/schematics/TRM/
> >
> > I'll let Heiko decide but I would personally go for a PD to match the
> > default state of the SoC according to the TRM.
>=20
> Happy to make a v2 with an explicit pull-down. Will wait a bit for any
> other potential feedback though.

I'd side with Quentin here, having the pin firmly on one state, when no-one
(board nor driver) is caring would be my preference.
Especially as Quentin said, this is the hardware-default too.

Heiko




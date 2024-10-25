Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA12FD10399
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 15:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bUPVH4MdHcWdQggcKtN+8M2dCOAXvqWyXtxOCgPjtnM=; b=G7NfpABYWIhfR1VaW3DmiRfqX4
	9lcnZUqbPU1RswsoWrn2UgrXdEiOyoajvAQUO4LoC3u2NADPVKmhw8P8vzIVl6zD8PLUM9Ze1evt+
	TU7ZvmteBBTEqGG8ZowszBFyWBuOAOYJkfFNqnk/IUhCqheVwjcG9hQY7h8K0MfwZo6uUsgaj+XoB
	+owlw+L8mfqO0Q5rTPfi034+qJuMm6skiTMd7msUL8KeN0AmRE0DhET7Ygwef3IsCYJwN3rmiuyVK
	mDmZc5/4oVbg0iy4YtD0gqRRUFIevtQTroRe1A6cskprLouphg/tMNCdEyY3vmCUHHd5CL+4yM/5R
	QHcSEgRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4MS5-00000004I2o-31Xf;
	Fri, 25 Oct 2024 15:42:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4MC8-00000004Ek4-2GYV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 15:25:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4DA69339;
	Fri, 25 Oct 2024 08:26:13 -0700 (PDT)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DA4AB3F73B;
	Fri, 25 Oct 2024 08:25:41 -0700 (PDT)
Date: Fri, 25 Oct 2024 16:25:39 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH] ARM: dts: cubieboard4: Fix DCDC5 regulator constraints
Message-ID: <20241025162539.425660a2@donnerap.manchester.arm.com>
In-Reply-To: <CAGb2v65oHDkNG4dp3+Zh-wmMTMvRnBNPGLiGi68WGXzSR+64=g@mail.gmail.com>
References: <20241007222916.19013-1-andre.przywara@arm.com>
	<CAGb2v65oHDkNG4dp3+Zh-wmMTMvRnBNPGLiGi68WGXzSR+64=g@mail.gmail.com>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_082544_758080_D9C8C3AF 
X-CRM114-Status: GOOD (  26.23  )
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

On Fri, 25 Oct 2024 22:42:14 +0800
Chen-Yu Tsai <wens@csie.org> wrote:

> On Tue, Oct 8, 2024 at 6:30=E2=80=AFAM Andre Przywara <andre.przywara@arm=
.com> wrote:
> >
> > The DCDC5 voltage rail in the X-Powers AXP809 PMIC has a resolution of
> > 50mV, so the currently enforced limits of 1.475 and 1.525 volts cannot
> > be set, when the existing regulator value is beyond this range.
> >
> > This will lead to the whole regulator driver to give up and fail
> > probing, which in turn will hang the system, as essential devices depend
> > on the PMIC.
> > In this case a bug in U-Boot set the voltage to 1.75V (meant for DCDC4),
> > and the AXP driver's attempt to correct this lead to this error:
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > [    4.447653] axp20x-rsb sunxi-rsb-3a3: AXP20X driver loaded
> > [    4.450066] vcc-dram: Bringing 1750000uV into 1575000-1575000uV
> > [    4.460272] vcc-dram: failed to apply 1575000-1575000uV constraint: =
-EINVAL
> > [    4.474788] axp20x-regulator axp20x-regulator.0: Failed to register =
dcdc5
> > [    4.482276] axp20x-regulator axp20x-regulator.0: probe with driver a=
xp20x-regulator failed with error -22
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> > Set the limits to values that can be programmed, so any correction will
> > be successful.
> >
> > Signed-off-by: Andre Przywara <andre.przywara@arm.com> =20
>=20
> Maybe
>=20
> Fixes: 1e1dea72651b ("ARM: dts: sun9i: cubieboard4: Add AXP809 PMIC
> device node and regulators")
>=20
> What do you think? I can add it when applying.

Well, I thought about it, but then it's a DT patch, so the Fixes: tag
doesn't make much sense here, IMHO. Put it there if you see fit, but for
my part I am just waiting for the commit hash, to pull into U-Boot, and
then it would be done, even for older kernels.

Cheers,
Andre.

> ChenYu
>=20
> > ---
> >  arch/arm/boot/dts/allwinner/sun9i-a80-cubieboard4.dts | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/arm/boot/dts/allwinner/sun9i-a80-cubieboard4.dts b/ar=
ch/arm/boot/dts/allwinner/sun9i-a80-cubieboard4.dts
> > index c8ca8cb7f5c94..52ad95a2063aa 100644
> > --- a/arch/arm/boot/dts/allwinner/sun9i-a80-cubieboard4.dts
> > +++ b/arch/arm/boot/dts/allwinner/sun9i-a80-cubieboard4.dts
> > @@ -280,8 +280,8 @@ reg_dcdc4: dcdc4 {
> >
> >                         reg_dcdc5: dcdc5 {
> >                                 regulator-always-on;
> > -                               regulator-min-microvolt =3D <1425000>;
> > -                               regulator-max-microvolt =3D <1575000>;
> > +                               regulator-min-microvolt =3D <1450000>;
> > +                               regulator-max-microvolt =3D <1550000>;
> >                                 regulator-name =3D "vcc-dram";
> >                         };
> >
> > --
> > 2.46.2
> > =20



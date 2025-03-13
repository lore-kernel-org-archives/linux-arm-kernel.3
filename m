Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE8DAC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 10:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bCwKevtvmgT+PCAKwwme/n8Fa5uxBbV586zEMVI7c/k=; b=GO7j1pwZPnM3DFC0Nm93f4Ygi0
	3dLv10nMxnI3KJSIQueX8uObmD+Ay9okOUrcqD5NNbYK9p8RWP2JNonk7+cGvRkGN95c529PeaVEO
	sRrU5OOyc8Qi9aQfYOkt5sRIidd68yifspJ2NVowa4X7vscqcB8/D6IPv729i28246j3O31NB/q0Z
	MjcuhoF9BC2YkIl384TYbuCIQ1aFbRMx+xOgIr+q4Fuk8D4n2GyMcLQR0VvdD/h/lCuji1KeqQYOp
	REVFZ8VKDVr6edH+BK11TMCrfBLDvH4/oWXVourTZ7Q5+PUeCY3cwNK7F+UWMz0qI5U0rmzZhDwug
	mv1/4qFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsg1M-0000000AuS1-2DLp;
	Thu, 13 Mar 2025 10:42:36 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsfzg-0000000Att4-00eE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Mar 2025 10:40:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0763C12FC;
	Thu, 13 Mar 2025 03:40:59 -0700 (PDT)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D83F23F694;
	Thu, 13 Mar 2025 03:40:46 -0700 (PDT)
Date: Thu, 13 Mar 2025 10:40:42 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Michael Klein <michael@fossekall.de>
Cc: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Samuel Holland
 <samuel@sholland.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] ARM: dts: bananapi: add support for PHY LEDs
Message-ID: <20250313104042.694c1856@donnerap.manchester.arm.com>
In-Reply-To: <Z9KYqlfUYxRaWnGQ@a98shuttle.de>
References: <20250312193629.85417-1-michael@fossekall.de>
	<20250312193629.85417-2-michael@fossekall.de>
	<4637912.LvFx2qVVIh@jernej-laptop>
	<Z9KYqlfUYxRaWnGQ@a98shuttle.de>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_034052_129152_228668C9 
X-CRM114-Status: GOOD (  22.18  )
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

On Thu, 13 Mar 2025 09:34:50 +0100
Michael Klein <michael@fossekall.de> wrote:

Hi,

> On Thu, Mar 13, 2025 at 07:07:24AM +0100, Jernej =C5=A0krabec wrote:
> >Dne sreda, 12. marec 2025 ob 20:36:28 Srednjeevropski standardni =C4=8Da=
s je Michael Klein napisal(a): =20
> >> The Bananapi M1 has three LEDs connected to the RTL8211E ethernet PHY.
> >> Add the corresponding nodes to the device tree.
> >>
> >> Signed-off-by: Michael Klein <michael@fossekall.de> =20
> >
> >This is patch 2/2. Which one is patch 1/2? I got only one. =20
>=20
> https://patchwork.kernel.org/project/netdevbpf/patch/20250312193629.85417=
-1-michael@fossekall.de/
>=20
> Sorry for any inconvenience in case I messed up the patch submission.
>=20
> I made two commits for this change and submitted them via `git send-email=
=20
> HEAD^^`. The first patch went to netdev@vger.kernel.org, the second=20
> to linux-arm-kernel@lists.infradead.org, which seems logical. Have I=20
> done something wrong?

Well, for those really small "series" it's probably better to send all
patches to everyone, especially if the first patch gives some context,
without which the second leaves people (like me) scratching their head.
Also in this case a cover letter would help
(git format-patch --cover-letter), to give some idea of what you are after.

Cheers,
Andre


>=20
> >Best regards,
> >Jernej =20
>=20
> Michael
>=20
> > =20
> >> ---
> >>  .../boot/dts/allwinner/sun7i-a20-bananapi.dts | 27 +++++++++++++++++++
> >>  1 file changed, 27 insertions(+)
> >>
> >> diff --git a/arch/arm/boot/dts/allwinner/sun7i-a20-bananapi.dts b/arch=
/arm/boot/dts/allwinner/sun7i-a20-bananapi.dts
> >> index 46ecf9db2324..4976453ed192 100644
> >> --- a/arch/arm/boot/dts/allwinner/sun7i-a20-bananapi.dts
> >> +++ b/arch/arm/boot/dts/allwinner/sun7i-a20-bananapi.dts
> >> @@ -48,6 +48,7 @@
> >>
> >>  #include <dt-bindings/gpio/gpio.h>
> >>  #include <dt-bindings/interrupt-controller/irq.h>
> >> +#include <dt-bindings/leds/common.h>
> >>
> >>  / {
> >>  	model =3D "LeMaker Banana Pi";
> >> @@ -169,6 +170,32 @@ &ir0 {
> >>  &gmac_mdio {
> >>  	phy1: ethernet-phy@1 {
> >>  		reg =3D <1>;
> >> +
> >> +		leds {
> >> +			#address-cells =3D <1>;
> >> +			#size-cells =3D <0>;
> >> +
> >> +			led@0 {
> >> +				reg =3D <0>;
> >> +				color =3D <LED_COLOR_ID_GREEN>;
> >> +				default-state =3D "keep";
> >> +				linux,default-trigger =3D "netdev";
> >> +			};
> >> +
> >> +			led@1 {
> >> +				reg =3D <1>;
> >> +				color =3D <LED_COLOR_ID_AMBER>;
> >> +				default-state =3D "keep";
> >> +				linux,default-trigger =3D "netdev";
> >> +			};
> >> +
> >> +			led@2 {
> >> +				reg =3D <2>;
> >> +				color =3D <LED_COLOR_ID_BLUE>;
> >> +				default-state =3D "keep";
> >> +				linux,default-trigger =3D "netdev";
> >> +			};
> >> +		};
> >>  	};
> >>  };
> >>
> >> =20
> >
> >
> >
> >
> > =20
>=20



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2F7BC282D1
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 01:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rLa1foUxsBIXYDL+Vi7Ah0I6tnQqwLN9iYPwBRBiHlY=; b=U0fKgZhv/3AlFBw0ytwxl8GtUd
	u3fXkTQ7UzhGN+R7ZtWQ/LUf5s9aZMiLOqAfI75P1XrVnYjn5gVxz/eQ6dIk5qZTHJYmS3zfB3CCr
	e+4j6CpoO7qEEubukXnJITjjOXI9bbbBbn6mwYI8Zi2qp2wwRHpSilTOX068KYAA/pyCACA2SkP2S
	clahS73pigQSjBw+KMqmXSgkrrcmWRnmGngnrLfs8PTfZCJ6IwRYQ9iq+ToGedpK4X40FDg0Nvq3t
	YOhr3KPigpR7qn4ClFhUOEtNUbafIoUk1R/n40mi85DXhdEv0jXPVAUnomXRr2I8XqfDgKLCxs6w2
	JZcXZOoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqM5R-0000000Cj5f-2wah;
	Fri, 07 Mar 2025 01:01:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqM0O-0000000ChfI-1o64
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 00:56:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3CD7F169E;
	Thu,  6 Mar 2025 16:56:12 -0800 (PST)
Received: from minigeek.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 19EB63F5A1;
	Thu,  6 Mar 2025 16:55:57 -0800 (PST)
Date: Fri, 7 Mar 2025 00:55:55 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Samuel
 Holland <samuel@sholland.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 08/15] arm64: dts: allwinner: Add Allwinner A523
 .dtsi file
Message-ID: <20250307005555.2c52199a@minigeek.lan>
In-Reply-To: <2646028.Lt9SDvczpP@jernej-laptop>
References: <20250304222309.29385-1-andre.przywara@arm.com>
	<20250304222309.29385-9-andre.przywara@arm.com>
	<2646028.Lt9SDvczpP@jernej-laptop>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_165600_520156_99359DBE 
X-CRM114-Status: GOOD (  21.50  )
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

On Wed, 05 Mar 2025 19:46:20 +0100
Jernej =C5=A0krabec <jernej.skrabec@gmail.com> wrote:

Hi,

> Dne torek, 4. marec 2025 ob 23:23:02 Srednjeevropski standardni =C4=8Das =
je Andre Przywara napisal(a):
> > The Allwinner A523, and its siblings A527 and T527, which share the same
> > die, are a new family of SoCs introduced in 2023. They features eight
> > Arm Cortex-A55 cores, and, among the other usual peripherals, a PCIe and
> > USB 3.0 controller.
> >=20
> > Add the basic SoC devicetree .dtsi for the chip, describing the
> > fundamental peripherals: the cores, GIC, timer, RTC, CCU and pinctrl.
> > Also some other peripherals are fully compatible with previous IP, so
> > add the USB and MMC nodes as well.
> > The other peripherals will be added in the future, once we understand
> > their compatibility and DT requirements.
> >=20
> > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > ---
> >  .../arm64/boot/dts/allwinner/sun55i-a523.dtsi | 598 ++++++++++++++++++
> >  1 file changed, 598 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> >=20
> > diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm6=
4/boot/dts/allwinner/sun55i-a523.dtsi
> > new file mode 100644
> > index 0000000000000..01e662bdf5521
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> > @@ -0,0 +1,598 @@
> > +// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
> > +// Copyright (C) 2023-2024 Arm Ltd.
> > +

 ...

> > +
> > +			mmc2_pins: mmc2-pins {
> > +				pins =3D "PC1" ,"PC5", "PC6", "PC8", "PC9",
> > +				       "PC10", "PC11", "PC13", "PC14", "PC15",
> > +				       "PC16"; =20
>=20
> I guess PC0 should be also included, for HS400 capable cards.

Sure, it doesn't conflict with much else (just NAND flash), so that's
no problem.

> With that fixed:
> Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Many thanks for that!

Cheers,
Andre

>=20
> Best regards,
> Jernej
>=20



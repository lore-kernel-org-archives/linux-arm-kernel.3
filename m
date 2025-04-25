Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9316CC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 10:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lRJ8sjjs30Cz4jQ131UQVNPCwJoDXKUG6RuUi7SQXXA=; b=iFPnXuW4bMwMDOBJZmp38Lc868
	Euyb0YU1mKIPvIbVGxp7vMK8ihqL0T1eUwHvZRIra/x5tUrCuHNyJ2F8hN+gdAmKjxbNFyS9ucxSs
	SPHPoYEoknL1PtXATe8UYlbwwfY6v1+wG2TVMNtBcoOpilA0wvdUSI0n3LzDSC20JRP1eoftEQoo3
	0x6Stuw3TlQ1RN2RROt6arVP6t1p2F3LkxHeNWyQ8vay3xnArg5oxfyrYsmGALx6kx7wBw4jX/7CE
	EZJMffCyfAEyv8gRTSFdRVHPQ8vyjYvJlkjrBvf4kp/A1AWjPNxoCnZXiAy4ZV4UVWxTmaMO3g9mK
	VB/aeBGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8GgH-0000000GpKp-292T;
	Fri, 25 Apr 2025 10:53:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8FYt-0000000GaUX-3YL2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 09:41:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C4A941BCA;
	Fri, 25 Apr 2025 02:41:29 -0700 (PDT)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4511E3F59E;
	Fri, 25 Apr 2025 02:41:32 -0700 (PDT)
Date: Fri, 25 Apr 2025 10:41:28 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Yixun Lan <dlan@gentoo.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Maxime Ripard <mripard@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Corentin Labbe <clabbe.montjoie@gmail.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-sunxi@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <netdev@vger.kernel.org>
Subject: Re: [PATCH v2 3/5] arm64: dts: allwinner: a523: Add EMAC0 ethernet
 MAC
Message-ID: <20250425104128.14f953f3@donnerap.manchester.arm.com>
In-Reply-To: <CAGb2v66a4ERAf_YhPkMWJjm26SsfjO3ze_Zp=QqkXNDLaLnBRg@mail.gmail.com>
References: <20250424-01-sun55i-emac0-v2-0-833f04d23e1d@gentoo.org>
	<20250424-01-sun55i-emac0-v2-3-833f04d23e1d@gentoo.org>
	<CAGb2v66a4ERAf_YhPkMWJjm26SsfjO3ze_Zp=QqkXNDLaLnBRg@mail.gmail.com>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_024135_944485_14B2BB9D 
X-CRM114-Status: GOOD (  16.94  )
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

On Fri, 25 Apr 2025 13:26:25 +0800
Chen-Yu Tsai <wens@csie.org> wrote:

Hi Chen-Yu,

> On Thu, Apr 24, 2025 at 6:09=E2=80=AFPM Yixun Lan <dlan@gentoo.org> wrote:
> >
> > Add EMAC0 ethernet MAC support which found on A523 variant SoCs,
> > including the A527/T527 chips. MAC0 is compatible to the A64 chip which
> > requires an external PHY. This patch only add RGMII pins for now.
> >
> > Signed-off-by: Yixun Lan <dlan@gentoo.org>
> > ---
> >  arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi | 40 ++++++++++++++++++=
++++++++
> >  1 file changed, 40 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm6=
4/boot/dts/allwinner/sun55i-a523.dtsi
> > index ee485899ba0af69f32727a53de20051a2e31be1d..c9a9b9dd479af05ba22fe9d=
783e32f6d61a74ef7 100644
> > --- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> > +++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> > @@ -126,6 +126,15 @@ pio: pinctrl@2000000 {
> >                         interrupt-controller;
> >                         #interrupt-cells =3D <3>;
> >
> > +                       rgmii0_pins: rgmii0-pins {
> > +                               pins =3D "PH0", "PH1", "PH2", "PH3", "P=
H4",
> > +                                      "PH5", "PH6", "PH7", "PH9", "PH1=
0",
> > +                                      "PH14", "PH15", "PH16", "PH17", =
"PH18";
> > +                               allwinner,pinmux =3D <5>;
> > +                               function =3D "emac0";
> > +                               drive-strength =3D <40>; =20
>=20
> We should probably add
>=20
>                                   bias-disable;
>=20
> to explicitly turn off pull-up and pull-down.

Should we? I don't see this anywhere else for sunxi, probably because it is
the (reset) default (0b00).
I wonder if we have a hidden assumption about this? As in: if no bias is
specified, we assume bias-disable? Then we should maybe enforce this is in
the driver?

Cheers,
Andre


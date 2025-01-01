Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72F44E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jan 2025 23:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bEhShWXuSCGAVS8Dtls+t48Vj18yU72qdGfahBF5ank=; b=DEOTQs6wN6Palp+zFBmP0vqb3/
	fQw9eDWLf928Z4upKYOCfrCgOnK57ROhGNaDNXxs5RLsXuIM3pMakBVH9ln22QVxWGH3Y7FALuVRe
	cf/GWe5r4P9C2+9ILIj5jaUporRs6Gnd3IbpfA0c4XCn92Y0OhhHWISWnc6+0lef36Yzn2WuVJc0e
	khnStI3eg3VbczlzhksP2/DVYfQm+GfjpSRvd1nuqSDATkMpAs7epPjn9tc/NKT/5Y9+3ERIxuXod
	yP0sca6jmvqTkII7e+a4rKSL5OIGxIkmLPsWKku8qWJP3JZjsfe5b1XctC2fqfwLulISWwkXUvC1q
	1CM/yscg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tT8B7-00000009TNo-014r;
	Wed, 01 Jan 2025 23:31:05 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tT89w-00000009THV-0Zff
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jan 2025 23:29:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6435B11FB;
	Wed,  1 Jan 2025 15:30:16 -0800 (PST)
Received: from minigeek.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BF6643F6A8;
	Wed,  1 Jan 2025 15:29:46 -0800 (PST)
Date: Wed, 1 Jan 2025 23:28:36 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Stefan Gloor <code@stefan-gloor.ch>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, jernej.skrabec@gmail.com,
 samuel@sholland.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: sunxi: Add MMC alias for consistent
 enumeration
Message-ID: <20250101232836.76c7fd0e@minigeek.lan>
In-Reply-To: <CAGb2v67dBhL3-AhLeHg3xOgbNZ3qu0aj9+kA+MoOMRYfr_Z_zQ@mail.gmail.com>
References: <20241219105622.13691-2-code@stefan-gloor.ch>
	<CAGb2v67dBhL3-AhLeHg3xOgbNZ3qu0aj9+kA+MoOMRYfr_Z_zQ@mail.gmail.com>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250101_152952_253076_C4BAAC33 
X-CRM114-Status: GOOD (  19.55  )
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

On Wed, 1 Jan 2025 16:58:28 +0800
Chen-Yu Tsai <wens@csie.org> wrote:

Hi,

> On Thu, Dec 19, 2024 at 6:58=E2=80=AFPM Stefan Gloor <code@stefan-gloor.c=
h> wrote:
> >
> > Add explicit alias for MMC devices, so that (e)MMC and micro SD cards
> > are enumerated consistently. This should fix spurious boot failures when
> > specifying a hard-coded root partition, e.g., mmcblk0p2. =20
>=20
> IIRC we have chosen against adding explicit MMC aliases for the sunxi
> platforms. Please try using UUID=3D or PARTUUID=3D for root partition
> references.

Yes, and LABEL=3D would be another way.

Alternatively you could use U-Boot's DT when booting the board. U-Boot
will add those aliases during build time (because it needs them for its
own purposes), and by using $fdtcontroladdr (instead of $fdt_addr_r,
on the bootz command line) you get this for free, and even save yourself
from loading some DT.
We sync the DTs regularly from the kernel to U-Boot now, and at the
moment they are identical between the kernel and U-Boot, so you don't
lose anything.

Cheers,
Andre

> > Link: https://github.com/linux-sunxi/meta-sunxi/pull/431
> > Signed-off-by: Stefan Gloor <code@stefan-gloor.ch>
> > ---
> >  arch/arm/boot/dts/allwinner/sun7i-a20-olinuxino-micro.dts | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/allwinner/sun7i-a20-olinuxino-micro.dts =
b/arch/arm/boot/dts/allwinner/sun7i-a20-olinuxino-micro.dts
> > index a1b89b2a2999..9cd1eb690134 100644
> > --- a/arch/arm/boot/dts/allwinner/sun7i-a20-olinuxino-micro.dts
> > +++ b/arch/arm/boot/dts/allwinner/sun7i-a20-olinuxino-micro.dts
> > @@ -60,6 +60,8 @@ aliases {
> >                 serial2 =3D &uart7;
> >                 spi0 =3D &spi1;
> >                 spi1 =3D &spi2;
> > +               mmc0 =3D &mmc0;
> > +               mmc1 =3D &mmc3;
> >         };
> >
> >         chosen {
> > --
> > 2.45.2
> >
> > =20
>=20



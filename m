Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02AA7D5E380
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 Nov 2024 10:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PPKjSVi+oF5YTtfzXW/v9o5VsuQRKlIT5Mtxb3FhWKM=; b=ifee5ejSnORWI4k3ZZuqrAfpnm
	ra0WaOyn4pe0yId9XFXjlLu0aocatk4n4D/es5b4hxjI3SiTYvgiBpZ0Kdadv69+jO2swjI94GWiw
	zclwxX/qk0SAt9EuuVhUBNiTzq/rP8hBXp6CgAeMMxWPci9pdyPDQGp8CNHCPbDY4K2pCI3O0U8gV
	Mt+fKcs9En2wVrttI55LXYOO+VO38fq846ylCN2QVoPrmp7oiot237AQtyyp6+kPd1+kkKhdp6dvX
	p0CNTNvfEHzwRmhpxpC+fOx/sIJE63b6bK3K1Q7RPbC3nKtQ65hbqyV0b9bxQ4C+x/8vgIHDV7rYV
	A2ESAtOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tA57P-0000000EgqK-2Pa5;
	Sun, 10 Nov 2024 10:24:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tA554-0000000EgeJ-32X3
	for linux-arm-kernel@lists.infradead.org;
	Sun, 10 Nov 2024 10:22:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A8C1E15A1;
	Sun, 10 Nov 2024 02:22:32 -0800 (PST)
Received: from minigeek.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4818B3F528;
	Sun, 10 Nov 2024 02:22:01 -0800 (PST)
Date: Sun, 10 Nov 2024 10:21:57 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, Yangtao Li <tiny.windzz@gmail.com>, Cody Eksal
 <masterr3c0rd@epochal.quest>, Parthiban <parthiban@linumiz.com>,
 stable@vger.kernel.org
Subject: Re: [PATCH] mmc: sunxi-mmc: Fix A100 compatible description
Message-ID: <20241110102157.2703463e@minigeek.lan>
In-Reply-To: <CAGb2v64HUp4Xwgc3fw1fMVTBQFV2kHSVbs7=XBufzJpQ9hkuzg@mail.gmail.com>
References: <20241107014240.24669-1-andre.przywara@arm.com>
	<CAGb2v64HUp4Xwgc3fw1fMVTBQFV2kHSVbs7=XBufzJpQ9hkuzg@mail.gmail.com>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241110_022206_875694_EE1B4BAE 
X-CRM114-Status: GOOD (  26.15  )
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

On Sun, 10 Nov 2024 17:04:08 +0800
Chen-Yu Tsai <wens@csie.org> wrote:

Hi,

> On Thu, Nov 7, 2024 at 9:43=E2=80=AFAM Andre Przywara <andre.przywara@arm=
.com> wrote:
> >
> > It turns out that the Allwinner A100/A133 SoC only supports 8K DMA
> > blocks (13 bits wide), for both the SD/SDIO and eMMC instances.
> > And while this alone would make a trivial fix, the H616 falls back to
> > the A100 compatible string, so we have to now match the H616 compatible
> > string explicitly against the description advertising 64K DMA blocks. =
=20
>=20
> Would be nice to know how this was discovered, and how the correct size
> was determined. As far as I could find, the A133 user manual says its
> 64K.

Mmh, my copy (Revision 1.1, Jul.14, 2020) only mentions bits[12:0] in
the DES1 DMA descriptor details, unconditional of SMHC0/1/2. And yes,
this is in contradiction to the prose section in "5.3.1. Overview",
which mentions a "Block size of 1 to 65535 bytes".
Also that matches the observation: eMMC was working fine (as it was
already limited to 8K), and the SD card was *somewhat* working: I could
mount a FAT filesystem, and even list the (rather short) root
directory, but any further action (reading file, benchmarking) would
hang. Which would make sense given that the first actions probably
don't ask for a block larger than 8K.

Cheers,
Andre



>=20
> ChenYu
>=20
> > As the A100 is now compatible with the D1 description, let the A100
> > compatible string point to that block instead, and introduce an explicit
> > match against the H616 string, pointing to the old description.
> > Also remove the redundant setting of clk_delays to NULL on the way.
> >
> > Fixes: 3536b82e5853 ("mmc: sunxi: add support for A100 mmc controller")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > ---
> >  drivers/mmc/host/sunxi-mmc.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/mmc/host/sunxi-mmc.c b/drivers/mmc/host/sunxi-mmc.c
> > index d3bd0ac99ec46..e0ab5fd635e6c 100644
> > --- a/drivers/mmc/host/sunxi-mmc.c
> > +++ b/drivers/mmc/host/sunxi-mmc.c
> > @@ -1191,10 +1191,9 @@ static const struct sunxi_mmc_cfg sun50i_a64_emm=
c_cfg =3D {
> >         .needs_new_timings =3D true,
> >  };
> >
> > -static const struct sunxi_mmc_cfg sun50i_a100_cfg =3D {
> > +static const struct sunxi_mmc_cfg sun50i_h616_cfg =3D {
> >         .idma_des_size_bits =3D 16,
> >         .idma_des_shift =3D 2,
> > -       .clk_delays =3D NULL,
> >         .can_calibrate =3D true,
> >         .mask_data0 =3D true,
> >         .needs_new_timings =3D true,
> > @@ -1217,8 +1216,9 @@ static const struct of_device_id sunxi_mmc_of_mat=
ch[] =3D {
> >         { .compatible =3D "allwinner,sun20i-d1-mmc", .data =3D &sun20i_=
d1_cfg },
> >         { .compatible =3D "allwinner,sun50i-a64-mmc", .data =3D &sun50i=
_a64_cfg },
> >         { .compatible =3D "allwinner,sun50i-a64-emmc", .data =3D &sun50=
i_a64_emmc_cfg },
> > -       { .compatible =3D "allwinner,sun50i-a100-mmc", .data =3D &sun50=
i_a100_cfg },
> > +       { .compatible =3D "allwinner,sun50i-a100-mmc", .data =3D &sun20=
i_d1_cfg },
> >         { .compatible =3D "allwinner,sun50i-a100-emmc", .data =3D &sun5=
0i_a100_emmc_cfg },
> > +       { .compatible =3D "allwinner,sun50i-h616-mmc", .data =3D &sun50=
i_h616_cfg },
> >         { /* sentinel */ }
> >  };
> >  MODULE_DEVICE_TABLE(of, sunxi_mmc_of_match);
> > --
> > 2.46.2
> > =20
>=20



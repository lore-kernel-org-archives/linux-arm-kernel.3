Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9FA1CD4F50
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 14:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N9kgAAEPtnSxcbrHDQ72PRf5dDYSASbFIFd9F8DhQgY=; b=bGKJLwlncWG2Zq329cd2bPrmXv
	Bkys6XCM7HJoJa7rP1VcCBSxeFa1iK03kowrWYm5Fq9kR54/gMjOazBCTm7jWRJi/klab/OkRWQth
	bzivLuNFbQn7AsdKArkVr6iEZBsOQrYemOeep+KsVECaxwazmvdIMYMVqAWqabqk6ZPRGXcla7gBP
	f9NzZJ72cU52Bs7or+QkyjfLVMJwRobATxihfFIdTZGT7fw4zbzl5EF/bOyH9m+AWaapBnM9RBFsW
	kuVZvY7iHLIL7G5sEHO/4vkvXRutwox4pu1cWChU1udwsTlfYnv9o4LrLpcWglXO/2iSBbYbYe8uV
	NIF/NRmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOyec-0000000FvF0-3ATR;
	Mon, 18 May 2026 14:09:10 +0000
Received: from leonov.paulk.fr ([185.233.101.22])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOyeY-0000000FvDt-3yAb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 14:09:09 +0000
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 1DEBE1F8004A
	for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 14:09:03 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 9E386B407FD; Mon, 18 May 2026 14:09:01 +0000 (UTC)
Received: from collins (unknown [192.168.1.1])
	by laika.paulk.fr (Postfix) with ESMTPSA id 838E7B407F7;
	Mon, 18 May 2026 14:08:51 +0000 (UTC)
Date: Mon, 18 May 2026 16:08:50 +0200
From: Paul Kocialkowski <paulk@sys-base.io>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arash Golgol <arash.golgol@gmail.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: Re: [PATCH 00/16] media: sun6i-csi/isp MC-centric support and
 cleanups
Message-ID: <agsdcmRQtQYD1KaH@collins>
References: <20260518102451.417971-1-paulk@sys-base.io>
 <20260518121511.GD21216@killaraus.ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1hdy3NiqHIhYUnpy"
Content-Disposition: inline
In-Reply-To: <20260518121511.GD21216@killaraus.ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_070907_350313_1BCCE454 
X-CRM114-Status: GOOD (  23.32  )
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


--1hdy3NiqHIhYUnpy
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Laurent,

Le Mon 18 May 26, 14:15, Laurent Pinchart a =C3=A9crit :
> On Mon, May 18, 2026 at 12:24:35PM +0200, Paul Kocialkowski wrote:
> > This series first introduces some fixes and new formats to v4l2 format
> > info, one of which we need for the sun6i-csi driver. Support for
> > MC-centric format enumeration is then added, along with cleanups and
> > improvements for both the sun6i-csi and sun6i-isp drivers.
> >=20
> > The first 4 patches are already reviewed and ready to go and are
> > included here as a reminder that this series depends on them.
>=20
> Patch 04/16 has no R-b tag.

Oops you're right, I added the tag in my reply to the patch yesterday
but did not add it when resending it with this series.

All the best,

Paul

> > Arash Golgol (4):
> >   media: sun6i-csi: bridge: Use V4L2 subdev active state
> >   media: sun6i-csi: capture: Implement vidioc_enum_framesizes
> >   media: sun6i-mipi-csi2: Use V4L2 subdev active state
> >   media: sun8i-a83t-mipi-csi2: Use V4L2 subdev active state
> >=20
> > Paul Kocialkowski (12):
> >   media: v4l2-common: Fix NV15_4L4 format info block height
> >   media: v4l2-common: Add missing tiled format info block sizes
> >   media: v4l2-common: Add NV12_16L16 pixel format to v4l2 format info
> >   media: v4l2-common: Add NV12_32L32 pixel format to v4l2 format info
> >   media: sun6i-csi: Split format validation to a dedicated helper
> >   media: sun6i-csi: Add support for MC-centric format enumeration
> >   media: sun6i-csi: Tidy up and unify coding style
> >   media: sun6i-mipi-csi2: Fix parenthesis alignment
> >   media: sun6i-isp: Add dummy params link_validate implementation
> >   media: sun6i-isp: Use V4L2 subdev active state
> >   media: sun6i-isp: Add support for MC-centric format enumeration
> >   media: sun6i-isp: Add support for frame size enumeration
> >=20
> >  .../sunxi/sun6i-csi/sun6i_csi_bridge.c        | 153 +++++++---------
> >  .../sunxi/sun6i-csi/sun6i_csi_bridge.h        |   9 -
> >  .../sunxi/sun6i-csi/sun6i_csi_capture.c       | 168 +++++++++++++-----
> >  .../sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c   | 107 ++++++-----
> >  .../sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.h   |   2 -
> >  .../sun8i_a83t_mipi_csi2.c                    | 113 ++++++------
> >  .../sun8i_a83t_mipi_csi2.h                    |   2 -
> >  drivers/media/v4l2-core/v4l2-common.c         |  12 +-
> >  .../media/sunxi/sun6i-isp/sun6i_isp_capture.c |  47 ++++-
> >  .../media/sunxi/sun6i-isp/sun6i_isp_params.c  |  37 +++-
> >  .../media/sunxi/sun6i-isp/sun6i_isp_params.h  |   4 +-
> >  .../media/sunxi/sun6i-isp/sun6i_isp_proc.c    | 117 ++++++------
> >  .../media/sunxi/sun6i-isp/sun6i_isp_proc.h    |   7 -
> >  13 files changed, 437 insertions(+), 341 deletions(-)
>=20
> --=20
> Regards,
>=20
> Laurent Pinchart

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--1hdy3NiqHIhYUnpy
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmoLHXIACgkQhP3B6o/u
lQzgWBAAjRaAAzEGF8iRPZsjcNNCPSKtGqSNpi4BoTAS50vH3SNcWlp/uLnjcSYh
zZpsK8ScF9XYEN4ooeEHDakoMC33qkRIA3ISlKhIFZGpxhD1/neVOBLb96BmZopt
c3n7Llgv0G7bbaJKPKjc3laxnuRCYA5+z7LnTLj/w/l8DKQNXs7ci19GYKx4Zs27
NQn/rqfONj1o2yrObi/xQmr/QRBTXhJ203NL/oqS+HT7pqiBpPRlv/BZmG9cVjHg
Xv9YqDQqk0NHEStWcaiFtXeDFOVIo3xq6CnPJx/IhNOaHAd/yGbGHp52UiyBACGx
vpppLRS3XFWyByk8SL0FOIS6qauBUxnP5vKsGlyIpD++sgKxpzoR0UkQhoSDpJFI
4IqVIqJT17YrPfAoaXqsDFlpmC38deCDwl2SDWPN2KNvuVMlMp87TfpmQUxFtDsz
m5fFyRQxs6OGkRKoxTAIdxlLOasHJmPJzvwOcpEdJK3TfmYqnvipYWhDs2nN4C6I
aIUg1r/9id1JLtPjpQp6H/UEOhLyFU5vkXX0JkAHuHjvlRYV9vbUCQBth+x4+QNc
msInkVfmff3Gooli+kwKNHRqKOfhTnidL970O1PSEifBV7PxjQyc2TMRv/oKsNii
Ef/WTmDCRchEsjfpd+yK8eeUjKx3She13MeMkBphB3pYOVwXN6Y=
=UHeJ
-----END PGP SIGNATURE-----

--1hdy3NiqHIhYUnpy--


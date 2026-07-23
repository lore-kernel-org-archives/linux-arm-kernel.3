Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51F23C531CC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 18:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4QpspjtslJ120+a+n4Oi2dib7YgmsWRuOIYa15ODY2Y=; b=CFFf1ZM3lxxiylQcZRZR5ijDbe
	UhIJHBnlwI5GMTbLmGsUELIDFuN2OeXKuE9S2dyhzzrrLmCOo664nbRqD+7KACgmwvUHGaRgtkBpO
	4PANqw82ZUNalUIon9m9T2eJoYN8nMBJIbFrOL7k/eDIs2aw6naXI30zTxJO1/QVSEMIklqaRNjQJ
	mS1Aapr9IeI7H6ykEBhpKQPRfGrCSmeccU4TUuqaZApC9sEG5MsJB0Iz1tPUTX6sNcXfLUj7dNKPw
	MRpUUelc/hAVit5XDIIWFq6/O3peNj8TNKGWWI+M5FGRDBYiQ8jVEx3DXDJx69tGSoKS8ZImh0k4e
	6qeMz7Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmyMw-0000000EuFR-3KeY;
	Thu, 23 Jul 2026 18:42:06 +0000
Received: from leonov.paulk.fr ([185.233.101.22])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmyMt-0000000EuEn-0WA1;
	Thu, 23 Jul 2026 18:42:06 +0000
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 4B6C43700EC1;
	Thu, 23 Jul 2026 18:41:57 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 655A7B49E0C; Thu, 23 Jul 2026 18:41:55 +0000 (UTC)
Received: from collins (unknown [192.168.1.1])
	by laika.paulk.fr (Postfix) with ESMTPSA id 63EE7B49DF6;
	Thu, 23 Jul 2026 18:41:54 +0000 (UTC)
Date: Thu, 23 Jul 2026 20:41:52 +0200
From: Paul Kocialkowski <paulk@sys-base.io>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Jiaxing Hu <gahing@gahingwoo.com>, detlev.casanova@collabora.com,
	mchehab@kernel.org, heiko@sntech.de, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	ezequiel@vanguardiasur.com.ar, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 0/3] media: rockchip: VEPU510 H.264 encoder for RK3576
Message-ID: <amJgcHf2vVDb75nR@collins>
References: <20260722073417.2064667-1-gahing@gahingwoo.com>
 <082e1141c38205222a91abf13b1a97d9a00e117a.camel@collabora.com>
 <20260723004642.2075233-1-gahing@gahingwoo.com>
 <210b72e32d1bd757a36b2baf532dd9f7d46ca5dc.camel@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="y1RuMRkspY6MNcmg"
Content-Disposition: inline
In-Reply-To: <210b72e32d1bd757a36b2baf532dd9f7d46ca5dc.camel@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_114203_510924_92E212AC 
X-CRM114-Status: GOOD (  39.27  )
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

--y1RuMRkspY6MNcmg
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

Le Thu 23 Jul 26, 12:14, Nicolas Dufresne a =C3=A9crit :
> Le jeudi 23 juillet 2026 =C3=A0 12:46 +1200, Jiaxing Hu a =C3=A9crit=C2=
=A0:
> > I'm not attached to the stateful interface -- I used it to get something
> > running on real silicon, not out of conviction. Before I commit to
> > reworking, I'd like to be sure I understand what "converge" means here,
> > because I see two fairly different directions in the thread: Paul's V4L2
> > stateless H.264 encoder (kernel-side reflist/rbsp/RC core), and the
> > Vulkan-Video split you describe for Detlev (thin kernel module + Mesa
> > userspace). Those differ a lot in kind and in effort. Which is the
> > intended target for the Rockchip encoders, or is that still open? Is
> > there a branch, early code or spec draft I should read beyond Paul's
> > series?

I would recommend taking a look at the slides of the talks I gave at the
Linux Media Summit last year and this year, which should give you more
context and insight about the design choices.

- https://paulk.fr/talks/2025-linux-media-summit/2025-linux-media-summit-v4=
l2-stateless-video-encoding-uapi.pdf
- https://paulk.fr/talks/2026-linux-media-summit/2026-linux-media-summit-v4=
l2-stateless-video-encoding-uapi-progress-update.pdf

Generally speaking the idea of this proposal is to stick with the same
design idea that we had for stateless decoders, including V4L2 M2M queues,
dedicated controls and media requests.

Like Nicolas explained, some hardware can be a good fit for both
approaches. I think we agreed that it wouldn't be a problem to have two
drivers (one v4l2, one drm-ish) for the same hardware, so the question is
really about what you prefer to do and get involved with.

My V4L2-based proposal is already rather usable, although it has not yet
reached its final form. I have a GStreamer implementation ready that has
been used extensively too, but it will also need to be reworked before
it can reach upstream.

The DRM-ish proposal is at an earlier stage and will likely require a
complete redesign of your driver, moving most things in userspace.

> Paul does not have this hardware protection, so I think he needs a higher=
 level
> interface for the driver, and at the point, why not base it on existing k=
ernel
> interface. Though, V4l2 is massively larger (probably around 100x) interf=
ace
> then what we are drafting currently for RKVENC in a drm style driver.
>=20
> The common part is the rate control. Typically, stateful encoder are firm=
ware
> based, and the rate control is in the firmware. We need an in kernel rate
> control for performance reason. The programming latency is going to be to=
o high
> otherwise. The point of convergence, is that we can share helpers for that
> purpose, and Paul's work is really clean, and already in the shape of hel=
pers
> not tied to v4l2.

Well there is some level of dependency to v4l2 in some places, but I'm
sure we can extract relevant parts and make them common so that a drm-ish
subsystem can reuse them easily.

> > Either way the RK3576 hardware enablement and the reference-read fix are
> > shared with RK3588, so I'd much rather contribute the VEPU510 side to a
> > common base than maintain a parallel one -- I'd just like to know which
> > base that is before rebuilding on it.
>=20
> This is our experience with decoder too, its relatively easy to support b=
oth,
> differences being minor. I will ping Detlev today and see if he can help =
here. I
> know in his case he was trying to avoid reconstructed frame compression, =
and it
> only started working when he enable that compression. Though, he had mmu =
faults
> prior to that.

In my opinion it would be fine to have two drivers, but it's really up
to you. Since you already have a v4l2 base for it, I would encourage you
to move it to my proposal, which will probably be finalized in a shorter
time frame than the other proposal and lets you reuse the code you've
already written. Then you could also add RK3576 support to the drm-ish
Vulkan Video proposal without too much work when it is ready, reusing the
RK3588 work.

But again, it's really your decision. And it's hard to say how long
things will take to finalize. But I think it would be beneficial to have
two drivers for this hardware and not trash the work you've done.

All the best,

Paul

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--y1RuMRkspY6MNcmg
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmpiYHAACgkQhP3B6o/u
lQzhCQ//eEM+ZMphhJvq6bc0sgRl6B9jBmP3PVjzgcuz+TnIhJkSmgtwMxjh8JjT
0xP+8Gut4Mnz59rETlRaCw5Y+xxoh6CNb4v0DtaSt0P5Ljnv/dAPIhGcw9b38gXE
Y4kMug69WWsoi/iG4dZJqhci4u+QFoY3aFTVGxMG0EALywmwpSbKbSl4MPNkjrM/
5EZBicsAyWuxZXjpPVu4m1ULmAd5dwLAD2JUxun58uXFL/lhM0jRQkmJQdjUADTS
GuyLfMqsLHBJSJc4lXnYZaMJKXy59pQUiFaRF7ZT5+s9mP9IT73xY6OCbypvqnJe
mxb24FDHDQklyk3qkOCstplpJMir3tVv0khdWNpnQtRETAXQZUKGUbwjrG0hEr+L
LRdeS5EN/tSiGvIpaafyaflHi/Y7Rynew6/lq+Msb00przHOcZsG5gYhSsmdH9KJ
IzcGYKq+9hU9C8Fpu1aI6nPcry3lqpzBtjYSOyv8A3Vir2vt5fVXiKz+xC+oIf2W
3K+JoMZzw83MV+FqnXw3uSDjtMaOTZ7RcDz2X5RrrtZ/Vit628BXjnSsfRuP0Hds
GXtpAjhl0HuDmGjF/c4ietBePTrsNQSCw76WygulOhY7nQlEr8CsoYkh7SERCrKW
593Hsh9d4t9X+zSfLEj7JQwhMnb4ChtPM7v8Ylg/ZO83PzAefzM=
=25OK
-----END PGP SIGNATURE-----

--y1RuMRkspY6MNcmg--


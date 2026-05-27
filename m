Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9568CD5BD0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 17:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1Y/th8zoNj6rDDjmoKVmswiGR4GLgTy3vGzdUV8hSSI=; b=klHeMXKkynSkqM0e/WSUy/jwCa
	kSQi4BpBGWHNSGQe4m7m3p/IawKNzoPI6ONYlSZj1dMwXZX3Dxryl+cd2CCl68jF5B1Y/guOR/sYG
	YnGhePgkL0T9EcQT9jNZ//bjvPLp3pThYjyB7QLVz2pLATBUA99NSuqFD1AmXpA/0WtvDwSEKUL0O
	+R1o2CerRkWO46niSnRsyyJVnmXCqXvbZ2rht7uboilxxCJrnFLa6fYHcm6dsL7DTHFcg1hOjIlKh
	sSm4IK8J5sNIrF91AbM6aXUkcu7VMOi5zHbwB+/gMoKQUs5keHBT0gOCkE9zjr9kAFvTnT2l6EqYh
	BEtvtR6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSHuK-00000004ZWR-1Xau;
	Wed, 27 May 2026 17:19:04 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSHuJ-00000004ZWL-0WLs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 17:19:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3B29660210;
	Wed, 27 May 2026 17:19:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 800291F000E9;
	Wed, 27 May 2026 17:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779902341;
	bh=1Y/th8zoNj6rDDjmoKVmswiGR4GLgTy3vGzdUV8hSSI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UsFywr+zYfFvYSi+eAfMneG/jA8t9qrKZ82pOhiqoQE/21H2nLqFj/jWRbZ3lugQ3
	 JtUeWC8DhkI5BcIgJUC8/abiNlA2zRN9MotNEa8yRPHbAlTM8Urk5s3nW91vIppw2d
	 Vf1UzgklTxdT8m9vme5ui4hwoFVy1a7ABXwORXm/njPVQDd2IZFt72rLJAXNTU167t
	 j6eqVmywhkhkIPYP/HiIaPCz17E4uHjfqdu726eufBdNQkBll5yVsSAZnmV8znr2oM
	 Vc344tEhcMDb8XsRA4WS5pNJaK6l4pJZGuOi27u7oGWyX+0+9QUIZk6zjHJOJqMcA8
	 EbPLjLBhjETvQ==
Date: Wed, 27 May 2026 18:18:56 +0100
From: Mark Brown <broonie@kernel.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Aishwarya.TCV@arm.com
Subject: Re: [PATCH 3/4] drm/exynos: Drop exynos_drm_gem.size field
Message-ID: <fa11e295-c3a2-4baf-a7d6-a290a4255ca6@sirena.org.uk>
References: <20260326094308.1161335-1-wenst@chromium.org>
 <20260326094308.1161335-4-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="H5kRiO6up3bnEQ+8"
Content-Disposition: inline
In-Reply-To: <20260326094308.1161335-4-wenst@chromium.org>
X-Cookie: 15% gratuity added for parties over 8.
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


--H5kRiO6up3bnEQ+8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 26, 2026 at 05:43:05PM +0800, Chen-Yu Tsai wrote:
> A size field is already included in the base GEM object, and is
> initialized through drm_gem_object_init() with the same value.
>=20
> Drop the field in the subclass to save some space. More changes to
> make exynos_drm_gem a subclass of drm_gem_dma_object will follow.

I'm seeing warnings on arm multi_v7_defconfig which also show up in
other CI which seem to be due to this commit, the type of the size field
is different so the format specifiers need updating or casts adding:

CC [M]  drivers/gpu/drm/exynos/exynos_drm_gem.o
CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/acr/ga102.o
In file included from ../drivers/gpu/drm/exynos/exynos_drm_gem.c:16:
=2E./drivers/gpu/drm/exynos/exynos_drm_gem.c: In function 'exynos_drm_alloc=
_buf':
=2E./drivers/gpu/drm/exynos/exynos_drm_gem.c:69:49: warning: format '%lx' e=
xpects argument of type 'long unsigned int', but argument 6 has type 'size_=
t' {aka 'unsigned int'} [-Wformat=3D]
69 |         DRM_DEV_DEBUG_KMS(drm_dev_dma_dev(dev), "dma_addr(0x%lx), size=
(0x%lx)\n",
      |                                                 ^~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~
70 |                         (unsigned long)exynos_gem->dma_addr, exynos_ge=
m->base.size);
      |                                                              ~~~~~~=
~~~~~~~~~~~~~~~
      |                                                                    =
          |
      |                                                                    =
          size_t {aka unsigned int}
=2E./include/drm/drm_print.h:563:39: note: in definition of macro 'drm_dev_=
dbg'
563 |         __drm_dev_dbg(NULL, dev, cat, fmt, ##__VA_ARGS__)
      |                                       ^~~
=2E./drivers/gpu/drm/exynos/exynos_drm_gem.c:69:9: note: in expansion of ma=
cro 'DRM_DEV_DEBUG_KMS'
69 |         DRM_DEV_DEBUG_KMS(drm_dev_dma_dev(dev), "dma_addr(0x%lx), size=
(0x%lx)\n",
      |         ^~~~~~~~~~~~~~~~~
=2E./drivers/gpu/drm/exynos/exynos_drm_gem.c:69:76: note: format string is =
defined here
69 |         DRM_DEV_DEBUG_KMS(drm_dev_dma_dev(dev), "dma_addr(0x%lx), size=
(0x%lx)\n",
      |                                                                    =
      ~~^
      |                                                                    =
        |
      |                                                                    =
        long unsigned int
      |                                                                    =
      %x
=2E./drivers/gpu/drm/exynos/exynos_drm_gem.c: In function 'exynos_drm_free_=
buf':
=2E./drivers/gpu/drm/exynos/exynos_drm_gem.c:83:37: warning: format '%lx' e=
xpects argument of type 'long unsigned int', but argument 6 has type 'size_=
t' {aka 'unsigned int'} [-Wformat=3D]
83 |         DRM_DEV_DEBUG_KMS(dev->dev, "dma_addr(0x%lx), size(0x%lx)\n",
      |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
84 |                         (unsigned long)exynos_gem->dma_addr, exynos_ge=
m->base.size);
      |                                                              ~~~~~~=
~~~~~~~~~~~~~~~
      |                                                                    =
          |
      |                                                                    =
          size_t {aka unsigned int}
=2E./include/drm/drm_print.h:563:39: note: in definition of macro 'drm_dev_=
dbg'
563 |         __drm_dev_dbg(NULL, dev, cat, fmt, ##__VA_ARGS__)
      |                                       ^~~
=2E./drivers/gpu/drm/exynos/exynos_drm_gem.c:83:9: note: in expansion of ma=
cro 'DRM_DEV_DEBUG_KMS'
83 |         DRM_DEV_DEBUG_KMS(dev->dev, "dma_addr(0x%lx), size(0x%lx)\n",
      |         ^~~~~~~~~~~~~~~~~
=2E./drivers/gpu/drm/exynos/exynos_drm_gem.c:83:64: note: format string is =
defined here
83 |         DRM_DEV_DEBUG_KMS(dev->dev, "dma_addr(0x%lx), size(0x%lx)\n",
      |                                                              ~~^
      |                                                                |
      |                                                                long=
 unsigned int
      |                                                              %x
CC [M]  drivers/gpu/drm/rockchip/rockchip_drm_vop.o
CC [M]  drivers/gpu/drm/exynos/exynos_drm_plane.o

--H5kRiO6up3bnEQ+8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoXJ38ACgkQJNaLcl1U
h9CAnQf7BRgsOk0q3qJLrYyRq+VnGlA2pf380qcMBSxg8Rd6FSfV9P0815cHXvyK
sh40YySY84XHxzWFmJx8gahCRdFTW5OSy1kKNJIP1ckIlkshNigy8ISuzd2YTQLX
l+SeFpbHozlFX/zVUNBWy2wSxiMq25Z5w1xztazu3C5oedRvHEERML5x7dIa2/S2
W5q0/A4bxhJXZqzATeSdLF0j2j+88gCCffXxfvu5yfMEa7/Z1UN74/R6g7IElima
7bbBhbaOTMTMJpxBbVTOdetF1CiBYvygGUWJcywTqnxdyLI1cOE3qJ81O2CYDOKB
EJYrH+c2+ZMZ/lmonzqlPwsthWCYuw==
=him5
-----END PGP SIGNATURE-----

--H5kRiO6up3bnEQ+8--


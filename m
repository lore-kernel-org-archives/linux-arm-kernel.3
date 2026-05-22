Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52073CD5BB0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 11:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2ZzTHm3H9lJutC9JWzV0RRTouRHJeFEdYJjeqtxWCzI=; b=Rkm91921A2VC9s4CRGQoRIreNN
	+ppo3deuBo5ExyNX55Noveo5Zz3Vq9gl9O2a70EoEnlf16xOMuE+WJ/UDmMUPG0zdDtg40sb5G3gW
	REdWv5Xe5RjQ3xJqMFipxJO4SB2Ylh+T5gB7dhKTRdGyUTtPi1TLkLmrlrBVX+v8oGkqIiGMfOyu4
	+nvEg970ajRcfGYQJU076qvURxTB6Xyrxxuz2Qdr6WucfPxafEerUJwuIgDk3fiHUT71OUl/ttE/J
	rxEiQBLnOzsYeI3qcQsL17y2x69STUq7LJYt4scErQBElmtdakH8nMBhslmn1HBFfVKvQSNOXsVxm
	QdjP1U/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQNqz-0000000AbN8-25s4;
	Fri, 22 May 2026 11:15:45 +0000
Received: from leonov.paulk.fr ([185.233.101.22])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQNqx-0000000AbMH-0Yjy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 11:15:44 +0000
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id C75583700294
	for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 11:15:38 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 1BE2FB408D1; Fri, 22 May 2026 11:15:37 +0000 (UTC)
Received: from collins (unknown [192.168.1.1])
	by laika.paulk.fr (Postfix) with ESMTPSA id BB3DEB408CA;
	Fri, 22 May 2026 11:15:35 +0000 (UTC)
Date: Fri, 22 May 2026 13:15:33 +0200
From: Paul Kocialkowski <paulk@sys-base.io>
To: arash golgol <arash.golgol@gmail.com>
Cc: linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: Re: [PATCH 14/16] media: sun6i-isp: Use V4L2 subdev active state
Message-ID: <ahA61YIGM4Bqipu7@collins>
References: <20260518102451.417971-1-paulk@sys-base.io>
 <20260518102451.417971-15-paulk@sys-base.io>
 <CAMxPZkg9MgZrsM2L0vKzzUOA_tnSLKHdHkzDsfH5_WRqSQgvZg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="my01EG0z/4JNTjDd"
Content-Disposition: inline
In-Reply-To: <CAMxPZkg9MgZrsM2L0vKzzUOA_tnSLKHdHkzDsfH5_WRqSQgvZg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_041543_343788_1CDB5D5F 
X-CRM114-Status: GOOD (  15.74  )
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


--my01EG0z/4JNTjDd
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Arash,

Le Thu 21 May 26, 12:53, arash golgol a =C3=A9crit :
> I used LicheePi Zero Dock (V3s) with the following pipeline as test setup.
>=20
> ov5647 -> sun6i-mipi-csi2 -> sun6i-csi-bridge -> sun6i-isp-proc ->
> sun6i-isp-capture
>=20
> I verified TRY and ACTIVE state handling, including changing TRY
> formats without affecting ACTIVE state. Format propagation from the
> sink (csi) pad to the source pad was also tested.
>=20
> I also tested streaming with the sensor test pattern enabled and
> verified the captured output was correct.
>=20
> Tested-by: Arash Golgol <arash.golgol@gmail.com>

Thanks a lot for testing this! Did you test just this patch or the other
ones (especially sun6i-csi format enumeration) as well?

Also if you have an opinion on the code itself feel free to drop a
Reviewed-by tag, a lot of this work is very similar to what you did for
sun6i-csi and other drivers.

All the best,

Paul

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--my01EG0z/4JNTjDd
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmoQOtUACgkQhP3B6o/u
lQyUew//eizFgJVGOhQ0FRIaPgONOOjys2DARGCXB3iuhfDoWvdG5fb1Ednuqi8u
QQ/KWW+vMgaB/aogtcSaaP2F+g+QU9iZ4r+1vvQl7Dmz9c1gr4cN4Wtbre1IFJ73
x9Weab1T9QDO+rRvhQ9i6v3xV4dN0M5UyhGDUfrby4ncO8sWrGyQymF9BWWAE4HT
K1dRGaAbaSTpXIL/bfI6FIK2hojGIBYUUkxnuG8u7nNDu2MmWDS8/qHU4wxmzfYe
VaXY542BzXyD+k4hJ8npaezHY8WfrP7DfaQAINXxywAtmbfY/ZrLJQWlIbem/HdY
J0clVD2GEfqG3aIP8mbzc417ND3PzubuYvUN8fY3tXXkCf5jYegANsOgPoFCzfmF
ZHzedumGdrmbY8cYCu3oSWUq2Ub+5Mp1zO43u3J5Dlx8vtmbsZP46D+dgoSgCr92
Cf5fpJh1vr7YsX9TP6cBcY4+o3mxEE3f9A5/NqpLHUMXOj1Lkq16r9weAencDGlx
k/83DgF3VEOQmooXR1THCnRKmbxY62Vn+IvHTIEtJIZFn4DddwHxq0cjQkfZwkIa
3kMXwVchPZHmIpBCQM0+jr836XspjxDEgdsQ+iQwpZiMZhbSOhTxbTWVpFpcmzJ5
fp/nwpcscXW9KdZty3zpYNE8d34xQCF3RGFSPMDZetQFDK76ZH0=
=512O
-----END PGP SIGNATURE-----

--my01EG0z/4JNTjDd--


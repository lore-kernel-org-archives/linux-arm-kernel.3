Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 977A5F31E3A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 15:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c3XTz4FSbDwr5p1av1qRgK3pfC3NQhiSyYhoNugQlMs=; b=a6zC6aSCZXpXON21tU6q2c/4Z2
	EOtByK4pfBXOKDVuKMUKMCSgMDE0iZxQP7YDphq42w1Fz7pLXoHAKsBaBdNxhIv6Mgq/HEuD7v2I+
	YmFp/f0BqnhEIcOB+tDK/O7wW6C14crrQia+fQXuhfqGnmGH1Y39/D1tCuwbr++d5dUTRJNi12QAy
	ypWwhLzTGd+WfqlWYGsowCJlqaSQSR74hVJyOYODzX+7+KsreFKiYe6B+F8vuEHEqEIkuXI13njJd
	lf/twm7Gw8JLhF+m6qgfOBETU/QidX8LFthZutOvEtKqcxEGpIvrgW3tBeMSlHP5kLZ+Uzeq81G8A
	q7wFp8iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wArMS-0000000Anq4-49L4;
	Thu, 09 Apr 2026 15:32:05 +0000
Received: from leonov.paulk.fr ([185.233.101.22])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wArMO-0000000AnpA-2gKL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Apr 2026 15:32:02 +0000
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id BE4D61F8005A
	for <linux-arm-kernel@lists.infradead.org>; Thu,  9 Apr 2026 15:31:53 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 2C026B401B9; Thu,  9 Apr 2026 15:31:52 +0000 (UTC)
Received: from shepard (unknown [192.168.1.1])
	by laika.paulk.fr (Postfix) with ESMTPSA id D4EF3B401B3;
	Thu,  9 Apr 2026 15:31:50 +0000 (UTC)
Date: Thu, 9 Apr 2026 17:31:48 +0200
From: Paul Kocialkowski <paulk@sys-base.io>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>, mripard@kernel.org,
	mchehab@kernel.org, gregkh@linuxfoundation.org, wens@kernel.org,
	jernej.skrabec@gmail.com, samuel@sholland.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: cedrus: skip invalid H.264 reference list entries
Message-ID: <adfGZHR9wM2d6-yJ@shepard>
References: <20260324080856.56787-1-pengpeng@iscas.ac.cn>
 <adeqkmA9VhaPkSAk@shepard>
 <4bd5d70a6144f3e8d4356c182f314cf735f1921c.camel@collabora.com>
 <ade4Qe4OS04au2Ba@shepard>
 <a5f8c14becdc926f14ea852c8c5a2d4665a2ef8a.camel@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8zWVGOCXRFNtUVQP"
Content-Disposition: inline
In-Reply-To: <a5f8c14becdc926f14ea852c8c5a2d4665a2ef8a.camel@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_083201_040736_E821F77B 
X-CRM114-Status: GOOD (  23.43  )
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


--8zWVGOCXRFNtUVQP
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu 09 Apr 26, 10:39, Nicolas Dufresne wrote:
> Hi,
>=20
> Le jeudi 09 avril 2026 =C3=A0 16:31 +0200, Paul Kocialkowski a =C3=A9crit=
=C2=A0:
> > I think it make sense yes, but it would be good to document it in the u=
API
> > document too.
>=20
> Basically, extend in the M2M decoder spec(s) on the existing documentatio=
n:
>   =20
>    V4L2_BUF_FLAG_ERROR:
>    -
>    When this flag is set, the buffer has been dequeued successfully, alth=
ough
>    the data might **have been corrupted**. This is recoverable, streaming=
 may
>    continue as normal and the buffer may be reused normally. Drivers set =
this
>    flag when the VIDIOC_DQBUF ioctl is called.

Well this part is about v4l2 buffers in general, not just m2m/decoders.
But I guess this mechanism would make sense for more device classes than ju=
st
decoders, so we could indeed specify it there. Maybe with a sufficiently br=
oad
wording.

But it would be good to also update the stateless decode document (and maybe
stateful too) where V4L2_BUF_FLAG_ERROR is already mentionned a few times.
We could indicate how this behavior related to reference frames there.

If we agree I could make a series with the following:
- Introduce a V4L2_H264_REF_MISSING 0xff define (same for HEVC)
- Update the v4l2_h264_reference doc to mention it
- Update the cedrus driver to error out (zero-size payload) when the L0/L1 =
index
  is either V4L2_H264_REF_MISSING or an invalid index that doesn't exist in=
 the
  DPB (same for HEVC)
- Update the v4l2 buffer and stateless(+stateful) documents to mention that
  buffers marked with V4L2_BUF_FLAG_ERROR may or may not contain usable (yet
  corrupted) data depending on the payload size and how it relates to refer=
ence
  frames.

Then we could later envision having a mechanism (hopefully common) to figur=
e out
the best replacement to a given missing reference, which would allow cedrus
(and maybe other drivers too) to return a frame with incorrect data instead=
 of
a zero-size payload error.

What do you think?

All the best,

Paul

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--8zWVGOCXRFNtUVQP
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmnXxmQACgkQhP3B6o/u
lQz8nA//drat7vJDY+ABdsZlCoKtEB58kHDwiuxolmRi5JwVyxQfQoaO3exwOicd
dAQmv1DYkEvV6C/BFO/4F+LtT3BOjASFPChxlB8jsWN+NU8TJhizp6BURanrmDns
PT2BOKE33OVvN+ZpumARIBZ2IjlPUOvuDZqj9wvnQKZBrqIn6n6bh0zMHmZ53Dxm
yADWxQhvGhP1Q9IKFjocOZwc4hULqolm1HDj7oc2sJBhNGoBHU49co5lUcaMuEag
DSC+wSkH5xGSNZsTbKuasl5XDIjObFlRTpoGykMFuQtKqKJu+SNYFCl1Gq4loyjX
5pkh2LbRUJeu3A6Zo3XDBRJACdRH9dh5ttaaR0tstL9XaQAU78MVvLPslumAmhti
wwq46BdVRBPOWkYw07HEsVXbFPZMZGX/BYq+Mfyj7whW3xfSQUn1wXjPOI6ed1OS
MH1GuZKy8nRXHnvo6RDqE0dvlBeeEb49uPDk/S92f/tvI7tVwIBTYFKzZzEtHusy
lx1QJj7U6hA2jUa/O/uWgRkDU2d/OVH7PN0wRh1DeDC4F9/TCX7/Qb1L5yaD81KN
kO4+GO4VlZD0g6yWPjvyrITJbmQF0e4yowB6BaOHJa8Z4Zf/G8AfVvkoxxs1byaA
+X+wV7C+8yveA0dP9fdbqvf8DCoixA0U6FHZSLRvACk+HAy84P8=
=EPPU
-----END PGP SIGNATURE-----

--8zWVGOCXRFNtUVQP--


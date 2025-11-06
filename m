Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF007CCFA03
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 15:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z4N6Bf0T0VYiK5Mxxn0CGxAsoHE2qIVKOD0hThM6PDA=; b=svV8JlWTfXFN4J5obCL6DTOsVT
	fIEwvZ50rAb34WM9ZZ+qQqI4AhtI/06NMe98dfXd6gpMxfebpUlpNPQt/7nm9uWkshcJRIlfYCAQs
	/bhXudN8KyVe2gvW/JeUAM8YhCOgx3ci69Y1FPBgeYKfePxE3X5UDwIjIrAynzGBqlzvYNRufGmbP
	FV4hIwi/IL3lHPrMhxA8HHJ4i6A3f2fv0BYWdu77Xjb+EjcnqbCb5T1HUdYz3pae5zfyb7teU2zM8
	eEfZH7pnJ5wWnSewEiyIK2V1sOrYcl7r5vobdjGQqaAc8eH9ENXRgJlOi1Se0FvLbm1b2Ge8mqygG
	VsEsFXKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH1WS-0000000FkDJ-3U3z;
	Thu, 06 Nov 2025 15:03:37 +0000
Received: from leonov.paulk.fr ([185.233.101.22])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH1WP-0000000FkC2-0ENA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 15:03:34 +0000
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 2CCFA1F80051
	for <linux-arm-kernel@lists.infradead.org>; Thu,  6 Nov 2025 15:03:23 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 35728B0AA88; Thu,  6 Nov 2025 15:03:21 +0000 (UTC)
Received: from collins (unknown [192.168.1.1])
	by laika.paulk.fr (Postfix) with ESMTPSA id D776CB0A6F3;
	Thu,  6 Nov 2025 15:03:19 +0000 (UTC)
Date: Thu, 6 Nov 2025 16:03:17 +0100
From: Paul Kocialkowski <paulk@sys-base.io>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH] drm/sun4i: Cleanup v3s mixer config fields ordering and
 indentation
Message-ID: <aQy4tVdoQeoEyuMV@collins>
References: <20250704154149.3464461-1-paulk@sys-base.io>
 <aKhFPRP8ILNkKAvy@shepard>
 <CAGb2v66=Ppqw+_fpAsRYd_4OBOhbHkk7RetfEXbYmvQ_+hoe7g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0I3HyHXU+o/IGbUL"
Content-Disposition: inline
In-Reply-To: <CAGb2v66=Ppqw+_fpAsRYd_4OBOhbHkk7RetfEXbYmvQ_+hoe7g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_070333_266483_6C52DC13 
X-CRM114-Status: GOOD (  22.02  )
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


--0I3HyHXU+o/IGbUL
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Chen-Yu,

Le Thu 06 Nov 25, 14:01, Chen-Yu Tsai a =C3=A9crit :
> On Fri, Aug 22, 2025 at 6:24=E2=80=AFPM Paul Kocialkowski <paulk@sys-base=
=2Eio> wrote:
> >
> > Hi,
> >
> > On Fri 04 Jul 25, 17:41, Paul Kocialkowski wrote:
> > > The v3s mixer config definition is a bit messy. Tidy it up.
> > > No function change is intended.
> >
> > This patch didn't make it in the previous cycle.
> > Would it be possible to pick it up this time?
>=20
> I guess this is going to conflict with Jernej's refactoring / cleanup
> series.
>=20
> And, I think v3s is not the only one that has fields in a different order.
> Might we clean this up after all the refactoring?

Sure, it's better if this doesn't get in the way of the rework.
I'll send something after the rework is merged if the issue still exists.

Thanks,

Paul

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--0I3HyHXU+o/IGbUL
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmkMuLUACgkQhP3B6o/u
lQw+jg/+Mg60NxB2i+9ikMTfbzq3n2Owcv3rvikDcScmhu8WSIKRvFQC8jGJbUM4
5jsEuxjK/RtQyvoxmkuD404H54uPHes5kFIhZ5V2OJqxTN3UUptRmgsHhqwElZQI
G1be0tjhzXpoF1R/KsWfWi1xmf3tyf+kgapFhmAfdIU/E9To5b3BJydLDk0vMFFF
3bg+wujCC5OLjIWe3HbgrkAdHaqctEf4eMQCDQTW6TcyX3WMz6yRh7BCQluxtun4
R4a8XOMV5Pe6fgSWDLTSQ+QL5e1hcFjNTGRWzPqQ0CJkAVo7AdfOfUNxhQcTjbRB
jynrXFpdIoQAfj2NnSdrPheb/0cbKphnKlPSC1oiFM2DlJwveYUxTBliHBPUFO5g
Pxp9djf6mRLf3wXJXcozb9o4RWX0YXSh0jobwb6UeEIN8xYxix+5pMvFfO73IrQg
4hD+P7EfN53wQcMg993CWfO6h7d36XWDglFBUJQI7jIXQuuIOhIKCpv+1+RWZ/9m
UE0JJgPOXp3Suz7fR3IsVeNaoL4sGWY510e/ZUdddZflJNv7pAhklLCV/TbTPf54
jInSCc2fitmkqYGqCa+n9g0Yn8OoPMwGoqwI6FxT9QbaF5hWEKt0uvlp9uAs1srN
lpy0Pnxeniypj5RUxCNb0VoQ8FxJjeLkKqEzrD0uJheXl7Vpph4=
=lqF6
-----END PGP SIGNATURE-----

--0I3HyHXU+o/IGbUL--


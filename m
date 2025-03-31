Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3E9DC3600B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Mar 2025 10:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L21ZPvClAKBSWzXxoiTFE/aDea7REiHELOeHQGD5ojQ=; b=3JxawP0vZE2EaMxh7P+CrdzUks
	0GEyDJoXIhvEGxeaopu2dLDWRQNZffJJhNzr5o+0l4K7Mee4sJig+DLF+zq7sZtMlHpRJ8UTuhVjY
	sa3CflW/i+CuRjVTRYnNUOi4Gl9mK/vlodnhA6q95+/xa9ysdsSL5Yre3GAQpyau9n9I9fUt+dsrq
	7sAjlfEMiMkf01f5WwxQ6/reBAlZBC1/CJhYAFnGm2Wre4+vn5dmHKIEIQqh9zu/VZpohQL8o0ooW
	bedvqUzN5CETSOtf7LVv7rRYjMDn1avDWMmEQp1RHm8i0wJnFfZarKJF7wBIz5FFfjpOG1wNyxt/B
	LjEqfKWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzCnz-000000007X7-3Mu8;
	Mon, 31 Mar 2025 10:55:47 +0000
Received: from whm50.louhi.net ([77.240.19.51])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzCmG-000000007Pb-2PZP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Mar 2025 10:54:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=haloniitty.fi; s=default; h=Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=L21ZPvClAKBSWzXxoiTFE/aDea7REiHELOeHQGD5ojQ=; b=rpnUb+VW0mW2eHSba98bwzbLwj
	pmKEqDjh8YSrv9nBxHWTnq0YrWzbCbNjZTjdCaIze2spH38rO9wK8COW0DTVU8cAS6irDxUmZ+XH3
	+unm7gQw6cCBtDt0HDaPlQxn1EK+2gXnCkqrs9+taGL031T6lMGQP0SaY7HKW/95xTrd6f8A5gQ1v
	CPs23Dc2IlVaZHtNoN/RKOEN+kAkb4G3dgo+i1lcTMmbS4dOOVAwT3+5JrkvjiugOtTIXQbwKnR/w
	prqKg7f7I4/e1AACvItXUPLSgcppd5WgAWQEhEVK/A32DOKB2QVfTix/WDRpdUbfQFqOuh1lWx5uv
	yMbBgbhQ==;
Received: from [194.136.85.206] (port=53836 helo=eldfell)
	by whm50.louhi.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <pekka.paalanen@haloniitty.fi>)
	id 1tzCm7-000000005Yd-2daZ;
	Mon, 31 Mar 2025 13:53:51 +0300
Date: Mon, 31 Mar 2025 13:53:37 +0300
From: Pekka Paalanen <pekka.paalanen@haloniitty.fi>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Tomi Valkeinen
 <tomi.valkeinen@ideasonboard.com>, Vishal Sagar <vishal.sagar@amd.com>,
 Anatoliy Klymenko <anatoliy.klymenko@amd.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Michal Simek <michal.simek@amd.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Dmitry Baryshkov
 <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v4 03/11] drm/fourcc: Add DRM_FORMAT_Y8
Message-ID: <20250331135337.61934003@eldfell>
In-Reply-To: <20250331082135.GB13690@pendragon.ideasonboard.com>
References: <20250326-xilinx-formats-v4-0-322a300c6d72@ideasonboard.com>
	<20250326-xilinx-formats-v4-3-322a300c6d72@ideasonboard.com>
	<CAMuHMdXM1B1c=62EpcuUdpdpaBRZSJLXb1GBB0egzp7Fyeo5-w@mail.gmail.com>
	<b195971c-52e6-463e-a440-83dde4346e65@ideasonboard.com>
	<20250327112009.6b4dc430@eldfell>
	<b5cf15a4-7c65-4718-9c39-a4c86179ba4c@ideasonboard.com>
	<20250327175842.130c0386@eldfell>
	<CAMuHMdVEpTVWmwrYt+G-QSWucT91goUcFor9qbo5rZ+X2jnRog@mail.gmail.com>
	<20250331105446.098f0fbe@eldfell>
	<20250331082135.GB13690@pendragon.ideasonboard.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/5nGe2EBr+ualrmveP2x_xsA";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - whm50.louhi.net
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - haloniitty.fi
X-Get-Message-Sender-Via: whm50.louhi.net: authenticated_id: pekka.paalanen@haloniitty.fi
X-Authenticated-Sender: whm50.louhi.net: pekka.paalanen@haloniitty.fi
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_035401_126722_8EE682F3 
X-CRM114-Status: GOOD (  45.14  )
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

--Sig_/5nGe2EBr+ualrmveP2x_xsA
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 31 Mar 2025 11:21:35 +0300
Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:

> On Mon, Mar 31, 2025 at 10:54:46AM +0300, Pekka Paalanen wrote:
> > On Thu, 27 Mar 2025 17:35:39 +0100
> > Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> >  =20
> > > Hi Pekka,
> > >=20
> > > On Thu, 27 Mar 2025 at 16:59, Pekka Paalanen
> > > <pekka.paalanen@haloniitty.fi> wrote: =20
> > > > On Thu, 27 Mar 2025 16:21:16 +0200
> > > > Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> wrote:   =20
> > > > > On 27/03/2025 11:20, Pekka Paalanen wrote:   =20
> > > > > > On Wed, 26 Mar 2025 15:55:18 +0200
> > > > > > Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> wrote:   =20
> > > > > >> On 26/03/2025 15:52, Geert Uytterhoeven wrote:   =20
> > > > > >>> On Wed, 26 Mar 2025 at 14:23, Tomi Valkeinen
> > > > > >>> <tomi.valkeinen@ideasonboard.com> wrote:   =20
> > > > > >>>> Add greyscale Y8 format.
> > > > > >>>>
> > > > > >>>> Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > > >>>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.c=
om>   =20
> > > > > >>>
> > > > > >>> Thanks for your patch!
> > > > > >>>   =20
> > > > > >>>> --- a/include/uapi/drm/drm_fourcc.h
> > > > > >>>> +++ b/include/uapi/drm/drm_fourcc.h
> > > > > >>>> @@ -405,6 +405,9 @@ extern "C" {
> > > > > >>>>    #define DRM_FORMAT_YUV444      fourcc_code('Y', 'U', '2',=
 '4') /* non-subsampled Cb (1) and Cr (2) planes */
> > > > > >>>>    #define DRM_FORMAT_YVU444      fourcc_code('Y', 'V', '2',=
 '4') /* non-subsampled Cr (1) and Cb (2) planes */
> > > > > >>>>
> > > > > >>>> +/* Greyscale formats */
> > > > > >>>> +
> > > > > >>>> +#define DRM_FORMAT_Y8          fourcc_code('G', 'R', 'E', '=
Y')  /* 8-bit Y-only */   =20
> > > > > >>>
> > > > > >>> This format differs from e.g. DRM_FORMAT_R8, which encodes
> > > > > >>> the number of bits in the FOURCC format. What do you envision
> > > > > >>> for e.g. DRM_FORMAT_Y16? fourcc_code('G', 'R', '1', '6')?   =
=20
> > > > > >>
> > > > > >> I wanted to use the same fourcc as on V4L2 side. Strictly spea=
king it's
> > > > > >> not required, but different fourccs for the same formats do co=
nfuse.
> > > > > >>
> > > > > >> So, generally speaking, I'd pick an existing fourcc from v4l2 =
side if
> > > > > >> possible, and if not, invent a new one.   =20
> > > > > >
> > > > > > what's the actual difference between DRM_FORMAT_R8 and DRM_FORM=
AT_Y8?
> > > > > >
> > > > > > Is the difference that when R8 gets expanded to RGB, it becomes=
 (R, 0,
> > > > > > 0), but Y8 gets expanded to (c1 * Y, c2 * Y, c3 * Y) where c1..=
c3 are
> > > > > > defined by MatrixCoefficients (H.273 terminology)?
> > > > > >
> > > > > > That would be my intuitive assumption following how YCbCr is ha=
ndled.
> > > > > > Is it obvious enough, or should there be a comment to that effe=
ct?   =20
> > > > >
> > > > > You raise an interesting point. Is it defined how a display drive=
r, that
> > > > > supports R8 as a format, shows R8 on screen? I came into this in =
the
> > > > > context of grayscale formats, so I thought R8 would be handled as=
 (R, R,
> > > > > R) in RGB. But you say (R, 0, 0), which... also makes sense.   =20
> > > >
> > > > That is a good question too. I based my assumption on OpenGL behavi=
or
> > > > of R8.
> > > >
> > > > Single channel displays do exist I believe, but being single-channe=
l,
> > > > expansion on the other channels is likely meaningless. Hm, but for =
the
> > > > KMS color pipeline, it would be meaningful, like with a CTM.
> > > > Interesting.
> > > >
> > > > I don't know. Maybe Geert does?   =20
> > >=20
> > > I did some digging, and was a bit surprised that it was you who told
> > > me to use R8 instead of Y8?
> > > https://lore.kernel.org/all/20220202111954.6ee9a10c@eldfell =20
> >=20
> > Hi Geert,
> >=20
> > indeed I did. I never thought of the question of expansion to R,G,B
> > before. Maybe that expansion is what spells R8 and Y8 apart?
> >=20
> > I do think that expansion needs to be specified, so that the KMS color
> > pipeline computations are defined. There is a big difference between
> > multiplying these with an arbitrary 3x3 matrix (e.g. CTM):
> >=20
> > - (R, 0, 0)
> > - (R, R, R)
> > - (c1 * Y, c2 * Y, c3 * Y) =20
>=20
> I'd be very surprised by an YUV to RGB conversion matrix where the first
> column would contain different values. What we need to take into account
> though is quantization (full vs. limited range).

A good point, are the Y coefficients always 1.0 after quantization
range has been accounted for?

That makes Y8 produce (Y, Y, Y), and we have our answer: R8 should be
(R, 0, 0), so we have both variants. Or do we need Y-formats at all?

Can we specify Y, R, G and B be nominal values in the range 0.0 - 1.0
in the KMS color processing?


Thanks,
pq

> > I forgot to consider that in the discussion of single-channel displays,
> > because the displays obviously do not consider any other channel than
> > the one.
> >=20
> > Using DRM_FORMAT_Y8 FB with a single-channel display might even be
> > surprising, because the proposed Y8 definition would result in c1 * Y,
> > and not Y. The default c1 comes from the BT.601 matrix IIRC?
> >=20
> > Therefore I think the difference between R8 and Y8 has been found. Now
> > we just need to determine whether R8 means (R, 0, 0) or (R, R, R) to
> > nail down the color operations as well. There are questions like what
> > is the outcome at the video signal level when we have one KMS plane
> > with an R8 FB and another KMS plane with an RGBA8888 FB on the same
> > CRTC? What about Y8 or NV12 in the mix? What if the video signal is
> > single-channel, RGB, or YCbCr? =20
>=20


--Sig_/5nGe2EBr+ualrmveP2x_xsA
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmfqdDEACgkQI1/ltBGq
qqdtmg/7BJP/M2woCFDbkAFSqAVNKzEjMXOmSEcgMcfxQddTCcjdcH7tuQOhQxbo
fwKO1vHo+dDlenz3cW5QcrWzXH5BKmuAYGjziq+ak7m3VtOYyBsSMgnICPxj7CYK
RmAuE3bBYGKiQRP4ZLcwwKGlaIb1EYHeaodsRtUCaU1uV6Ly/VA5s5IAn5JT1r5M
aDCD+/YloWRV6G3hlm+LQch05lshBn+VjC82fh+Kq/pGIqZyG9hJ3T8c9k6f/pr+
gBaQMOQVws8UZ0lPdxmpRpIhjlXa5hU8sZAWuEx2gT2lw0CbXzW/VKOffaEMY4fV
EDEqAWiYlH72I6YqCMTnZQ/QyRigN1UXt23U0Y3x75iTv5PhL2JyzTCT++xXewMc
gLYhDy8OKcxZW9Q1A6TEcVuB7BYI8H82ME8/VQcvprKnd2s1yydxR9bsxxddPZPp
DYzBQsF5LNePd5cKFygErRc+yfeGR3myBosf1dDgyQla5vftMxZ6gGG2hdq3ETaZ
L/VfL73xHbQyCEax/OYMjVpKsuChaS19MAhPj4W5xDhj3hW1evlWyQ+Q5X7iCYx/
T5gTBQrTzLsC8p9q8DL8x74/A1nWvwKxw9nutXHTUYPPgxD2BehF6a4tmRphOK/k
rY/5/QMyH7dJpdJqGP8+p7upz4f7KPKpf7tVO0wxTLw9pHMe5nQ=
=Voos
-----END PGP SIGNATURE-----

--Sig_/5nGe2EBr+ualrmveP2x_xsA--


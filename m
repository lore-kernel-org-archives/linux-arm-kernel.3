Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D121C36014
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Mar 2025 07:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sb9hcwin4tLRp3oqgDcx/MjqTaRYlwB2vSQozhYeOj4=; b=i2UhswssdvtqL6oUPMdzJT8jnG
	e3VLCCajwD+VPFJTfWeo/X4FJMUTKzwGeXLnMz0QCn72iaWxXCgpaEP8qNKf01Ys2qbdXUE1B4aZ0
	8iEVofto/pLTX6/A6xO2KgQ1iaORqdwaU4hY3p0Jx7Ed2NBjD2VT5DSOv0BmKpao17/slJVGBd+re
	x+4m5fB+0wrIb89NJSYMWBnSt4/5tJijXTqizVe96+WIVTbRanqr7RyZCqzPDUYlbPo859n/UbfLW
	DikcuWkgenYAXQ3OPW1+t3UrNCcjazlKsRc7/lp8m2crXHekurP/VLrni5hogfz5RGQTyPpqr3R7B
	K29CiFOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzA0v-0000000HH8C-31jW;
	Mon, 31 Mar 2025 07:56:57 +0000
Received: from whm50.louhi.net ([77.240.19.51])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tz9zB-0000000HGu2-3Zci
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Mar 2025 07:55:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=haloniitty.fi; s=default; h=Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=sb9hcwin4tLRp3oqgDcx/MjqTaRYlwB2vSQozhYeOj4=; b=bwCC02T90+w20Rigll6t4LOJse
	ncSrDoAbrpcYMOJlaUZabIrii55xXfB/50d2baNQ0o2q/k2uGQld46Amu876rqHxFKceZCSC3rfGl
	cimnpaAsO8McDHHL2DCw/QZ4E8Y5M5/Z0xljp0HmVmY7E8qhG9t0wLrejPZ+y+U7uJfNJHxW+px+B
	uUHpKajSPts78R9zJjsUUcs7hVK6X8/nD0BNDlLjOIHNsvFWeEwY7+k4j2dR1WnqQn5STbOqwc0h5
	azEndrsep7ppw77ho/HbGrYMQGv8GAi4RrzoU7xT7gdAO/6D7L6YWn9jWFWt/TCra0sp0Cgy+OEOH
	iA5QCBlQ==;
Received: from [194.136.85.206] (port=34794 helo=eldfell)
	by whm50.louhi.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <pekka.paalanen@haloniitty.fi>)
	id 1tz9z0-0000000021R-2b7A;
	Mon, 31 Mar 2025 10:54:58 +0300
Date: Mon, 31 Mar 2025 10:54:46 +0300
From: Pekka Paalanen <pekka.paalanen@haloniitty.fi>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Vishal Sagar
 <vishal.sagar@amd.com>, Anatoliy Klymenko <anatoliy.klymenko@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Michal Simek <michal.simek@amd.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Dmitry Baryshkov
 <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v4 03/11] drm/fourcc: Add DRM_FORMAT_Y8
Message-ID: <20250331105446.098f0fbe@eldfell>
In-Reply-To: <CAMuHMdVEpTVWmwrYt+G-QSWucT91goUcFor9qbo5rZ+X2jnRog@mail.gmail.com>
References: <20250326-xilinx-formats-v4-0-322a300c6d72@ideasonboard.com>
	<20250326-xilinx-formats-v4-3-322a300c6d72@ideasonboard.com>
	<CAMuHMdXM1B1c=62EpcuUdpdpaBRZSJLXb1GBB0egzp7Fyeo5-w@mail.gmail.com>
	<b195971c-52e6-463e-a440-83dde4346e65@ideasonboard.com>
	<20250327112009.6b4dc430@eldfell>
	<b5cf15a4-7c65-4718-9c39-a4c86179ba4c@ideasonboard.com>
	<20250327175842.130c0386@eldfell>
	<CAMuHMdVEpTVWmwrYt+G-QSWucT91goUcFor9qbo5rZ+X2jnRog@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/QZAnc9FdGv0CGGuBeb7Bgcd";
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
X-CRM114-CacheID: sfid-20250331_005510_410123_8112EC87 
X-CRM114-Status: GOOD (  34.84  )
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

--Sig_/QZAnc9FdGv0CGGuBeb7Bgcd
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 27 Mar 2025 17:35:39 +0100
Geert Uytterhoeven <geert@linux-m68k.org> wrote:

> Hi Pekka,
>=20
> On Thu, 27 Mar 2025 at 16:59, Pekka Paalanen
> <pekka.paalanen@haloniitty.fi> wrote:
> > On Thu, 27 Mar 2025 16:21:16 +0200
> > Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> wrote: =20
> > > On 27/03/2025 11:20, Pekka Paalanen wrote: =20
> > > > On Wed, 26 Mar 2025 15:55:18 +0200
> > > > Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> wrote: =20
> > > >> On 26/03/2025 15:52, Geert Uytterhoeven wrote: =20
> > > >>> On Wed, 26 Mar 2025 at 14:23, Tomi Valkeinen
> > > >>> <tomi.valkeinen@ideasonboard.com> wrote: =20
> > > >>>> Add greyscale Y8 format.
> > > >>>>
> > > >>>> Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > >>>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> =
=20
> > > >>>
> > > >>> Thanks for your patch!
> > > >>> =20
> > > >>>> --- a/include/uapi/drm/drm_fourcc.h
> > > >>>> +++ b/include/uapi/drm/drm_fourcc.h
> > > >>>> @@ -405,6 +405,9 @@ extern "C" {
> > > >>>>    #define DRM_FORMAT_YUV444      fourcc_code('Y', 'U', '2', '4'=
) /* non-subsampled Cb (1) and Cr (2) planes */
> > > >>>>    #define DRM_FORMAT_YVU444      fourcc_code('Y', 'V', '2', '4'=
) /* non-subsampled Cr (1) and Cb (2) planes */
> > > >>>>
> > > >>>> +/* Greyscale formats */
> > > >>>> +
> > > >>>> +#define DRM_FORMAT_Y8          fourcc_code('G', 'R', 'E', 'Y') =
 /* 8-bit Y-only */ =20
> > > >>>
> > > >>> This format differs from e.g. DRM_FORMAT_R8, which encodes
> > > >>> the number of bits in the FOURCC format. What do you envision
> > > >>> for e.g. DRM_FORMAT_Y16? fourcc_code('G', 'R', '1', '6')? =20
> > > >>
> > > >> I wanted to use the same fourcc as on V4L2 side. Strictly speaking=
 it's
> > > >> not required, but different fourccs for the same formats do confus=
e.
> > > >>
> > > >> So, generally speaking, I'd pick an existing fourcc from v4l2 side=
 if
> > > >> possible, and if not, invent a new one. =20
> > > >
> > > > what's the actual difference between DRM_FORMAT_R8 and DRM_FORMAT_Y=
8?
> > > >
> > > > Is the difference that when R8 gets expanded to RGB, it becomes (R,=
 0,
> > > > 0), but Y8 gets expanded to (c1 * Y, c2 * Y, c3 * Y) where c1..c3 a=
re
> > > > defined by MatrixCoefficients (H.273 terminology)?
> > > >
> > > > That would be my intuitive assumption following how YCbCr is handle=
d.
> > > > Is it obvious enough, or should there be a comment to that effect? =
=20
> > >
> > > You raise an interesting point. Is it defined how a display driver, t=
hat
> > > supports R8 as a format, shows R8 on screen? I came into this in the
> > > context of grayscale formats, so I thought R8 would be handled as (R,=
 R,
> > > R) in RGB. But you say (R, 0, 0), which... also makes sense. =20
> >
> > That is a good question too. I based my assumption on OpenGL behavior
> > of R8.
> >
> > Single channel displays do exist I believe, but being single-channel,
> > expansion on the other channels is likely meaningless. Hm, but for the
> > KMS color pipeline, it would be meaningful, like with a CTM.
> > Interesting.
> >
> > I don't know. Maybe Geert does? =20
>=20
> I did some digging, and was a bit surprised that it was you who told
> me to use R8 instead of Y8?
> https://lore.kernel.org/all/20220202111954.6ee9a10c@eldfell

Hi Geert,

indeed I did. I never thought of the question of expansion to R,G,B
before. Maybe that expansion is what spells R8 and Y8 apart?

I do think that expansion needs to be specified, so that the KMS color
pipeline computations are defined. There is a big difference between
multiplying these with an arbitrary 3x3 matrix (e.g. CTM):

- (R, 0, 0)
- (R, R, R)
- (c1 * Y, c2 * Y, c3 * Y)

I forgot to consider that in the discussion of single-channel displays,
because the displays obviously do not consider any other channel than
the one.

Using DRM_FORMAT_Y8 FB with a single-channel display might even be
surprising, because the proposed Y8 definition would result in c1 * Y,
and not Y. The default c1 comes from the BT.601 matrix IIRC?

Therefore I think the difference between R8 and Y8 has been found. Now
we just need to determine whether R8 means (R, 0, 0) or (R, R, R) to
nail down the color operations as well. There are questions like what
is the outcome at the video signal level when we have one KMS plane
with an R8 FB and another KMS plane with an RGBA8888 FB on the same
CRTC? What about Y8 or NV12 in the mix? What if the video signal is
single-channel, RGB, or YCbCr?


Thanks,
pq

--Sig_/QZAnc9FdGv0CGGuBeb7Bgcd
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmfqSkYACgkQI1/ltBGq
qqc4pxAAnPZQ0QQxEZ5HZEAD/A561x3dmKYKf16AaBIpBhdwXvF672H3q7NOC3MH
4qWNrJHlv5TQ+rhcwQJfYzqnOTfOwoQdpz0siUUjtSrxwfpQ2T9KmAT1sWHSudet
kmEWqPBDXwmnUui4Hi6bXgiKqYsMW6PaXwT/3GO3UI8Matmu5D0yeIqqC+p4UnH7
WCcZ4osqzkgxyRkw2r7+aZq6k0VsfYXjXTNQ1PXHCArJSx5Rwlucw96IvOvUSO/o
EvA0h+UIqIiuq3Va7XfyeoTaVKZ52f8F5nkeTHYoc1X3AbOAiEIGANId3vGu8hZn
9UG0SAMxJBl2BGdJpi+auNSS1Mq5J8RT/X4Tlq0L9UOg6w3gB1SwbdnQIgolYYGu
MiwdyAry2zffnH5e3/pfsiM37IZNMX2bC8XzfvpK+pVxpfTE+lU15ffEA8++LisI
zdpckbn440o9I074KglAGkZaB33++gNlemoVZE0nl+YY+o0frBXeObf1OMuPnZ2m
K5uwHCbQLRnQkKnL2gcbwaMtZmkohGnksoD+pT7FF6ebMd4yv/7JyXnBezyccGhv
Q0xATae0gNbooT4s0VrduWFRariMVz0WUUsoIb2rYx2MHXnahtmS/zXkwbYXU2U1
1tg/KdcAxlpSiTCS+6UTRD1hai9FzgLLxz7vMUbdx2r2iEDjSPY=
=dA9t
-----END PGP SIGNATURE-----

--Sig_/QZAnc9FdGv0CGGuBeb7Bgcd--


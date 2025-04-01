Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 587A7C36010
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 13:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7ZhFowZYPb/ehWe3WI9YDzdqsWQBq6iqxIFEK20hOv0=; b=MWbIcV9iphLMz2DK/6fktfTDmt
	fAR5MMGBjf0CIR2hMFZXiWNoXlAliodbxqgUdDLzEh/zT5yyrue6yavAMOQ7Gwq/IKgrkYI+7pCof
	BRp5w7z8/cDENKbOkWRclMGMXLmEqw717LDLhjvh9O8ptXXY+EtnEJ9k1TBalUU+NLn6KxraPdPIL
	7Xk4i27KN2K2Q7q1mJOLM4cSMzXIk/Fio+AxZqq23dLnrI2EraejgmEm7cQQoZt4vX8K1fInW7eIh
	K6Rx2LOV8ZWYwoN0dv30ui3VAUz1wHT1uqATKoDVD0aOfYoqKDqDdeKHcVifKKfZi0WtNgP3DKfO1
	JRa5iJbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzbgL-00000003RIX-3wyx;
	Tue, 01 Apr 2025 13:29:33 +0000
Received: from whm50.louhi.net ([77.240.19.51])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzbeY-00000003R6U-0XZS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 13:27:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=haloniitty.fi; s=default; h=Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=7ZhFowZYPb/ehWe3WI9YDzdqsWQBq6iqxIFEK20hOv0=; b=fxULT5/ryE6nrW7IvM++sEHUGg
	/Zgyu+03x5TWoOgeVWdoSCY3VlGGOuncrqGNHBNAkY67Dy1JwhjeWDi8tuq9ysnWJBHq440I7C/mb
	tS+1rFRf8nDyBParFYzVkoAR8/btiBW3xVe6awJGw9NvNTJuqNIRFxpaXCMMFLaYeH8qFErvn6Wza
	YUldOi+0pjK62jO0oWxpVlnECPuavByutr1Xmlf/ZuDwsJ2MBSe0mOXJummZv82XoSwTeuXCHZJ2N
	hTCga/344qp+GS4dg603VcRDqlDkXxS8wjzSrZ5tApQun0mN4eaR4lo6zQQphPYuZYIKs+VOT5jIp
	18qOXvEg==;
Received: from [194.136.85.206] (port=49796 helo=eldfell)
	by whm50.louhi.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <pekka.paalanen@haloniitty.fi>)
	id 1tzbeS-000000004cW-0byF;
	Tue, 01 Apr 2025 16:27:36 +0300
Date: Tue, 1 Apr 2025 16:27:32 +0300
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
Message-ID: <20250401162732.731ef774@eldfell>
In-Reply-To: <20250331135337.61934003@eldfell>
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
	<20250331135337.61934003@eldfell>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/OLA4PRd4W1=pfOT/_baNr+x";
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
X-CRM114-CacheID: sfid-20250401_062742_671262_91F3928F 
X-CRM114-Status: GOOD (  39.79  )
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

--Sig_/OLA4PRd4W1=pfOT/_baNr+x
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 31 Mar 2025 13:53:37 +0300
Pekka Paalanen <pekka.paalanen@haloniitty.fi> wrote:

> On Mon, 31 Mar 2025 11:21:35 +0300
> Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:
>=20
> > On Mon, Mar 31, 2025 at 10:54:46AM +0300, Pekka Paalanen wrote: =20
> > > On Thu, 27 Mar 2025 17:35:39 +0100
> > > Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > >    =20
> > > > Hi Pekka,
> > > >=20
> > > > On Thu, 27 Mar 2025 at 16:59, Pekka Paalanen
> > > > <pekka.paalanen@haloniitty.fi> wrote:   =20
> > > > > On Thu, 27 Mar 2025 16:21:16 +0200
> > > > > Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> wrote:     =20
> > > > > > On 27/03/2025 11:20, Pekka Paalanen wrote:     =20
> > > > > > > On Wed, 26 Mar 2025 15:55:18 +0200
> > > > > > > Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> wrote:     =
=20
> > > > > > >> On 26/03/2025 15:52, Geert Uytterhoeven wrote:     =20
> > > > > > >>> On Wed, 26 Mar 2025 at 14:23, Tomi Valkeinen
> > > > > > >>> <tomi.valkeinen@ideasonboard.com> wrote:     =20
> > > > > > >>>> Add greyscale Y8 format.
> > > > > > >>>>
> > > > > > >>>> Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > > > >>>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard=
.com>     =20
> > > > > > >>>
> > > > > > >>> Thanks for your patch!
> > > > > > >>>     =20
> > > > > > >>>> --- a/include/uapi/drm/drm_fourcc.h
> > > > > > >>>> +++ b/include/uapi/drm/drm_fourcc.h
> > > > > > >>>> @@ -405,6 +405,9 @@ extern "C" {
> > > > > > >>>>    #define DRM_FORMAT_YUV444      fourcc_code('Y', 'U', '2=
', '4') /* non-subsampled Cb (1) and Cr (2) planes */
> > > > > > >>>>    #define DRM_FORMAT_YVU444      fourcc_code('Y', 'V', '2=
', '4') /* non-subsampled Cr (1) and Cb (2) planes */
> > > > > > >>>>
> > > > > > >>>> +/* Greyscale formats */
> > > > > > >>>> +
> > > > > > >>>> +#define DRM_FORMAT_Y8          fourcc_code('G', 'R', 'E',=
 'Y')  /* 8-bit Y-only */     =20
> > > > > > >>>
> > > > > > >>> This format differs from e.g. DRM_FORMAT_R8, which encodes
> > > > > > >>> the number of bits in the FOURCC format. What do you envisi=
on
> > > > > > >>> for e.g. DRM_FORMAT_Y16? fourcc_code('G', 'R', '1', '6')?  =
   =20
> > > > > > >>
> > > > > > >> I wanted to use the same fourcc as on V4L2 side. Strictly sp=
eaking it's
> > > > > > >> not required, but different fourccs for the same formats do =
confuse.
> > > > > > >>
> > > > > > >> So, generally speaking, I'd pick an existing fourcc from v4l=
2 side if
> > > > > > >> possible, and if not, invent a new one.     =20
> > > > > > >
> > > > > > > what's the actual difference between DRM_FORMAT_R8 and DRM_FO=
RMAT_Y8?
> > > > > > >
> > > > > > > Is the difference that when R8 gets expanded to RGB, it becom=
es (R, 0,
> > > > > > > 0), but Y8 gets expanded to (c1 * Y, c2 * Y, c3 * Y) where c1=
..c3 are
> > > > > > > defined by MatrixCoefficients (H.273 terminology)?
> > > > > > >
> > > > > > > That would be my intuitive assumption following how YCbCr is =
handled.
> > > > > > > Is it obvious enough, or should there be a comment to that ef=
fect?     =20
> > > > > >
> > > > > > You raise an interesting point. Is it defined how a display dri=
ver, that
> > > > > > supports R8 as a format, shows R8 on screen? I came into this i=
n the
> > > > > > context of grayscale formats, so I thought R8 would be handled =
as (R, R,
> > > > > > R) in RGB. But you say (R, 0, 0), which... also makes sense.   =
  =20
> > > > >
> > > > > That is a good question too. I based my assumption on OpenGL beha=
vior
> > > > > of R8.
> > > > >
> > > > > Single channel displays do exist I believe, but being single-chan=
nel,
> > > > > expansion on the other channels is likely meaningless. Hm, but fo=
r the
> > > > > KMS color pipeline, it would be meaningful, like with a CTM.
> > > > > Interesting.
> > > > >
> > > > > I don't know. Maybe Geert does?     =20
> > > >=20
> > > > I did some digging, and was a bit surprised that it was you who told
> > > > me to use R8 instead of Y8?
> > > > https://lore.kernel.org/all/20220202111954.6ee9a10c@eldfell   =20
> > >=20
> > > Hi Geert,
> > >=20
> > > indeed I did. I never thought of the question of expansion to R,G,B
> > > before. Maybe that expansion is what spells R8 and Y8 apart?
> > >=20
> > > I do think that expansion needs to be specified, so that the KMS color
> > > pipeline computations are defined. There is a big difference between
> > > multiplying these with an arbitrary 3x3 matrix (e.g. CTM):
> > >=20
> > > - (R, 0, 0)
> > > - (R, R, R)
> > > - (c1 * Y, c2 * Y, c3 * Y)   =20
> >=20
> > I'd be very surprised by an YUV to RGB conversion matrix where the first
> > column would contain different values. What we need to take into account
> > though is quantization (full vs. limited range). =20

Quantization range is indeed good to note. R8 would be always full
range, but Y8 would follow COLOR_RANGE property.

> That makes Y8 produce (Y, Y, Y), and we have our answer: R8 should be
> (R, 0, 0), so we have both variants.
>=20
> Can we specify Y, R, G and B be nominal values in the range 0.0 - 1.0
> in the KMS color processing?

I think this 0.0 - 1.0 nominal range definition for the abstract KMS
color processing is necessary.

It also means that limited range Y8 data, when containing values 0-15
or 240-255, would produce negative and greater than 1.0 values,
respectively. They might get immediately clamped to 0.0 - 1.0 with the
first color operation they face, though, but the concept seems
important and carrying over to the new color pipelines UAPI which might
choose not to clamp.


Thanks,
pq

--Sig_/OLA4PRd4W1=pfOT/_baNr+x
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmfr6cQACgkQI1/ltBGq
qqcyAg/7B5M9LjzwSycaieCw4rY2vce9hzdBsGuTQ9VLRFvXZF/OhbeaTsYJCg6j
NGDDcGHOq0SV25e6I8YvaSUfb7n+MbW+l8Xjo3Ivoz0S9Uy5aUeo58ZsjM3GO2yu
7JlWxw4cAJge22SukdPef5qmGa37+Lkl0HyowrjbIAJYUqdEzRKrqLZRl3EVG+98
SKR2Z4ZZhysT2lrlDCJaAz8UfYDXO7FoZ0qcDqYbl6tzSKv6kIizymb9RGrywcel
5Bsm3Y8ynnXVtZc02TMWswXpoCDPn3VxdOCz6D2pQkcgdB0cZjigAuiDtOXbnA7L
iQPJECcDK1vlSFpNk7Xa24SN3FNiCGpiGKpZp/vobDL8aDtOWvcburh+VZ6yq3WL
Pi1RDaePaCr5/vxJ8+Aw+tgWtx5kaSUEN5kCkQQ4ujVaeRsyE3qx/mITMEEx6LgJ
o23+CS7EmbM0Q3XLByu4MvzgerWz2kBpgBSRZ8bwFpwns3kAG6YCKjoE1sguj+qI
xTj7NH9zfRq9jIz8Td6Tix/jVPzqAEKUcwb2N9SCoJyc4eV0wLjp0xmyEL65soGg
ZqVyXyfhwtHemGOEQt37MQOmxEs+lclEhh8+Cg+LKCyMyrWrbSFlSqJp7ohmT8fd
S4N12JsErxzbtTtGsZETiaYc+tqrC9yoqW/x0IUQKZHHl7jeyyA=
=flgN
-----END PGP SIGNATURE-----

--Sig_/OLA4PRd4W1=pfOT/_baNr+x--


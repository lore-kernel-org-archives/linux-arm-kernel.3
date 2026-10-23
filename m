Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9145F606A324
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 06:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=X/LCk8aW;
	dkim=pass (2048-bit key, unprotected) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=COP0c/ae
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Cc:To:Subject:
	From:Message-ID:Reply-To:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=5WUYJH09/Iy/2Pqz1SpjpByH7uaHMKWs6PkgJ+HFOqE=; b=X/LCk8aWIzMGXv22eiaBHwMItR
	TTXdzVHNQJZqmaDJHXCey+RCBCj6/XihGBLyDKdfES0KEh7IUbSJ1TzN1dwu/lf1Ad1vGTtzDAwhN
	KAQKvZkZHAXLjmpDiyQxC1r5HXAkcq5Ao2ynI11NcHVHbLlwrQFIwmKh6wa5OEJbE08b3ZygcBCfE
	3S9y9JDsQG9mq2EKxbsVmw1Z0G0zsEK+sLgP5w5GOuechg4DfH9ZMU5gXAnnXuPtJLAAdo9NPR6nF
	NE6bWvnboY4uPV8uvhpjei0WlJgvJ5+GoeoksxIgpPQtsjO1j34uzXhzKi9lMVvhUqt4iwGRZv5dX
	NHGoqudA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK9FY-0000000FfRd-0Vt8;
	Fri, 23 Oct 2026 06:59:36 +0000
Received: from mx1.white.stw.pengutronix.de ([185.203.200.13])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK9FU-0000000FfPw-36wO;
	Fri, 23 Oct 2026 06:59:35 +0000
Received: from [127.0.0.1] (unknown [IPv6:2a02:560:5ca5:d100:9ebf:dff:fe00:fdb5])
	(Authenticated sender: sha@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 25D28200208;
	Fri, 23 Oct 2026 08:59:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1792738770;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5WUYJH09/Iy/2Pqz1SpjpByH7uaHMKWs6PkgJ+HFOqE=;
	b=COP0c/ae33eU2nr8ufHwDNo8/1U1SpPul/FROCBH0dr6mR3LUU5mdq6RUQiOkgHWaIykAN
	vOusL9unHBrQzHksnuHHTdGqTrRPhGSgJH+Br9SUKdjZkL5XHznx7gCMP6SrowrfCZgNbs
	Bk9mM/5wkdeQuzdp3rmWnZN8CX+bk1DTlsdaMITCoO+S0FbqKstKHzFgiPUd8nqqrG5+yG
	hc83VLJBwFqKLAHjB8VP1RR4fOR8RlpCF5FhBYS7YtJoXzw25lRS62yublqh8pUWD8GP9s
	5PRuOxVc+z4Lnlegg6PXMu16SV4rpULCbdQYQkF2eGMTidfAAIbQ1/LF4xWWOg==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1792738770; a=rsa-sha256;
	cv=none;
	b=dFXCkMHNNoQihSuiD0QcaPCvK22UBLxXS0kmxLEyQu3wPO3zREhDResdyQeNJVn0mkmxjB
	j+aU118/54rjN3SRj8eUmWzo6vs03yBigI/RnP9/BTGlX2EDijO5kre3LrNGscYKw6zVyD
	h1i2SmxlAFPEJ2UIxZR0pNtA/1Ub4OD+KZ2nrgKf1wj9Nrr6nKv4MlpFyL2DggViEuVz3j
	wZbRXOWisvqclPsTvKwHmCELOQEyveMvGnjOLWJGzzpAxFgEBf0spQT0EqJJ9lPffHRBVs
	ZAXwjFtPuv+gtUWWRsCWGdjD9nnXrOqJ9BrNXjhIUvg9IxMEoWRgsCK/gTEiAA==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sha@pengutronix.de smtp.mailfrom=s.hauer@pengutronix.de
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1792738770;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5WUYJH09/Iy/2Pqz1SpjpByH7uaHMKWs6PkgJ+HFOqE=;
	b=VBQWGtzqBPmkhreSKXjEzQRfkhq2OiPXFcksB5OThxlFeCMnC6EfEQOHu9kAfQkwIdnDwb
	CYN5DFcM/Pz2kWfwimOZWpXjbRMTGJp5W1CgRasJ55AQR5U1YF42V0U0rXLgkf+2O8AZUa
	4HmLsy5RaWHSZoWXklsMimTuu/2ZnnEEr0PbdRKmW+LTfsQhJu1K9usTS7HFfsIeqeSHBx
	SseYUOrRdtigpuWMilPLB8SwWBNzC56yrkjrjDoqkIRnjnwoFAyKmbwDN7R24yyXd7zBrY
	KJINmtSho+qE6nzsAJ7PKUtB4wX6HVPeWFSreCqHq0CW62OQmKsSQGzQH57l4g==
Message-ID: <132e7b48-8233-4977-ade1-2ee94b2b19e7@pengutronix.de>
From: "Sascha Hauer" <s.hauer@pengutronix.de>
Subject: Re: [PATCH v7 2/4] media: rockchip: Add JPEG decoder driver
To: "Torsten Duwe" <duwe@lst.de>
Cc: "Sascha Hauer" <s.hauer@pengutronix.de>, "Lucas Sinn" <lucas.sinn@wolfvision.net>, "Mauro
 Carvalho Chehab" <mchehab@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Heiko
 Stuebner" <heiko@sntech.de>, "Philipp Zabel" <p.zabel@pengutronix.de>, linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261022190026.6cb0a534@rocky.lan>
References: <20261022-rockchip-jpegdec-v7-0-3fd7dd55f408@pengutronix.de>
 <20261022-rockchip-jpegdec-v7-2-3fd7dd55f408@pengutronix.de>
 <20261022190026.6cb0a534@rocky.lan>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 23 Oct 2026 06:59:29 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_235932_942574_A4673049 
X-CRM114-Status: GOOD (  24.33  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

Hi Torsten,

On 2026-10-22 19:00, Torsten Duwe wrote:
> Hi Sascha,
>=20
> first: thank you for driving this :)
>=20
> On Thu, 22 Oct 2026 13:06:40 +0200
> Sascha Hauer <s.hauer@pengutronix.de> wrote:
>=20
> > Add a driver for the JPEG hardware decoder Rockchip integrates into a
> > number of its SoCs.=20
>=20
> [...]
>=20
> > +static int rkjpegd_enum_fmt_vid_out(struct file *file, void *priv,
> > +				    struct v4l2_fmtdesc *f)
> > +{
> > +	if (f->index)
> > +		return -EINVAL;
> > +
> > +	f->pixelformat =3D V4L2_PIX_FMT_JPEG;
> > +	f->flags |=3D V4L2_FMT_FLAG_DYN_RESOLUTION;
> > +
> > +	return 0;
> > +}
> > +
> > +static int rkjpegd_enum_framesizes(struct file *file, void *priv,
> > +				   struct v4l2_frmsizeenum *fsize)
> > +{
> > +	/* The decoded format follows the bitstream, nothing to enumerate. */
> > +	if (fsize->pixel_format =3D=3D V4L2_PIX_FMT_NV12 ||
> > +	    fsize->pixel_format =3D=3D V4L2_PIX_FMT_GREY)
> > +		return -ENOTTY;
> > +
> > +	if (fsize->pixel_format !=3D V4L2_PIX_FMT_JPEG)
> > +		return -EINVAL;
> > +
> > +	if (fsize->index)
> > +		return -EINVAL;
> > +
> > +	fsize->type =3D V4L2_FRMSIZE_TYPE_STEPWISE;
> > +	fsize->stepwise.min_width =3D RKJPEGD_MIN_WIDTH;
> > +	fsize->stepwise.max_width =3D RKJPEGD_MAX_SIZE;
> > +	fsize->stepwise.step_width =3D RKJPEGD_CODED_STEP;
> > +	fsize->stepwise.min_height =3D RKJPEGD_MIN_HEIGHT;
> > +	fsize->stepwise.max_height =3D RKJPEGD_MAX_SIZE;
> > +	fsize->stepwise.step_height =3D RKJPEGD_CODED_STEP;
> > +
> > +	return 0;
> > +}
>=20
> Can it do JPEG, MJPEG or maybe both? AFAICT the difference is minimal,
> so maybe try to be more permissive?

It can do both. Gstreamer uses image/jpeg und thus V4L2_PIX_FMT_JPEG for
both, so it just works. It seems most jpeg decoders in Linux do not have
need to support V4L2_PIX_FMT_MJPEG.

>=20
> [...]
>=20
> > +static const struct v4l2_ioctl_ops rkjpegd_ioctl_ops =3D {
> > +	.vidioc_querycap =3D rkjpegd_querycap,
> > +	.vidioc_enum_framesizes =3D rkjpegd_enum_framesizes,
> > +
> > +	.vidioc_enum_fmt_vid_cap =3D rkjpegd_enum_fmt_vid_cap,
> > +	.vidioc_g_fmt_vid_cap_mplane =3D rkjpegd_g_fmt_vid_cap,
> > +	.vidioc_try_fmt_vid_cap_mplane =3D rkjpegd_try_fmt_vid_cap,
> > +	.vidioc_s_fmt_vid_cap_mplane =3D rkjpegd_s_fmt_vid_cap,
> > +
> > +	.vidioc_enum_fmt_vid_out =3D rkjpegd_enum_fmt_vid_out,
> > +	.vidioc_g_fmt_vid_out_mplane =3D rkjpegd_g_fmt_vid_out,
> > +	.vidioc_try_fmt_vid_out_mplane =3D rkjpegd_try_fmt_vid_out,
> > +	.vidioc_s_fmt_vid_out_mplane =3D rkjpegd_s_fmt_vid_out,
> >=20
>=20
> You are populating only the *_out_mplane members and not the single
> plane ones? So a greyscale JPEG needs to go _mplane with 1 plane?

Yes.

>=20
> And for color, the colorspace on the decoded side should be
> V4L2_COLORSPACE_JPEG, not sRGB, I think.

from colorspace-details.rst:

   The JPEG standard does not actually store colorspace
   information. So if something other than sRGB is used, then the driver
   will have to set that information explicitly. Effectively
   ``V4L2_COLORSPACE_JPEG`` can be considered to be an abbreviation for
   ``V4L2_COLORSPACE_SRGB``, ``V4L2_XFER_FUNC_SRGB``, ``V4L2_YCBCR_ENC_601``
   and ``V4L2_QUANTIZATION_FULL_RANGE``.

These are the values the driver sets on the capture side. mxc-jpeg for
example does the same.

>=20
> Would you mind to give a hint about your test setup?

I tested with Gstreamer, like different variants of:

for format in I420 Y42B Y444 Y41B GRAY8; do x=3D1920; y=3D1088; GST_DEBUG=
=3D2 \
        gst-launch-1.0 videotestsrc num-buffers=3D100 ! \
        video/x-raw,format=3D$format,width=3D$x,height=3D$y ! \
        jpegenc ! jpegparse ! v4l2jpegdec ! waylandsink sync=3Dfalse; done

I also tested several single frame jpegs with various defects/oddities
in them, also all with gstreamer.

Sascha

--
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |



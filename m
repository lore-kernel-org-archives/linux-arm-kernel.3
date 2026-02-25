Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0628EFD374D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 12:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b/5//T3STrG3tJcsacYFrtG2L7YbeLPIfSzDPfJFV48=; b=0fhlOGu+SJbtO7uM+3w5QSUIyA
	Hq2+eQb65h6IYOUUUyHYcbofBuA/xhfOZnLLbCu7YqqtAlniV3vNywzQJ6sqwgDsrtNQbwiObOp88
	R5jB2CCMIkJ7ZZ7JpeDPZNOmjJYLU4B3juhFB63gt0b0QE53m7rmczx1lu3+aSwzNn6X5PP3OUC3Q
	Llu6VlPO6onknN4SmrsSkF4+O//UU6X5uLXjBw8TiUvWgFDqNiv1gNup9yn2hDsi0b5A8DXvMp9et
	yQuLk/izRjis0SsuCirD/YUJB9a7odCFhD4hnHDC1ABnfBeWWE/NWnb5RGtRaW1CfMLmefB/MVyFV
	dTE+qAyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvDtS-00000003zXt-0V8y;
	Wed, 25 Feb 2026 12:21:30 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvDtP-00000003zW9-0dOS;
	Wed, 25 Feb 2026 12:21:28 +0000
Received: from ideasonboard.com (unknown [IPv6:2a00:6020:448c:6c00:cd05:b041:1dc3:f62c])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 93E1C448;
	Wed, 25 Feb 2026 13:20:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1772022025;
	bh=O3SZVQ+M9LG2PI2LBL6JJVkAewsKootWHqN8pcBDkPI=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=KjwY5ZUYkckHkY/gdqU07Rs+pt3hfjpYRGJUtE+oErC8yB9owcHiOpkBmSgBGseD4
	 u0ZVRknSgKrgb+CbABdys+uw8sPbhrA2FeIBvYIo3BxzExu/slZ3e0Q08Bk1jha20V
	 UNpu0TaDkKaIRIBIusIJIwkl5b1WJfncLR5yK0BM=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250301143453.GJ7342@pendragon.ideasonboard.com>
References: <20250227114558.3097101-1-stefan.klug@ideasonboard.com> <20250227114558.3097101-2-stefan.klug@ideasonboard.com> <20250301010252.GI7342@pendragon.ideasonboard.com> <20250301143453.GJ7342@pendragon.ideasonboard.com>
Subject: Re: [PATCH 1/3] media: rkisp1: Set format defaults based on requested color space
From: Stefan Klug <stefan.klug@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Dafna Hirschfeld <dafna@fastmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Date: Wed, 25 Feb 2026 13:21:20 +0100
Message-ID: <177202208017.2000438.5208896949701142402@localhost>
User-Agent: alot/0.12.dev8+g2c003385c862.d20250602
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_042127_336316_1D7802A5 
X-CRM114-Status: GOOD (  54.54  )
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

Hi Laurent,

Thank you for the (loong ago) review. I finally came around to wrap my
head around that again.

Quoting Laurent Pinchart (2025-03-01 15:34:53)
> On Sat, Mar 01, 2025 at 03:02:54AM +0200, Laurent Pinchart wrote:
> > On Thu, Feb 27, 2025 at 12:44:59PM +0100, Stefan Klug wrote:
> > > When color space JPEG is requested, the ISP sets the quantization
> > > incorrectly to limited range. To fix that, set the xfer_func, ycbcr_e=
nc
> > > and quantization to the defaults for the requested color space if they
> > > are not specified explicitly.
> >=20
> > The commit message fails to explain why you're addressing xfer_func and
> > ycbcr_enc to fix the quantization issue.
> >=20
> > > Do this only in case we are converting
> > > from RAW to YUV.
> >=20
> > And this should explain why.
> >=20
> > > Signed-off-by: Stefan Klug <stefan.klug@ideasonboard.com>
> > > ---
> > >  .../media/platform/rockchip/rkisp1/rkisp1-isp.c   | 15 +++++++++++++=
+-
> > >  1 file changed, 14 insertions(+), 1 deletion(-)
> > >=20
> > > diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/dr=
ivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> > > index d94917211828..468f5a7d03c7 100644
> > > --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> > > +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> > > @@ -680,10 +680,23 @@ static void rkisp1_isp_set_src_fmt(struct rkisp=
1_isp *isp,
> >=20
> > Adding a bit more context:
> >=20
> >       set_csc =3D format->flags & V4L2_MBUS_FRAMEFMT_SET_CSC;
> >=20
> >       if (set_csc && src_info->pixel_enc =3D=3D V4L2_PIXEL_ENC_YUV) {
> >=20
> > If V4L2_MBUS_FRAMEFMT_SET_CSC isn't set, the colorspace fields on the
> > source pad will be copied from the sink pad, which doesn't seem right.
>=20
> Thinking some more about it, it's not wrong either. The colorspace and
> xfer_func fields are not used by the driver, as the related ISP
> processing blocks are configured through ISP parameters. Without
> userspace providing the value of the fields on the source pad, the
> driver can't know what colorspace and xfer_func is produced. Copying the
> values from the sink pad is as good of a guess as we can make.
>=20
> The ycbcr_enc and quantization fields are different, as they are taken
> into account by the driver to configure the ISP. Copying ycbcr_enc from
> the sink pad means that it will be set to V4L2_YCBCR_ENC_601 when the
> sink format is bayer and the source format is YUV. As the sink
> colorspace is most likely going to be V4L2_COLORSPACE_RAW in that case,
> that's a fine default, and is identical to what we would get from
> V4L2_MAP_YCBCR_ENC_DEFAULT(). Setting the quantization to
> V4L2_QUANTIZATION_LIM_RANGE also seems fine as a default, and it what
> V4L2_MAP_QUANTIZATION_DEFAULT() would give us.
>=20
> TL;DR: there's probably no need to change the current behaviour when
> V4L2_MBUS_FRAMEFMT_SET_CSC isn't set.

I partially agree. Basically we don't care about colorspace and
xfer_func because we know that it is not used by the driver. But
src_fmt->colorspace is now V4L2_COLORSPACE_RAW and that could also be
queried by the user if I'm not mistaken. Wouldn't it be better (and
clearer code wise) to explicitly set the defaults in case we are
converting from RAW to YUV? Something like

	/*
	 * Copy the color space for the sink pad. When converting from Bayer to
	 * YUV, set proper defaults.
	 */
	if (sink_info->pixel_enc =3D=3D V4L2_PIXEL_ENC_BAYER &&
	    src_info->pixel_enc =3D=3D V4L2_PIXEL_ENC_YUV) {
		src_fmt->colorspace =3D V4L2_COLORSPACE_SRGB;
		src_fmt->xfer_func =3D V4L2_XFER_FUNC_SRGB;
		src_fmt->ycbcr_enc =3D V4L2_YCBCR_ENC_601;
		src_fmt->quantization =3D V4L2_QUANTIZATION_LIM_RANGE;
	} else {
		src_fmt->colorspace =3D sink_fmt->colorspace;
		src_fmt->xfer_func =3D sink_fmt->xfer_func;
		src_fmt->ycbcr_enc =3D sink_fmt->ycbcr_enc;
		src_fmt->quantization =3D sink_fmt->quantization;
	}

Functionality wise it is the same, but it makes the following code easier
to understand without the need to remember that we can safely copy
colorspace as it won't be used anyways.

>=20
> > It's a separate issue, but fixing both together may lead to better code.
> >=20
> > >             if (sink_info->pixel_enc =3D=3D V4L2_PIXEL_ENC_BAYER) {
> > >                     if (format->colorspace !=3D V4L2_COLORSPACE_DEFAU=
LT)
> > >                             src_fmt->colorspace =3D format->colorspac=
e;
> > > -                   if (format->xfer_func !=3D V4L2_XFER_FUNC_DEFAULT)
> > > +
> > > +                   if (format->xfer_func =3D=3D V4L2_XFER_FUNC_DEFAU=
LT)
> >=20
> > Are you sure the condition should be inverted ?

That really looks quite wrong.

> >=20
> > >                             src_fmt->xfer_func =3D format->xfer_func;
> > > +                   else
> > > +                           src_fmt->xfer_func =3D
> > > +                                   V4L2_MAP_XFER_FUNC_DEFAULT(format=
->colorspace);
> > > +
> > >                     if (format->ycbcr_enc !=3D V4L2_YCBCR_ENC_DEFAULT)
> > >                             src_fmt->ycbcr_enc =3D format->ycbcr_enc;
> > > +                   else
> > > +                           src_fmt->ycbcr_enc =3D
> > > +                                   V4L2_MAP_YCBCR_ENC_DEFAULT(format=
->colorspace);
> > > +
> > > +                   if (format->quantization =3D=3D V4L2_QUANTIZATION=
_DEFAULT)
> > > +                           src_fmt->quantization =3D
> > > +                                   V4L2_MAP_QUANTIZATION_DEFAULT(fal=
se,
> > > +                                           format->colorspace, forma=
t->ycbcr_enc);
> >=20
> > Shouldn't this use src_fmt instead of format ?

The outcome is the same. It felt more symmetrical to base the default
value on format->... as we do for the other fields.

> >=20
> > I think quantization handling could be moved below.
> >=20
> > >             }
> > > =20
> > >             if (format->quantization !=3D V4L2_QUANTIZATION_DEFAULT)
>=20
> Now I'm wondering if this is right. As far as I can tell, the
> quantization isn't taken into account by the driver when the ISP is
> bypassed (capturing raw bayer data, or capturing YUV data from a YUV
> sensor).

Are you sure about the YUV to YUV case? We pass src_fmt->quatization
into rkisp1_params_pre_configure() which is then used to initializ the
remaining blocks. Iam however unsure if *any* of these blocks is active
in YUV to YUV mode.

>=20
> How about something like this ?
>=20
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/driver=
s/media/platform/rockchip/rkisp1/rkisp1-isp.c
> index d94917211828..9c215c9bb30f 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> @@ -659,11 +659,10 @@ static void rkisp1_isp_set_src_fmt(struct rkisp1_is=
p *isp,
>                 src_fmt->quantization =3D sink_fmt->quantization;
>=20
>         /*
> -        * Allow setting the source color space fields when the SET_CSC f=
lag is
> -        * set and the source format is YUV. If the sink format is YUV, d=
on't
> -        * set the color primaries, transfer function or YCbCr encoding a=
s the
> -        * ISP is bypassed in that case and passes YUV data through witho=
ut
> -        * modifications.
> +        * Allow setting the source color space fields when the SET_CSC f=
lag.
> +        * This is restricted to the case where the sink format is raw an=
d the
> +        * source format is YUV, as in other cases the ISP is bypassed an=
d the
> +        * input data is passed through without modifications.

Yes, that seems legit and makes the logic easier to follow. Only concern
is the YUV to YUV mode.

>          *
>          * The color primaries and transfer function are configured throu=
gh the
>          * cross-talk matrix and tone curve respectively. Settings for th=
ose
> @@ -676,18 +675,30 @@ static void rkisp1_isp_set_src_fmt(struct rkisp1_is=
p *isp,
>          */
>         set_csc =3D format->flags & V4L2_MBUS_FRAMEFMT_SET_CSC;
>=20
> -       if (set_csc && src_info->pixel_enc =3D=3D V4L2_PIXEL_ENC_YUV) {
> -               if (sink_info->pixel_enc =3D=3D V4L2_PIXEL_ENC_BAYER) {
> -                       if (format->colorspace !=3D V4L2_COLORSPACE_DEFAU=
LT)
> -                               src_fmt->colorspace =3D format->colorspac=
e;
> -                       if (format->xfer_func !=3D V4L2_XFER_FUNC_DEFAULT)
> -                               src_fmt->xfer_func =3D format->xfer_func;
> -                       if (format->ycbcr_enc !=3D V4L2_YCBCR_ENC_DEFAULT)
> -                               src_fmt->ycbcr_enc =3D format->ycbcr_enc;
> -               }
> +       if (set_csc && sink_info->pixel_enc =3D=3D V4L2_PIXEL_ENC_BAYER &&
> +           src_info->pixel_enc =3D=3D V4L2_PIXEL_ENC_YUV) {
> +               if (format->colorspace !=3D V4L2_COLORSPACE_DEFAULT)
> +                       src_fmt->colorspace =3D format->colorspace;
> +
> +               if (format->xfer_func !=3D V4L2_XFER_FUNC_DEFAULT)
> +                       src_fmt->xfer_func =3D format->xfer_func;
> +               else
> +                       src_fmt->xfer_func =3D
> +                               V4L2_MAP_XFER_FUNC_DEFAULT(src_fmt->color=
space);
> +
> +               if (format->ycbcr_enc !=3D V4L2_YCBCR_ENC_DEFAULT)
> +                       src_fmt->ycbcr_enc =3D format->ycbcr_enc;
> +               else
> +                       src_fmt->ycbcr_enc =3D
> +                               V4L2_MAP_YCBCR_ENC_DEFAULT(src_fmt->color=
space);
>=20
>                 if (format->quantization !=3D V4L2_QUANTIZATION_DEFAULT)
>                         src_fmt->quantization =3D format->quantization;
> +               else
> +                       src_fmt->quantization =3D
> +                               V4L2_MAP_QUANTIZATION_DEFAULT(false,
> +                                                             src_fmt->co=
lorspace,
> +                                                             src_fmt->yc=
bcr_enc);
>         }
>=20
>         *format =3D *src_fmt;
>=20
> Can I let you write a commit message ? :-)

I try to get bak to it :-)

Best regards,
Stefan

>=20
> --=20
> Regards,
>=20
> Laurent Pinchart
>


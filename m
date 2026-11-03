Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB52B606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 18:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UH7s3t3e;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tyGM2Uai
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=FhokGCOTWniwqQcXW8/zbSxPkJmQW6og4OZKMkNPbC8=; b=UH7s3t3e93cwiZqcdjJAuuc3za
	f+LLAJedoPk2Ik83qGGpPgMPxInN67E7zX/3gDlRBokiU1+47UhUmkEKlcHl7cVziIf3vfNVN2TOQ
	4YH7/va6vbgWjQYV76Jd3tugYCriYXK0iDOUH0mpVcYtw4vsw4OSYYeti7c7ppicOWiDV9lH7g5BI
	Jjl5UM7kT7lWBTAJ4TAqtNVLaQRewcFy01h8RVUoiLaHABtcexpENwO7o6Kox05WR9wYsxg2WMh4h
	GXho8K2ITJ+4zawAra//sTDg5PN8hgFWlI24osVbzhdAIm9zNsTOv9aLH+Tkmr86GiKwWev4tMc0T
	ZSXPYtgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOIqK-00000003M2i-417l;
	Tue, 03 Nov 2026 18:02:44 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOIqI-00000003M2L-14Iu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 18:02:43 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-48af4d4e61fso2765600f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 10:02:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793728960; x=1794333760; darn=lists.infradead.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FhokGCOTWniwqQcXW8/zbSxPkJmQW6og4OZKMkNPbC8=;
        b=tyGM2UaiuWu3sassInfkbxBGQg5qJtdcVltgS3rHE1BpCGz972OlssZzXZZPvEaNcB
         21YggqMkTGCo30A8vE/EwjgsU/YCFN0LZXsDSaOKe3VoNP7/JGRFHDA6heuS5rdtdhGW
         HmV2xqvH8TcSNvTQN2VMAff5xHi+pq6wuBokE7ih6jODB6H9Aguo5OQvHatACmBa/S2+
         ZLLc1nEv9i7c0jIWoKsjhoa7jP/jK4HpH/lOu/8OqBCecicy1nPC3xSoJ7+/GKxjPYsu
         63jzOKjb91AUBlERPKMYlVGaFipPPM7nJMJbJPvXaz5QwaQFqi/ZnVLDpKb9HeXVmexu
         SiTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793728960; x=1794333760;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FhokGCOTWniwqQcXW8/zbSxPkJmQW6og4OZKMkNPbC8=;
        b=yQ/O7XRB1wwmN75hH0R/uLGXx32TmwBNveg4EDbdnsVesreB+SkE9qZm5EDHM97nEt
         Ryuj1+eYKGzhDnclythf6qZ9HYWc0vY1Ld3uYD4dqyTPBW5FJa+cV9L+AoSXxkckA0xN
         p2Ww2J8/jpP1D9wq5zEGRBlGqhQ+aVb8POJrJyEE1+4tm3+EERkm/1R6Yrbwg30fC/RY
         YMbl51fpBGhZe/69R2M+D1EI2pEOJAlq3KIwAbPhuiHihHX69po6wk8+YZhoCeGA+19H
         ZEdK+xTMCeGmpxF99ALrFqJwF15AO4fugejBzraLb3BApi6qT8V/lklFCS8PhCao8lr1
         EhmQ==
X-Forwarded-Encrypted: i=1; AKwUvBxH45YW+tAFuGUF2FbK64XkRtaGCrvnzGmTBCaHUXqVP3ERdg7Nl2b4KresoS14r9Atg6h57fmcjgIwGGRcZdot@lists.infradead.org
X-Gm-Message-State: APuU4Z++tz7sjqXHQSprgh9wdSwAl7tVKptPPLKtYCS995NkLHyjx6dP
	xBlOLPdJZEMrHl8MRc8cCs372/OGDwktxR551XlYPhD1uMSfoVGFnzAu
X-Gm-Gg: AYBFou0qujaB2bhQMReHX4+0LYlh0E64GmMpHNjtSkyjTVpfWNhxbqJmC4e/n8KgShV
	DM0U10udoew6cEVlXxjv0zba77Z5oF0HqN41XdamxKRtVTjWzMRvfjfMU+oou22oR5838BvikD+
	vn/LncqEIGICBJQ4oORq83uqDWSJnJ058DE2dMH2D9P5TvJShLxKUtsR2BE7Ha6wn6xC9IeDvMt
	xPZfdiChL9ySqVwvI45/rhUM64LnAOFU85fmAUfnrWC/5BAcFWIbImhBPRSnobyuH5P8iiABThU
	w0J2cdMQLO+A8Anoll1GmDDEmJDJzVOSsfgVE3B+a2H635TTkjW/JwslkeJUtJIg5gwiHPGy1Sl
	gmwVtjT4Qgnn/6o2n2OENg1r9P4VkHrNusmDah6+ggrNQJbAvOyp+CeN1tf4CSZ2MOP/P6QcClb
	YqVVFoqBVjxbt/Y1cHTUY1WOJPpevAFc1NQ6WkVCaX3spspo2vQhW+ysBBAoGHK62NMZ8wyAZU6
	BhsJj8dZ7bgAOlUUdxxRVe0GRPwItmgj5MqbodbXvo3ilPRdd8B+GtxWsmPKpYBZ4gbwMcxenJS
	+VVem2KggcHIDvaPnmdP45Cl17oon8mLbbxcUoHHj6VAF0KdVOFPLt6PGf/QDKRFJGaB+7ELMOg
	Efq41MXCjq2cw/kU5HkVbB+U5WYGWhiOMMTnQqh8ZMvgM//oOi0C3z98MMuYI8WLhtGbO7MlO7g
	aQ5DmS42hf8lQ6eiu5eA7w7dQZFSODLACTEh6oEhYNstSnmgE0NkUCy/C9rTWxT6wR2jIRAWG6+
	Q4Z6SAQA3j/WM+g7UFOu3HD/9CQI2k6JUPV9We87Y91SdDC+AAZSBfDQnsSdw==
X-Received: by 2002:a5d:5d09:0:b0:48e:4835:de5f with SMTP id ffacd0b85a97d-48e6e4fcf2amr28751210f8f.47.1793728959547;
        Tue, 03 Nov 2026 10:02:39 -0800 (PST)
Received: from jernej-laptop.localnet (194-152-27-116.dynamic.telemach.net. [194.152.27.116])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b964desm26248330f8f.46.2026.11.03.10.02.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 10:02:38 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@kernel.org>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Maxime Ripard <mripard@kernel.org>, Paul Kocialkowski <paulk@sys-base.io>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Chen-Yu Tsai <wens@kernel.org>, Samuel Holland <samuel@sholland.org>,
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 02/10] staging: media: cedrus: reject too large H.264/HEVC SPS
Date: Tue, 03 Nov 2026 19:02:37 +0100
Message-ID: <P3FCc6YrSeexw_Zto5zS4g@gmail.com>
In-Reply-To: <0cecac8706862ea7410be0553d942539f0d53c06.camel@collabora.com>
References: <20261102170303.1973892-1-jernej.skrabec@gmail.com>
 <20261102170303.1973892-3-jernej.skrabec@gmail.com>
 <0cecac8706862ea7410be0553d942539f0d53c06.camel@collabora.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_100242_336191_6252D9BC 
X-CRM114-Status: GOOD (  31.28  )
X-Spam-Score: -1.1 (-)
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
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_GMAIL_RCVD,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Dne ponedeljek, 2. november 2026 ob 19:44:38 Srednjeevropski standardni =C4=
=8Das je Nicolas Dufresne napisal(a):
> Le lundi 02 novembre 2026 =C3=A0 18:02 +0100, Jernej Skrabec a =C3=A9crit=
 :
> > The hardware decodes whatever picture size the SPS describes. An SPS
> > beyond CEDRUS_MAX_WIDTH/HEIGHT, or beyond the capture buffers once they
> > are allocated, makes the hardware overrun memory and hang. On H616, the
> > JCT-VC PICSIZE_A..D streams (1056x8440, 8440x1056, 528x4216 and
> > 4216x528) leave the hardware wedged, so that every following job times
> > out until reboot.
> >=20
> > Validate the SPS picture size in try_ctrl. Move the size limits to
> > cedrus_video.h for that.
> >=20
> > Fixes: 6eb9b758e307 ("media: cedrus: Add H264 decoding support")
> > Fixes: 86caab29da78 ("media: cedrus: Add HEVC/H.265 decoding support")
> > Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> > ---
> >  drivers/staging/media/sunxi/cedrus/cedrus.c   | 40 ++++++++++++++++++-
> >  .../staging/media/sunxi/cedrus/cedrus_video.c |  5 ---
> >  .../staging/media/sunxi/cedrus/cedrus_video.h |  5 +++
> >  3 files changed, 44 insertions(+), 6 deletions(-)
> >=20
> > diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/stag=
ing/media/sunxi/cedrus/cedrus.c
> > index c3331b4f3f02..45deebddb630 100644
> > --- a/drivers/staging/media/sunxi/cedrus/cedrus.c
> > +++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
> > @@ -28,10 +28,38 @@
> >  #include "cedrus_dec.h"
> >  #include "cedrus_hw.h"
> > =20
> > +/*
> > + * The hardware decodes whatever picture size the bitstream headers de=
scribe.
> > + * Reject sizes beyond the hardware limits, or beyond the capture buff=
ers once
> > + * they are allocated, instead of letting the hardware overrun memory =
and hang.
> > + */
> > +static int cedrus_check_pic_size(struct cedrus_ctx *ctx, u32 width, u3=
2 height)
> > +{
> > +	struct vb2_queue *vq;
> > +
> > +	if (width > CEDRUS_MAX_WIDTH || height > CEDRUS_MAX_HEIGHT)
> > +		return -EINVAL;
> > +
> > +	/*
> > +	 * The hardware decodes whole 16x16 macroblocks, and all capture
> > +	 * formats pad the buffers to at least 16 pixels in both directions.
> > +	 */
> > +	vq =3D v4l2_m2m_get_vq(ctx->fh.m2m_ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE);
> > +	if (vb2_is_busy(vq) &&
> > +	    (width > ALIGN(ctx->src_fmt.width, 16) ||
> > +	     height > ALIGN(ctx->src_fmt.height, 16)))
> > +		return -EINVAL;
>=20
> If my memory is correct, Hans rejected this kind of construct in try_ctrl,
> because if you are only doing try() it shouldn't fail like this. Instead =
we can
> validate in the real s_ctrl, but I believe the downside is that it makes =
the
> error asynchronous when a request is used (perhaps that's actually wanted=
 ?)

You're right. This is not the best place to check size, since it can be
bypassed as sashiko bot find out.

My suggestion for v2 is to split this to two stages. Max width and height
check stays here, whereas buffer size check is moved to setup() callback.
=46ailing there it will mark buffer with V4L2_BUF_FLAG_ERROR.

What do you think?

Best regards,
Jernej

>=20
> Nicolas
>=20
> > +
> > +	return 0;
> > +}
> > +
> >  static int cedrus_try_ctrl(struct v4l2_ctrl *ctrl)
> >  {
> > +	struct cedrus_ctx *ctx =3D container_of(ctrl->handler, struct cedrus_=
ctx, hdl);
> > +
> >  	if (ctrl->id =3D=3D V4L2_CID_STATELESS_H264_SPS) {
> >  		const struct v4l2_ctrl_h264_sps *sps =3D ctrl->p_new.p_h264_sps;
> > +		u32 height;
> > =20
> >  		if (sps->chroma_format_idc !=3D 1)
> >  			/* Only 4:2:0 is supported */
> > @@ -42,9 +70,15 @@ static int cedrus_try_ctrl(struct v4l2_ctrl *ctrl)
> >  		if (sps->bit_depth_luma_minus8 !=3D 0)
> >  			/* Only 8-bit is supported */
> >  			return -EINVAL;
> > +		height =3D (sps->pic_height_in_map_units_minus1 + 1) * 16;
> > +		if (!(sps->flags & V4L2_H264_SPS_FLAG_FRAME_MBS_ONLY))
> > +			height *=3D 2;
> > +		if (cedrus_check_pic_size(ctx,
> > +					  (sps->pic_width_in_mbs_minus1 + 1) * 16,
> > +					  height))
> > +			return -EINVAL;
> >  	} else if (ctrl->id =3D=3D V4L2_CID_STATELESS_HEVC_SPS) {
> >  		const struct v4l2_ctrl_hevc_sps *sps =3D ctrl->p_new.p_hevc_sps;
> > -		struct cedrus_ctx *ctx =3D container_of(ctrl->handler, struct cedrus=
_ctx, hdl);
> >  		unsigned int bit_depth, max_depth;
> >  		struct vb2_queue *vq;
> > =20
> > @@ -52,6 +86,10 @@ static int cedrus_try_ctrl(struct v4l2_ctrl *ctrl)
> >  			/* Only 4:2:0 is supported */
> >  			return -EINVAL;
> > =20
> > +		if (cedrus_check_pic_size(ctx, sps->pic_width_in_luma_samples,
> > +					  sps->pic_height_in_luma_samples))
> > +			return -EINVAL;
> > +
> >  		bit_depth =3D max(sps->bit_depth_luma_minus8,
> >  				sps->bit_depth_chroma_minus8) + 8;
> > =20
> > diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_video.c b/driver=
s/staging/media/sunxi/cedrus/cedrus_video.c
> > index adc7f255d7cf..2521315abdb7 100644
> > --- a/drivers/staging/media/sunxi/cedrus/cedrus_video.c
> > +++ b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
> > @@ -29,11 +29,6 @@
> >  #define CEDRUS_DECODE_SRC	BIT(0)
> >  #define CEDRUS_DECODE_DST	BIT(1)
> > =20
> > -#define CEDRUS_MIN_WIDTH	16U
> > -#define CEDRUS_MIN_HEIGHT	16U
> > -#define CEDRUS_MAX_WIDTH	4096U
> > -#define CEDRUS_MAX_HEIGHT	2304U
> > -
> >  static struct cedrus_format cedrus_formats[] =3D {
> >  	{
> >  		.pixelformat	=3D V4L2_PIX_FMT_MPEG2_SLICE,
> > diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_video.h b/driver=
s/staging/media/sunxi/cedrus/cedrus_video.h
> > index 8e1afc16a6a1..367e52158f01 100644
> > --- a/drivers/staging/media/sunxi/cedrus/cedrus_video.h
> > +++ b/drivers/staging/media/sunxi/cedrus/cedrus_video.h
> > @@ -22,6 +22,11 @@ struct cedrus_format {
> >  	unsigned int	capabilities;
> >  };
> > =20
> > +#define CEDRUS_MIN_WIDTH	16U
> > +#define CEDRUS_MIN_HEIGHT	16U
> > +#define CEDRUS_MAX_WIDTH	4096U
> > +#define CEDRUS_MAX_HEIGHT	2304U
> > +
> >  extern const struct v4l2_ioctl_ops cedrus_ioctl_ops;
> > =20
> >  int cedrus_queue_init(void *priv, struct vb2_queue *src_vq,
>=20






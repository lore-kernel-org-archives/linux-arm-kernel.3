Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7CF5606A324
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 18:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=du/z9SE0;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tUlfXUV/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=/dRBcMfZeipH0bf8lHSiASOZP3cat5iGjHJj/5kyYjE=; b=du/z9SE0vo9pCc+zkUfdZkAQW2
	FtUMmhLbDKumsiOw6ActWOFQoGAUGIrZrCrCFlmMQs8PfS4+NIbC4b1pvrQhYEwaufXOu4yl2OiPA
	7pLHAPfHYtdOG4pIMNcg4/cjciZ1zgdko0nKrDZECGPuDJSZ2UOct/0aODR+cFY+vEYVtVKtpGgCP
	aik1CoZNoykOd7eBKEUh65rfCEMr7MU7QfYuJxNSAZaG0tL1Js3yAPpbWs5AjpDujtrg051DEHsW4
	mwcgwhyjkIdB9iiQBrUCtzL/y+CvZPgdaMQG9sQwNDwymELEI2lP9UfQSUjX3mP8Fn5o6sEYQcCnb
	QlP+N3AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOItk-00000003MPS-2uEC;
	Tue, 03 Nov 2026 18:06:16 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOIti-00000003MOE-0zbT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 18:06:15 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4a5087a5348so36482945e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 10:06:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793729172; x=1794333972; darn=lists.infradead.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/dRBcMfZeipH0bf8lHSiASOZP3cat5iGjHJj/5kyYjE=;
        b=tUlfXUV/uSYJfSRomVr68bK2RxStHIVNgLGtzygDBPTOPzweBV017BiPWolTTRdaau
         HC0y4nXHM2gRkr83bzd1bNxRmnYCpUi3JBpTF9YfWlrW8wJ0RB5oD7A2oBNyAaE8o0PF
         5DybCMio7kcnlU7jsZ3Z2kqsjlKhd3E8mavpnPs1Cq+ceaNQvLvaWAqq1R9Cam12T6G+
         CE6n++bRkAUXZd9iWbkyvXll+aYp5cJeteaZx2f4SLJPHdf+11TvXTMFayS4SPcwezqK
         wQx2nnJVCwgUegecvx4zhnT0sQkc2bDnXK8LWai8OQAFZOImw62E5GIsDc64ugxa274O
         3Xmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793729172; x=1794333972;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/dRBcMfZeipH0bf8lHSiASOZP3cat5iGjHJj/5kyYjE=;
        b=dVnIO+rgS60T6Sr2YTEPlsSC8u9ps6vrXk+JSL9g+e3ibNr4PRpziKyRqO9rpvBZkB
         H+NwstlrozotG5IDRJ5YhVmUCuTVgbTl6/Q2fslNe6ADnN45vj3dhVdQgM4FYK1BRUVY
         Yp4Zt1caNJlyxCrXpjp8wPclCptz9A7Zuej1HloTybaCWnJTixBcDcsyEcl6R57oH0Oz
         2sVK2tvvRqq5QW45qutsxghJDpQYvjPlirIjjHPXzbclmj4R5W0mBe/JXNNr5Dt6Mrvp
         qqCJJiisfQKmP5U+XhQZrE9zHASM/4qCISPCHnR2wF5e0ADuF3KTNAWr6FKCV5uaDCcK
         lrEg==
X-Forwarded-Encrypted: i=1; AKwUvBzh/z6o47JfqAKlQply+KfT2IHkhCldgcDoUwhqSVXtO61Wjrkil16wX0PGu7RKBXHGwqoCUwqR4s5BVRPSHUnQ@lists.infradead.org
X-Gm-Message-State: APuU4Z/v9+5GuJX8ARTPDfObPIvIXrz+MD+T0953c0FMQlmJ8G97jcad
	HcPjDUGfEyoUouI2l6LoG52lzk1klYViK7IixSgRF4GEveDluGrXSgsd
X-Gm-Gg: AYBFou3ntRYgyjCvTDnUqUTJft1ciEHShxV1ysZ8UFgkKpYFV6993C/aeymf4/fqcWA
	fQwOOQbkssvotKeOrN2rQxruXBevlkiYXIZIlWrbQn7Hx/0KNF5TprgwWQdaeekvaBBRkGg2jjG
	DcXMZeQlb8vZSMJl1vzUKPglgDwhLjPQwYyxixJUKAc2k7MTKzvNnoJsZk/0ka3tVO0yUXap8tk
	UCVc0g/oMrc4YiDkMH+5zB+Tppf3j6NTbu5XvM/vyQlc+wLiXKof++hKMca+YZfu3DfmT+k8o9W
	G+6UcI6NRoSw5/DCX98LDKkV3Rqq2Qz1eDKgZPRWL54p9N9yEIIwq0/0rNFqhPKaXzaTQ2qvFpJ
	EhhYMdh8c3bWSy48TL3DcG26pXZgq0sgaxuxUOZ06fHV8WcClsp4uuaDOTSGJRt8/NT7CWvB1xx
	A89Z+tPGfDViKTQy3RgdYbSAhx1IS0agIFGwapNoF5qmxpYf9jcWmCOh9FSslH7gQ8SvGd3Kakc
	xmt7iYM+o/l2+/RMQ4KTwv5CHTQkqwJZoUgIh8KRQl1NyVJi9Fan5kVVvWrI8QNFXMSJFRk4W59
	uGXW88JIxYzwLKKzCSuOoboqFxNI5jXAv+X5bWfbpMwGgqZ0UWzR2Cl4oO8nxy2RetHlwEIJT4t
	jn8YUNX0m0r6nVCo+0puXW7njL48C6HTjUpHjbbp4ePcWMEfAFGKa27TtOdPf7PuUj2ob/V3hnS
	24hyrbCdQcFqrNO+pHsV579YaIHk0nGHYjB4C2OelrQjY0d/clErfkKfLDF9NVRdwslScvAJsBp
	J9ys7yprhJUULje8+RqGVQCCkwmrYAZuDa7Rz+p9d2RwjWvYjMnay/CoSORM3CwXFxYSrkAKCRx
	5GfGLTU=
X-Received: by 2002:a05:600c:6095:b0:4a0:1b21:2628 with SMTP id 5b1f17b1804b1-4ac18b7e1c1mr284061485e9.23.1793729172136;
        Tue, 03 Nov 2026 10:06:12 -0800 (PST)
Received: from jernej-laptop.localnet (194-152-27-116.dynamic.telemach.net. [194.152.27.116])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2afee292bsm82769945e9.4.2026.11.03.10.06.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 10:06:10 -0800 (PST)
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
Subject: Re: [PATCH 03/10] staging: media: cedrus: h264: mark long-term references in
 the frame info
Date: Tue, 03 Nov 2026 19:06:09 +0100
Message-ID: <zYI0QcxKSEeu6sHIbu0-3w@gmail.com>
In-Reply-To: <29e72b15007592f98dd000f5f62a85367c590347.camel@collabora.com>
References: <20261102170303.1973892-1-jernej.skrabec@gmail.com>
 <20261102170303.1973892-4-jernej.skrabec@gmail.com>
 <29e72b15007592f98dd000f5f62a85367c590347.camel@collabora.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_100614_311831_35D7B110 
X-CRM114-Status: GOOD (  25.03  )
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
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Dne ponedeljek, 2. november 2026 ob 19:50:44 Srednjeevropski standardni =C4=
=8Das je Nicolas Dufresne napisal(a):
> Hi,
>=20
> Le lundi 02 novembre 2026 =C3=A0 18:02 +0100, Jernej Skrabec a =C3=A9crit=
 :
> > The frame info of a reference has a reference type for each field, in
> > bits 1:0 for the top field and 5:4 for the bottom one, which is 1 for a
> > long-term reference. The driver never sets it, so the hardware handles
> > long-term references like short-term ones, also where they differ, like
> > in temporal direct and implicit weighted prediction. The vendor library
> > sets it.
> >=20
> > This fixes MR8_BT_B and MR9_BT_B of the H.264 conformance suite.
> >=20
> > Fixes: 6eb9b758e307 ("media: cedrus: Add H264 decoding support")
> > Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> > ---
> >  drivers/staging/media/sunxi/cedrus/cedrus_h264.c | 12 +++++++++++-
> >  drivers/staging/media/sunxi/cedrus/cedrus_regs.h |  8 ++++++++
> >  2 files changed, 19 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c b/drivers=
/staging/media/sunxi/cedrus/cedrus_h264.c
> > index 892193c12b2f..a716955655f7 100644
> > --- a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> > +++ b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> > @@ -69,13 +69,21 @@ static void cedrus_fill_ref_pic(struct cedrus_ctx *=
ctx,
> >  				struct cedrus_buffer *buf,
> >  				unsigned int top_field_order_cnt,
> >  				unsigned int bottom_field_order_cnt,
> > +				bool long_term,
> >  				struct cedrus_h264_sram_ref_pic *pic)
> >  {
> >  	struct vb2_buffer *vbuf =3D &buf->m2m_buf.vb.vb2_buf;
> > +	u32 frame_info, ref_type;
> > =20
> >  	pic->top_field_order_cnt =3D cpu_to_le32(top_field_order_cnt);
> >  	pic->bottom_field_order_cnt =3D cpu_to_le32(bottom_field_order_cnt);
> > -	pic->frame_info =3D cpu_to_le32(buf->codec.h264.pic_type << 8);
> > +
> > +	ref_type =3D long_term ? VE_H264_FRAME_INFO_REF_TYPE_LONG_TERM :
> > +			       VE_H264_FRAME_INFO_REF_TYPE_SHORT_TERM;
> > +	frame_info =3D VE_H264_FRAME_INFO_TOP_REF_TYPE(ref_type) |
> > +		     VE_H264_FRAME_INFO_BOT_REF_TYPE(ref_type) |
> > +		     VE_H264_FRAME_INFO_PIC_TYPE(buf->codec.h264.pic_type);
> > +	pic->frame_info =3D cpu_to_le32(frame_info);
> > =20
> >  	pic->luma_ptr =3D cpu_to_le32(cedrus_buf_addr(vbuf, &ctx->dst_fmt, 0)=
);
> >  	pic->chroma_ptr =3D cpu_to_le32(cedrus_buf_addr(vbuf, &ctx->dst_fmt, =
1));
> > @@ -128,6 +136,7 @@ static int cedrus_write_frame_list(struct cedrus_ct=
x *ctx,
> >  		cedrus_fill_ref_pic(ctx, cedrus_buf,
> >  				    dpb->top_field_order_cnt,
> >  				    dpb->bottom_field_order_cnt,
> > +				    dpb->flags & V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM,
> >  				    &pic_list[position]);
> >  	}
> > =20
> > @@ -174,6 +183,7 @@ static int cedrus_write_frame_list(struct cedrus_ct=
x *ctx,
> >  	cedrus_fill_ref_pic(ctx, output_buf,
> >  			    decode->top_field_order_cnt,
> >  			    decode->bottom_field_order_cnt,
> > +			    false,
>=20
> nit: Not a hard objection, but I really hate boolean parameters. It could=
 be a
> simple as:
>=20
> +			    false, /* short term reference */
>=20
> Or using an enum. My preference being documented here, its yours to decid=
e.

I'll use VE_H264_FRAME_INFO_REF_TYPE_* as parameter. I have to fix sashiko
issue anyway.

I'll keep your Reviewed-by, unless you object.

Best regards,
Jernej

>=20
> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
>=20
> >  			    &pic_list[position]);
> > =20
> >  	cedrus_h264_write_sram(dev, CEDRUS_SRAM_H264_FRAMEBUFFER_LIST,
> > diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_regs.h b/drivers=
/staging/media/sunxi/cedrus/cedrus_regs.h
> > index 05e6cbc548ab..961fe023bb43 100644
> > --- a/drivers/staging/media/sunxi/cedrus/cedrus_regs.h
> > +++ b/drivers/staging/media/sunxi/cedrus/cedrus_regs.h
> > @@ -616,6 +616,14 @@
> >  #define VE_AVC_SRAM_PORT_OFFSET		0x2e0
> >  #define VE_AVC_SRAM_PORT_DATA		0x2e4
> > =20
> > +/* Frame info word of a frame buffer list entry in the AVC SRAM */
> > +#define VE_H264_FRAME_INFO_PIC_TYPE(v)		SHIFT_AND_MASK_BITS(v, 9, 8)
> > +#define VE_H264_FRAME_INFO_BOT_REF_TYPE(v)	SHIFT_AND_MASK_BITS(v, 5, 4)
> > +#define VE_H264_FRAME_INFO_TOP_REF_TYPE(v)	SHIFT_AND_MASK_BITS(v, 1, 0)
> > +
> > +#define VE_H264_FRAME_INFO_REF_TYPE_SHORT_TERM	0
> > +#define VE_H264_FRAME_INFO_REF_TYPE_LONG_TERM	1
> > +
> >  #define VE_VP8_PPS			0x214
> >  #define VE_VP8_PPS_PIC_TYPE_P_FRAME		BIT(31)
> >  #define VE_VP8_PPS_LAST_SHARPNESS_LEVEL(v)	SHIFT_AND_MASK_BITS(v, 30, =
28)
>=20






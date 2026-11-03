Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E05E606D802
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 18:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AguJcJCt;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZMqkV6jc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=axeQ5CIE2uW000DJFHLDIWC6PSnHJaM+7ICNLkjh1BE=; b=AguJcJCtnWepZkVQVI0zelcRpF
	QsphYDjld7xDUo8wKDrIKaDbzQCH79ZYHilYfIQY/RG8i/vsxuOUUIkzvQMSV4OLClnXcpc+raHfK
	Gmcvmitw04EH80XfyfJSpKSNjycat5KE9wIDgQJcCEidoG9QQvc+xoqQf2+hP1C9oPEgQBYajVHq3
	KVn51jtSTGybevnhAsE0U6n9r2zdmPkTrdUl+frU+qjbs5tBWaDrapBjQdEMQ6VPK6MAh99dJv/PW
	Zjzp7mz9OVUmoJilqegGWaVXr/kEiO5SHGZmJ8YO1Uzz7ciJoeRpxhLxfWxrja2qpvpCeq84cdcKK
	XsFbuuKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOJ08-00000003N2C-3TDW;
	Tue, 03 Nov 2026 18:12:52 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOJ06-00000003N1Z-0Ww7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 18:12:51 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-48e6eb21a8fso1902122f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 10:12:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793729568; x=1794334368; darn=lists.infradead.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=axeQ5CIE2uW000DJFHLDIWC6PSnHJaM+7ICNLkjh1BE=;
        b=ZMqkV6jcg4H77gVwHc7ZeLPXPF1fZa1R5d2AbnDQzUDZnhjCayyL3UgXy5kf+UIqH3
         JHXpXJT7ZozAa+dNXALOp2wY3tUSFyWSrdqWPRk97Tg4E7KkRIZUAs0OZ4zFcKs0DEF6
         Ucl9TgcFEEyI3+n3hYyIrgB+7g09Io8QSZWTuMzzELG2TQAM6ADHmPoNGFt5oXTWDctB
         rlMhm7iZgGWTXZo3t7YW/b8QfnpCK+95NdMpAAOYu8kqfy/P9vTUPcRsDaUorr8NR/Fs
         ilObSa+lB4LO75A+XtjBDMhMmdwu1btSzRHY72Bgqb5zxzUKlC8U+7QFm8f4c6d3qS66
         0uNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793729568; x=1794334368;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=axeQ5CIE2uW000DJFHLDIWC6PSnHJaM+7ICNLkjh1BE=;
        b=MUYN8iLxNlEBPO+StTmeWEIbrq/9zDJcqjv2CGWIaZ8S0zJG6sCeTF6my7yQ5DZxFC
         3FPQFfJ5ygt+xaVjxsdfJC8I1GZAwaiDHngYc/oYuXvnxXQ1PYADdwBxdfXwDuD0LZss
         +sRDqzOrSfZm7KGSgW7k26VLVrqtQ8jRdF70iW/qlacE/nexgVuA+kuCQmsgTxgAIAMw
         Qss6ySMnjsTCzOXtcXif1EC30zAi9nxNVb12gShV9ym6if6pPt/63KF48svRAb7eWxGh
         F3n3F37z1pRpemZTOXwITb1q2d2Qx+ZwKUI/ou+kPYDJtrZV/1FRm0goWySHP9pqDADg
         A5bg==
X-Forwarded-Encrypted: i=1; AKwUvBxbOTQmw/d1R8ih3ze5vLzTUYBOVMBg9ZvOULUvyJMIluow3wkvQJ97xaYCb30CO0EEjSLtPTmk/xTxxDpUTGQq@lists.infradead.org
X-Gm-Message-State: APuU4Z9uaLFuRjRnITjJX0Byj5wiKuFAkD9+ebBHXC3fraXeqaG/KLdh
	5eSGDUaXjJOc7GPmntzfLpyM4paRHcJlm+in2zFUtjlQiiaNR7BZO4b+
X-Gm-Gg: AYBFou1M/s7Z/VA3k64VYPhQSaSfVyNWBsWpOcGQ96evjM3NCQ6LLRSKhcCBYs0yefo
	uHREqrzb7EUVQvhhym1AYa8cXaIRB86X1CUHKOxdJPnlu0nWnnJ0Cbklqp7lv29+kwNXqeUvJpC
	Hgy6iyEDBfvYEY5uJM6mtEf9y2/IFsfia4jLZnHUQtRB8hDlxxmHEzOJM6BKGQu9BkUwCWjdSZI
	QIJnah+B4BNt/28pz3iimcTF0s1y6s3JoiMgyV1crmauzNJq7AwYGTsQozlzGVqk7/q+9jitZUm
	EvZwHqtFR4yzRAfpIMZchl6lzGDNlHoVb+GO816Y0OgPB8/jZvpN7NoRgtEumF1D7Al4bA+19ZE
	sn5PSD57cLk6/jeYSN6DvC59ENJFKgrCUmbACIzkX5H4mHfbf3XVn1Es55XiCA2bjw5U/4pBk+1
	GFb+UFIRi1Pk7zYfA9mou869/ve/WeJQtvpx0/chDDf45cjnPmBCUJsQ0UOdvz/vh9cmbRunowc
	l4eBu2Eij83MuReybW7uy8R7psu1qrwMP91+B2TPRtLzjvDUEJtTkKtO0zK2bbfArchEmi/QI7o
	TE4ifKCrOWv9Xzvpc9zc28Qkc+HMw251Nsr7qcIGXKJ512ryAopptsA+yNSv5llmH38OkohzbFJ
	Q4aZPLyRFaGvsxvEvKOrBCXR7zsp/bJQXV9ECCWVECrMNuT1v2rKIy55K3QUyNUSIgY/HcnBdXS
	bvdc2xmabUXJy9wvwSC1pZj4rheQCw5iyTUwG5HVsFzzKYnhi2Q2i4ExWfQeJRAiczhfZHn8hV+
	TtzqKfd4rWcce4quWpvNPSGyQRRz7V+g+MPhgdLX1lUDdS1CpVpn60khZX9fw==
X-Received: by 2002:a05:6000:310d:b0:48a:f59f:8b70 with SMTP id ffacd0b85a97d-48e6e4f8c71mr33769566f8f.46.1793729568150;
        Tue, 03 Nov 2026 10:12:48 -0800 (PST)
Received: from jernej-laptop.localnet (194-152-27-116.dynamic.telemach.net. [194.152.27.116])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b789c6sm28261090f8f.26.2026.11.03.10.12.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 10:12:47 -0800 (PST)
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
Subject: Re: [PATCH 04/10] staging: media: cedrus: mpeg2: use the field height for
 field pictures
Date: Tue, 03 Nov 2026 19:12:46 +0100
Message-ID: <vCPa4waZQ6-kwYC7OOX3Kg@gmail.com>
In-Reply-To: <cd5780876274ab5aa73739f890a32ceacf2e793b.camel@collabora.com>
References: <20261102170303.1973892-1-jernej.skrabec@gmail.com>
 <20261102170303.1973892-5-jernej.skrabec@gmail.com>
 <cd5780876274ab5aa73739f890a32ceacf2e793b.camel@collabora.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_101250_192484_8F3230A2 
X-CRM114-Status: GOOD (  23.93  )
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

Dne ponedeljek, 2. november 2026 ob 19:56:52 Srednjeevropski standardni =C4=
=8Das je Nicolas Dufresne napisal(a):
> Le lundi 02 novembre 2026 =C3=A0 18:02 +0100, Jernej Skrabec a =C3=A9crit=
 :
> > A field picture covers only half of the macroblock rows of a frame, but
> > the driver programs the coded and the boundary size of the whole frame
> > for it, as for a frame picture.
> >=20
> > Program the height of a field for field pictures, like the vendor
> > library does.
> >=20
> > Fixes: 50e761516f2b ("media: platform: Add Cedrus VPU decoder driver")
> > Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> > ---
> >  drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c | 13 +++++++++++--
> >  1 file changed, 11 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c b/driver=
s/staging/media/sunxi/cedrus/cedrus_mpeg2.c
> > index 10e98f08aafc..ca66a3c6b830 100644
> > --- a/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c
> > +++ b/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c
> > @@ -58,6 +58,7 @@ static int cedrus_mpeg2_setup(struct cedrus_ctx *ctx,=
 struct cedrus_run *run)
> >  	struct vb2_queue *vq;
> >  	const u8 *matrix;
> >  	unsigned int i;
> > +	bool field;
> >  	u32 reg;
> > =20
> >  	seq =3D run->mpeg2.sequence;
> > @@ -108,13 +109,21 @@ static int cedrus_mpeg2_setup(struct cedrus_ctx *=
ctx, struct cedrus_run *run)
> > =20
> >  	/* Set frame dimensions. */
> > =20
> > +	/*
> > +	 * Field pictures cover half of the frame's macroblock rows; the
> > +	 * vendor library halves both the coded and the boundary height.
> > +	 */
> > +	field =3D pic->picture_structure !=3D V4L2_MPEG2_PIC_FRAME;
> > +
> >  	reg =3D VE_DEC_MPEG_PICCODEDSIZE_WIDTH(seq->horizontal_size);
> > -	reg |=3D VE_DEC_MPEG_PICCODEDSIZE_HEIGHT(seq->vertical_size);
> > +	reg |=3D VE_DEC_MPEG_PICCODEDSIZE_HEIGHT(field ?
> > +			ALIGN(seq->vertical_size, 32) / 2 : seq->vertical_size);
> > =20
> >  	cedrus_write(dev, VE_DEC_MPEG_PICCODEDSIZE, reg);
> > =20
> >  	reg =3D VE_DEC_MPEG_PICBOUNDSIZE_WIDTH(ctx->src_fmt.width);
> > -	reg |=3D VE_DEC_MPEG_PICBOUNDSIZE_HEIGHT(ctx->src_fmt.height);
> > +	reg |=3D VE_DEC_MPEG_PICBOUNDSIZE_HEIGHT(field ? ctx->src_fmt.height =
/ 2 :
> > +						   ctx->src_fmt.height);
>=20
> I'm not entirely sure, but I see:
>=20
> 	fsize->stepwise.step_height =3D 1;

Where? I don't see this in Cedrus.

>=20
> But I don't think interlaced video can have odd height in the first place=
=2E But
> it also have an implication here as you are not rounding up to a multiple=
 of 2.
> Not sure what is the proper fix, but I have this impression something is
> missing.

Odd height shouldn't exist in practice, but I'll use
DIV_ROUND_UP(ctx->src_fmt.height, 2) in v2 if you agree.

Best regards,
Jernej

>=20
> Nicolas
>=20
> > =20
> >  	cedrus_write(dev, VE_DEC_MPEG_PICBOUNDSIZE, reg);
> > =20
>=20






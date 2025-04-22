Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E78EFC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 21:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=45H/AloEC5EQosKI+fEptjCF1JCPdnHEO37xdJvt3C0=; b=aweiRGaOPrChY4zTXDnM6kl0af
	aLmYTv6yhvMzaSJmKJpLe1sYYRXpQ72ylpu1KsKPl5V502gfH376gXRT+lHQHQfODvGbrytTIXVvq
	9cbqAxhwenWvam8qPuwSVvux61zjBzGzyyssBIF+HoqAQhO6raobvHwPZRVRdJqt2fwnt+bVyRSpb
	jCtb4WFpxLq9ypwbiHBiWWzJa1gN0v4l05LEqx3QnnHfFrQMfazoEvDhxPQGjszFE49LlCR39gtlH
	1/u2FKU5vaFiMJgDApVeqpXCeR0Ppq6qfc/Fjic4mCucbiuVdain8teHP7gm/mQs4tG85pbx21p5j
	FzSJVi/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7KsP-00000008YHp-0blG;
	Tue, 22 Apr 2025 21:09:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7KqX-00000008YAM-0SNI
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 22 Apr 2025 21:08:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=45H/AloEC5EQosKI+fEptjCF1JCPdnHEO37xdJvt3C0=; b=Iz7jgOafzA/JtKdtv4NNfkNKDQ
	Kb262bKYCWao74EDrZDAN+ELVJa1CLSSTaS4Jrcw7mfzkIR4/5nYUBidPWKmGUkC0BvjZXNkI8MVr
	IRKv1UehdLZ5yNskpXDAB7ZQvBOsci9ihAiI0rQ4eEf8F3ZxfbdA9HTP5/owgVUjF/X8N8/FP0z8h
	B3FlDYChVQpLLlc7nNqx0eRJT1Eaj2OcAfKaMbpUkVGDYuIk+UzlzlhMF3Fqc2gWfqylUadbAyugz
	+KmAjhwx2XBmRoYoP8JYDel8dXfn9k8nu1ErXW+6TGYZ5o8T6lkXK9v8vKudwxAWCiYoDhxhQG7eZ
	gILyYaFQ==;
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7KqQ-0000000BKZ5-2gql
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 21:07:57 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-736aaeed234so4729808b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Apr 2025 14:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745356070; x=1745960870; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=45H/AloEC5EQosKI+fEptjCF1JCPdnHEO37xdJvt3C0=;
        b=Fmvq3k1HZqDseZZhLg3dxq79dER1lVTOKyN5OaSrIzGCsy/RrsNlkOnk+fMUpl+Lqs
         AxYhLuecqYGXoF+CwB/laHmz7yo3MG5FhYAAvL8kRCEvhQICd9aySxnT2E8y+MyDwtdi
         Ix2AbzqK30MuZBTF0+BItd2AVqS7eku7626ik=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745356070; x=1745960870;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=45H/AloEC5EQosKI+fEptjCF1JCPdnHEO37xdJvt3C0=;
        b=s/ma670oWR0iwmmhysVEZyMwrYo67zoH8PNOlWwMU+4mquZeYHkB83eyHWlWkUUSnK
         xr27pKICkcU/D0kNCtmwoT4cbmdrvMcMnTnYWwj/sTbGCh3Go6ILHcYkg1ECu8SG/+De
         nA7RWGZjFS7bRGSw1fa2aMcOwAkR9C3Unxvlv6Tgv0HbM3Jt9qRyOP9eKTU4LjiIm94C
         wFvht0/ZhNKN/ryNdkyXBGP0BhxLO1EB86p/iQHDgUsrj0Ic9waEDKN66orJqeaYjRKP
         YLedIKyCVy4RqrPZC/KNmUqa40Owcb8ewpnfS9wQkm7P8lHaAxPJQqyQedvH6CdFkgXW
         4rlA==
X-Forwarded-Encrypted: i=1; AJvYcCXEeYZlp8BuNph7Tken8wFNEEdIdHcFo24iTmCAM3qYGlrkItpRp/Lj9x5j3jeTqIocvbmpcUW4L0l2cNj4NlvV@lists.infradead.org
X-Gm-Message-State: AOJu0YwRLMMf8k6e8C9/8TifFHt5LElnRmLBj/tSuc7Zh000zeURHH5F
	Rn3oFPLrDomq80eJyB+W8qU1cTGjTwW6t9YWc5CI41pTe8yOBone0U3fp9uV/qrl4/NvsSQtVVE
	I8orWKf2K+Bd6aqR4msaWolCbbwzPsTYcwxeO
X-Gm-Gg: ASbGncvY5jZT2icGP0O4F/0NGp0x0J0PuCJygpt5eJUEvaXfeJUxU1A3KkVzZYrjmd2
	V2gILKIlrAYFLpBk1kR59a872B5oe7pn/ndiOrhXlJ4VkWop37YZCZU7UTKLyq82JAm6c45iQda
	51aykIHGbdurB2A5/Bqh5KZqV2TsE5hQ8C6MWVwCz69dUH3fN2IAWdFTjITplduIU=
X-Google-Smtp-Source: AGHT+IGltlrXXX5WKjfs3az+RLOdT3RUOZ4pgUz3pzyv9A2wvBoVRwdKL4WWPasLspXHid4QoIa/QcaTAyeY1aVtvOw=
X-Received: by 2002:a17:90b:1f8c:b0:2ff:5ed8:83d0 with SMTP id
 98e67ed59e1d1-3087bb631d7mr27536082a91.16.1745356070047; Tue, 22 Apr 2025
 14:07:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250211-enable_hevc_still_picture-v1-1-0c06c0c9add2@chromium.org>
 <f257832e823d23c8324a9eaf7890dd4b6d50a6f0.camel@ndufresne.ca>
 <1f1e41700b16eef7fe790b9b14d6ccfd157f67ad.camel@ndufresne.ca> <a2cb7a26f120558ab7b84a6f954188c8e61f37a8.camel@ndufresne.ca>
In-Reply-To: <a2cb7a26f120558ab7b84a6f954188c8e61f37a8.camel@ndufresne.ca>
From: Nathan Hebert <nhebert@chromium.org>
Date: Tue, 22 Apr 2025 14:07:39 -0700
X-Gm-Features: ATxdqUGjCZHeQwn5h4Wm7IoTgUdcsGQStAHC2clGfbY2_C-9n3g3PH2xVEW8YXs
Message-ID: <CANHAJhE--nOrMnCHPEEmRyTvd6mK5GoC+J7TdX64VEX+OJ69Kw@mail.gmail.com>
Subject: Re: [PATCH] media: mediatek: vcodec: Enable HEVC main still picture decode
To: Nicolas Dufresne <nicolas@ndufresne.ca>
Cc: Yunfei Dong <yunfei.dong@mediatek.com>, Tiffany Lin <tiffany.lin@mediatek.com>, 
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_220754_925786_C9416C59 
X-CRM114-Status: GOOD (  32.84  )
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

On Tue, Apr 22, 2025 at 1:54=E2=80=AFPM Nicolas Dufresne <nicolas@ndufresne=
.ca> wrote:
>
> Le lundi 17 f=C3=A9vrier 2025 =C3=A0 14:28 -0500, Nicolas Dufresne a =C3=
=A9crit :
> > aLe lundi 17 f=C3=A9vrier 2025 =C3=A0 13:45 -0500, Nicolas Dufresne a =
=C3=A9crit :
> > > Hi Nathan,
> > >
> > > Le mardi 11 f=C3=A9vrier 2025 =C3=A0 16:34 -0800, Nathan Hebert a =C3=
=A9crit :
> > > > Mediatek devices that support HEVC also support the main still pict=
ure
> > > > profile, but today, the main still picture profile is excluded.
> > > >
> > > > This removes the skip mask for HEVC, and enables the main still
> > > > picture profile decoding.
> > > >
> > > > Signed-off-by: Nathan Hebert <nhebert@chromium.org>
> > > > ---
> > > > On Mediatek devices that support HEVC decoding, HEVC Main Still Pic=
ture
> > > > profile is also supported by the SOC and firmware. However, this
> > > > capability is turned off in the vcodec driver.
> > > >
> > > > This removes the code that disables HEVC Main Still Picture profile
> > > > decoding. Validation of the decoder has been done via V4L2-backed
> > > > Android CTS tests on an MT8196 device.
> > >
> > > While its nice to know that you are working on upcoming SoC, we need
> > > confirmation that this is working on all the upstream stateless
> > > decoders supported: 8183, 8186, 8192, 8195. Ideally testing on 8188,
> > > which I can see has merged support without the linux-firmware file to
> > > go with it.
> > >
> > > I'll wait for that and Yunfei's ack before picking it. Yunfei, please
> > > fix the situation with 8188 in linux-firmware, and CC me.
> >
> > In case this is useful, we recommend providing fluster scores for the
> > codec, which in that case runs some public ITU conformance vectors.
> > Since most of the testing has been done with GStreamer, you may be able
> > to find old report and confirm it it works. GStreamer does not
> > currently filter the profile/level (on my todo), so it will try anyway.
> > IPRED_B_Nokia_3 is the one vector in the base suite that expose that
> > profile.
> >
> > resources/JCT-VC-HEVC_V1/IPRED_B_Nokia_3/IPRED_B_Nokia_3.bit
> >   Stream #0:0: Video: hevc (Main Still Picture), none, 1920x1080, 25 fp=
s, 1200k tbr, 1200k tbn
>
> Ran the test myself on MT8195 and can confirm it passes if you ignore
> the profiles.
Thank you for checking, Nicholas. I apologise for slow action on my
end. My work priorities have pushed this back in the queue.
>
> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
>
> >
> > regards,
> > Nicolas
> >
> > >
> > > regards,
> > > Nicolas
> > >
> > > > ---
> > > >  .../media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateles=
s.c   | 2 --
> > > >  1 file changed, 2 deletions(-)
> > > >
> > > > diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vco=
dec_dec_stateless.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vc=
odec_dec_stateless.c
> > > > index afa224da0f41..d873159b9b30 100644
> > > > --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec=
_stateless.c
> > > > +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec=
_stateless.c
> > > > @@ -152,8 +152,6 @@ static const struct mtk_stateless_control mtk_s=
tateless_controls[] =3D {
> > > >                   .id =3D V4L2_CID_MPEG_VIDEO_HEVC_PROFILE,
> > > >                   .def =3D V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN,
> > > >                   .max =3D V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10,
> > > > -                 .menu_skip_mask =3D
> > > > -                         BIT(V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STI=
LL_PICTURE),
> > > >           },
> > > >           .codec_type =3D V4L2_PIX_FMT_HEVC_SLICE,
> > > >   },
> > > >
> > > > ---
> > > > base-commit: ffd294d346d185b70e28b1a28abe367bbfe53c04
> > > > change-id: 20250211-enable_hevc_still_picture-26b35eb08270
> > > >
> > > > Best regards,
> > >


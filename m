Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5790CDB475
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 03:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6gf0cDEKhbj5fscbEvHzuZbmEnf4dVk4rDx+EdHDqqA=; b=B66f87XUefmfhBW2fAw0tjtLd/
	0MYXsWxFewAZ2at2oC8jbcAF0ojO6p7KzbcVpFhnwMJu27HXW/XW8EZkN3drXXeCHTOpQ4fizJn0P
	uMsu6F+MRtALwRqi51mVUi5szmLa0DxM/aBmDZQd2WG5ZNMZP0wxq3IExqPswLE7Xv1o1nLPvRLbM
	EsEolo1XMfcz+XjQaNaD5OdfF54UdisHUPxkLXs1yJIIBU5QYBE0PWkXQiTYdKr6Yq3G4T1IV2XCN
	HnkyiYFjh9LEvo8Xy5noG6J3qqULY5tDo87p5bc5wrEFH+cu1P4d5ztpkA8Op9rflxZK8Bj+mifeu
	dPC6HE0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJk6M-0000000BRvP-0kRC;
	Fri, 14 Nov 2025 03:03:54 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJk6J-0000000BRuT-2lj0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 03:03:52 +0000
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com [209.85.221.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 0B104402D5
	for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Nov 2025 03:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1763089429;
	bh=6gf0cDEKhbj5fscbEvHzuZbmEnf4dVk4rDx+EdHDqqA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=EbkdUMLF1Ec2W4CdWiPqElaJ5oG+EEpOzI+tVixATZmd1r20Ls9K3e4Vbs4KtOXnm
	 hx0/xD5l9QW/NCiTEv2TAwPZUYZQikYxqSJ4pn5E3txj9hZubRlmW0ONsVrHZDN2UO
	 xin1v0WFMP/NFe3dRsgAtMi4/H5qn5YSqfr2HEBwDAQ4ay0l0oLjtVb4UX4mE9lr+B
	 nGRi0mm03Np/9WUhAvxcBpZUT1+TR9jolbPfPUCbWSRXdaKTlKOQcjVHUtOvGUpUdB
	 eeJZIQ8VGPpbMGshEDDS/jy19rmLkqilJn5kSgZIIjdKop2Qkj0/mysh2mtB0ERgLM
	 0Hk9WEYHVMOxGsrpNsYvvPxk9HPVsbSPAhh9vLBzYCjNH2KWSPlg9yGRCgPTRTYkLN
	 kD23EqbEf+wDWxK4SCfVGDABsfllpO7TdNyHDrSBjWxoJP9UlDXY7ENFcMLXMPh+ar
	 0LcAVUQ6jyh+NhAXjv6eZnJNXQVrOva5VxR9Qy4gXnwSgdYf9sjTgSQvEVj2Qb7PgE
	 i8vJsLvhXgIVwT6GyQO4isyleIpPK8XFg1jKjeowdJOg0lrjSkvbkNIX9FfVysdxMl
	 EH+8Slm/DwQeIBL5U6q0tOvwbx7ZTfGumVEpkyaJdbQ1eVJBb8fVxlpp8Pr+f2H0Y0
	 4xEliiALAXkgY3QIX5OcXmxA=
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-42b2fb13b79so704789f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Nov 2025 19:03:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763089421; x=1763694221;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6gf0cDEKhbj5fscbEvHzuZbmEnf4dVk4rDx+EdHDqqA=;
        b=EyuRkoi1FKs8Nd36QzqmXw/nxEENl9lTwV1i5aPHkiKcgyDQ5MiI3J9pwdO4BECUgs
         t0Z34GlrzJ7WIDIbFbsb3RhI0lMdr5is5R42mp8SGmWJi4t0WsYM22jOqbTuFsBBnQ1H
         DK+FEGHUtxSgKsX6RcpNyzverCxJbGhiDPFushogbyXrzBBhPQ6twRtSNHfbftQfPytN
         vumDVpsm34+DaLuymL/3irGrBIW3xBJq9gB0rCMOZzQdhDzb8LE45K8bpedIWRFAys+7
         r7VRBoxMR2NC3aTnePgBC06aE407abGZTaO6Z4o3ibPNzy8y0haxZ8M4/clXeuP9dFgn
         uqLg==
X-Forwarded-Encrypted: i=1; AJvYcCULWEL3IIW0dukx8oAHtYw7KRnLNv9wPC+RR854zq5D7FsslfeAtDlJ+rNFK6kg95KcRHyMeDKJykT+ZtzTo7dZ@lists.infradead.org
X-Gm-Message-State: AOJu0YyddFmDKxcTp0CJVHS6utHgufxsPHtx1ejVrYf1mAIApvtVPBNG
	hQwa8dMtXzmSTM0dDlD8AnK6g6j8zqbP3A9vsKCTt8FPCsozSm0dRTI2QlF1f3PasshptsxMiHs
	OKeo0LBKvOXvLty5dNN/OrIlujHmk+Ao/OLRH51hlfZYNf11mvfuc9jh6YtxUj18vOIlqOM31BF
	IN4lLFWEqtmjPBtnwGiWHhmXCxapxpspCTMNllqNHqlAtFMZlvhtI0jQUWPciuib4T6CA=
X-Gm-Gg: ASbGnctq5wpQjfWeGxcXYjX4VSmnb2ORSjGsZK1UmfnrtxIyGDFG0B6r1fejq8A7xP+
	Xjkwl2/iUEdus9Aw5FLOwelnUMNFk8scS0KnzLkgRK3nbAtxcPDmEpoA2QZ3t+Leh3wpzz4VroG
	Kof3M/o3JJNaP3n0gspWorzvm3TJevuEZXVC+2jX2bHFr1ftrSobAPVbwJDA==
X-Received: by 2002:a5d:5f47:0:b0:42b:3bfc:d5dd with SMTP id ffacd0b85a97d-42b59384b07mr1348723f8f.54.1763089420787;
        Thu, 13 Nov 2025 19:03:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH7lXto+SrYlSZwMjWg2X2Xom9R1MvDo5ZjuJvGkM/TWys4E1pNn82Ax34l1tOXRO3FfFHoszR5+HD2D5hkPkg=
X-Received: by 2002:a5d:5f47:0:b0:42b:3bfc:d5dd with SMTP id
 ffacd0b85a97d-42b59384b07mr1348706f8f.54.1763089420451; Thu, 13 Nov 2025
 19:03:40 -0800 (PST)
MIME-Version: 1.0
References: <20251111124853.2916889-1-jianhui.lee@canonical.com> <589670a9-ac91-4fde-b595-473408b3df18@kernel.org>
In-Reply-To: <589670a9-ac91-4fde-b595-473408b3df18@kernel.org>
From: Jian Hui Lee <jianhui.lee@canonical.com>
Date: Fri, 14 Nov 2025 11:03:28 +0800
X-Gm-Features: AWmQ_bnMo4sgehMAEZ-tiHd0CQ6awtXHzB4uH7_k7YqeDdG-uC5Y-NypoFmYMzg
Message-ID: <CAGmiHmGiDngNCkfkwdoV8M0XjQVFEXTJekPAfuZfUFRui9gSbg@mail.gmail.com>
Subject: Re: [PATCH] memory: mtk-smi: Fix NULL pointer dereference in config_port
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Yong Wu <yong.wu@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Joerg Roedel <jroedel@suse.de>, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_190351_826863_54F73AA8 
X-CRM114-Status: GOOD (  21.44  )
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

On Wed, Nov 12, 2025 at 11:51=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> Please trim the traces from all irrelevant information.
>
> >
> > Fixes: e6dec92308628 ("iommu/mediatek: Add mt2712 IOMMU support")
>
> Add Cc stable.
>
> > Signed-off-by: Jian Hui Lee <jianhui.lee@canonical.com>
>
> > ---
> >  drivers/memory/mtk-smi.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/drivers/memory/mtk-smi.c b/drivers/memory/mtk-smi.c
> > index 733e22f695ab..8eb043ff8280 100644
> > --- a/drivers/memory/mtk-smi.c
> > +++ b/drivers/memory/mtk-smi.c
> > @@ -244,6 +244,10 @@ static int mtk_smi_larb_config_port_gen2_general(s=
truct device *dev)
> >       struct arm_smccc_res res;
> >       int i;
> >
> > +     /* larb->mmu and larb->bank are set in bind(), may not be ready y=
et */
>
> And how do you synchronize this between CPUs? IOW, what certainty you
> have that this CPU sees correct data and the checks below have any sense?

Thank you for the review and for pointing this out. Moving
pm_runtime_enable/disable to component bind/unbind should ensure that
the synchronization happens correctly. I will send a v2 to address
those you mentioned.

> > +     if (!larb->mmu || !larb->bank)
> > +             return 0;
> > +
> >       if (BIT(larb->larbid) & larb->larb_gen->larb_direct_to_common_mas=
k)
> >               return 0;
> >
>
> Best regards,
> Krzysztof


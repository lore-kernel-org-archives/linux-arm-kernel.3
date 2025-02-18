Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFD7EC021A9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 06:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xv4n+LUwamiLE41T0SAH0qvuQvjUID2QnZlS05VRF3A=; b=JB+9unqiM9cFxsMqreRVlnZdJr
	5931yGDqzBlL8sIbfB+Qyiai6KUjf8gEc3zcM6AsZknELeqF0iwgj1tlQdbbhV2Q3MNBa4Fl4hLYy
	MgxHNWpFmZzv3vP7BLzKXbnBN2ICQ8ecHLrT/DZ0oIgHubCsh3CNaW47hWXJkeFIqtfkIHaFW/Eal
	sRYA8gRwBZPQ8ugHl7z/t2Ok7aXh+aiclWue5YyqoT1UFfPHlWMVChlaF6JARlwXwNkbVIQ6QYhEP
	p9jVOkr7D2iHqq48/t7ynTkt5HFvoPOAkkDGyxhGCH1BgaT2miKlh4IjPo2pp+aigr+r3Bm+pfgl1
	5U8IC2bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkGz7-00000006y6Y-0slY;
	Tue, 18 Feb 2025 06:21:33 +0000
Received: from mail-vs1-xe34.google.com ([2607:f8b0:4864:20::e34])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkGxf-00000006xyv-07Us
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 06:20:04 +0000
Received: by mail-vs1-xe34.google.com with SMTP id ada2fe7eead31-4be55c93be1so344512137.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Feb 2025 22:20:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1739859601; x=1740464401; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xv4n+LUwamiLE41T0SAH0qvuQvjUID2QnZlS05VRF3A=;
        b=YS/iNhE7l5FrFojZ2Y5OWXlXaMfoPdIazgDxsRBfJ1dqpWnE9ZvcrKxnKmejmRD8X0
         W0BDI7BMBUms6Mt6nYL8Y6AFPxhSkRlz8Y4233b04QCfHcJbHTHqcSkMEyHeSb5YUSL4
         zgrwnkxpNZ+MBda5pLkVdFWt1teok9aNlrNiA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739859601; x=1740464401;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xv4n+LUwamiLE41T0SAH0qvuQvjUID2QnZlS05VRF3A=;
        b=HBmKAYBI3xgBRyiLIPBB4Id2aHi0go7/ivAtrdgqbifYmfdOzZqplXulbhoHj5Ll9/
         XIRs59lE/LnHTL4dLn+UMYWzVQwJiMFj+lnmgdx82FtDY5uEaSTPlNgQzr6ukgYLdQfT
         6QbmnNUZnadgUrULbDo/ElFdC8kEFKaUXMoVAC04CgXAk+6ePCzOWfd4p4UkoaCfYayR
         lddLXZfknR6bSitMOUMGxVl/5ax6NjwjbhajBkRIP81f17T/koRiozGyCaLHgDP0Lbom
         gRkglblTl3JI8xqNJ64QYhQblCo6UTLk4QadtJMfnmVi1ydb+MzOc1AghxdvG8KAwimC
         of1Q==
X-Gm-Message-State: AOJu0YzVSfAjgVxIMP/QHfC16fewy/ovYvMzPnHrcKxeSyLyPm1kbuHY
	BrCMX6y8VAuQox4WYq8yI7+QiIw4lhExVYQJrtSILIAd6O2XsrJOyAEC34yS7mSCID/qypd0C/Y
	=
X-Gm-Gg: ASbGncv3qZ+qbgB0LpenkTP5WKkHFmkPaMs3MjPC664irLnublYTwsaTNjaZDmh7yOM
	5lA2+qqSBhjGA9o9lSJcGHpeMjApCBMAbfnwFy+IPwLKBjLUNvHeBL2Fty2RHs/illY2SgbQMyJ
	O762aId1zz9Sr8/ROyyGwOrvgHYUdCsYBEWxYk+gdhzxKTTAN1L3QYBFZtHn/+DutLWj6YG1F/R
	0DJ2jHU0WT+lTM7iI6CSgWzt8HUZuuuP2Io9s1FnrEA1dw/A3Mt6tcEjXlrc1DghLi9HAi3e8Wp
	5qF8KZZ5u+Z8tCLk/R24U8RvC9Pd3qpDucwm6y86Ri2l3iqeKHQ=
X-Google-Smtp-Source: AGHT+IETTkXJ5NnhOtgAPUpImqXttgfgUpPuI3MX3qOAw0+N7+51OE/mDZOGAQKA5kxACgkpHXzwTw==
X-Received: by 2002:a05:6102:d93:b0:4bb:d31b:7ae4 with SMTP id ada2fe7eead31-4bd3fea03e5mr5715688137.19.1739859600931;
        Mon, 17 Feb 2025 22:20:00 -0800 (PST)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com. [209.85.217.45])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-868e8547ffasm2287267241.4.2025.02.17.22.19.59
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Feb 2025 22:19:59 -0800 (PST)
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-4bd3763900aso858271137.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Feb 2025 22:19:59 -0800 (PST)
X-Received: by 2002:a05:6102:151d:b0:4bb:5d61:1288 with SMTP id
 ada2fe7eead31-4bd3ff163famr7472440137.23.1739859598960; Mon, 17 Feb 2025
 22:19:58 -0800 (PST)
MIME-Version: 1.0
References: <20241219113411.3999355-1-fshao@chromium.org>
In-Reply-To: <20241219113411.3999355-1-fshao@chromium.org>
From: Fei Shao <fshao@chromium.org>
Date: Tue, 18 Feb 2025 14:19:22 +0800
X-Gmail-Original-Message-ID: <CAC=S1nib8o+4gbVSRXx40_jcCRne4KD5xwEFEHZiaokjask5RA@mail.gmail.com>
X-Gm-Features: AWEUYZmvvAhIhLZdIE8ZnGqrNusNM3AKRBNLuy20n7CpoEBss__hOTAJAkQGCeU
Message-ID: <CAC=S1nib8o+4gbVSRXx40_jcCRne4KD5xwEFEHZiaokjask5RA@mail.gmail.com>
Subject: Re: [PATCH] soc: mediatek: mtk-socinfo: Restructure SoC attribute information
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_222003_097560_C0D3209C 
X-CRM114-Status: GOOD (  27.38  )
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

On Thu, Dec 19, 2024 at 7:34=E2=80=AFPM Fei Shao <fshao@chromium.org> wrote=
:
>
> So far, the MediaTek socinfo driver populates the SoC information as
> follows:
>   - family:  "MediaTek"
>   - machine: "<marketing_name> (<soc_name>)"
>       e.g.,  "Kompanio 1380 (MT8195)"
>   - soc_id:  <null>
>
> This approach has some drawbacks:
> 1.  "soc_id" can be used for showing the SoC name (e.g. "MT8195"), while
>     it's currently unused.
> 2.  The newer socinfo API automatically populates the "machine"
>     attribute with the model name from board DTS if unspecified, which
>     we may want to preserve if possible.
> 3.  "machine" combines the marketing name and SoC name, making it
>     trickier to parse. Ideally, the marketing name and SoC name should
>     be in separate attributes so userspace to utilize them as needed.
> 4.  There's no guarantee that the marketing name will be announced along
>     with the SoC name. If either is undetermined, the current design
>     will result in a malformed "machine" output. This is observed on
>     some newer MediaTek platforms, where the marketing name is still
>     undetermined but the SoC information needs to be settled for device
>     registration and validation before launch.
>
> To address these points, this commit proposes a new theme to display the
> SoC information:
>   - family:  "MediaTek <marketing_name>"
>       e.g.,  "MediaTek Kompanio 1380"
>   - machine: "<dt_model_name>" (auto-populated)
>       e.g.,  "Acer Tomato (rev1) board"
>   - soc_id:  "<soc_name>"
>       e.g.,  "MT8195"
>
> Moreover, if the marketing name is not provided, the driver displays
> "MediaTek" in the "family" attribute instead, consistent with the
> previous behavior.
>
> Restructure the way driver populates the SoC information as described
> above.
>
> Note that Mediatek-based Chromebooks are the primary consumers of this
> socinfo driver, and Google has prepared corresponding userspace changes
> to comply with this update, so the impact to userspace is controlled.
>
> Signed-off-by: Fei Shao <fshao@chromium.org>

Just want to resurface this patch. Should I resend?

Regards,
Fei

> ---
>
>  drivers/soc/mediatek/mtk-socinfo.c | 17 ++++++++++++-----
>  1 file changed, 12 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/soc/mediatek/mtk-socinfo.c b/drivers/soc/mediatek/mt=
k-socinfo.c
> index 123b12cd2543..b9dbc90d7814 100644
> --- a/drivers/soc/mediatek/mtk-socinfo.c
> +++ b/drivers/soc/mediatek/mtk-socinfo.c
> @@ -62,17 +62,24 @@ static struct socinfo_data socinfo_data_table[] =3D {
>  static int mtk_socinfo_create_socinfo_node(struct mtk_socinfo *mtk_socin=
fop)
>  {
>         struct soc_device_attribute *attrs;
> -       static char machine[30] =3D {0};
> +       struct socinfo_data *data =3D mtk_socinfop->socinfo_data;
>         static const char *soc_manufacturer =3D "MediaTek";
>
>         attrs =3D devm_kzalloc(mtk_socinfop->dev, sizeof(*attrs), GFP_KER=
NEL);
>         if (!attrs)
>                 return -ENOMEM;
>
> -       snprintf(machine, sizeof(machine), "%s (%s)", mtk_socinfop->socin=
fo_data->marketing_name,
> -               mtk_socinfop->socinfo_data->soc_name);
> -       attrs->family =3D soc_manufacturer;
> -       attrs->machine =3D machine;
> +       if (data->marketing_name !=3D NULL && data->marketing_name[0] !=
=3D '\0')
> +               attrs->family =3D devm_kasprintf(mtk_socinfop->dev, GFP_K=
ERNEL, "MediaTek %s",
> +                                              data->marketing_name);
> +       else
> +               attrs->family =3D soc_manufacturer;
> +
> +       attrs->soc_id =3D data->soc_name;
> +       /*
> +        * The "machine" field will be populated automatically with the m=
odel
> +        * name from board DTS (if available).
> +        **/
>
>         mtk_socinfop->soc_dev =3D soc_device_register(attrs);
>         if (IS_ERR(mtk_socinfop->soc_dev))
> --
> 2.47.1.613.gc27f4b7a9f-goog
>


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE592C282CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 13:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sOVfAtbvZNxNCwgHpSyQRSngRcaBGZ7H2zzyJ3wS2ig=; b=SM7LgvpFWWu8jCU31s7T/qT0La
	6j9WZrcgfuwYkudB5WtSPx13k3slkmOb3WFUQ+j1BHT0ESjemSaWuCklGWDoVQhav82jSrMTcUqPL
	zzxnXDUtB3Cw9qEGDmqM/RG+2vwMmfUbSnb+2Sj9kPYNJlZ6hzjPVPVTfrItHIndGs0uahf+6MI5Q
	x2/TM1QKrS2za1MkEsWYXd7SaEndBRp+lDH0v9IMXkLqbj0801LpF8RmDRaqD+qcpfvwcG6Xy24W1
	PLopQjGa87nYC7kzMByJshXMVRMFBCE1kLQtzpkwPWIneSdeveI8ERie2P5G/wsAFziKbpw27FKDZ
	UZDUmSPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp5iv-00000000t2p-2Bz6;
	Mon, 03 Mar 2025 13:20:45 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp5dP-00000000s9Z-3Jss;
	Mon, 03 Mar 2025 13:15:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 41D595C596B;
	Mon,  3 Mar 2025 13:12:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5463C4CEE8;
	Mon,  3 Mar 2025 13:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741007702;
	bh=nwrY5mTBKsH0VrIlw0M+a6qAcq9/UvmEmo3JfFgzxI8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ckAWY6ydEYES7IYxghoebGnlP5Hw44gzxvtzcBTYXWJD7h1D/ZFFdoE21onxb4qr9
	 wOEmpbDpjBnTYSYj7FB2P3sP0957DntKshxe4U1Si6ofwrNHu8s5fmTD1hDjFzW9qm
	 6VxrrffeSayrkbyHr6trQbkHvqaBKTA73rnG6yyQylko+hLrVJO3IqnNLhxynFzC4o
	 vi5D6Kvkq3Hdj8nAF1DWy/ZdYwUBjJescwR38hv9Sc1MUNWRbPMzDGBxD9KB1R0G99
	 sWoGq3f9fWNtf1FmlhGszXMh0jYbZsjz2Yexm7cQAKECTD+XyCni2siFzPQh0OxuP7
	 lafJyce5Gnrmg==
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2fe821570e4so6253324a91.0;
        Mon, 03 Mar 2025 05:15:02 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUHUOX0Cdvap5o16MHgkQQuBiGrHiS70YaTvHvL++HEj0lx2DXbRXQxsgwWV3S4kyB3M35eTchRLadqL2xl9/g=@lists.infradead.org, AJvYcCXKU3xdtOzev9zkpM0GihkGeasN/4mHCURCdarz71TkU7ioYO9gMRpM117u2w8TFidTjM8MJWnhIX6GK3EHsR4x@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1yX3JpYXawcVtao/JiYwVj7Nt+n7TLnlA/m4XZ2/hEyo8SHJr
	TjFH8H8E/2zFBwFQbAfYIRvFAQRijv2gDBcsajfNMX2SEwBmP+El7LcUS/+jqs3n3YpmKMYm9Iz
	P34BXEGUL4kFCSSfLu8HWkGouFQ==
X-Google-Smtp-Source: AGHT+IEdq6TIp16hKhBlDO4xfda53D7O9rz6s7IDZPVAapB9apF5VJ70jX9N1Qnsx75v9OLYhq9X6ox1YKUJZiNS6WQ=
X-Received: by 2002:a17:90b:4ac6:b0:2fe:b9be:216 with SMTP id
 98e67ed59e1d1-2febac10927mr18112467a91.31.1741007702343; Mon, 03 Mar 2025
 05:15:02 -0800 (PST)
MIME-Version: 1.0
References: <20231023-display-support-v7-0-6703f3e26831@baylibre.com> <20231023-display-support-v7-3-6703f3e26831@baylibre.com>
In-Reply-To: <20231023-display-support-v7-3-6703f3e26831@baylibre.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 3 Mar 2025 21:15:50 +0800
X-Gmail-Original-Message-ID: <CAAOTY__qg1R4JQDssy1bDDJMea8Ud7OsPXjek20cHV8S=jfNbA@mail.gmail.com>
X-Gm-Features: AQ5f1JqYD6WJcU1BIk0mtXtCrxuXqvikkqhcdhVAAsXT4MVrnLil5ua2eCNjEcM
Message-ID: <CAAOTY__qg1R4JQDssy1bDDJMea8Ud7OsPXjek20cHV8S=jfNbA@mail.gmail.com>
Subject: Re: [PATCH v7 3/6] drm/mediatek: add MT8365 SoC support
To: amergnat@baylibre.com
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Jitao Shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Simona Vetter <simona@ffwll.ch>, Simona Vetter <simona.vetter@ffwll.ch>, 
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Fabien Parent <fparent@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_051503_914728_F2C9D742 
X-CRM114-Status: GOOD (  14.49  )
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

Hi, Amergnat:

<amergnat@baylibre.com> =E6=96=BC 2025=E5=B9=B41=E6=9C=8810=E6=97=A5 =E9=80=
=B1=E4=BA=94 =E4=B8=8B=E5=8D=889:31=E5=AF=AB=E9=81=93=EF=BC=9A
>
> From: Fabien Parent <fparent@baylibre.com>
>
> Add DRM support for MT8365 SoC.
>
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>

Applied to mediatek-drm-next [1], thanks.

[1] https://web.git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.=
git/log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/med=
iatek/mtk_drm_drv.c
> index 0829ceb9967c..5471ef744cc1 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -328,6 +328,10 @@ static const struct mtk_mmsys_driver_data mt8195_vdo=
sys1_driver_data =3D {
>         .min_height =3D 1,
>  };
>
> +static const struct mtk_mmsys_driver_data mt8365_mmsys_driver_data =3D {
> +       .mmsys_dev_num =3D 1,
> +};
> +
>  static const struct of_device_id mtk_drm_of_ids[] =3D {
>         { .compatible =3D "mediatek,mt2701-mmsys",
>           .data =3D &mt2701_mmsys_driver_data},
> @@ -355,6 +359,8 @@ static const struct of_device_id mtk_drm_of_ids[] =3D=
 {
>           .data =3D &mt8195_vdosys0_driver_data},
>         { .compatible =3D "mediatek,mt8195-vdosys1",
>           .data =3D &mt8195_vdosys1_driver_data},
> +       { .compatible =3D "mediatek,mt8365-mmsys",
> +         .data =3D &mt8365_mmsys_driver_data},
>         { }
>  };
>  MODULE_DEVICE_TABLE(of, mtk_drm_of_ids);
> @@ -751,6 +757,8 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[=
] =3D {
>           .data =3D (void *)MTK_DISP_MUTEX },
>         { .compatible =3D "mediatek,mt8195-disp-mutex",
>           .data =3D (void *)MTK_DISP_MUTEX },
> +       { .compatible =3D "mediatek,mt8365-disp-mutex",
> +         .data =3D (void *)MTK_DISP_MUTEX },
>         { .compatible =3D "mediatek,mt8173-disp-od",
>           .data =3D (void *)MTK_DISP_OD },
>         { .compatible =3D "mediatek,mt2701-disp-ovl",
>
> --
> 2.25.1
>


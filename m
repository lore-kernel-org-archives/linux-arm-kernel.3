Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB831C021B1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 16:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DgM5sUb9hfHYmtSkv/5pnKpeKFZPOX7gUFFWxW6PMI0=; b=EZ5b3GuU5z9aROZya9O+bQDuhX
	hDEI7XdYomMb9f5UjF0rYmRS68xWds8v10PN2LsqZhfUduu/0TkIbUXjw0koh2JO9qUly0ELCee1b
	6V63wNpZRdFTmcmcquOnH//Go8w9+vWBykIodxQNG6hqhJgmADRlyzwD/S4Oozaqx4buInHb1J5VP
	KjX1bIa7woo5CJLJyNZd4HL97ECauFYdu9D6FPn/i7bMCOwpt6nM5EyNFn1c+Qf9hCrOx8eWyZbYb
	zQko/Pb3pC7ap0A71/wp0yzY11651BEdvTJi9EDk0dd3foaCUcTK34i+DgJoZIsNMF5y2Bkvd4G96
	SZ/7S9xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkn8M-0000000DsMv-3J2D;
	Wed, 19 Feb 2025 16:41:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkkpa-0000000DDkr-2W9X;
	Wed, 19 Feb 2025 14:13:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=DgM5sUb9hfHYmtSkv/5pnKpeKFZPOX7gUFFWxW6PMI0=; b=UmTLULsBK4dvf/G4jtscRzuN1j
	quo8HgrjzWaJs3rZ0uXJjSoc+IJTrBuvaOx82u6n6sOrF+XLpTT+M6P+BX3sC18OaeWkITJeUj9oW
	jOMRZquqYOSaAEqGAbC/7nhf/enCXJ/bBoq2TlHUOEIQeygD9dpKXnC76Kc6skfpGRDX5fk5289fv
	EAG8S6jQi1s5wh7wLuX9fix/0q/P53oW1hfidKtvNuhcANKJAfOULB04QGxaw5ZJMP5Lob9SmV7I1
	m44f44+bgsDg+cGzAciD18KDRnRX6NK6tJ1Li2Tz1d3wz3YvXFNtV/vZkLMclqZYhLGn7ggn/xit8
	Z9RzF66w==;
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkkpX-00000002At2-1NAN;
	Wed, 19 Feb 2025 14:13:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 97ABAA4289B;
	Wed, 19 Feb 2025 14:11:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD2B5C4CEED;
	Wed, 19 Feb 2025 14:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739974415;
	bh=jso5qQFQSYU2mgkN6qCTfJjd+ezV54v2ynj9RTPzjc4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=FnsiTdTjIta96r2UPsWQppWhDfdDVi33yIdAv7br0buBtK0uCnRlPz0zRE70iN7jh
	 qU5jsaxlcf56OVAeYMyc9UZZcCMR60GxCxst2IolLXGVZ/dvgaC8RZOOj8Re+N/zrA
	 25NjV3xP/6CV/+rhx4njuRt3Wv0qvCfwVw5iHK5l6YA1fngr3GwC+Ota629c+VKEye
	 qVFF9FH0D0rsAHnroytvbw/un7iO2yCsCfutiArUcaWitMcJArqal9WgfQ6dY7HtAi
	 bzGz9inzKseg0RKM85ZLNScRMNjpmwIXJK5dU1ihYmGpvi2DKeeFrYZ/lOeaTOtDtK
	 3yJ424zphsNFA==
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2f9d3d0f55dso9737044a91.1;
        Wed, 19 Feb 2025 06:13:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW/AkB3l7QZMgZOxznmf0Ye0QW0lQ4iEC/WFO8/Dy1mXKt1a3plkKWJRb6yFvjVAPMugJiGqm7b4nIBg2fwMCg=@lists.infradead.org, AJvYcCWo9fqEa74Ar8OL98MskjsjeFoPn45AO6Kk4SX4uw/wYDAGKUWsmDQfBRr/O9slZnjyfAJcz4Dg3l58E17LpBwv@lists.infradead.org
X-Gm-Message-State: AOJu0YyjqTSFmDOik/RDynGQq+5ekfkuiPohIz6qUIxhY89rMgKNbWXl
	tkpBw0VKvcQXBV/gyE8v1oiNA7czLEVVJrjdZhkPawnBE/SuSQisxUNQf0yK1Y7xHtWZh6rFkAz
	mMGD0zDUjhUljk86iFNbClDE5Ew==
X-Google-Smtp-Source: AGHT+IFa8R6i4Eeuldo8axIMgGyezQE2Aih3YKW/uwabG5hR2Fqqcd+qkA666mlQjsQf/SRPn9uJJ5YEmt8CiUS/WUI=
X-Received: by 2002:a17:90b:3912:b0:2fa:229f:d036 with SMTP id
 98e67ed59e1d1-2fcb5abe3cemr5694227a91.30.1739974415205; Wed, 19 Feb 2025
 06:13:35 -0800 (PST)
MIME-Version: 1.0
References: <20250217154836.108895-1-angelogioacchino.delregno@collabora.com> <20250217154836.108895-17-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250217154836.108895-17-angelogioacchino.delregno@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 19 Feb 2025 22:14:20 +0800
X-Gmail-Original-Message-ID: <CAAOTY_99Q5X+PurxQKewJRN4e=cxwMwX-6qzrZztOe5Eu2KuPg@mail.gmail.com>
X-Gm-Features: AWEUYZmtLYXEQSNosRWwGHhpXxbA8tfEaeBMbNB5Y9ryg9Aq3cPAidz3jkYE8sg
Message-ID: <CAAOTY_99Q5X+PurxQKewJRN4e=cxwMwX-6qzrZztOe5Eu2KuPg@mail.gmail.com>
Subject: Re: [PATCH v7 16/43] drm/mediatek: mtk_hdmi: Compress of_device_id
 array entries
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com, 
	simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	matthias.bgg@gmail.com, ck.hu@mediatek.com, jitao.shi@mediatek.com, 
	jie.qiu@mediatek.com, junzhi.zhao@mediatek.com, 
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com, 
	dmitry.baryshkov@linaro.org, lewis.liao@mediatek.com, 
	ives.chenjh@mediatek.com, tommyyl.chen@mediatek.com, 
	jason-jh.lin@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_141339_650390_FCBEB139 
X-CRM114-Status: GOOD (  15.09  )
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

Hi, Angelo:

AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com> =E6=96=
=BC
2025=E5=B9=B42=E6=9C=8817=E6=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=8811:=
49=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Compress the entries found in the of_device_id array to improve
> readability of this file and to make that consistent with other
> kernel drivers.

Applied to mediatek-drm-next [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_hdmi.c | 13 ++++---------
>  1 file changed, 4 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediat=
ek/mtk_hdmi.c
> index 1e50b3918069..be71105ba81d 100644
> --- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
> @@ -1780,15 +1780,10 @@ static const struct mtk_hdmi_conf mtk_hdmi_conf_m=
t8167 =3D {
>  };
>
>  static const struct of_device_id mtk_hdmi_of_ids[] =3D {
> -       { .compatible =3D "mediatek,mt2701-hdmi",
> -         .data =3D &mtk_hdmi_conf_mt2701,
> -       },
> -       { .compatible =3D "mediatek,mt8167-hdmi",
> -         .data =3D &mtk_hdmi_conf_mt8167,
> -       },
> -       { .compatible =3D "mediatek,mt8173-hdmi",
> -       },
> -       {}
> +       { .compatible =3D "mediatek,mt2701-hdmi", .data =3D &mtk_hdmi_con=
f_mt2701 },
> +       { .compatible =3D "mediatek,mt8167-hdmi", .data =3D &mtk_hdmi_con=
f_mt8167 },
> +       { .compatible =3D "mediatek,mt8173-hdmi" },
> +       { /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, mtk_hdmi_of_ids);
>
> --
> 2.48.1
>


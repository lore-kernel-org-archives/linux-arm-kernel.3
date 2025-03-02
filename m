Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47BB1C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Mar 2025 14:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Itn+Ar+lGNSxKUrAq1NsXY9lvQiFY5PLxtscnb2Id8A=; b=5GoMZrx816wWnDVpW8PqPVhvVQ
	XUhC78pxLW2NTa9bPYcxVFG301iO2VhIFBOu6k1VOnuenzqViLZA8wRF84OPMhFZJn2SO+L2tMpCW
	zES4pdYtALP8lWV0p619iBzyJy0kqoiDHvS27mmr3oz6a5pzE5EzyKUHSFtOE73RQD0wDMv2yYWD0
	47LmPXR9P0PUVdbg7r3bDyxXxYUENiTdFjew6iTytMxn8rTENwLafy8TFuqCYHJ9KHJ/nIoN8BoJF
	jiEJweA05rNXV2ubd8SJZbZTDAOrTML2ITuyjbnWFwqa/Fd9SliG3Ytgbkr/VOx6uyYtws1Wd5hJu
	h8B/VDLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tojxr-0000000G66x-1rPx;
	Sun, 02 Mar 2025 14:06:43 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tojwJ-0000000G5zd-0L0q;
	Sun, 02 Mar 2025 14:05:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id ADFBC5C55CD;
	Sun,  2 Mar 2025 14:02:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7854CC4AF09;
	Sun,  2 Mar 2025 14:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740924303;
	bh=ACEiqu9VyNmqiDL7jDGjoGE0f92hgXDBZVuSdlhL6c4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=feia/f3NOUJDjs0K1SnCGswU3g3gzbBeIKSDA/ChWT6xKyWlnHs1ayaXRl/uZKfAv
	 wf3u3MtYT+Es8Kmf5uUW5gxsZhrz5HH5MheS4CMuI4943Dk+vhGJg7dAoX3WQRKgWZ
	 pHmCZEgOmgahdTDdMoXMgwHs8uGJgCKF31NlvS52VP7Bcysu+9cElBpMmdccCjtITo
	 xPGo0TWs4hfxm/yXi5Gnt7wTCbMRgsgid/X+PUU+OfBIgeZEtlCOiE8OxvMhD8sEwz
	 3UmxWbsJuH8txJHlOLpFjk9S1oc5cpvU4U4jlLdceGdrCitabASCPgMyHcRWiU+dIF
	 EpUe0sHVWhSpg==
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2fea8d8c322so6443209a91.2;
        Sun, 02 Mar 2025 06:05:03 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU8qpXYyJ4GLoF2Wvmi85rfQlwzB4TNAoen5rEVn+C3Cbsk4tb691TUJA0XuiD8TZr8QK27k3eC16UQ4uGsES3e@lists.infradead.org, AJvYcCXPtHQKEo0HFM8E3sVTCZffN8wx9ngAfKmceilkvAUHeTt2Ft2bdi2ofFcoM1uz07fGtRF+npbKOnq4J4enbqY=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5iuQykMn3/UJVcKx0E66HH1x8hiva0jvHEpY+Ps1KxPzYtjA8
	0yJpNHTMc6veUSxfw3LUAvbhVtlTeUm4OPr+0GSSlwqY0JrjeSxPJ6/D6B21DvbFaRXfU765XmO
	RKY4vlOuWfqAE8UAS19sslDUG5g==
X-Google-Smtp-Source: AGHT+IG16EEdJJHvm6Oj64x4u72JISQwLPN9kfN5w5LtdjSW9aGHHuRsWNMb8JRAz2CRhaPVGvxVlY/s8nFADdCz3Og=
X-Received: by 2002:a17:90b:4fd0:b0:2ee:aed6:9ec2 with SMTP id
 98e67ed59e1d1-2febab5e11dmr17308029a91.14.1740924302962; Sun, 02 Mar 2025
 06:05:02 -0800 (PST)
MIME-Version: 1.0
References: <20250217154836.108895-1-angelogioacchino.delregno@collabora.com> <20250217154836.108895-10-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250217154836.108895-10-angelogioacchino.delregno@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 2 Mar 2025 22:05:50 +0800
X-Gmail-Original-Message-ID: <CAAOTY__zrRM9oyDtuDAzJ+ddOU2as2-vy9FkGs_Wzqjo_==RvA@mail.gmail.com>
X-Gm-Features: AQ5f1JoTySmTRsktldIsbqAg0MJ_QRQyHKP457TZ4jFIH5MH1bn0tYelMK9Vy-I
Message-ID: <CAAOTY__zrRM9oyDtuDAzJ+ddOU2as2-vy9FkGs_Wzqjo_==RvA@mail.gmail.com>
Subject: Re: [PATCH v7 09/43] drm/mediatek: mtk_dpi: Explicitly manage TVD
 clock in power on/off
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
X-CRM114-CacheID: sfid-20250302_060507_218938_3BD4E798 
X-CRM114-Status: GOOD (  17.71  )
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
> In preparation for adding support for MT8195's HDMI reserved
> DPI, add calls to clk_prepare_enable() / clk_disable_unprepare()
> for the TVD clock: in this particular case, the aforementioned
> clock is not (and cannot be) parented to neither pixel or engine
> clocks hence it won't get enabled automatically by the clock
> framework.
>
> Please note that on all of the currently supported MediaTek
> platforms, the TVD clock is always a parent of either pixel or
> engine clocks, and this means that the common clock framework
> is already enabling this clock before the children.
> On such platforms, this commit will only increase the refcount
> of the TVD clock without any functional change.

Applied to mediatek-drm-next [1], thanks.

[1] https://web.git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.=
git/log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dpi.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediate=
k/mtk_dpi.c
> index e12dc73ed79c..ee952785866c 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> @@ -499,6 +499,7 @@ static void mtk_dpi_power_off(struct mtk_dpi *dpi)
>
>         mtk_dpi_disable(dpi);
>         clk_disable_unprepare(dpi->pixel_clk);
> +       clk_disable_unprepare(dpi->tvd_clk);
>         clk_disable_unprepare(dpi->engine_clk);
>  }
>
> @@ -515,6 +516,12 @@ static int mtk_dpi_power_on(struct mtk_dpi *dpi)
>                 goto err_refcount;
>         }
>
> +       ret =3D clk_prepare_enable(dpi->tvd_clk);
> +       if (ret) {
> +               dev_err(dpi->dev, "Failed to enable tvd pll: %d\n", ret);
> +               goto err_engine;
> +       }
> +
>         ret =3D clk_prepare_enable(dpi->pixel_clk);
>         if (ret) {
>                 dev_err(dpi->dev, "Failed to enable pixel clock: %d\n", r=
et);
> @@ -524,6 +531,8 @@ static int mtk_dpi_power_on(struct mtk_dpi *dpi)
>         return 0;
>
>  err_pixel:
> +       clk_disable_unprepare(dpi->tvd_clk);
> +err_engine:
>         clk_disable_unprepare(dpi->engine_clk);
>  err_refcount:
>         dpi->refcount--;
> --
> 2.48.1
>


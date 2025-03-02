Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2D95C282C6
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Mar 2025 11:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ePuPcjctU3ceTk0aqaWCLX84CNfJhwXMMhVJDn4S81M=; b=ZzWdtXkOtsbs68y1fCsPQ6VCI5
	LJR+HLfWkm4589sN3IvLfl3k3HXOt395SpRxQsTLk/kkBf7EJOK+16ZGG9BBHRNR/GqTJXlkHujie
	r/QYIlv9MWy/rFI7guSo88l1AC2fP5zocOhtsemnBp0CYnV6+sPkvTSzOIZXB+kudlegKEzjNay7O
	uJx4/gIXFxbCuhQJs+tekbBL4BQAIC1KUQ1DPbMld5X7fwhwoT6OMd6p/pcu/5hk+b2s2oo1Bdplc
	4tZKkcXHIluxSJKW3j4Keu1gBuYbx+B/B+MuksjVJFpzgmPKDHPXEPPdJ5VAarBZWnVgNFa9Y7jSf
	Eo8Qrj1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tohWD-0000000FuhT-3sfL;
	Sun, 02 Mar 2025 11:30:01 +0000
Received: from tor.source.kernel.org ([2600:3c04::f03c:95ff:fe5e:7468])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tohUh-0000000FuaW-3djt;
	Sun, 02 Mar 2025 11:28:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 23570611C2;
	Sun,  2 Mar 2025 11:28:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78A12C4CEEA;
	Sun,  2 Mar 2025 11:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740914906;
	bh=FfIs5OJets3zRpgfLQ3jbMz9ChRage5kgf6KcUykEhU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=U96P/ECYfFdfEmY00MOBO8lZ+Re2UyFVUwKO2FS24Ejg/IjOxkhSQxI85PwyuRviQ
	 jw0j2xu1X4UgiqXdHaKaeY+WB59KjjmKegS5wg58lxuJJ5E8fzqUiNpdZvIKpTUoPt
	 k3C2zE36OFaTgLS6X+8u9ptYdZvnV8LwA0lFllsahA3DdYuI780zZegI+ES26PM9Cp
	 aPTAlRRUSRLwpbgud9El/r/9nvlCs5+SIOjc7KVF2ult/hqVOyGuWrSYEIAE3o3fuX
	 WjxzpNcwZp7GRhDa6LiFEskOX6XnCX9PZqL5n3W4xVVp4EQc7ENG5ApvielC2RCpzO
	 yu3zdNQvROmDg==
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2fea78afde5so4499339a91.2;
        Sun, 02 Mar 2025 03:28:26 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU3g5ri+u298nzidQCgJIBNhTNOrbozZFZWEk8IYe2AXZtjrTsGCCZISUslWS9Wz3tKaJsqP6FUVRJhhzgUHx0=@lists.infradead.org, AJvYcCXSYE7qgveEWSjdiTP13lw85FNLOmnJfi5UbkDRX61AL2AMfbyhXm8OwQtruPEZEp2Tx1WS54GVjId9Qr52goZu@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1ujGopYKz1XwwjG4bHyXU7Bn0qnhrGV4Ea5gGgQaScDtaLG2p
	wK1xMC/gopKtnDlZNaCbqoBNCXaxZki+OKh2U1TciZDcyYm6ypMuRPV3QC/D046IT0HuoNPrS86
	lzScHP37as7Xp8sgN+5vuMZ98LQ==
X-Google-Smtp-Source: AGHT+IFRC1P9usso4XTv7JMgu0fBHyNMS/JMJfbPzBZYNlk0eFKXHASNV5TbO4HnaJUruaY5STSEE7582brQlBGjZAA=
X-Received: by 2002:a17:90a:e703:b0:2f4:43ce:dcea with SMTP id
 98e67ed59e1d1-2febac0573fmr13699214a91.25.1740914906028; Sun, 02 Mar 2025
 03:28:26 -0800 (PST)
MIME-Version: 1.0
References: <20250217154836.108895-1-angelogioacchino.delregno@collabora.com> <20250217154836.108895-9-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250217154836.108895-9-angelogioacchino.delregno@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 2 Mar 2025 19:29:13 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8kxxaj+jum6CkJGHKrpjiX_cNt4FT345yET8GWR2QSFA@mail.gmail.com>
X-Gm-Features: AQ5f1JrqzU6s7sUO38hOT2IPnyssGJxMSyeRq4q2duHbl9tAb7DYvcalEylndsk
Message-ID: <CAAOTY_8kxxaj+jum6CkJGHKrpjiX_cNt4FT345yET8GWR2QSFA@mail.gmail.com>
Subject: Re: [PATCH v7 08/43] drm/mediatek: mtk_dpi: Support AFIFO 1T1P output
 and conversion
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
> On some SoCs, like MT8195 and MT8188, the DPI's FIFO controller
> (afifo) supports outputting either one or two pixels per round
> regardless of the input being 1T1P or 1T2P.
>
> Add a `output_1pixel` member to struct mtk_dpi_conf which, if
> set, will enable outputting one pixel per clock.
>
> In case the input is two pixel per clock (1T2P), the AFIFO HW
> will automatically (and internally) convert it to 1T1P.

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
>  drivers/gpu/drm/mediatek/mtk_dpi.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediate=
k/mtk_dpi.c
> index 9f83e82437dd..e12dc73ed79c 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> @@ -147,6 +147,8 @@ struct mtk_dpi_factor {
>   * @edge_cfg_in_mmsys: If the edge configuration for DPI's output needs =
to be set in MMSYS.
>   * @clocked_by_hdmi: HDMI IP outputs clock to dpi_pixel_clk input clock,=
 needed
>   *                  for DPI registers access.
> + * @output_1pixel: Enable outputting one pixel per round; if the input i=
s two pixel per
> + *                 round, the DPI hardware will internally transform it =
to 1T1P.
>   */
>  struct mtk_dpi_conf {
>         const struct mtk_dpi_factor *dpi_factor;
> @@ -168,6 +170,7 @@ struct mtk_dpi_conf {
>         u32 pixels_per_iter;
>         bool edge_cfg_in_mmsys;
>         bool clocked_by_hdmi;
> +       bool output_1pixel;
>  };
>
>  static void mtk_dpi_mask(struct mtk_dpi *dpi, u32 offset, u32 val, u32 m=
ask)
> @@ -653,7 +656,13 @@ static int mtk_dpi_set_display_mode(struct mtk_dpi *=
dpi,
>         if (dpi->conf->support_direct_pin) {
>                 mtk_dpi_config_yc_map(dpi, dpi->yc_map);
>                 mtk_dpi_config_2n_h_fre(dpi);
> -               mtk_dpi_dual_edge(dpi);
> +
> +               /* DPI can connect to either an external bridge or the in=
ternal HDMI encoder */
> +               if (dpi->conf->output_1pixel)
> +                       mtk_dpi_mask(dpi, DPI_CON, DPI_OUTPUT_1T1P_EN, DP=
I_OUTPUT_1T1P_EN);
> +               else
> +                       mtk_dpi_dual_edge(dpi);
> +
>                 mtk_dpi_config_disable_edge(dpi);
>         }
>         if (dpi->conf->input_2p_en_bit) {
> --
> 2.48.1
>


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36ED7C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Mar 2025 11:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iK/y6R2rqlOnWMEb9BA0sLW7ePdxt9g0xG6aNqcIFic=; b=WYoNMO1W7QElWyfL03MZ9ckD9x
	zvloJRMIMi2T3w/hIlALqIz0kBG4Aihr0fX0iDD+hRgJ1hY0v70k/zAbGX0JOhYzEujIS3U1RCZyq
	0tZxkF4lb5Ljv2BAYJbhDsQZ+BP8dvT70xHofnM1joo2KVNTybHF7OmLDGYUBNI7/NeQAoXP0feF1
	b1h8mwgw/+49XcJLpIs7ZPkwRnNYCa3i+1c85KuSVaUa9aN6QfSAv+NTxNr4dkybR5wxsmpCURlUP
	/TayqxBkAdyhiiuADpEv8WANmzbuaNzVR7WS2pEK5FqKe7vFiWhiUtMOgvNZhLXYS+kEsDtxp84b3
	UyEAxuWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tohC8-0000000Fstn-0tb9;
	Sun, 02 Mar 2025 11:09:16 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tohAJ-0000000FsiT-3IUa;
	Sun, 02 Mar 2025 11:07:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D69F05C5577;
	Sun,  2 Mar 2025 11:05:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05808C4CEED;
	Sun,  2 Mar 2025 11:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740913642;
	bh=3KC5ipDcjMMPu+IkC8vu+yztuxCxRp2YBcH3qbhnh3o=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=IKOhVmSzFw3Sf2YmjeuKFwjqdYb6is2Gc4m/SbzrvuS12TN1hehDf+fPSBxH52SUb
	 RWKVlhEIIhQVctA7XYc+z8DfiiPxRbIshjYlUvKYKyVbuhGGSZz3tvcargZc1kRqI8
	 1SWwvn3IjCnBXW7oQ67PkvvCcjMluXwoy+AtgnyjxKNCEheeNMP1HMs6U4/BYJ04Q2
	 5nTxlUHtt8vMwPOOQClOOlbYyYjUyDK/qZiMOsD+vjvggZ71hT4f6boqpoXaQvBGMO
	 Vw29T147PssSVHd+yToJkMe0DY/acwVRHdqXQxnlUU5EhHu4af0quk176ECPMXstAF
	 fUiHsCWRN0zJg==
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2fe848040b1so7398120a91.3;
        Sun, 02 Mar 2025 03:07:22 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUrCmzPFZEZTQXYaW0fNoiZqnV5Zs/z9eIxCfOxFpLvRcpi3b40xbD7qte/5KvkdZNcchq6OeFfSjqywYULmP8=@lists.infradead.org, AJvYcCWCA+liF3IJsxKI/RgCw1294L4adxVDxspC1Z/mQiW9/Zmj66d47ZcincuGrpB5A9sUWAaX28hvBFdjRmytTsPh@lists.infradead.org
X-Gm-Message-State: AOJu0YzN0u9QcRYXByugjB4Fl47yM8I4zCHE6/K9GKgUt/jHfodUrdkQ
	7DhWf64sluwjMXvIZKeorNxOPG0SxORy92CZgF4WIeZDFQ2WhmleRjCMpRmn0N62YvWp79y5AbS
	qwwYi8OIT9BjbxW1kJBkToDw9iQ==
X-Google-Smtp-Source: AGHT+IH01Pb+Acrlm17K+9SKFrPTyC3svpmtUZZOMamUnprzp62lYR8CKSAPg6EiKdHhDLfl4WwIpNFLts/zm0G5jQ8=
X-Received: by 2002:a17:90b:554f:b0:2ea:712d:9a82 with SMTP id
 98e67ed59e1d1-2febabf8577mr14667145a91.29.1740913641527; Sun, 02 Mar 2025
 03:07:21 -0800 (PST)
MIME-Version: 1.0
References: <20250217154836.108895-1-angelogioacchino.delregno@collabora.com> <20250217154836.108895-5-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250217154836.108895-5-angelogioacchino.delregno@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 2 Mar 2025 19:08:08 +0800
X-Gmail-Original-Message-ID: <CAAOTY__DqCA3+-nsi7+svqHTbjdpTU5+8yDqWwNMnU8V=euQbQ@mail.gmail.com>
X-Gm-Features: AQ5f1JoGUFVsLmWfEOgrfpxwZh3naxz8ITQIPQgo0omrUXo2qHRWobPGb5JPDMg
Message-ID: <CAAOTY__DqCA3+-nsi7+svqHTbjdpTU5+8yDqWwNMnU8V=euQbQ@mail.gmail.com>
Subject: Re: [PATCH v7 04/43] drm/mediatek: mtk_dpi: Move pixel clock setting
 flow to function
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
X-CRM114-CacheID: sfid-20250302_030723_941507_48243053 
X-CRM114-Status: GOOD (  19.89  )
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
> In preparation for adding support for the DPI IP found in MT8195
> and in MT8188 used for HDMI, move the code flow for calculation
> and setting of the DPI pixel clock to a separate function called
> mtk_dpi_set_pixel_clk().
>
> This was done because, on those platforms, the DPI instance that
> is used for HDMI will get its pixel clock from the HDMI clock,
> hence it is not necessary, nor desirable, to calculate or set
> the pixel clock in DPI.

After fix conflicts, applied to mediatek-drm-next [1], thanks.

[1] https://web.git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.=
git/log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dpi.c | 43 +++++++++++++++++-------------
>  1 file changed, 24 insertions(+), 19 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediate=
k/mtk_dpi.c
> index 41fdc193891a..59c2e4f32a61 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> @@ -537,26 +537,17 @@ static unsigned int mtk_dpi_calculate_factor(struct=
 mtk_dpi *dpi, int mode_clk)
>         return dpi_factor[dpi->conf->num_dpi_factor - 1].factor;
>  }
>
> -static int mtk_dpi_set_display_mode(struct mtk_dpi *dpi,
> -                                   struct drm_display_mode *mode)
> +static void mtk_dpi_set_pixel_clk(struct mtk_dpi *dpi, struct videomode =
*vm, int mode_clk)
>  {
> -       struct mtk_dpi_polarities dpi_pol;
> -       struct mtk_dpi_sync_param hsync;
> -       struct mtk_dpi_sync_param vsync_lodd =3D { 0 };
> -       struct mtk_dpi_sync_param vsync_leven =3D { 0 };
> -       struct mtk_dpi_sync_param vsync_rodd =3D { 0 };
> -       struct mtk_dpi_sync_param vsync_reven =3D { 0 };
> -       struct videomode vm =3D { 0 };
>         unsigned long pll_rate;
>         unsigned int factor;
>
>         /* let pll_rate can fix the valid range of tvdpll (1G~2GHz) */
>         factor =3D mtk_dpi_calculate_factor(dpi, mode_clk);
> -       drm_display_mode_to_videomode(mode, &vm);
> -       pll_rate =3D vm.pixelclock * factor;
> +       pll_rate =3D vm->pixelclock * factor;
>
>         dev_dbg(dpi->dev, "Want PLL %lu Hz, pixel clock %lu Hz\n",
> -               pll_rate, vm.pixelclock);
> +               pll_rate, vm->pixelclock);
>
>         clk_set_rate(dpi->tvd_clk, pll_rate);
>         pll_rate =3D clk_get_rate(dpi->tvd_clk);
> @@ -566,20 +557,34 @@ static int mtk_dpi_set_display_mode(struct mtk_dpi =
*dpi,
>          * pixels for each iteration: divide the clock by this number and
>          * adjust the display porches accordingly.
>          */
> -       vm.pixelclock =3D pll_rate / factor;
> -       vm.pixelclock /=3D dpi->conf->pixels_per_iter;
> +       vm->pixelclock =3D pll_rate / factor;
> +       vm->pixelclock /=3D dpi->conf->pixels_per_iter;
>
>         if ((dpi->output_fmt =3D=3D MEDIA_BUS_FMT_RGB888_2X12_LE) ||
>             (dpi->output_fmt =3D=3D MEDIA_BUS_FMT_RGB888_2X12_BE))
> -               clk_set_rate(dpi->pixel_clk, vm.pixelclock * 2);
> +               clk_set_rate(dpi->pixel_clk, vm->pixelclock * 2);
>         else
> -               clk_set_rate(dpi->pixel_clk, vm.pixelclock);
> +               clk_set_rate(dpi->pixel_clk, vm->pixelclock);
>
> -
> -       vm.pixelclock =3D clk_get_rate(dpi->pixel_clk);
> +       vm->pixelclock =3D clk_get_rate(dpi->pixel_clk);
>
>         dev_dbg(dpi->dev, "Got  PLL %lu Hz, pixel clock %lu Hz\n",
> -               pll_rate, vm.pixelclock);
> +               pll_rate, vm->pixelclock);
> +}
> +
> +static int mtk_dpi_set_display_mode(struct mtk_dpi *dpi,
> +                                   struct drm_display_mode *mode)
> +{
> +       struct mtk_dpi_polarities dpi_pol;
> +       struct mtk_dpi_sync_param hsync;
> +       struct mtk_dpi_sync_param vsync_lodd =3D { 0 };
> +       struct mtk_dpi_sync_param vsync_leven =3D { 0 };
> +       struct mtk_dpi_sync_param vsync_rodd =3D { 0 };
> +       struct mtk_dpi_sync_param vsync_reven =3D { 0 };
> +       struct videomode vm =3D { 0 };
> +
> +       drm_display_mode_to_videomode(mode, &vm);
> +       mtk_dpi_set_pixel_clk(dpi, &vm, mode->clock);
>
>         dpi_pol.ck_pol =3D MTK_DPI_POLARITY_FALLING;
>         dpi_pol.de_pol =3D MTK_DPI_POLARITY_RISING;
> --
> 2.48.1
>


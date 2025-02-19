Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67D64C021B0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 14:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SMq2eFU6Ljg+Zxne9quqU1lbGCJjE+HBi81N+5bjRks=; b=Ul1SFPVjGoeWXb21Aw+asepfUc
	6s13DwJgEhDRLXM5tGmi9GqPzjrHKVlQWQ0mg0wX+itpeVBL4xWBBqON3LnBzMxGZyQZ9possrA33
	GH6KDqp7dCtlXMnDeS6rdmu8Vh6pAwJm3kb0Rewe6wjp0UoK1EnaCvHf0aIqxin8i67xmbC1uLNdw
	YSlEATjqN/KxoGf5Zcqx85te00sJZxg2MCredS/bCbIHjDy+tiuEVlLSFw+QjdqSsBkqsiooOudl+
	l6CAxTZH2gJvK3XubLGECNliOVG45sHAgpCDVlTXDKX/BlgA3DP/Jb0Ah6/zII+Ye4JtN36ccXV2P
	ENXCU8tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkkea-0000000D8Sp-09O8;
	Wed, 19 Feb 2025 14:02:20 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkkd5-0000000D7yo-3JkY;
	Wed, 19 Feb 2025 14:00:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0C9025C59A6;
	Wed, 19 Feb 2025 14:00:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97789C4CEEA;
	Wed, 19 Feb 2025 14:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739973646;
	bh=vEn5X9s0X03RZNsX/FehVn8bFO/GVsoqwmgLAKeThTI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Zi+Bfg1RQd+Lf4yEh810Okdlgu/zmfqteq1iKlGjV9u6OXEOJYhII6NBAn/0gE3Ko
	 Tp+I7eItZ1itdf1igTj06pEtoiaNFTC9GdT7liBCY4EcBlQqGN86HY55MJ8vC4tN4M
	 NxB/NzKIgvkECDBDfxMfrRAi7cmnW27+ZG3qRhWiwtBm0W7wcL6HxQg3E+eQQsbbwh
	 LlFBXQwsdwum316iPRaOS5tvYqQCvlaancOvovw8ETCIOeXpm6CbYF3bo5BhoYcbqk
	 oLAIJn87TSOQKwLfHisNbXuZYeUDcF9jaWTtPO6iIezEpSh5/+hNrisapP0/MshpnS
	 bImhpaceohLZg==
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2f9d3d0f55dso9708861a91.1;
        Wed, 19 Feb 2025 06:00:46 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUiW/Yh0MF2CcNhGHIPRvM5c3tylEbASphy8GP+am5lrTiTom8oTSpnkgYOfJ4Rtw1JraWtW0djkBrYRyOG6Xs=@lists.infradead.org, AJvYcCVvkMUcKVm9SVUX164mlSHdcfiQkswz3y6tBvOn2F82ivl3+CgpordJw6s1xf+6HMP4D3pkJ4JWh+DElJ7k9AW3@lists.infradead.org
X-Gm-Message-State: AOJu0YxmBBreQINR5nKt2UB7aGdn9bfhoiNFUaI6FAX6wli3rw2wIW6l
	O0rhHaEl41pJxShR3pkUmY6juoEZqhuY8dxZniV3BmchcIYRmOwNQ8EbwIzyzUXk58V8rr/8Rbc
	DXOJ9z85qKK9M/kQ9tDEsAUMbMQ==
X-Google-Smtp-Source: AGHT+IHRoKXGmXM1paDFNeCBXkKPPbaMW6fIKItj9hAqnwjEMJdKy4fDjEc43FMEaHHNLq0oBSEC7WyHzl/u9EJNtqg=
X-Received: by 2002:a17:90b:1a89:b0:2ee:c2b5:97a0 with SMTP id
 98e67ed59e1d1-2fcb5a9db51mr5836056a91.25.1739973646106; Wed, 19 Feb 2025
 06:00:46 -0800 (PST)
MIME-Version: 1.0
References: <20250217154836.108895-1-angelogioacchino.delregno@collabora.com> <20250217154836.108895-18-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250217154836.108895-18-angelogioacchino.delregno@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 19 Feb 2025 22:01:30 +0800
X-Gmail-Original-Message-ID: <CAAOTY__d2A6BiegTqX+eXAk5LYAtRexnwLvkbje94ax05jOMug@mail.gmail.com>
X-Gm-Features: AWEUYZn3pFp_1IYzIW4DyIvJ63JD27HTlx-6jN1bSkLAtPngd4i98FCr_lIubC4
Message-ID: <CAAOTY__d2A6BiegTqX+eXAk5LYAtRexnwLvkbje94ax05jOMug@mail.gmail.com>
Subject: Re: [PATCH v7 17/43] drm/mediatek: mtk_hdmi: Unregister audio
 platform device on failure
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
X-CRM114-CacheID: sfid-20250219_060047_913216_3C198AC8 
X-CRM114-Status: GOOD (  24.44  )
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
> The probe function of this driver may fail after registering the
> audio platform device: in that case, the state is not getting
> cleaned up, leaving this device registered.
>
> Adding up to the mix, should the probe function of this driver
> return a probe deferral for N times, we're registering up to N
> audio platform devices and, again, never freeing them up.
>
> To fix this, add a pointer to the audio platform device in the
> mtk_hdmi structure, and add a devm action to unregister it upon
> driver removal or probe failure.

Applied to mediatek-drm-next [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

>
> Fixes: 8f83f26891e1 ("drm/mediatek: Add HDMI support")
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_hdmi.c | 25 +++++++++++++++++++------
>  1 file changed, 19 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediat=
ek/mtk_hdmi.c
> index be71105ba81d..b9f4f06edde6 100644
> --- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
> @@ -172,6 +172,7 @@ struct mtk_hdmi {
>         unsigned int sys_offset;
>         void __iomem *regs;
>         enum hdmi_colorspace csp;
> +       struct platform_device *audio_pdev;
>         struct hdmi_audio_param aud_param;
>         bool audio_enable;
>         bool powered;
> @@ -1661,6 +1662,11 @@ static const struct hdmi_codec_ops mtk_hdmi_audio_=
codec_ops =3D {
>         .hook_plugged_cb =3D mtk_hdmi_audio_hook_plugged_cb,
>  };
>
> +static void mtk_hdmi_unregister_audio_driver(void *data)
> +{
> +       platform_device_unregister(data);
> +}
> +
>  static int mtk_hdmi_register_audio_driver(struct device *dev)
>  {
>         struct mtk_hdmi *hdmi =3D dev_get_drvdata(dev);
> @@ -1671,13 +1677,20 @@ static int mtk_hdmi_register_audio_driver(struct =
device *dev)
>                 .data =3D hdmi,
>                 .no_capture_mute =3D 1,
>         };
> -       struct platform_device *pdev;
> +       int ret;
>
> -       pdev =3D platform_device_register_data(dev, HDMI_CODEC_DRV_NAME,
> -                                            PLATFORM_DEVID_AUTO, &codec_=
data,
> -                                            sizeof(codec_data));
> -       if (IS_ERR(pdev))
> -               return PTR_ERR(pdev);
> +       hdmi->audio_pdev =3D platform_device_register_data(dev,
> +                                                        HDMI_CODEC_DRV_N=
AME,
> +                                                        PLATFORM_DEVID_A=
UTO,
> +                                                        &codec_data,
> +                                                        sizeof(codec_dat=
a));
> +       if (IS_ERR(hdmi->audio_pdev))
> +               return PTR_ERR(hdmi->audio_pdev);
> +
> +       ret =3D devm_add_action_or_reset(dev, mtk_hdmi_unregister_audio_d=
river,
> +                                      hdmi->audio_pdev);
> +       if (ret)
> +               return ret;
>
>         DRM_INFO("%s driver bound to HDMI\n", HDMI_CODEC_DRV_NAME);
>         return 0;
> --
> 2.48.1
>


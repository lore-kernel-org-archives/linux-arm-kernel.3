Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4316D606A326
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 03:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EmK0A9lK;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wIXgh/lP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=w32LmgqDCV1eew1K0IjeecQXsQlnn48/GdAJChQRoV0=; b=EmK0A9lKuezuh7
	WjHGWpezz49OpY7TinFgvTFZybkRF7Y3JxlV+5UrY3LhLlqGKKJh/9ZPpg0CLCzOLZyLT7TG1sJfE
	uL2Wmn6MnxqaN3jlP0c3Wjss8n1f9ul+MNzrKL4muGfkryKsSvidZS4KqKkfvKvrx/u28+C/BEYhg
	wVfPN0bJQMTzJiNgLv8CudeBU39GqWKyLzKdc/TS6wgQWxiZjjzQe+ZBdMoYhFcH/CbuL0hEHmTXo
	o2xCLRHD+jS4L74ox0sSEcrQIFAi+L1MkKKUnzmMVj6zGZWv6h2xz9wydmIaeAA7lLFdwZxK3d95e
	17B/teUf5pRvxldB3KkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPAX7-0000000B9TU-3LA3;
	Fri, 06 Nov 2026 03:22:29 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPAX5-0000000B9T9-1zTo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 03:22:28 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-cd62c570b5dso99200a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 19:22:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793935346; cv=none;
        d=google.com; s=arc-20260327;
        b=LVnJAg4Vr4VYQDphaVuy9hEAAqiEmcTfZvuRqbhC2JZ20f0IphwEE4Shir5SQmxMK9
         2UHxctVsO49A7BNhbYIVLygaQkGebQFjds5QyZJeAhtindkxr86pIAHnK0VRgf5Sa65d
         rdoPdlsixAm6xqAcYNLcneQu6ydENGFnFyAegF868owjfHfoxQVeYvFP67wJ52kC5/he
         eq4RCQUj/31P4Hj79WtqkHQZA09INkByY3rteseEkWjBAhYrsvBuVGu5h7R+GNbgX+x/
         VV3li90xobjBnSgwoyz9M5iS/qdhSnBeHkSijoi19k+N77n29I0zzB8aZJ7RphaE8tfI
         cvIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=w32LmgqDCV1eew1K0IjeecQXsQlnn48/GdAJChQRoV0=;
        fh=GRD1hWcSe3T7zr0Fi5ERZHpMsFh9NTvYBSQwH+Uvu9c=;
        b=Cmj2ITW96BsAqxmZzf1O8idwO1oTkOq1l+r0X4qSq5FodI0qJkrYLu+VVtvNX8aKja
         Fky1ebOPCVV/RFroAHGX5MYCuqsfrLD2MU+JpIEhSwdu4Gg49jHlOFAUtLIjddDluaoj
         nPjpY+vOVrkfZCFzIuVldBt+9tnIdqVA2+dgDY8ICT+B+nsseownfTu8ydOd4yTKWFT/
         RTlb1NzRbABGZhWaXUclTzzJS0dyWHhDv2GPEtjVOjIqGxKUjU3GfDkyKb0ee1pe5s1n
         D6p3nd8BN9HIpL34pivgdzxsskSSgIVXOT52Gq1QEzrpInJ16+6FwRllm8WjhmbWqELH
         3VMg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793935346; x=1794540146; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=w32LmgqDCV1eew1K0IjeecQXsQlnn48/GdAJChQRoV0=;
        b=wIXgh/lPK7EiI87BX2sjkzAuGofEhG5A9iiRCvb2u+8zxtt+ygxqirBJz8FGn2Qfm2
         IlgnYKn20hICxhTFWSsMOgNZA9pJWv0dUczRKjZ2n+TT5VR723GO2WK76HY9CICasQuB
         rsrtH+znRPWnqwKqCORrZcOKx4DZoD839Q41ui/Yn3L1NDHmPDQCjGJcjuBuorRjJ01J
         LBXUSg3t3yArxSafYSdPPoGN6qA0C5mqga6echPb2PeCfHwbzVWUeyyjrPIzSzpzjxfU
         wrpSQtMkCmeUNdlTfpk+QVeNSSnPy4Qt+4GfVUv9t/SD/ZgYRpeKEz+qnSQRmP5WHDOh
         BhGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793935346; x=1794540146;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w32LmgqDCV1eew1K0IjeecQXsQlnn48/GdAJChQRoV0=;
        b=mf3Qa+xvcJlQEBndUWiCJiUChfNNcJLZlRzfun31c0Qx6RHcCNaqGCQ+iErZYqLYNQ
         oGY3segFhEfyLoxiler484ONsnQzgQ3HhFaavwEZ19yCWw2gnLi9/7Ij/tjbwZoFdUt/
         C4lo7GbwthhSK1DZ8QXUKzZ/i3jRzVzsavwFvKsOUENgAc4BzG/pFAsZCYJQdBSsoLNq
         8Ifkh2PfgzYxiL5Ys+S7C7mlUeCnCwKDHMX0da087MVngO8A+zKlzlsp+OTLOxGsGsAc
         sGq+rA37JYPNaStgXFCiRxbkMu0JLChuoDk0zI9jyWrt08HJB7SMTf+iYIvqOi7SrSzB
         MGYQ==
X-Forwarded-Encrypted: i=1; AL+hErEmWcG4BMpzZee20ZzkW61BwAZ6+2f8XA8kxFwdtByCu2SCYTmgq+stXuKEkGXINIj0/DgtokqMQml8d9B7d15d@lists.infradead.org
X-Gm-Message-State: APuU4Z+g00EYB29wP3XqqVT+KZ91QUM4nO2xxzrWV+0ovAYOu696DB+t
	TZeeymc9NOqwt+Xn1BEHjC0w1vJuQHw4nv4YnA5tT52T6Ux7tJKbg+trcQwSgOO8cIlpHPKEjdw
	eFTI3Dr6KIBhUUGR2WkAi2w0j0E3/mBU=
X-Gm-Gg: AYBFou0IiIhCjwPMrrluhLkMD76Wm8UjixIPrqte4z9c/Q0zn1tbqYJL39mwNBrj9cQ
	q9anoI+BC9a+/uymRx3SYP+zD/tCviG7/NNZgXXheIoAnERWosuDIfUBqnR9eE+xh+TNHZC5Tij
	6LjHoNfz9sFtYXr+OWNBJ3YgsyAvnf9Bj2Rf8SpmKQV52+HMDGDz3Hh+LNzQYJmP36YJpr5P5qQ
	DxyhXDfWYdLhoBdmmm8edFUs+SbFDjytlBJ0Pyj6PF5r1wjfFRcusE9rz6rRntYMzXDSk+T44RU
	IwJNNBb58jzBFK51KuLKAzn0tXnwMcDmNB8pnmPr/a4f40q/W7qQq17wneDQdN95+DZbW6UDNjY
	MZv7LHE2Xs+eCbeYAXxhtBrY0ek7Itk8TVEod
X-Received: by 2002:a17:90b:4983:b0:3ac:9d26:551d with SMTP id
 98e67ed59e1d1-3b0db6f11f7mr1320600a91.50.1793935346215; Thu, 05 Nov 2026
 19:22:26 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261102180915.3981805-1-Frank.Li@oss.nxp.com>
In-Reply-To: <20261102180915.3981805-1-Frank.Li@oss.nxp.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 6 Nov 2026 11:21:57 +0800
X-Gm-Features: AclHuK-h3hDpTZTCQrDXlURnXU4dNiye78ZL33OWRSh0a0w-nnzOWFYn2sw0Q-0
Message-ID: <CAA+D8ANwEqFJYQ39h+1A3zXhcUfpFGzSvVjEzx2htoYxB4sLGg@mail.gmail.com>
Subject: Re: [PATCH 1/1] ASoC/sound: use dmaengine_desc_set_callback()
To: Frank.Li@oss.nxp.com
Cc: Lars-Peter Clausen <lars@metafoo.de>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>, 
	Nicolin Chen <nicoleotsuka@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Chunyan Zhang <zhang.lyra@gmail.com>, Olivier Moysan <olivier.moysan@foss.st.com>, 
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Kexin Sun <kexinsun@smail.nju.edu.cn>, 
	Frank Li <Frank.Li@nxp.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Tianchu Chen <flynnnchen@tencent.com>, Liviu Dudau <liviu.dudau@arm.com>, 
	bui duc phuc <phucduc.bui@gmail.com>, Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, 
	"open list:SOUND" <linux-sound@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	"open list:FREESCALE SOC SOUND DRIVERS" <linuxppc-dev@lists.ozlabs.org>, 
	"open list:RENESAS R-CAR & FSI AUDIO (ASoC) DRIVERS" <linux-renesas-soc@vger.kernel.org>, 
	"moderated list:ARM/STM32 ARCHITECTURE" <linux-stm32@st-md-mailman.stormreply.com>, 
	"moderated list:ARM/STM32 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, imx@lists.linux.dev, 
	vkoul@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_192227_545336_E35BC0F0 
X-CRM114-Status: GOOD (  19.47  )
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
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 3, 2026 at 2:09=E2=80=AFAM <Frank.Li@oss.nxp.com> wrote:
>
> From: Frank Li <Frank.Li@nxp.com>
>
> Replace open-coded assignments to callback and callback_param fields
> of struct dma_async_tx_descriptor with calls to the
> dmaengine_desc_set_callback() helper across sound drivers.
>
> No functional change intended. Prepare to make struct
> dma_async_tx_descriptor private to the DMA engine.
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

For fsl part
Acked-by: Shengjiu Wang <shengjiu.wang@gmail.com>

Best regards
Shengjiu Wang
> ---
>  sound/core/pcm_dmaengine.c         | 3 +--
>  sound/soc/fsl/fsl_asrc_dma.c       | 3 +--
>  sound/soc/fsl/fsl_asrc_m2m.c       | 3 +--
>  sound/soc/renesas/fsi.c            | 3 +--
>  sound/soc/renesas/siu_pcm.c        | 6 ++----
>  sound/soc/sprd/sprd-pcm-compress.c | 5 +++--
>  sound/soc/sprd/sprd-pcm-dma.c      | 5 +++--
>  sound/soc/stm/stm32_spdifrx.c      | 3 +--
>  8 files changed, 13 insertions(+), 18 deletions(-)
>
> diff --git a/sound/core/pcm_dmaengine.c b/sound/core/pcm_dmaengine.c
> index 1306b04be171a..41feb5312ffec 100644
> --- a/sound/core/pcm_dmaengine.c
> +++ b/sound/core/pcm_dmaengine.c
> @@ -169,8 +169,7 @@ static int dmaengine_pcm_prepare_and_submit(struct sn=
d_pcm_substream *substream)
>         if (!desc)
>                 return -ENOMEM;
>
> -       desc->callback =3D dmaengine_pcm_dma_complete;
> -       desc->callback_param =3D substream;
> +       dmaengine_desc_set_callback(desc, dmaengine_pcm_dma_complete, NUL=
L, substream);
>         prtd->cookie =3D dmaengine_submit(desc);
>
>         return 0;
> diff --git a/sound/soc/fsl/fsl_asrc_dma.c b/sound/soc/fsl/fsl_asrc_dma.c
> index b417de6abebe4..cd3bf6340b650 100644
> --- a/sound/soc/fsl/fsl_asrc_dma.c
> +++ b/sound/soc/fsl/fsl_asrc_dma.c
> @@ -76,8 +76,7 @@ static int fsl_asrc_dma_prepare_and_submit(struct snd_p=
cm_substream *substream,
>                 return -ENOMEM;
>         }
>
> -       pair->desc[!dir]->callback =3D fsl_asrc_dma_complete;
> -       pair->desc[!dir]->callback_param =3D substream;
> +       dmaengine_desc_set_callback(pair->desc[!dir], fsl_asrc_dma_comple=
te, NULL, substream);
>
>         dmaengine_submit(pair->desc[!dir]);
>
> diff --git a/sound/soc/fsl/fsl_asrc_m2m.c b/sound/soc/fsl/fsl_asrc_m2m.c
> index 58101ce07c9f9..c6970a7e88f3f 100644
> --- a/sound/soc/fsl/fsl_asrc_m2m.c
> +++ b/sound/soc/fsl/fsl_asrc_m2m.c
> @@ -176,8 +176,7 @@ static int asrc_dmaconfig(struct fsl_asrc_pair *pair,
>                 return -EINVAL;
>         }
>
> -       pair->desc[dir]->callback =3D ASRC_xPUT_DMA_CALLBACK(dir);
> -       pair->desc[dir]->callback_param =3D pair;
> +       dmaengine_desc_set_callback(pair->desc[dir], ASRC_xPUT_DMA_CALLBA=
CK(dir), NULL, pair);
>
>         return 0;
>  }
> diff --git a/sound/soc/renesas/fsi.c b/sound/soc/renesas/fsi.c
> index 74e2ea002fbb1..fa21cf47befff 100644
> --- a/sound/soc/renesas/fsi.c
> +++ b/sound/soc/renesas/fsi.c
> @@ -1375,8 +1375,7 @@ static int fsi_dma_transfer(struct fsi_priv *fsi, s=
truct fsi_stream *io)
>                 goto fsi_dma_transfer_err;
>         }
>
> -       desc->callback          =3D fsi_dma_complete;
> -       desc->callback_param    =3D io;
> +       dmaengine_desc_set_callback(desc, fsi_dma_complete, NULL, io);
>
>         if (dmaengine_submit(desc) < 0) {
>                 dev_err(dai->dev, "tx_submit() fail\n");
> diff --git a/sound/soc/renesas/siu_pcm.c b/sound/soc/renesas/siu_pcm.c
> index fd5b20b469a4a..7208514e16a43 100644
> --- a/sound/soc/renesas/siu_pcm.c
> +++ b/sound/soc/renesas/siu_pcm.c
> @@ -125,8 +125,7 @@ static int siu_pcm_wr_set(struct siu_port *port_info,
>                 return -ENOMEM;
>         }
>
> -       desc->callback =3D siu_dma_tx_complete;
> -       desc->callback_param =3D siu_stream;
> +       dmaengine_desc_set_callback(desc, siu_dma_tx_complete, NULL, siu_=
stream);
>         cookie =3D dmaengine_submit(desc);
>         if (cookie < 0) {
>                 dev_err(dev, "Failed to submit a dma transfer\n");
> @@ -175,8 +174,7 @@ static int siu_pcm_rd_set(struct siu_port *port_info,
>                 return -ENOMEM;
>         }
>
> -       desc->callback =3D siu_dma_tx_complete;
> -       desc->callback_param =3D siu_stream;
> +       dmaengine_desc_set_callback(desc, siu_dma_tx_complete, NULL, siu_=
stream);
>         cookie =3D dmaengine_submit(desc);
>         if (cookie < 0) {
>                 dev_err(dev, "Failed to submit dma descriptor\n");
> diff --git a/sound/soc/sprd/sprd-pcm-compress.c b/sound/soc/sprd/sprd-pcm=
-compress.c
> index f790b959cd4e4..a810c9c8a0b5b 100644
> --- a/sound/soc/sprd/sprd-pcm-compress.c
> +++ b/sound/soc/sprd/sprd-pcm-compress.c
> @@ -247,8 +247,9 @@ static int sprd_platform_compr_dma_config(struct snd_=
soc_component *component,
>
>         /* Only channel 1 transfer can wake up the AP system. */
>         if (!params->no_wake_mode && channel =3D=3D 1) {
> -               dma->desc->callback =3D sprd_platform_compr_dma_complete;
> -               dma->desc->callback_param =3D cstream;
> +               dmaengine_desc_set_callback(dma->desc,
> +                                           sprd_platform_compr_dma_compl=
ete,
> +                                           NULL, cstream);
>         }
>
>         kfree(sg);
> diff --git a/sound/soc/sprd/sprd-pcm-dma.c b/sound/soc/sprd/sprd-pcm-dma.=
c
> index bbd7516f81954..968901ae4c335 100644
> --- a/sound/soc/sprd/sprd-pcm-dma.c
> +++ b/sound/soc/sprd/sprd-pcm-dma.c
> @@ -287,8 +287,9 @@ static int sprd_pcm_hw_params(struct snd_soc_componen=
t *component,
>                 }
>
>                 if (!runtime->no_period_wakeup) {
> -                       data->desc->callback =3D sprd_pcm_dma_complete;
> -                       data->desc->callback_param =3D dma_private;
> +                       dmaengine_desc_set_callback(data->desc,
> +                                                   sprd_pcm_dma_complete=
,
> +                                                   NULL, dma_private);
>                 }
>         }
>
> diff --git a/sound/soc/stm/stm32_spdifrx.c b/sound/soc/stm/stm32_spdifrx.=
c
> index 88863dbd05d9b..44467a25fb69a 100644
> --- a/sound/soc/stm/stm32_spdifrx.c
> +++ b/sound/soc/stm/stm32_spdifrx.c
> @@ -302,8 +302,7 @@ static int stm32_spdifrx_dma_ctrl_start(struct stm32_=
spdifrx_data *spdifrx)
>         if (!spdifrx->desc)
>                 return -EINVAL;
>
> -       spdifrx->desc->callback =3D stm32_spdifrx_dma_complete;
> -       spdifrx->desc->callback_param =3D spdifrx;
> +       dmaengine_desc_set_callback(spdifrx->desc, stm32_spdifrx_dma_comp=
lete, NULL, spdifrx);
>         cookie =3D dmaengine_submit(spdifrx->desc);
>         err =3D dma_submit_error(cookie);
>         if (err)
> --
> 2.43.0
>


Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FACA606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 06:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=W5Yd4P9G;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yfWU+Cc3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=dqJik3giojyQdxTVlYt/SVYHbelelREmDC0vou6fiGs=; b=W5Yd4P9GHRGkLH
	xWAfN83iAiSnnsk+RXVj/LdkZRWvRh9q+gFFADSmoaeH2yUG8aERx10lfavQicxKuHW3TJ7CMAgAp
	U4bJ5m5C0PoXs0Bt++r/8L9vLpawMOA6/WqDogKNDjN+mOQHk+zy+p5HX2/GyOevTRswSM9lnAqP7
	+F+2hvRAbexufrVIt3ccKaFIntJoGEiKz+Um0st708V5mv+868ckXVtQ2YVfke9/tQFXVt8y3OYIn
	Xs7CZgiHrkTc0Cc9S199kS0wC31f5eEHHNZXVsblxPZOfslYuRpePngSxb7gI/DdYDhMBpq4GioWV
	w2/14+a6zs0CP5StNjZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOrHe-00000007z3n-2UZw;
	Thu, 05 Nov 2026 06:49:14 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOrHc-00000007z3F-2iix
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 06:49:14 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-3ae1b34e0d2so169401a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Nov 2026 22:49:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793861352; cv=none;
        d=google.com; s=arc-20260327;
        b=r9YIYdGUincZv7hOvjlBnsS+ASgnPfwUXLEa+zTlnVcfwk13/o/eUHHZ2JaTjq4hF6
         WTxtHzcLMKJ66PoMx2N0E+Y/ygP2/E2VPm9Rbw1H61YRVUV54zH46G23Ffc5jiLQIY7s
         Zc0ZijHXhd1cKQEQhmk2ho/lZuUA5L3Vav2bopw/1f+eSvJlfaSTEBoMxpX7jHlmy0MY
         Djt+VmcFVPXKRkU1pQbkpkTnReuAvyLzr9yAZ7UoPZBydqd+VZFJfjPivDPpU0RLC+ZC
         benXrbrGvROBmePsYFNmEUpYwDFss8snygR/Zu0/j0Nce5dTC+sB8MXI4KC+UnolU3xf
         yK0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dqJik3giojyQdxTVlYt/SVYHbelelREmDC0vou6fiGs=;
        fh=EzuBFEAXOl8ay3jC/2h4VukrXBw8PBxb7MHSV7Ng+Gg=;
        b=hQRIBOf7EmmwyhOZCedxkwWLCJar3uKx5nPPsF4mG4/An97THEi6yu3T6oEdZsiA7+
         yCXEbHZxTmuFRjj5mdCvOV6zmJ1LDVuKEaTNgXcVzaxDsdaZOieBS1OyXqF0bVtoyjoS
         S+u+cmliivBLxWBxtgLkFSFTh+miSL/1HQIztkbaMY4UJHP2A4N1/phwf1LuXlt3jTZm
         HrvzNz1nMl0+BxeOSG2dKBa/O2n55lMEp9+TIjzDpONgt++kHPcn2C7GhgAoArWAujnR
         i3wk1ysxCiXNF1PPMO5SRl+JBMem1pD+NyluhIw5zWp8ioUR1rRT05KSlxlBPX9zux95
         /JlA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793861352; x=1794466152; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dqJik3giojyQdxTVlYt/SVYHbelelREmDC0vou6fiGs=;
        b=yfWU+Cc3eCVQp7ueU6i4zrjrqRH+EgnxqmFwoECSk9CvDcM2JzzLFxv7co479MjhPb
         cGybo52CbIDFCIDWgLK32fWFPVkJGVI1swWBDfCErhADeyhQ9DLkSpox8wbICcDqrYoL
         NKtkYbWSA5omXKFk9Icg5y+b6K/tkRG++zeVIBg3GgncO0ho4e4spr8oh8GDQgFiQkJU
         uoKakOJzi2kKRxHt8QDyo+IiWXLNYAHb6ai8oZkg0eaqh5Fgx+ZkFWWUw2tFSaa1Rnds
         ADns28D9Zqw8lLYzArhMRB/6qVuWdqsKYiMy4TMpxaqL8UODmpT4dQV8frToc4HkSESd
         M/QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793861352; x=1794466152;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dqJik3giojyQdxTVlYt/SVYHbelelREmDC0vou6fiGs=;
        b=Kq6azw3pWiiEPYlH6gp32kn7WjqEgPvCQ+0EsPcbz4HKq8w0RsR1aqD2D1NmsZIRUj
         uxrR12xVG68dJnsYldH/cKSTEIVCzVYtvnKyHGI304N+0MIzVL9cvC/L2/AD7zFDR5aq
         3Ih9dLpDVKgc8KisYmw09oXLL5+SEYjB7df2PTU7WfN6HeRdP8uv5mp7WupRz/mHDmZW
         y7GvqfdIP+X0k7oLSgJZzNx3rO78bnGcPq3OROYFwlF7ngBEmAEzf5i9qbAG7aaJjBY/
         JZI1QEci2RLwRjkfgFl1ZvRm/gmtdhMDYFrvZzi8FYao0lwyXLL1z52k+uaDTF1UWDgM
         VcCA==
X-Forwarded-Encrypted: i=1; AKwUvBxE7UgrFwM+b8fApUuG1d/bXCNrLlJv7ZVyoVfJ0qnub4qufkMbE77Gt8T0pwRJe4s28aT9yEtRN4y0E4EB4ova@lists.infradead.org
X-Gm-Message-State: APuU4Z+o6O2hrA3qQxJ8iinMwF3jxBBTj7SxVLFOqj400jwGdUdvC6cO
	AHntUMk2aZI8wtZK6JizjKN9RfRxg8R0/JUHeng+B7HyKzyqY45NzCeA8ZegfP1RpY7ncAm7sXx
	Qj7zWiBtmI048/zFNbaTOvhF4gzeYOpo=
X-Gm-Gg: AYBFou0gItlBVsrQ7Etq7pRY1lOQpe3v1Rd+rzjfKXLSTwKukHMelOMF/omLSqfjgHH
	SMPTldUpyi2T8NcV+QvNiuGJIBDK0w8Deeo55lyGjenLjNLGbK2SWY74chIzTPz0xh8VN20Q086
	JDkwO8pXx6dQBXrPdgTydAfoJSDwt4DpHeSyhBpnWIwTKJTK/WDglOjRwonlfCYPWbZu/5FV56G
	j+nmh2CamwlqgVNrXiyxzuFFCOoMZQqGtCDCVTh84iq1zmBpGHIKPy0E6Ur0I0X61WQEAartjcO
	QRP2bSzhrp62k+9A9JVGcfM2QqENdIVcH0qDrjLAgUU2zwnHeQSKMt4HA9lHmiRJJNwndomzezN
	QrJCzhf4bgvMJ3wt81RWX7ECufK76ybQnZtSZ
X-Received: by 2002:a17:90b:5145:b0:3b0:a7b5:c044 with SMTP id
 98e67ed59e1d1-3b0afbf69bamr928353a91.1.1793861351672; Wed, 04 Nov 2026
 22:49:11 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261104-imx-sgtl5000-cleanup-v1-1-62739fbb4a25@baylibre.com>
In-Reply-To: <20261104-imx-sgtl5000-cleanup-v1-1-62739fbb4a25@baylibre.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 5 Nov 2026 14:48:43 +0800
X-Gm-Features: AclHuK9RYtMW40xJ2QKN3LFb2Z1eP_S0Ak6cnyuxLFg7_4CvqzYMgBFsDCsykmE
Message-ID: <CAA+D8AO6dy8Jn+yAaSmdQ2Zh0r_L_ChCAOhpQ-AJh1k+C_usrA@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl: imx-sgtl5000: release codec clock right after
 reading its rate
To: Valerio Setti <vsetti@baylibre.com>
Cc: Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>, 
	Nicolin Chen <nicoleotsuka@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, linux-sound@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_224912_693264_6113845A 
X-CRM114-Status: GOOD (  30.87  )
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
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 4, 2026 at 6:48=E2=80=AFPM Valerio Setti <vsetti@baylibre.com> =
wrote:
>
> The 'codec_clk' is only used in 'probe' to read its rate, which is then
> cached in clk_frequency and used by 'imx_sgtl5000_dai_init()'. Holding th=
e
> clk until 'remove()' serves no purpose.
>
> Release the clock right after reading its rate. This allows turning
> 'codec_clk' into a local variable, simplifying the probe error path and
> dropping the 'remove()' callback, which has nothing left to do.
>
> Signed-off-by: Valerio Setti <vsetti@baylibre.com>

Reviewed-by: Shengjiu Wang <shengjiu.wang@gmail.com>

Best regards
Shengjiu Wang
> ---
> While reviewing [1] I realized that the driver could be simplified a bit.
> 'codec_clk' is only used in the 'probe()' function with 'clk_get_rate()',
> so it can be a local variable there. Also it must be put when no more
> used, still in the 'probe()' function.
> This allows to remove 'imx_sgtl5000_remove()'.
>
> This patch does not depend on [1] and they are addressing different thing=
s.
> The two should apply cleanly on 7.4-rc1.
>
> [1] https://lore.kernel.org/all/20261104022815.1484320-1-vulab@iscas.ac.c=
n/
> ---
>  sound/soc/fsl/imx-sgtl5000.c | 24 +++++++-----------------
>  1 file changed, 7 insertions(+), 17 deletions(-)
>
> diff --git a/sound/soc/fsl/imx-sgtl5000.c b/sound/soc/fsl/imx-sgtl5000.c
> index 8bcf54ef709e..032ea3e066bd 100644
> --- a/sound/soc/fsl/imx-sgtl5000.c
> +++ b/sound/soc/fsl/imx-sgtl5000.c
> @@ -20,7 +20,6 @@ struct imx_sgtl5000_data {
>         struct snd_soc_card card;
>         char codec_dai_name[DAI_NAME_SIZE];
>         char platform_name[DAI_NAME_SIZE];
> -       struct clk *codec_clk;
>         unsigned int clk_frequency;
>  };
>
> @@ -54,8 +53,9 @@ static int imx_sgtl5000_probe(struct platform_device *p=
dev)
>         struct device_node *ssi_np, *codec_np;
>         struct platform_device *ssi_pdev;
>         struct i2c_client *codec_dev;
> -       struct imx_sgtl5000_data *data =3D NULL;
> +       struct imx_sgtl5000_data *data;
>         struct snd_soc_dai_link_component *comp;
> +       struct clk *codec_clk;
>         int int_port, ext_port;
>         int ret;
>
> @@ -129,13 +129,14 @@ static int imx_sgtl5000_probe(struct platform_devic=
e *pdev)
>                 goto put_device;
>         }
>
> -       data->codec_clk =3D clk_get(&codec_dev->dev, NULL);
> -       if (IS_ERR(data->codec_clk)) {
> -               ret =3D PTR_ERR(data->codec_clk);
> +       codec_clk =3D clk_get(&codec_dev->dev, NULL);
> +       if (IS_ERR(codec_clk)) {
> +               ret =3D PTR_ERR(codec_clk);
>                 goto put_device;
>         }
>
> -       data->clk_frequency =3D clk_get_rate(data->codec_clk);
> +       data->clk_frequency =3D clk_get_rate(codec_clk);
> +       clk_put(codec_clk);
>
>         data->dai.cpus          =3D &comp[0];
>         data->dai.codecs        =3D &comp[1];
> @@ -185,22 +186,12 @@ static int imx_sgtl5000_probe(struct platform_devic=
e *pdev)
>  put_device:
>         put_device(&codec_dev->dev);
>  fail:
> -       if (data && !IS_ERR(data->codec_clk))
> -               clk_put(data->codec_clk);
>         of_node_put(ssi_np);
>         of_node_put(codec_np);
>
>         return ret;
>  }
>
> -static void imx_sgtl5000_remove(struct platform_device *pdev)
> -{
> -       struct snd_soc_card *card =3D platform_get_drvdata(pdev);
> -       struct imx_sgtl5000_data *data =3D snd_soc_card_get_drvdata(card)=
;
> -
> -       clk_put(data->codec_clk);
> -}
> -
>  static const struct of_device_id imx_sgtl5000_dt_ids[] =3D {
>         { .compatible =3D "fsl,imx-audio-sgtl5000", },
>         { /* sentinel */ }
> @@ -214,7 +205,6 @@ static struct platform_driver imx_sgtl5000_driver =3D=
 {
>                 .of_match_table =3D imx_sgtl5000_dt_ids,
>         },
>         .probe =3D imx_sgtl5000_probe,
> -       .remove =3D imx_sgtl5000_remove,
>  };
>  module_platform_driver(imx_sgtl5000_driver);
>
>
> ---
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
> change-id: 20261104-imx-sgtl5000-cleanup-371e704e5de6
>
> Best regards,
> --
> Valerio Setti <vsetti@baylibre.com>
>


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E58ACAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 13:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TIgtSwakb4S2F49hv2ah0ceDD3kdcrnl68lJO2bz2SI=; b=2l0el46LhsTYc3M//Jgq3dQll/
	h8rzME5M9F/r7jFs7CAUN+El5N0aDF3WSF77QPzky3oTM7/y6H4b2qonbPM27ivBEzPvtqj1JMZ6A
	iOjiCBRoBHm8zpYNXLayVmbY1HF3tEmLwM5W5c3k9yajiXw7QpbSfe97sfDnY0uBg7G2XmQ0NTGLs
	5OhlsyFg2dLHDwZM8aWNXmyI1ds3ElIiS/WU6SuzJRK3WaspGFN7ZgRPh6GhFRravlInqP/zGmV5O
	zEA6Ty12LELTJ0bqssJyqDNu1Y84FDaj8FDbdTC2DBTZboMY6E0ldml5iHJGk0e6pmM+J4gl7YPb3
	2xBmhHpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3DeF-00000002WnI-06tJ;
	Mon, 29 Sep 2025 13:10:35 +0000
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3DeC-00000002Wll-2odV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Sep 2025 13:10:33 +0000
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-71d603cebd9so58643877b3.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Sep 2025 06:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759151431; x=1759756231; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TIgtSwakb4S2F49hv2ah0ceDD3kdcrnl68lJO2bz2SI=;
        b=rcBrosrgiZ0y6mNEUiurEE+TMk1tVo52FC05A9130qTjckl0WlFayS8KMsvYxE/m6T
         +gssBbwRfRbyQj7KaGSI+AosMuot9wVsn3+MAHtsEy+ZKxKDEMDpSul17J3bo3RUVf42
         CR2eVYviyTDIGpDGmdDio2FmA/Ua6ANsYausV0lJomS8Fgotb5Vsy0RMt3s3iGMF6Etp
         Yke5FtsO35Ysghl82QFlm3CFi26+7DC29BWp+Z/XLfzNVLuBG/d36uysoPdA5qIx9Hlx
         xZ6yrwLfmb89blYBlLqwN7BjWE5VBKejSGVu6wqLM74/SO2GmX1uQsiFq/I1G6Vmr4B9
         HGIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759151431; x=1759756231;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TIgtSwakb4S2F49hv2ah0ceDD3kdcrnl68lJO2bz2SI=;
        b=ngPq1Oj6x1VgZc3llGb+5dionBGDnN+56K9LKeRwzMa1xu61+eheg/2BRkxi1QL221
         DC/9HWq8lYdqADiqs0MOo3d8SU+dZR0fmcd27uHGGYAnwi+1HWZHSEHuIKbjv2uVayi3
         9YB0KFOUTCv+ePzNhTDNZH/wY9CrCVkA407gfWoMTkC9sbepLRFwqYKka9HCe9Rpdgt/
         K1dI/Rx7bwaTBHmz/b1TPV6Xz4x3XW9oQE8zOTrRoGfypihh2IpWmqay6fJ40MVLiYgS
         FGLChAgLWePANfZaC3ihapwgyOj1ouf53WszXdTN7OeBu/hsExDpZU9wBaa9EE+i7sWz
         i9aw==
X-Forwarded-Encrypted: i=1; AJvYcCX1e+9v2B0BmwZKX7+XC2/U5lYjz4peN9AHGpPOWRxFGnZUd41IFWJekefVIaDL5pdFXgA49DHFkzf6uRObcU2Y@lists.infradead.org
X-Gm-Message-State: AOJu0YzoKpOTcWKZpIO1L1nRTlIuezXzBdPdYqOX+wBpVA80L2itsOVJ
	xs69MEOXY4wCa3Zf+pJTA7/iqqX0wztbwkNTqACHgjEjZZVJSfI9ZBLbWaDDanARD8S3hDQPdmR
	onz3SUmnRSWFuuRJnntUfG9tUly63tRwA2YVcKMWH9A==
X-Gm-Gg: ASbGncte6ymkAapM2Ar02qBw3DJ6ld84B7zsTH3Ulb0MzTRtJ45cXeKvIujHMMrDGxD
	76HALjs0wVdabnp4wIfm5zzhkqWOqnnQNhIH2ILabgSMaKE/u5PH72e2Sz4CHpHGMNNOjvYri97
	oMCwQWwuHxxIMMTMk/myC1e2y5KZvdgZf3GoKoUm03PuLTBFcfX++sXC9XvuMa65kAUA2tft7jK
	ygy7KbOrkGePFjbT0E=
X-Google-Smtp-Source: AGHT+IEaqhle1COgySgMHCGl7/RAGDslrMpVmtc/WxzU5IvlxnhajJDxwCn8WYXyXNTN50BLyVZqReaPXPJrWYY1F9w=
X-Received: by 2002:a05:690e:154c:20b0:639:2794:3416 with SMTP id
 956f58d0204a3-639279436b2mr3662726d50.19.1759151431542; Mon, 29 Sep 2025
 06:10:31 -0700 (PDT)
MIME-Version: 1.0
References: <20250926-imx_rproc_v3-v3-0-4c0ec279cc5f@nxp.com> <20250926-imx_rproc_v3-v3-1-4c0ec279cc5f@nxp.com>
In-Reply-To: <20250926-imx_rproc_v3-v3-1-4c0ec279cc5f@nxp.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 29 Sep 2025 15:09:55 +0200
X-Gm-Features: AS18NWBrMVxKi_O1xz826dCqJxNTtrsBYTk49Oo4lKT0mm4rt1UcT29ebmOL9cg
Message-ID: <CAPDyKFqsDjn2+6XxY=Dkv9qZ6weTaeChwsSHvnHFnFzbYQ9bUg@mail.gmail.com>
Subject: Re: [PATCH v3 1/6] remoteproc: imx_rproc: Fix runtime PM cleanup and
 improve remove path
To: Peng Fan <peng.fan@nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Hiago De Franco <hiago.franco@toradex.com>, Frank Li <Frank.Li@nxp.com>, 
	Daniel Baluta <daniel.baluta@nxp.com>, linux-remoteproc@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_061032_901825_411A6EDD 
X-CRM114-Status: GOOD (  21.17  )
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

On Fri, 26 Sept 2025 at 14:33, Peng Fan <peng.fan@nxp.com> wrote:
>
> Proper cleanup should be done when rproc_add() fails by invoking both
> pm_runtime_disable() and pm_runtime_put_noidle() to avoid leaving the
> device in an inconsistent power state.
>
> Fix it by adding pm_runtime_put_noidle() and pm_runtime_disable()
> in the error path.
>
> Also Update the remove() callback to use pm_runtime_put_noidle() instead of
> pm_runtime_put(), to clearly indicate that only need to restore the usage
> count.
>
> Fixes: a876a3aacc43 ("remoteproc: imx_rproc: detect and attach to pre-booted remote cores")
> Cc: Ulf Hansson <ulf.hansson@linaro.org>
> Cc: Hiago De Franco <hiago.franco@toradex.com>
> Suggested-by: Ulf Hansson <ulf.hansson@linaro.org>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe


> ---
>  drivers/remoteproc/imx_rproc.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index bb25221a4a8987ff427d68e2a5535f0e156b0097..8424e6ea5569b9ba6b07525643ce795faaeb2898 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -1136,11 +1136,16 @@ static int imx_rproc_probe(struct platform_device *pdev)
>         ret = rproc_add(rproc);
>         if (ret) {
>                 dev_err(dev, "rproc_add failed\n");
> -               goto err_put_clk;
> +               goto err_put_pm;
>         }
>
>         return 0;
>
> +err_put_pm:
> +       if (dcfg->method == IMX_RPROC_SCU_API) {
> +               pm_runtime_disable(dev);
> +               pm_runtime_put_noidle(dev);
> +       }
>  err_put_clk:
>         clk_disable_unprepare(priv->clk);
>  err_put_scu:
> @@ -1160,7 +1165,7 @@ static void imx_rproc_remove(struct platform_device *pdev)
>
>         if (priv->dcfg->method == IMX_RPROC_SCU_API) {
>                 pm_runtime_disable(priv->dev);
> -               pm_runtime_put(priv->dev);
> +               pm_runtime_put_noidle(priv->dev);
>         }
>         clk_disable_unprepare(priv->clk);
>         rproc_del(rproc);
>
> --
> 2.37.1
>


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12621C83F34
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 15:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HMki3EREzOkEdCOqJgQuxQoEpYrU9bwlyOJXDCisQCI=; b=fYIrVxidnL123J8x7nHvziu6DD
	VciwA3c5AxAEYPtJBDGc2cAp2Fk9juIlmHqwU0bLB3c48Hora7A5Ri8MazSFgCcGq542HnhrkgbQr
	NaAsYaXaoShg4vbUckp4TRkUWH6wKQK4wRkArpZKmsJH1yGDEJP22e8LOCMAfoBmho3PFs4rcJxGi
	+0SoU8IoyRgoBcPGhx9pwBaTkEHTDGPy0HDhsT9++kglUXJBtbvs7wv53Be/zPJrHhHsn8br4+Msy
	oxR9hKRqvV+9WrfmoDSHiB770nFLaKnomJ62MAc2VM9eO8rLpMvFvcL1Fe9khq97Qhsp3LwA/Y+wg
	mACcUtrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucQBv-0000000ATTF-34Yg;
	Thu, 17 Jul 2025 15:06:35 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucPqr-0000000APa8-0H3x
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Jul 2025 14:44:50 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-23649faf69fso9741735ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Jul 2025 07:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752763488; x=1753368288; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HMki3EREzOkEdCOqJgQuxQoEpYrU9bwlyOJXDCisQCI=;
        b=URbm7OePf1XCOLqxITSZ5gtrgQeCkmjr09xgs6/6TWUVY87MYGj0rx/Hfl8FqZm9D+
         4avJuhKUE6jq3K3QoPqwQ4plGJ3pLIbk2nHrXTC/AlbYIc3rMniateaXkc29TOETy7m7
         /HKdGq6houXUOPH2uNCtkycRbeR6bez3pMcvajoGgMuaAKzqij+O3JayKaBfjifX0i5W
         I0QAqNa0FfTgCI+LzNXCwpW0W69QryMIoeerPFzF3XV0OkT4hiJaX2RuKVC6xziSXrG8
         N9ksIqoYTKViNoAhFLybK5lo0K9wlsAGCBmYQqohMePyF3r0sOZzburcFhCrOAJRloDB
         MLcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752763488; x=1753368288;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HMki3EREzOkEdCOqJgQuxQoEpYrU9bwlyOJXDCisQCI=;
        b=NXbF8D4grgcUZKz85gFwuSImpa7dXe3fFWzh0gajaDS7HzHnqBRwyDZ/Nw3lt/Tqkx
         2rDorJST1kqqL0e8SQsKjv05mk94i7UnRX7FqdDLilcTpmu7ld0InjV8zkRoruvuClSb
         6iYTbduBTpWruvdJwdgIY8d1kloAxW5AF0lHTZG6QaveQBl3AJnQOgRs+DkXNqTx+EtZ
         AB9oQkdab4Qe8MEtPmm6EL/7KCG461alGU36Ge+oq6Y8rhmUWIq5L4pk0xo00XVebtTJ
         ToVoWtHgNBppL39LnLNdREMsLvcP4ZEa10SzLkUzqKshxUn7fy6aAuJqFlVmp+hpVvPo
         mE8Q==
X-Forwarded-Encrypted: i=1; AJvYcCWWbLbZnxEWqPsLnP5gWxgKMESuxwy6547Ijkhhzx8WHfzttuvhlw3yQANlYIBz4600Cm0bMygVdfYb1PH0+4b/@lists.infradead.org
X-Gm-Message-State: AOJu0YyYu3giGny4vku5iDTIr+Ozbk09Xdm/RM5KUNJh0tpVDoos/oIX
	9lPotzE50toQ8tS1xKL94HxwatwVsRTzd+Pd2KtqjshU/yYUC9+PsaV4OxFTj0rXOII=
X-Gm-Gg: ASbGnctgM8Jb7aMf8X/hgFQMSVK3oB+Agky8Vx8pmPMwgjeI3430yKKn1ClML6InGlw
	R9yT2EU/JvRy0LMOuQ8eyZyUmuTYEvl6sfrqWcxo/Fgw1vY8EYpPbUVptoPOCEKLGYVze3C3p2k
	+zX3+71k2l/BHMp+tWxLHXO6qJBsTwPoIbhGTIEqnsCtJ7Kw5pvVO9uiqrnZ15PmTtku4fSbfIQ
	p356P2q07TnYzAY7tPlGqY7miRiuXf1o0ZD+pSd2CXqtFgrEu1Djb1E8tZOxkPrYfs8bkfjXotL
	sVVQ5zbgevrsrB4wk0pxJKr5lTMKgh8a4Xt1OqrRxeg0rqmBjshYeNYzQPEW0KGz0u/kUXgPuU1
	cqlsO/PRDQwEOz5wS/ePBSFIH
X-Google-Smtp-Source: AGHT+IFxbtqBAGkJym8+VFRPzdrsyZhZt1QmNmPClKyw9FUHG1z6ALCqHlkDrXho3ZJx8sxkci5pug==
X-Received: by 2002:a17:903:1ac8:b0:234:d431:ec6e with SMTP id d9443c01a7336-23e256849dfmr104855025ad.3.1752763488194;
        Thu, 17 Jul 2025 07:44:48 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:e0c8:a1e8:3882:b37])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de4322b2dsm145347495ad.92.2025.07.17.07.44.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 07:44:47 -0700 (PDT)
Date: Thu, 17 Jul 2025 08:44:45 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Hiago De Franco <hiagofranco@gmail.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linux-remoteproc@vger.kernel.org,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	daniel.baluta@nxp.com, iuliana.prodan@oss.nxp.com,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Hiago De Franco <hiago.franco@toradex.com>,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v8] remoteproc: imx_rproc: detect and attach to
 pre-booted remote cores
Message-ID: <aHkMXWfs0iXqFTbw@p14s>
References: <20250716194638.113115-1-hiagofranco@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250716194638.113115-1-hiagofranco@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_074449_123909_35778B0B 
X-CRM114-Status: GOOD (  47.14  )
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

On Wed, Jul 16, 2025 at 04:46:38PM -0300, Hiago De Franco wrote:
> From: Hiago De Franco <hiago.franco@toradex.com>
> 
> When the Cortex-M remote core is started and already running before
> Linux boots (typically by the Cortex-A bootloader using a command like
> bootaux), the current driver is unable to attach to it. This is because
> the driver only checks for remote cores running in different SCU
> partitions. However in this case, the M-core is in the same partition as
> Linux and is already powered up and running by the bootloader.
> 
> This patch adds a check using dev_pm_genpd_is_on() to verify whether the
> M-core's power domains are already on. If all power domain devices are
> on, the driver assumes the M-core is running and proceed to attach to
> it.
> 
> To accomplish this, we need to avoid passing any attach_data or flags to
> dev_pm_domain_attach_list(), allowing the platform device become a
> consumer of the power domain provider without changing its current
> state.
> 
> During probe, also enable and sync the device runtime PM to make sure
> the power domains are correctly managed when the core is controlled by
> the kernel.
> 
> Suggested-by: Ulf Hansson <ulf.hansson@linaro.org>
> Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

> ---
> Hi Mathieu, Ulf,
> 
> This is the v8 of patch3 from the patch series:
> https://lore.kernel.org/all/20250629172512.14857-1-hiagofranco@gmail.com/
> 
> As patches 1 and 2 are already applied on Ulf's next branch, as
> requested I am sending now only the v8 of patch 3.
> 
> I made a small correction into the commit description, s/SCFW
> partitions/SCU partitions/g and updated with the check for the return
> value.
> 
> I hope this is ok.
> 
> Thanks!
> 
> Hiago.
> 
> v7 -> v8:
>     - Added return error check for dev_pm_domain_attach_list().
>     - Commit description: changed to use "SCU partitions" instead of
>       "SCFW partitions". This is more accurate since these are hardware
>       enforced partitions.
> v6 -> v7:
>  - Added Peng reviewed-by.
> v5 -> v6:
>  - Commit description improved, as suggested. Added Ulf Hansson reviewed
>    by. Comment on imx-rproc.c improved.
> v4 -> v5:
>  - pm_runtime_get_sync() removed in favor of
>    pm_runtime_resume_and_get(). Now it also checks the return value of
>    this function.
>  - Added pm_runtime_disable() and pm_runtime_put() to imx_rproc_remove()
>    function.
> v3 -> v4:
>  - Changed to use the new dev_pm_genpd_is_on() function instead, as
>    suggested by Ulf. This will now get the power status of the two
>    remote cores power domains to decided if imx_rpoc needs to attach or
>    not. In order to do that, pm_runtime_enable() and
>    pm_runtime_get_sync() were introduced and pd_data was removed.
> v2 -> v3:
>  - Unchanged.
> v1 -> v2:
>  - Dropped unecessary include. Removed the imx_rproc_is_on function, as
>    suggested.
> ---
> ---
>  drivers/remoteproc/imx_rproc.c | 41 +++++++++++++++++++++++++++++-----
>  1 file changed, 35 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 627e57a88db2..a6eef0080ca9 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -18,6 +18,7 @@
>  #include <linux/of_reserved_mem.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_domain.h>
> +#include <linux/pm_runtime.h>
>  #include <linux/reboot.h>
>  #include <linux/regmap.h>
>  #include <linux/remoteproc.h>
> @@ -890,10 +891,8 @@ static int imx_rproc_partition_notify(struct notifier_block *nb,
>  static int imx_rproc_attach_pd(struct imx_rproc *priv)
>  {
>  	struct device *dev = priv->dev;
> -	int ret;
> -	struct dev_pm_domain_attach_data pd_data = {
> -		.pd_flags = PD_FLAG_DEV_LINK_ON,
> -	};
> +	int ret, i;
> +	bool detached = true;
>  
>  	/*
>  	 * If there is only one power-domain entry, the platform driver framework
> @@ -902,8 +901,25 @@ static int imx_rproc_attach_pd(struct imx_rproc *priv)
>  	if (dev->pm_domain)
>  		return 0;
>  
> -	ret = dev_pm_domain_attach_list(dev, &pd_data, &priv->pd_list);
> -	return ret < 0 ? ret : 0;
> +	ret = dev_pm_domain_attach_list(dev, NULL, &priv->pd_list);
> +	if (ret < 0)
> +		return ret;
> +	/*
> +	 * If all the power domain devices are already turned on, the remote
> +	 * core is already powered up and running when the kernel booted (e.g.,
> +	 * started by U-Boot's bootaux command). In this case attach to it.
> +	 */
> +	for (i = 0; i < ret; i++) {
> +		if (!dev_pm_genpd_is_on(priv->pd_list->pd_devs[i])) {
> +			detached = false;
> +			break;
> +		}
> +	}
> +
> +	if (detached)
> +		priv->rproc->state = RPROC_DETACHED;
> +
> +	return 0;
>  }
>  
>  static int imx_rproc_detect_mode(struct imx_rproc *priv)
> @@ -1146,6 +1162,15 @@ static int imx_rproc_probe(struct platform_device *pdev)
>  		}
>  	}
>  
> +	if (dcfg->method == IMX_RPROC_SCU_API) {
> +		pm_runtime_enable(dev);
> +		ret = pm_runtime_resume_and_get(dev);
> +		if (ret) {
> +			dev_err(dev, "pm_runtime get failed: %d\n", ret);
> +			goto err_put_clk;
> +		}
> +	}
> +
>  	ret = rproc_add(rproc);
>  	if (ret) {
>  		dev_err(dev, "rproc_add failed\n");
> @@ -1171,6 +1196,10 @@ static void imx_rproc_remove(struct platform_device *pdev)
>  	struct rproc *rproc = platform_get_drvdata(pdev);
>  	struct imx_rproc *priv = rproc->priv;
>  
> +	if (priv->dcfg->method == IMX_RPROC_SCU_API) {
> +		pm_runtime_disable(priv->dev);
> +		pm_runtime_put(priv->dev);
> +	}
>  	clk_disable_unprepare(priv->clk);
>  	rproc_del(rproc);
>  	imx_rproc_put_scu(rproc);
> -- 
> 2.39.5
> 


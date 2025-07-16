Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 100FDC83F22
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 13:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=d6kfc10B6ok/s3QG/0BYXTIDoit26JaipG2QuAEmJ7I=; b=Dc/Y3yaxj36iem
	ka9H12kj8299gTyr3Qm2KPk/xN8kn3TH0+ozUM2L2IPzRGbyj2YKLvG1GWxKvN6tPt6fognnjraiz
	RtbywcN2eUkMFkZLEnACpHz482WOjEZoT0OiT7iISgNjewoa9Edqlk2UVgWBLrVSDulxAKVeLRlAh
	OZxxDPqyoMepfIDf6wdoXiihYXhDLc6nDyFbNnZaUeMIEx+58t8DlBa4QClo5PdEpyLhBTqvEBMDH
	2FwEww2/WADrjY+FOTycqQ4m4B4fv18j0638quzMSI8uZ24+BrGa1s6ezyfS+rCCBFnbsrs35MZ6+
	453eL3wyB4sdhjkl3+nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc2Bg-00000007nJ1-0yQy;
	Wed, 16 Jul 2025 13:28:44 +0000
Received: from mail-ua1-x931.google.com ([2607:f8b0:4864:20::931])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc293-00000007mxH-1H03
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Jul 2025 13:26:02 +0000
Received: by mail-ua1-x931.google.com with SMTP id a1e0cc1a2514c-86fea8329cdso4053511241.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Jul 2025 06:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752672360; x=1753277160; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=d6kfc10B6ok/s3QG/0BYXTIDoit26JaipG2QuAEmJ7I=;
        b=jjojWNayYtdKBBsyvgyRIcdUoFq29vYGVrLW9K5Hk1s2XA/iM9+A6T3PS+ZH6h9QcT
         QM/VgtC9CdowswborpYJ22LpEpj1VihXmQAbDTncw/CQU9frNyKPjD8ND8nMVyi7kboI
         4H5WrnecAJRtSXpd//VFtuusM7LD3Njmkk1igtwe1YDBDPZFOnL1XBavE0aQNI0Twu3I
         e+xWgrBJvkiY4FvEurRjOaNy7+AJI4KoQVhmqGjM6zvD7G/sY83mpfzMZVtmtNTPPhnH
         tVJdFTuRv69uIm5If1VKrG7MMgZBibUHtdvS2crFbN8lOPRyx7Qd+kvo+/iYtx5aCCFW
         crWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752672360; x=1753277160;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d6kfc10B6ok/s3QG/0BYXTIDoit26JaipG2QuAEmJ7I=;
        b=l3DGmn2cRvFMA8mB9qa0PWCxfvomfIaX9I6ir5GPsYtQ70tIMcpCwnnwolxmd8sCTK
         VuvrgG5g8WHQD+ueGySqFgL9byJGtMhTSgRHodcUV988nuk7MMGKapLyz7FwP6B/pMy0
         DPJp6Il7H98UUtL8U+k3yi/A4Xz/YdVF3SVuWsjDtNrUF8/kLUcUWAnWj8157vznfhDg
         KMjq0zfWASzJh4yTCQ8eriw1SVjAipzH6dtMih2kTYx5y6KcbFu9iROYSZIX9D9XRqTN
         C1EBXSmXm5nuyqSLFtTk8Dx97l2ALXK8okxwYn9x1ICHYPT7zMGF1vRL8VJf8n9j+a7r
         E+lw==
X-Forwarded-Encrypted: i=1; AJvYcCXazDkAMpd1cdfaDEZ7kx6km0pzk516rMExHfx8Y7p4wHHacwGrLNiEgMitP83Y39GtQ8rla52n+aPArewaSl0h@lists.infradead.org
X-Gm-Message-State: AOJu0Yyg8s+XELAzuXHMKv8hF/m2Oq5GZKTsozsUq2Q8pNEECT5ROF1X
	WKCHOsoawGhBMEvZaiDI117HddjKf++Qbm+D8D2lEl02V6J1K92TKhp5
X-Gm-Gg: ASbGnctdcmqBpdN6cBVlPM5c8BUxg8XqC/uM5glFaYTQ9Ig0i5xSYcJjDReAA4OLmep
	fnY8ve5E/TMDrd2jQbi59kf8nK3BsWv+BZw5XiX790/3vZEwSjq4L4v8j5BLWnTT6+37UdJqorE
	4OEjapcijn3fPF/ULLOo3Z6MTgb4Aw2gaOm/aUH/z0qyAvDKrmRu8t2cWQ3INOVjcKlLuRkXdmC
	wkX+gCiN3I3nbl5p3BgDRza1jvME9wS1zd+H2R39Q7CP1pfvD3hG+joiBWZ7Kr8jdhWJJ1ltQzt
	lgnXZGC7kjkhtGWM912T6Lsd7D/UnltzJnCEXTq8XJ9ck7de4eKvSyASe36mC99b+19Ll3ft+jB
	s0U7y3W3G88w10yw2tZk=
X-Google-Smtp-Source: AGHT+IGLZtQSK5F5avY+4+/nRGti/F+DWgaDPqtV4DEb2TtE0xcBhcqnIWzqD/MfxQq4TFm15BZo2w==
X-Received: by 2002:a05:6102:808d:b0:4e5:fe5e:2be4 with SMTP id ada2fe7eead31-4f89999f155mr1651316137.22.1752672359482;
        Wed, 16 Jul 2025 06:25:59 -0700 (PDT)
Received: from hiagonb ([2804:1b3:a7c1:459e:e3dd:d2e:b1ee:b9ec])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-888ec44ad97sm3105837241.25.2025.07.16.06.25.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 06:25:58 -0700 (PDT)
Date: Wed, 16 Jul 2025 10:25:52 -0300
From: Hiago De Franco <hiagofranco@gmail.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
	Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-pm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Hiago De Franco <hiago.franco@toradex.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@oss.nxp.com>, daniel.baluta@nxp.com,
	iuliana.prodan@oss.nxp.com,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v7 3/3] remoteproc: imx_rproc: detect and attach to
 pre-booted remote cores
Message-ID: <20250716132552.bra37ucw4fcjwril@hiagonb>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aHZ0nK4ZZShAr6Xz@p14s>
 <CAPDyKFrWng0CY-ayKoEbnS_yanghSqogxfuizxEVbVogJ4DT=g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_062601_371255_F9816764 
X-CRM114-Status: GOOD (  51.69  )
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

Hi Mathieu, Ulf,

On Tue, Jul 15, 2025 at 09:32:44AM -0600, Mathieu Poirier wrote:
> On Sun, Jun 29, 2025 at 02:25:12PM -0300, Hiago De Franco wrote:
> > From: Hiago De Franco <hiago.franco@toradex.com>
> > 
> > When the Cortex-M remote core is started and already running before
> > Linux boots (typically by the Cortex-A bootloader using a command like
> > bootaux), the current driver is unable to attach to it. This is because
> > the driver only checks for remote cores running in different SCFW
> > partitions. However in this case, the M-core is in the same partition as
> > Linux and is already powered up and running by the bootloader.
> > 
> > This patch adds a check using dev_pm_genpd_is_on() to verify whether the
> > M-core's power domains are already on. If all power domain devices are
> > on, the driver assumes the M-core is running and proceed to attach to
> > it.
> > 
> > To accomplish this, we need to avoid passing any attach_data or flags to
> > dev_pm_domain_attach_list(), allowing the platform device become a
> > consumer of the power domain provider without changing its current
> > state.
> > 
> > During probe, also enable and sync the device runtime PM to make sure
> > the power domains are correctly managed when the core is controlled by
> > the kernel.
> > 
> > Suggested-by: Ulf Hansson <ulf.hansson@linaro.org>
> > Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
> > Reviewed-by: Peng Fan <peng.fan@nxp.com>
> > Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
> > ---
> > v6 -> v7:
> >  - Added Peng reviewed-by.
> > v5 -> v6:
> >  - Commit description improved, as suggested. Added Ulf Hansson reviewed
> >    by. Comment on imx-rproc.c improved.
> > v4 -> v5:
> >  - pm_runtime_get_sync() removed in favor of
> >    pm_runtime_resume_and_get(). Now it also checks the return value of
> >    this function.
> >  - Added pm_runtime_disable() and pm_runtime_put() to imx_rproc_remove()
> >    function.
> > v3 -> v4:
> >  - Changed to use the new dev_pm_genpd_is_on() function instead, as
> >    suggested by Ulf. This will now get the power status of the two
> >    remote cores power domains to decided if imx_rpoc needs to attach or
> >    not. In order to do that, pm_runtime_enable() and
> >    pm_runtime_get_sync() were introduced and pd_data was removed.
> > v2 -> v3:
> >  - Unchanged.
> > v1 -> v2:
> >  - Dropped unecessary include. Removed the imx_rproc_is_on function, as
> >    suggested.
> > ---
> >  drivers/remoteproc/imx_rproc.c | 37 +++++++++++++++++++++++++++++-----
> >  1 file changed, 32 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> > index 627e57a88db2..24597b60c5b0 100644
> > --- a/drivers/remoteproc/imx_rproc.c
> > +++ b/drivers/remoteproc/imx_rproc.c
> > @@ -18,6 +18,7 @@
> >  #include <linux/of_reserved_mem.h>
> >  #include <linux/platform_device.h>
> >  #include <linux/pm_domain.h>
> > +#include <linux/pm_runtime.h>
> >  #include <linux/reboot.h>
> >  #include <linux/regmap.h>
> >  #include <linux/remoteproc.h>
> > @@ -890,10 +891,8 @@ static int imx_rproc_partition_notify(struct notifier_block *nb,
> >  static int imx_rproc_attach_pd(struct imx_rproc *priv)
> >  {
> >  	struct device *dev = priv->dev;
> > -	int ret;
> > -	struct dev_pm_domain_attach_data pd_data = {
> > -		.pd_flags = PD_FLAG_DEV_LINK_ON,
> > -	};
> > +	int ret, i;
> > +	bool detached = true;
> >  
> >  	/*
> >  	 * If there is only one power-domain entry, the platform driver framework
> > @@ -902,7 +901,22 @@ static int imx_rproc_attach_pd(struct imx_rproc *priv)
> >  	if (dev->pm_domain)
> >  		return 0;
> >  
> > -	ret = dev_pm_domain_attach_list(dev, &pd_data, &priv->pd_list);
> > +	ret = dev_pm_domain_attach_list(dev, NULL, &priv->pd_list);
> > +	/*
> > +	 * If all the power domain devices are already turned on, the remote
> > +	 * core is already powered up and running when the kernel booted (e.g.,
> > +	 * started by U-Boot's bootaux command). In this case attach to it.
> > +	 */
> > +	for (i = 0; i < ret; i++) {
> > +		if (!dev_pm_genpd_is_on(priv->pd_list->pd_devs[i])) {
> > +			detached = false;
> > +			break;
> > +		}
> > +	}
> 
> I was doing one final review of this work when I noticed the return code for
> dev_pm_domain_attach_list() is never checked for error.

As Ulf pointed out, the 'return' a few lines below will return the
negative value to the caller of 'imx_rproc_attach_pd', which ultimately
will fail 'imx_rproc_detect_mode' and fail the probe of imx_rproc.

Please notice that even tough 'dev_pm_domain_attach_list' fails, the
rproc->state will still be set as RPROC_DETACHED because we are starting
'detached' as true, but I am not seeing this as an issue because as
mentioned above the probe will fail anyway. Please let me know if you
see this as an issue.

> 
> Thanks,
> Mathieu
> 
> > +
> > +	if (detached)
> > +		priv->rproc->state = RPROC_DETACHED;
> > +
> >  	return ret < 0 ? ret : 0;
> >  }
> >  
> > @@ -1146,6 +1160,15 @@ static int imx_rproc_probe(struct platform_device *pdev)
> >  		}
> >  	}
> >  
> > +	if (dcfg->method == IMX_RPROC_SCU_API) {
> > +		pm_runtime_enable(dev);
> > +		ret = pm_runtime_resume_and_get(dev);
> > +		if (ret) {
> > +			dev_err(dev, "pm_runtime get failed: %d\n", ret);
> > +			goto err_put_clk;
> > +		}
> > +	}
> > +
> >  	ret = rproc_add(rproc);
> >  	if (ret) {
> >  		dev_err(dev, "rproc_add failed\n");
> > @@ -1171,6 +1194,10 @@ static void imx_rproc_remove(struct platform_device *pdev)
> >  	struct rproc *rproc = platform_get_drvdata(pdev);
> >  	struct imx_rproc *priv = rproc->priv;
> >  
> > +	if (priv->dcfg->method == IMX_RPROC_SCU_API) {
> > +		pm_runtime_disable(priv->dev);
> > +		pm_runtime_put(priv->dev);
> > +	}
> >  	clk_disable_unprepare(priv->clk);
> >  	rproc_del(rproc);
> >  	imx_rproc_put_scu(rproc);
> > -- 
> > 2.39.5
> > 

On Tue, Jul 15, 2025 at 06:03:44PM +0200, Ulf Hansson wrote:
> On Tue, 15 Jul 2025 at 17:32, Mathieu Poirier
> <mathieu.poirier@linaro.org> wrote:
> >
> > On Sun, Jun 29, 2025 at 02:25:12PM -0300, Hiago De Franco wrote:
> > > From: Hiago De Franco <hiago.franco@toradex.com>
> > >
> > > When the Cortex-M remote core is started and already running before
> > > Linux boots (typically by the Cortex-A bootloader using a command like
> > > bootaux), the current driver is unable to attach to it. This is because
> > > the driver only checks for remote cores running in different SCFW
> > > partitions. However in this case, the M-core is in the same partition as
> > > Linux and is already powered up and running by the bootloader.
> > >
> > > This patch adds a check using dev_pm_genpd_is_on() to verify whether the
> > > M-core's power domains are already on. If all power domain devices are
> > > on, the driver assumes the M-core is running and proceed to attach to
> > > it.
> > >
> > > To accomplish this, we need to avoid passing any attach_data or flags to
> > > dev_pm_domain_attach_list(), allowing the platform device become a
> > > consumer of the power domain provider without changing its current
> > > state.
> > >
> > > During probe, also enable and sync the device runtime PM to make sure
> > > the power domains are correctly managed when the core is controlled by
> > > the kernel.
> > >
> > > Suggested-by: Ulf Hansson <ulf.hansson@linaro.org>
> > > Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
> > > Reviewed-by: Peng Fan <peng.fan@nxp.com>
> > > Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
> > > ---
> > > v6 -> v7:
> > >  - Added Peng reviewed-by.
> > > v5 -> v6:
> > >  - Commit description improved, as suggested. Added Ulf Hansson reviewed
> > >    by. Comment on imx-rproc.c improved.
> > > v4 -> v5:
> > >  - pm_runtime_get_sync() removed in favor of
> > >    pm_runtime_resume_and_get(). Now it also checks the return value of
> > >    this function.
> > >  - Added pm_runtime_disable() and pm_runtime_put() to imx_rproc_remove()
> > >    function.
> > > v3 -> v4:
> > >  - Changed to use the new dev_pm_genpd_is_on() function instead, as
> > >    suggested by Ulf. This will now get the power status of the two
> > >    remote cores power domains to decided if imx_rpoc needs to attach or
> > >    not. In order to do that, pm_runtime_enable() and
> > >    pm_runtime_get_sync() were introduced and pd_data was removed.
> > > v2 -> v3:
> > >  - Unchanged.
> > > v1 -> v2:
> > >  - Dropped unecessary include. Removed the imx_rproc_is_on function, as
> > >    suggested.
> > > ---
> > >  drivers/remoteproc/imx_rproc.c | 37 +++++++++++++++++++++++++++++-----
> > >  1 file changed, 32 insertions(+), 5 deletions(-)
> > >
> > > diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> > > index 627e57a88db2..24597b60c5b0 100644
> > > --- a/drivers/remoteproc/imx_rproc.c
> > > +++ b/drivers/remoteproc/imx_rproc.c
> > > @@ -18,6 +18,7 @@
> > >  #include <linux/of_reserved_mem.h>
> > >  #include <linux/platform_device.h>
> > >  #include <linux/pm_domain.h>
> > > +#include <linux/pm_runtime.h>
> > >  #include <linux/reboot.h>
> > >  #include <linux/regmap.h>
> > >  #include <linux/remoteproc.h>
> > > @@ -890,10 +891,8 @@ static int imx_rproc_partition_notify(struct notifier_block *nb,
> > >  static int imx_rproc_attach_pd(struct imx_rproc *priv)
> > >  {
> > >       struct device *dev = priv->dev;
> > > -     int ret;
> > > -     struct dev_pm_domain_attach_data pd_data = {
> > > -             .pd_flags = PD_FLAG_DEV_LINK_ON,
> > > -     };
> > > +     int ret, i;
> > > +     bool detached = true;
> > >
> > >       /*
> > >        * If there is only one power-domain entry, the platform driver framework
> > > @@ -902,7 +901,22 @@ static int imx_rproc_attach_pd(struct imx_rproc *priv)
> > >       if (dev->pm_domain)
> > >               return 0;
> > >
> > > -     ret = dev_pm_domain_attach_list(dev, &pd_data, &priv->pd_list);
> > > +     ret = dev_pm_domain_attach_list(dev, NULL, &priv->pd_list);
> > > +     /*
> > > +      * If all the power domain devices are already turned on, the remote
> > > +      * core is already powered up and running when the kernel booted (e.g.,
> > > +      * started by U-Boot's bootaux command). In this case attach to it.
> > > +      */
> > > +     for (i = 0; i < ret; i++) {
> > > +             if (!dev_pm_genpd_is_on(priv->pd_list->pd_devs[i])) {
> > > +                     detached = false;
> > > +                     break;
> > > +             }
> > > +     }
> >
> > I was doing one final review of this work when I noticed the return code for
> > dev_pm_domain_attach_list() is never checked for error.
> 
> The for loop covers the error condition correctly, I think. It's only
> when ret >=1 when the loop should be started - and ret is propagated
> to the caller a few lines below.
> 
> >
> > Thanks,
> > Mathieu
> >
> 
> Kind regards
> Uffe
> 
> > > +
> > > +     if (detached)
> > > +             priv->rproc->state = RPROC_DETACHED;
> > > +
> > >       return ret < 0 ? ret : 0;
> > >  }
> > >
> > > @@ -1146,6 +1160,15 @@ static int imx_rproc_probe(struct platform_device *pdev)
> > >               }
> > >       }
> > >
> > > +     if (dcfg->method == IMX_RPROC_SCU_API) {
> > > +             pm_runtime_enable(dev);
> > > +             ret = pm_runtime_resume_and_get(dev);
> > > +             if (ret) {
> > > +                     dev_err(dev, "pm_runtime get failed: %d\n", ret);
> > > +                     goto err_put_clk;
> > > +             }
> > > +     }
> > > +
> > >       ret = rproc_add(rproc);
> > >       if (ret) {
> > >               dev_err(dev, "rproc_add failed\n");
> > > @@ -1171,6 +1194,10 @@ static void imx_rproc_remove(struct platform_device *pdev)
> > >       struct rproc *rproc = platform_get_drvdata(pdev);
> > >       struct imx_rproc *priv = rproc->priv;
> > >
> > > +     if (priv->dcfg->method == IMX_RPROC_SCU_API) {
> > > +             pm_runtime_disable(priv->dev);
> > > +             pm_runtime_put(priv->dev);
> > > +     }
> > >       clk_disable_unprepare(priv->clk);
> > >       rproc_del(rproc);
> > >       imx_rproc_put_scu(rproc);
> > > --
> > > 2.39.5
> > >

Best Regards,

Hiago.


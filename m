Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CBB1D79769
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Jan 2026 12:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	To:Cc:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o1FArTjWb5fHnMv+cvCRxPx2Pce2+vtnbqLuhuuwGV4=; b=t28R7FqUFDWWFVSVYrl2aU6/45
	76ZS5qeufuNX9dg4BC4hq0N2PEIzaCcq+yWOCKbPONPWT+Re94+cgxThnhkCoXIM3Q6Fzky2rkI+R
	0AjfPH5hw675kONOriS0hg8QIxAwAWkZmxm65aY+2ScXqh/VdWl2IVQzZ3EBLnxbPt4nNPvAF3K10
	Wa/pDBy+tfOeZzHDIAD30PWuHLkgNMKcL8L0+ApzkUzBzaA9bIfJUFlf3nepbUItZ40cN+YxlGrLa
	McpV3s739UQibMD7VCQffPB56Rt8dTGn6X+88YSEAMXChveRuyBZ+9cmm6oezkiLI1lX7Bv2nQ3Sh
	PMh4KF+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmAAp-00000002ZnK-0kLN;
	Sat, 31 Jan 2026 12:33:59 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmAAk-00000002ZmV-0lCo;
	Sat, 31 Jan 2026 12:33:57 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id E4BD5C22F7C;
	Sat, 31 Jan 2026 12:33:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EBC92606B6;
	Sat, 31 Jan 2026 12:33:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2DA53119A8886;
	Sat, 31 Jan 2026 13:33:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769862826; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=o1FArTjWb5fHnMv+cvCRxPx2Pce2+vtnbqLuhuuwGV4=;
	b=oqTZJV0hSg/2X16nn9r8HEyNeDGFLcFLjeWYysi+mRl3B8Uj0JW9fvJs4Pxa4SClyr2qbA
	ZQamRMUOLc7fAbjdchR/x04C2usO+abkffytpKYafkpjibIF1pJftgtdM9kZKNhgQWW+he
	Qen3cNjQnXdCBvQixpQSw1Ina3DIgbzxdLPAVQB92wUkKnPYOXDdb5pSVOfSG8U1+7sEPT
	TWjulhUlCGohNKQW8tAuhKiE+ww/5LNHvq8zRIVOMPOALjdXHIlWH0t2U92M+uIGCxbG8f
	R5Uj2RBFaitVU2ZkJIq++Kvw1YgbCYmFH60kAjMd7q8SIjUMcalagEoEEfDdYw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 31 Jan 2026 13:33:29 +0100
Message-Id: <DG2S064XPGXL.1MQDAKWZEK50K@bootlin.com>
Subject: Re: [PATCH v8 05/18] drm/bridge: Move legacy bridge driver out of
 imx directory for multi-platform use
Cc: <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@gmail.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
 <simona@ffwll.ch>, <shawnguo@kernel.org>, <s.hauer@pengutronix.de>,
 <kernel@pengutronix.de>, <festevam@gmail.com>, <inki.dae@samsung.com>,
 <sw0312.kim@samsung.com>, <kyungmin.park@samsung.com>, <krzk@kernel.org>,
 <alim.akhtar@samsung.com>, <jingoohan1@gmail.com>,
 <p.zabel@pengutronix.de>, <hjc@rock-chips.com>, <heiko@sntech.de>,
 <andy.yan@rock-chips.com>, <dmitry.baryshkov@oss.qualcomm.com>,
 <dianders@chromium.org>, <m.szyprowski@samsung.com>,
 <jani.nikula@intel.com>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <imx@lists.linux.dev>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-samsung-soc@vger.kernel.org>, <linux-rockchip@lists.infradead.org>
To: "Damon Ding" <damon.ding@rock-chips.com>, <andrzej.hajda@intel.com>,
 <neil.armstrong@linaro.org>, <rfoss@kernel.org>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.20.1
References: <20251217093321.3108939-1-damon.ding@rock-chips.com>
 <20251217093321.3108939-6-damon.ding@rock-chips.com>
In-Reply-To: <20251217093321.3108939-6-damon.ding@rock-chips.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260131_043355_273778_7C07C506 
X-CRM114-Status: GOOD (  14.29  )
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

Hello Damon, Dmitry,

On Wed Dec 17, 2025 at 10:33 AM CET, Damon Ding wrote:
> As suggested by Dmitry, the DRM legacy bridge driver can be pulled
> out of imx/ subdir for multi-platform use. The driver is also renamed
> to make it more generic and suitable for platforms other than i.MX.
>
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
>
> ---
>
> Changes in v7:
> - Rename legacy-bridge to of-display-mode-bridge.
> - Remove unnecessary API drm_bridge_is_legacy().

...

> --- a/drivers/gpu/drm/bridge/Kconfig
> +++ b/drivers/gpu/drm/bridge/Kconfig
> @@ -244,6 +244,16 @@ config DRM_NXP_PTN3460
>  	help
>  	  NXP PTN3460 eDP-LVDS bridge chip driver.
>
> +config DRM_OF_DISPLAY_MODE_BRIDGE
> +	tristate
> +	depends on DRM_BRIDGE && OF
> +	help
> +	  This is a DRM bridge implementation that uses of_get_drm_display_mode
> +	  to acquire display mode.
> +
> +	  Newer designs should not use this bridge and should use proper panel
> +	  driver instead.

"Newer designs should not use this bridge", but in patch 8 you are
introducing a new use ot devm_drm_of_display_mode_bridge(). Shouldn't you
instead "use proper panel driver instead" in patch 8?

Can you point to the conversation where the converstaion where Dmitry
suggested this change? Maybe it already contains the answer to my
qustion. Also adding a link to that conversation in the commit message
woule be useful.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


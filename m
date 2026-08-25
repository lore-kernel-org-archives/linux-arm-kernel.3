Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB62CC61DBE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 12:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2yDcFU7YsslUI6s0Dtntf8/bFhvQTaYgcIEjyIJGB0I=; b=d2ZLy8UIfEKwUAzB/jR10UfSuW
	EGniMRLEukobLNZ9tNaCX8VXInU2dd7vcr/1tytZr5veRfVP7iXqxBlDw74+jyMBoXSHJwe1x2YBj
	Tft1/K8XbSQ/Jq/GvtT+YmxZ3xdoA37uN4E0Aksi5eU7cGte+xwvfOuNrxUMTacllHtshDXVwX7tS
	XjH7HcXlNMEOzxvUxpoX/S+uIZMR2BTHWY5UceTmoqSd1wZBQT14KsPLy0lD+Iuif3WWQh6VliFyV
	8q8qa50gJoDl1FaUIXl1hJ9zJQQ5071Z5i8AtuD6tcREdNOtAR3hvxL1G+VifeAseaxIu+5mN+ugh
	qg8kf7ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyqCx-00000000lFl-1NB0;
	Tue, 25 Aug 2026 12:24:51 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyqCt-00000000lEo-38QV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 12:24:49 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 3C2564E41337;
	Tue, 25 Aug 2026 12:24:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0C5C6604C4;
	Tue, 25 Aug 2026 12:24:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F292A11C79280;
	Tue, 25 Aug 2026 14:24:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787660682; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=2yDcFU7YsslUI6s0Dtntf8/bFhvQTaYgcIEjyIJGB0I=;
	b=P87jJVC0Zti1STqX290ssqV/pzUf1XngR7Q7TyklmXSh0i10iiGxk6BhwC98BsHLFCFiHm
	S5OrExD0bXmKEhszWji1FvdVKJ/aRtGCM261wMOdspplF1j5NXhjZCRjoZuv0zHZLvNy2H
	39oBQPIchu7z/+K3NvR1btglwETWcmXEBcMDcI1T7yafZ82EpPLPRIDHSR+BwjfQB42/27
	9any3WMzVt9nZ7dzkfttkS61USAbEWU8k/sMZO3dFIaAVWjri0QItY8Vj6pO97iJSieT/f
	mgZTCKpFAWIYEdwelWAENJVUoOqV0grO5eGDNxiyVI7V7c9SdRboggu2jdm5Zg==
Date: Tue, 25 Aug 2026 14:24:32 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Hui Pu
 <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Marek Vasut <marex@denx.de>, Sudarshan
 Shetty <tessolveupstream@gmail.com>, Alexander Stein
 <alexander.stein@ew.tq-group.com>, Esben Haabendal <esben@geanix.com>
Subject: Re: [PATCH v2 05/12] drm/bridge: ti-sn65dsi83: select
 DRM_PANEL_BRIDGE
Message-ID: <20260825142432.7ff10082@bootlin.com>
In-Reply-To: <20260825-drm-bridge-drm_panel-cleanup-v2-5-c6c88ba7ffd2@bootlin.com>
References: <20260825-drm-bridge-drm_panel-cleanup-v2-0-c6c88ba7ffd2@bootlin.com>
	<20260825-drm-bridge-drm_panel-cleanup-v2-5-c6c88ba7ffd2@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_052447_940296_382707ED 
X-CRM114-Status: GOOD (  15.24  )
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

Hi Luca,

On Tue, 25 Aug 2026 12:09:38 +0200
Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:

> This driver uses the drm_panel_bridge API and not the drm_panel API so it
> should select DRM_PANEL_BRIDGE and not DRM_PANEL.
> 
> Cc: Marek Vasut <marex@denx.de>
> Cc: Sudarshan Shetty <tessolveupstream@gmail.com>
> Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
> Cc: Herve Codina <herve.codina@bootlin.com>
> Cc: Esben Haabendal <esben@geanix.com>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  drivers/gpu/drm/bridge/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
> index d46aa2eb01b5..03f52dcbba6f 100644
> --- a/drivers/gpu/drm/bridge/Kconfig
> +++ b/drivers/gpu/drm/bridge/Kconfig
> @@ -461,7 +461,7 @@ config DRM_TI_SN65DSI83
>  	depends on OF
>  	select DRM_KMS_HELPER
>  	select REGMAP_I2C
> -	select DRM_PANEL
> +	select DRM_PANEL_BRIDGE
>  	select DRM_MIPI_DSI
>  	help
>  	  Texas Instruments SN65DSI83 and SN65DSI84 DSI to LVDS Bridge driver
> 

Makes sense on my side.

Reviewed-by: Herve Codina <herve.codina@bootlin.com>

Best regards,
Hervé


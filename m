Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19F42C61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 13:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MnFo6aft2Hia4ynHkRSKrZ6ZoG41Jy7JGffv0qeTE1Q=; b=efqHIXkC41UEraGbxHcB8pHN+i
	JjqRf8AYP9Sa3DsMe9E5ZKMUFdkKxTdgvnnhrdpEidatbzunANxo1z69Po110ctHA0U9SuPPxMN1e
	yX1O+OQJqRhvlPCyWey6GK1EdffIZBtbD1hlUuC5BM1I4jr8eAl/stywKqcEhMt1Y5+3yTcArNNjA
	au+xOZF+RC3m9+zTdqUvBfKgqq2QbZxJBGLU+ZCacHr2bhMJwQiS/m75uk0Oqme7sYdGcfmlkWqv1
	e7+crTW2QrSwHMfX2JgPJ8dExK2tmZ5/qLHy6ElzOLha7uRL84DmyJFnSq4CZJ36o0AzxUKcpDhCc
	vOlEIujQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyrOM-00000000shZ-3kQq;
	Tue, 25 Aug 2026 13:40:42 +0000
Received: from mail-244108.protonmail.ch ([109.224.244.108])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyrOI-00000000sfn-3SW6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 13:40:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=geanix.com;
	s=protonmail; t=1787665230; x=1787924430;
	bh=MnFo6aft2Hia4ynHkRSKrZ6ZoG41Jy7JGffv0qeTE1Q=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=i+uAiirlDwV0kE9TPmjrOowVWrvmeTwymKmn5v5QU118GOCFfc870RiAw8meV6Inr
	 ykxII8GQT7qGuJOLnRZ4bmmqcPlo0Z23VBUMU0He9CQJ+HrbSH0mrIU7cjsT17ecl8
	 Th7egJl7qyAZUg0P2uHvH9cXM9VuRpj1csJEViAlASS7Op385bKgnA16ZWLmdWv6nj
	 T5QYxkBcZNtvrlHdBBM7Yy3zKYrplf49S8ZWd/JTUc3quf6zAjWxh/kjcKS40lsP+f
	 hm4ry+rlz4LuCeeSncMwPcdEzVNwQaAZ6eIKyDx6rWBLEZ4ldhsE1YSvaUedK9LLuV
	 4PAwijYJmuDZQ==
X-Pm-Submission-Id: 4hTpnN1fTNz2Sd57
From: Esben Haabendal <esben@geanix.com>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Cc: "Andrzej Hajda" <andrzej.hajda@intel.com>,  "Neil Armstrong"
 <neil.armstrong@linaro.org>,  "Robert Foss" <rfoss@kernel.org>,  "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>,  "Jonas Karlman"
 <jonas@kwiboo.se>,  "Jernej Skrabec" <jernej.skrabec@gmail.com>,  "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>,  "Maxime Ripard"
 <mripard@kernel.org>,  "Thomas Zimmermann" <tzimmermann@suse.de>,  "David
 Airlie" <airlied@gmail.com>,  "Simona Vetter" <simona@ffwll.ch>,
  "Matthias Brugger" <matthias.bgg@gmail.com>,  "AngeloGioacchino Del
 Regno" <angelogioacchino.delregno@collabora.com>,  "Hui Pu"
 <Hui.Pu@gehealthcare.com>,  "Ian Ray" <ian.ray@gehealthcare.com>,  "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>,
  <dri-devel@lists.freedesktop.org>,  <linux-kernel@vger.kernel.org>,
  <linux-arm-kernel@lists.infradead.org>,
  <linux-mediatek@lists.infradead.org>,  "Marek Vasut" <marex@denx.de>,
  "Sudarshan Shetty" <tessolveupstream@gmail.com>,  "Alexander Stein"
 <alexander.stein@ew.tq-group.com>,  "Herve Codina"
 <herve.codina@bootlin.com>
Subject: Re: [PATCH v2 05/12] drm/bridge: ti-sn65dsi83: select DRM_PANEL_BRIDGE
In-Reply-To: <20260825-drm-bridge-drm_panel-cleanup-v2-5-c6c88ba7ffd2@bootlin.com>
	(Luca Ceresoli's message of "Tue, 25 Aug 2026 12:09:38 +0200")
References: <20260825-drm-bridge-drm_panel-cleanup-v2-0-c6c88ba7ffd2@bootlin.com>
	<COq_BAI4NWaVy-NBuHWUwkkIB1rDDvgFsm6RbFinywA20vsnC6ObH70xZON16F61KkbCk1EW9KyxxQKO5A_LxQ==@protonmail.internalid>
	<20260825-drm-bridge-drm_panel-cleanup-v2-5-c6c88ba7ffd2@bootlin.com>
Date: Tue, 25 Aug 2026 15:40:23 +0200
Message-ID: <87tsoimi7s.fsf@geanix.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_064039_776866_65D60A9B 
X-CRM114-Status: GOOD (  14.38  )
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

"Luca Ceresoli" <luca.ceresoli@bootlin.com> writes:

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
> --
> 2.55.0

Acked-by: Esben Haabendal <esben@geanix.com>


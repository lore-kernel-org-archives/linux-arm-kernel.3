Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53FDCEE642A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 31 Dec 2025 11:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:
	Subject:From:To:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=55XhYgANfix4/exU+jGGVTiGXqeuZF3yQcF00ZiG0dM=; b=CgTjcjOGfY9j9J6TSCiDYhilRM
	sUiiwMPPnIih4j/4w+PPB0W/dVjaab4TfX9uAH4Z2C60kmhzzc7L+caqx9kO1sVegnGQBf1tHippz
	5R/cF+4uZ3VOfYVMMVq6ZTGXIaaLYGAgPGSLjXMJ3oENMqn4nWjajj2paLBaEpUempN4DaYcU+upd
	OQx9jWIA7L4RhcN8R9bc7eJeN3E5O7ZR58CKkqFEJlo8+IwVhJlr9xKLeBnzLWOgqz/Z4nUKovtj+
	zuJczz1/n9VmMo3fFIwku9XZztcG9yI9KjJcMrhdGp3M/Pz4WQP0ZhXctoItjZ0grfmrw1v+wojs0
	ENJ30mYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vau6y-00000005uY5-2xBB;
	Wed, 31 Dec 2025 11:11:28 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vau6v-00000005uXP-35kM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 31 Dec 2025 11:11:27 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 364B51A255B;
	Wed, 31 Dec 2025 11:11:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E455C60744;
	Wed, 31 Dec 2025 11:11:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 23832113B0764;
	Wed, 31 Dec 2025 12:11:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767179480; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=55XhYgANfix4/exU+jGGVTiGXqeuZF3yQcF00ZiG0dM=;
	b=SV1z9pfVtcvrATQfVDliiBBq97NU2utS5KLqyYqYIEj6QCeA4MJLMV0/aD0g5Kgy2ee3tw
	veAPFFUoIjkP14Qn16fce692SQjf3ADHMll9fqtbkPG3bp6oQWbpgBpvzE+wWPpZgT+pXV
	eYO2QQC1jxOxq44S19F4xyBKx0SCOpxb5zQ/ly1kI4hEIm4pb7Sh+yOhXln3rGW02DunPj
	EJQlHqWuVLbsLvvlhtnaoHXIERp1gRaD4S6ql/3Yjzy47tbZM/cCNTPWXT5qCEu53eNF1P
	AAve6YLAB9fWQWUp/Yu9yIzJrpJV1l1SZdgRcIuzp8Ez1v7p1prS1R34TIwyLw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 31 Dec 2025 12:11:08 +0100
Message-Id: <DFCCU8AN0GZQ.2CYTKKV40JYLI@bootlin.com>
To: "Damon Ding" <damon.ding@rock-chips.com>, <andrzej.hajda@intel.com>,
 <neil.armstrong@linaro.org>, <rfoss@kernel.org>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v8 04/18] drm/bridge: analogix_dp: Add
 &analogix_dp_plat_data.next_bridge
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
X-Mailer: aerc 0.20.1
References: <20251217093321.3108939-1-damon.ding@rock-chips.com>
 <20251217093321.3108939-5-damon.ding@rock-chips.com>
In-Reply-To: <20251217093321.3108939-5-damon.ding@rock-chips.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251231_031125_900608_3A2D927A 
X-CRM114-Status: GOOD (  15.92  )
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

Hello Damon,

On Wed Dec 17, 2025 at 10:33 AM CET, Damon Ding wrote:
> In order to move the panel/bridge parsing and attachmenet to the
> Analogix side, add component struct drm_bridge *next_bridge to
> platform data struct analogix_dp_plat_data.
>
> The movement makes sense because the panel/bridge should logically
> be positioned behind the Analogix bridge in the display pipeline.
>
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
>
> ---
>
> Changes in v4:
> - Rename the &analogix_dp_plat_data.bridge to
>   &analogix_dp_plat_data.next_bridge
> ---
>  include/drm/bridge/analogix_dp.h | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/include/drm/bridge/analogix_dp.h b/include/drm/bridge/analog=
ix_dp.h
> index cf17646c1310..582357c20640 100644
> --- a/include/drm/bridge/analogix_dp.h
> +++ b/include/drm/bridge/analogix_dp.h
> @@ -27,6 +27,7 @@ static inline bool is_rockchip(enum analogix_dp_devtype=
 type)
>  struct analogix_dp_plat_data {
>  	enum analogix_dp_devtype dev_type;
>  	struct drm_panel *panel;
> +	struct drm_bridge *next_bridge;
>  	struct drm_encoder *encoder;
>  	struct drm_connector *connector;
>  	bool skip_connector;

It took a while to understand why you are adding the next_bridge pointer in
struct analogix_dp_plat_data instead of struct analogix_dp_device, where it
would be more natural. I found an answer in patch 16: with current code you
need to place next_bridge in struct analogix_dp_plat_data because it is
used by user drivers to attach, and those drivers have no access to struct
analogix_dp_device. However patch 16 (which looks a very good cleanup BTW)
next_bridge can be moved to struct analogix_dp_device.

So I'd suggest to move patch 16 before this one if it easily doable, so
that you can introduce next_bridge in struct analogix_dp_device from the
beginning. Should that be impossible, you can send a separate patch to move
next_bridge, after patch 16.

Best regards,
Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


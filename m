Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ADECC624D0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 18:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1PLOUFt01bjv3+FnDvD0W41z4VX4dqbmzqYLUhSV+HA=; b=20izUTRXSJCigOIcAzZWr6/XWD
	D6jpoOdq1mBxph+NPtIwLywz64gP3bpJujJQ966GzTbBIIqkEzHzn3GMeSCY588UH6pXDM7WVC5FR
	HS3FgTOaW4qT/p0xjeuApwNnAtx01aC8zI3jMpQ17hkrAnce81Khak05pdouUyNvH3Gq7wOVnbGFp
	jFrhyJmj/cIC288lTFjTLVAUrVT9UZrU0/wcISVPxOy5LobfCMU4f/MrSn7aceG1Cpwwhk+ruU9L5
	ofdorpIIZBcK0WL/FH7uBD0Ioj718Sx5nDsojkAfQZO49T3KxboGZCBPnX5/YZlhxw8DEYRBgxP6D
	mQA6dFZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1TaS-0000000D2Nd-35uy;
	Tue, 01 Sep 2026 18:52:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1TZc-0000000D16R-3EV0;
	Tue, 01 Sep 2026 18:51:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=1PLOUFt01bjv3+FnDvD0W41z4VX4dqbmzqYLUhSV+HA=; b=Oo+9PFHc0r5RK0AouJOgaiSa+9
	tuL/974ErYz9/8yD+OfYQil1xe4ZvRyBhTb+xw67VtZogFXuWdw/7d/RLOVNhJc/SlfH9/JwhH0nJ
	WY4j1KxHI2fxWkbSqFrRWKt8RjsFwVRNlK23YG0yFyvZQ06BdecTS6fS2X47gU4fc51CGyPehsyGD
	34skXXOw9usvOgj+hixtddJ5vYRCjtDHDgCkiwiEpJFdUM/T8+BcJbVSBBqA3X4FhqJx3SA+sp634
	ULncw4FOrxJRmteAiPK68ysIOTD2I3cB9sRae/yZQXhyWMDZ/3zHJf8VWU7map1rbrPPKRJO7bDIy
	hy8BVFlw==;
Received: from bali.collaboradmins.com ([148.251.105.195])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x1TZZ-0000000BHKo-2Qnx;
	Tue, 01 Sep 2026 18:51:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1788288657;
	bh=s7nfXrufCSMgabRiLlCwtS5BY0Y5rXZc77iLgoU2ACk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=o0Fmo9JU/JHC/s3aTSbVAAFV2mAg12KyJpFmlQQE0iu+VggsX+WT3eK4Z72zJujOJ
	 5Qd4v14DiYBQa8/GXRnZK14qcClbR8zkvrMtXVSClLtV6uCfqKfXycVfW4o+m6s0gs
	 Mdwy+kr67mATafCZGV54ZX2fCQcOKaEWNQ97SvRy1r7ntrvFYItwO8eniwgoYU60mG
	 k5gCtoNCWuZeizG8+pJ5a/nqRrKrR33nR1fhyw2KWerJMbcT7pwIdHrnqPqX4f1T3x
	 HHPvWB5OQfO8JkNwo+GjS7+jzUPi4K7oz/06iVFjKMTP7j3CdsW+cuqNZm+Mz6h/Gu
	 dsrFvAs7xnWgw==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6BC0317E38D2;
	Tue, 01 Sep 2026 20:50:57 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 01 Sep 2026 21:50:46 +0300
Subject: [PATCH v11 22/74] drm/display: hdmi-state-helper: Add
 drm_atomic_helper_connector_hdmi_force_ctx()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-dw-hdmi-qp-scramb-v11-22-bc12954a0688@collabora.com>
References: <20260901-dw-hdmi-qp-scramb-v11-0-bc12954a0688@collabora.com>
In-Reply-To: <20260901-dw-hdmi-qp-scramb-v11-0-bc12954a0688@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Chen-Yu Tsai <wens@kernel.org>, 
 Samuel Holland <samuel@sholland.org>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Raphael Gallais-Pou <rgallaispou@gmail.com>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, Algea Cao <algea.cao@rock-chips.com>, 
 Daniel Stone <daniels@collabora.com>, Liu Ying <victor.liu@nxp.com>, 
 Phong LE <ple@baylibre.com>, Helge Deller <deller@gmx.de>
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-rockchip@lists.infradead.org, 
 linux-fbdev@vger.kernel.org
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_195105_759373_BE630AB5 
X-CRM114-Status: GOOD (  11.43  )
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

Introduce drm_atomic_helper_connector_hdmi_force_ctx() as the HDMI
connector implementation of the .force_ctx() callback.  It receives the
modeset acquire context, allowing it to take additional locks, e.g. to
support SCDC status synchronization.

Since migrating from the .force() callback is somewhat more involved,
its users will be migrated incrementally, after which
drm_atomic_helper_connector_hdmi_force() will be removed.

Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/display/drm_hdmi_state_helper.c | 21 +++++++++++++++++++++
 include/drm/display/drm_hdmi_state_helper.h     |  2 ++
 2 files changed, 23 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
index 485fcca2de4b..8045b1d17d6e 100644
--- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
@@ -1424,3 +1424,24 @@ void drm_atomic_helper_connector_hdmi_force(struct drm_connector *connector)
 	drm_atomic_helper_connector_hdmi_update(connector, NULL, connector->status);
 }
 EXPORT_SYMBOL(drm_atomic_helper_connector_hdmi_force);
+
+/**
+ * drm_atomic_helper_connector_hdmi_force_ctx - HDMI Connector implementation
+ * of the force_ctx callback
+ * @connector: A pointer to the HDMI connector
+ * @ctx: Lock acquisition context to be used for resetting CRTC
+ *
+ * This function implements the .force_ctx() callback for the HDMI connectors.
+ * It can either be used directly as the callback or should be called from
+ * within the .force_ctx() callback implementation to maintain the HDMI-specific
+ * connector's data.
+ *
+ * Returns:
+ * Zero on success, error code on failure, including -EDEADLK.
+ */
+int drm_atomic_helper_connector_hdmi_force_ctx(struct drm_connector *connector,
+					       struct drm_modeset_acquire_ctx *ctx)
+{
+	return drm_atomic_helper_connector_hdmi_update(connector, ctx, connector->status);
+}
+EXPORT_SYMBOL(drm_atomic_helper_connector_hdmi_force_ctx);
diff --git a/include/drm/display/drm_hdmi_state_helper.h b/include/drm/display/drm_hdmi_state_helper.h
index 2439bad15c4b..965342f6bbc9 100644
--- a/include/drm/display/drm_hdmi_state_helper.h
+++ b/include/drm/display/drm_hdmi_state_helper.h
@@ -28,6 +28,8 @@ int drm_atomic_helper_connector_hdmi_hotplug(struct drm_connector *connector,
 					     struct drm_modeset_acquire_ctx *ctx,
 					     enum drm_connector_status status);
 void drm_atomic_helper_connector_hdmi_force(struct drm_connector *connector);
+int drm_atomic_helper_connector_hdmi_force_ctx(struct drm_connector *connector,
+					       struct drm_modeset_acquire_ctx *ctx);
 
 enum drm_mode_status
 drm_hdmi_connector_mode_valid(struct drm_connector *connector,

-- 
2.55.0



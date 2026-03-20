Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F57310987A5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 16:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+0nzKHd4TEOVW1JhMBjHJxIJizZLuJd8rMvZvuy+jLM=; b=rTztLbOxSYy2no37hJdEE4G8HG
	GAhVC9W52Y8R+t6/k4mzNuWRrNlUvClNDDccr6ev/akNUnxsn6aUJtS6QwNgGDv4tu5zY7smgmFu2
	GihkDO5I6ixIBtinWphpilJnvlpJnq66qasKeUQu5T0/EkyMqrOt/jEdu2SV2FPKJNjigu5DDoQZP
	GGCRAso1YOlV5gLKWTGrwyLjR080LU7UYHASEX5Tjj9laeiE7oStKhYtNxgToa0DnNd4b2DZZCDDY
	A/7Uvl/DPZHqob5j+MdhUIwzZo3REJ1g4A3aavHUSxkZ6DImSh/9AQeHXgclAhZnz7NZCQDv+znmc
	vVoUuRTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3chD-0000000D7cP-0IFy;
	Fri, 20 Mar 2026 16:27:35 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3ch9-0000000D7aO-0Jle
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 16:27:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6781B6015B;
	Fri, 20 Mar 2026 16:27:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93F5BC2BC87;
	Fri, 20 Mar 2026 16:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774024050;
	bh=lNZetqlAlYsCQ3l8SXsI36D+xpB6Any31LXspuuaXTY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Ri/l4I5G4LL3GavyOmxNz9RMdGVF7KmPJP+UamcEAbb9MFzJPhczb9G6vD0i0kXmh
	 1OcFjDxKZHEE6mUTjbGmTdo6nqeMbC+YFl6CHx8HrMAyvkbXxiaFbhRrNBHbsvpSVN
	 mSgvaD78N0ox/V5NCMWqPeZpTp2l19Jw+RcsCuBCXanC+AorwkZNt3RNMVi53GwCr1
	 yftkUn/wsQ/wmsgnh7ES2o4S/Z9a/K6Mu9vHwlxIPuZxxJVEthKnE8V2yKOyFTuHzn
	 Qb5P8Xy2eV/YZQEsHgWz/occy5+r+I71AOHJ8bIPLsSezBI5TjmShjAmcnHoRkmdZH
	 M9QvbbU+HVOsQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Fri, 20 Mar 2026 17:27:08 +0100
Subject: [PATCH v2 01/20] drm/colorop: Fix typos in the doc
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260320-drm-mode-config-init-v2-1-c63f1134e76c@kernel.org>
References: <20260320-drm-mode-config-init-v2-0-c63f1134e76c@kernel.org>
In-Reply-To: <20260320-drm-mode-config-init-v2-0-c63f1134e76c@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Jyri Sarha <jyri.sarha@iki.fi>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Simon Ser <contact@emersion.fr>, Harry Wentland <harry.wentland@amd.com>, 
 Melissa Wen <mwen@igalia.com>, Sebastian Wick <sebastian.wick@redhat.com>, 
 Alex Hung <alex.hung@amd.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, Chen-Yu Tsai <wens@kernel.org>, 
 Samuel Holland <samuel@sholland.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Daniel Stone <daniels@collabora.com>, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2296; i=mripard@kernel.org;
 h=from:subject:message-id; bh=lNZetqlAlYsCQ3l8SXsI36D+xpB6Any31LXspuuaXTY=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDJl7S1O+FtmvStxgxlMUbJckrn03YslMh3OF18JKTyoEB
 s6ftelmx1QWBmFOBlkxRZYnMmGnl7cvrnKwX/kDZg4rE8gQBi5OAZjIVgXGhg3n7gq/ij3rd/Tu
 urtp1w5r6zT+0a3k0zlj09aaLzdtxaVbBtM1O+NKXv9h2zRt0Yev5Yw1fO8b3IO6MwyiHQqVLfX
 EPk/brPs90+sC28yNVyISO3dV8/Mu0V61VfNy31d/jx8L/z8HAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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

In the documentation of drm_colorop introduced by commit cfc27680ee20
("drm/colorop: Introduce new drm_colorop mode object"), the
documentation of __drm_colorop_state_reset() and __drm_colorop_reset()
were mentioning CRTC when they really meant colorop, probably due to
copy and paste.

Fixes: cfc27680ee20 ("drm/colorop: Introduce new drm_colorop mode object")
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_colorop.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
index 566816e3c6f0c7d172534966fcfe56982e6505f3..373cd0ddb8fd4478874509ed12c95451c1f66203 100644
--- a/drivers/gpu/drm/drm_colorop.c
+++ b/drivers/gpu/drm/drm_colorop.c
@@ -503,11 +503,11 @@ void drm_colorop_atomic_destroy_state(struct drm_colorop *colorop,
  * __drm_colorop_state_reset - resets colorop state to default values
  * @colorop_state: atomic colorop state, must not be NULL
  * @colorop: colorop object, must not be NULL
  *
  * Initializes the newly allocated @colorop_state with default
- * values. This is useful for drivers that subclass the CRTC state.
+ * values. This is useful for drivers that subclass the colorop state.
  */
 static void __drm_colorop_state_reset(struct drm_colorop_state *colorop_state,
 				      struct drm_colorop *colorop)
 {
 	u64 val;
@@ -526,14 +526,14 @@ static void __drm_colorop_state_reset(struct drm_colorop_state *colorop_state,
 /**
  * __drm_colorop_reset - reset state on colorop
  * @colorop: drm colorop
  * @colorop_state: colorop state to assign
  *
- * Initializes the newly allocated @colorop_state and assigns it to
- * the &drm_crtc->state pointer of @colorop, usually required when
- * initializing the drivers or when called from the &drm_colorop_funcs.reset
- * hook.
+ * Initializes the newly allocated @colorop_state and assigns it to the
+ * &drm_colorop->state pointer of @colorop, usually required when
+ * initializing the drivers or when called from the
+ * &drm_colorop_funcs.reset hook.
  *
  * This is useful for drivers that subclass the colorop state.
  */
 static void __drm_colorop_reset(struct drm_colorop *colorop,
 				struct drm_colorop_state *colorop_state)

-- 
2.53.0



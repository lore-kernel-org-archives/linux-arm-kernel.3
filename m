Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E127CC6B12
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 22:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P/i4dUPN3aN2IgixpKjGT3nzBaX8eT2Yvo5TQQCFDZ8=; b=t7Lx7zB67bi2vv+GE75kzvjBy9
	U4oZBIO+uUrprbyUe9ICz4TOWla3b0YZmA7YP+20lFHEvpojt0ZYgDz1pw8gBGNDkUdKGUneQAimO
	wQcp7icGGklqkwBaM7huvj7dH7fS6w9XiQqgQZUd2aunZllnp8kN4SkYS4Z9khbZmMAsHomzpEGgN
	XxrWoZdc2V7GC/OaFZ6EpP189rNKrymEfvy+0dnIcP1BXMf/BgkL082L2mQf6HrkX0ep+kjSKw5jL
	8dMqNxLDeLOoikkka9ntaFiuwBDr85XDUmrrCofgFluKzhTfOB2/LtI5KJWnuNHxCrz52+XFshSbf
	rboe5pcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGlM6-0000000EBBM-27fI;
	Tue, 13 Oct 2026 22:52:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGlLo-0000000EB1h-2vMT;
	Tue, 13 Oct 2026 22:52:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=P/i4dUPN3aN2IgixpKjGT3nzBaX8eT2Yvo5TQQCFDZ8=; b=Zj/wPVWj7DGqj9AbdNF5xNxb8B
	cKyOxy8rBrgXvi4N+MFPRj2tpOIEQBYMwSjSeUyzum6DB3s5jiFXhYwZNAxNhFAbblC0Slfr+G6y6
	ek13TsOmmDtpYZzIPKGi55ZekuKITaCtLqu0JKNeFE+O4jvsx5AsbDw9u9rtVBwGhbHwlkc1rbDIl
	dslDSHvR+DcLvhgCNfro3/t6oMrTHenynGDVDrr4fxfNLrhGpETPPWnwu2M2YZz5z/ukW8R4wGffg
	SWvObyfxw8rcyhJaM9tUDvvOyVIz30qFy1qBsr6a+oVyyCLzh6V86miSgA1kGYgu8c8/Yby4qv0ZP
	fhw+ICig==;
Received: from bali.collaboradmins.com ([148.251.105.195])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xGlLk-0000000GAm3-2HnH;
	Tue, 13 Oct 2026 22:52:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1791931912;
	bh=hvWdJ69mM+J4kuIJVLecF3GZlHnrtRwAfhlvCxEoTvM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=DwSTBTR7mEnpATJYkkEKIwVcEr37n2KuoHdOlGWQ9LdcY4r8Yl5ATwKeAJbLwugH+
	 xxPcEd/Xv8rquPEHs+IWS1TFocIpOW0MT7eQPj90Q+YYBRGkSpDySGnkNu3Kary/sp
	 F6mwdnhcrFQ8xsBBBzTzIGGyanG13bfJVDNJFPr1kc3pZ/23F+/RQpVQEg25qM788f
	 wPc+4nuCxNV48ayEpADZoI4mGfzG4i10Ztav7BTn0cBjHvClOzDUh/M/oJujlljURc
	 g6iaJxOPvqE6vD5J0UydgL1vahXQC2NVLPmvFqG7J6MAUFQlC79l3wediM7Pyi73so
	 TfjJoFLGcLXrQ==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CE74D17E0C98;
	Wed, 14 Oct 2026 00:51:52 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Wed, 14 Oct 2026 01:51:20 +0300
Subject: [PATCH v5 03/15] drm/rockchip: vop2: Balance state on
 atomic_enable() error paths
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-dw-hdmi-qp-yuv-v5-3-6fab0fe43a9b@collabora.com>
References: <20261014-dw-hdmi-qp-yuv-v5-0-6fab0fe43a9b@collabora.com>
In-Reply-To: <20261014-dw-hdmi-qp-yuv-v5-0-6fab0fe43a9b@collabora.com>
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Daniel Stone <daniels@collabora.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Daniel Stone <daniel@fooishbar.org>, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: kernel@collabora.com, Andy Yan <andyshrk@163.com>, 
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>, 
 Igor Paunovic <royalnet026@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_235201_294491_DD2B7B8A 
X-CRM114-Status: GOOD (  17.40  )
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

vop2_crtc_atomic_enable() prepares vp->dclk and, for the first CRTC,
calls vop2_enable(), incrementing the shared vop2->enable_count before
programming VOP2 registers.  Two later failure points return early with
only vop2_unlock(), leaking the dclk prepare, the enable_count
increment, and the core clocks / PM runtime reference from
vop2_enable().

Since the disable path decrements enable_count unconditionally, the
leaked increment skews the count, causing an underflow or premature
shutdown of core clocks and PM runtime while another CRTC is active.

Moreover, cleaning up on the enable error paths alone is insufficient.
A CRTC whose atomic_enable() bailed is still committed as active, so
vop2_crtc_atomic_disable() still runs its full teardown, releasing the
same dclk prepare and enable_count a second time, thus underflowing both
counts and, where vop2_enable() ran, touching VOP registers with core
clocks gated.

Fix this by reverting exactly what was set up on failure, and track the
per-VP bring-up state so atomic_disable() skips teardown when
atomic_enable() never completed.  Additionally, ensure any further
hardware programming is also skipped within the affected RPM commit
tail, i.e. in the callbacks gated by drm_atomic_helper_commit_planes():
vop2_crtc_atomic_begin(), vop2_plane_atomic_update{update|disable}() and
vop2_crtc_atomic_flush().

Fixes: 604be85547ce ("drm/rockchip: Add VOP2 driver")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260623202043.8BFE21F000E9@smtp.kernel.org/
Link: https://lore.kernel.org/all/20260623202043.8BFE21F000E9@smtp.kernel.org/
Tested-by: Igor Paunovic <royalnet026@gmail.com>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 68 ++++++++++++++++++++++------
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.h |  6 +++
 2 files changed, 59 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index e0caea93a896..36384f029ef7 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -1033,6 +1033,9 @@ static void vop2_crtc_atomic_disable(struct drm_crtc *crtc,
 
 	vop2_lock(vop2);
 
+	if (!vp->enabled)
+		goto out_unlock;
+
 	old_crtc_state = drm_atomic_get_old_crtc_state(state, crtc);
 	drm_atomic_helper_disable_planes_on_crtc(old_crtc_state, false);
 
@@ -1063,11 +1066,14 @@ static void vop2_crtc_atomic_disable(struct drm_crtc *crtc,
 
 	clk_disable_unprepare(vp->dclk);
 
+	vp->enabled = false;
+
 	vop2->enable_count--;
 
 	if (!vop2->enable_count)
 		vop2_disable(vop2);
 
+out_unlock:
 	vop2_unlock(vop2);
 
 	if (crtc->state->event && !crtc->state->active) {
@@ -1197,13 +1203,21 @@ static void vop2_plane_atomic_disable(struct drm_plane *plane,
 	struct drm_plane_state *old_pstate = NULL;
 	struct vop2_win *win = to_vop2_win(plane);
 	struct vop2 *vop2 = win->vop2;
+	struct vop2_video_port *vp;
 
 	drm_dbg(vop2->drm, "%s disable\n", win->data->name);
 
 	if (state)
 		old_pstate = drm_atomic_get_old_plane_state(state, plane);
-	if (old_pstate && !old_pstate->crtc)
-		return;
+
+	if (old_pstate) {
+		if (!old_pstate->crtc)
+			return;
+
+		vp = to_vop2_video_port(old_pstate->crtc);
+		if (!vp->enabled)
+			return;
+	}
 
 	vop2_win_disable(win);
 	vop2_win_write(win, VOP2_WIN_YUV_CLIP, 0);
@@ -1298,6 +1312,9 @@ static void vop2_plane_atomic_update(struct drm_plane *plane,
 	if (WARN_ON(!crtc))
 		return;
 
+	if (!vp->enabled)
+		return;
+
 	if (!pstate->visible) {
 		vop2_plane_atomic_disable(plane, state);
 		return;
@@ -1803,8 +1820,11 @@ static void vop2_crtc_atomic_enable(struct drm_crtc *crtc,
 		return;
 	}
 
-	if (!vop2->enable_count)
-		vop2_enable(vop2);
+	if (!vop2->enable_count) {
+		ret = vop2_enable(vop2);
+		if (ret)
+			goto err_unprepare_dclk;
+	}
 
 	vop2->enable_count++;
 
@@ -1831,10 +1851,8 @@ static void vop2_crtc_atomic_enable(struct drm_crtc *crtc,
 		clock = vop2->ops->setup_intf_mux(vp, rkencoder->crtc_endpoint_id, polflags);
 	}
 
-	if (!clock) {
-		vop2_unlock(vop2);
-		return;
-	}
+	if (!clock)
+		goto err_put_enable_count;
 
 	if (vcstate->output_mode == ROCKCHIP_OUT_MODE_AAAA &&
 	    !(vp_data->feature & VOP2_VP_FEATURE_OUTPUT_10BIT))
@@ -1852,8 +1870,7 @@ static void vop2_crtc_atomic_enable(struct drm_crtc *crtc,
 		default:
 			drm_err(vop2->drm, "Unknown DRM_MODE_CONNECTOR %d\n",
 				vcstate->output_type);
-			vop2_unlock(vop2);
-			return;
+			goto err_put_enable_count;
 		}
 	else
 		out_mode = vcstate->output_mode;
@@ -1965,6 +1982,18 @@ static void vop2_crtc_atomic_enable(struct drm_crtc *crtc,
 
 	drm_crtc_vblank_on(crtc);
 
+	vp->enabled = true;
+
+	vop2_unlock(vop2);
+
+	return;
+
+err_put_enable_count:
+	if (!--vop2->enable_count)
+		vop2_disable(vop2);
+
+err_unprepare_dclk:
+	clk_disable_unprepare(vp->dclk);
 	vop2_unlock(vop2);
 }
 
@@ -2023,6 +2052,9 @@ static void vop2_crtc_atomic_begin(struct drm_crtc *crtc,
 	struct vop2_video_port *vp = to_vop2_video_port(crtc);
 	struct vop2 *vop2 = vp->vop2;
 
+	if (!vp->enabled)
+		return;
+
 	vop2->ops->setup_overlay(vp);
 }
 
@@ -2034,13 +2066,19 @@ static void vop2_crtc_atomic_flush(struct drm_crtc *crtc,
 	struct vop2_video_port *vp = to_vop2_video_port(crtc);
 	struct vop2 *vop2 = vp->vop2;
 
-	/* In case of modeset, gamma lut update already happened in atomic enable */
-	if (!drm_atomic_crtc_needs_modeset(crtc_state) && crtc_state->color_mgmt_changed)
-		vop2_crtc_atomic_try_set_gamma_locked(vop2, vp, crtc, crtc_state);
+	if (vp->enabled) {
+		/*
+		 * In case of modeset, gamma lut update already happened
+		 * in atomic enable.
+		 */
+		if (!drm_atomic_crtc_needs_modeset(crtc_state) &&
+		    crtc_state->color_mgmt_changed)
+			vop2_crtc_atomic_try_set_gamma_locked(vop2, vp, crtc, crtc_state);
 
-	vop2_post_config(crtc, false, crtc_state, old_crtc_state);
+		vop2_post_config(crtc, false, crtc_state, old_crtc_state);
 
-	vop2_cfg_done(vp);
+		vop2_cfg_done(vp);
+	}
 
 	spin_lock_irq(&crtc->dev->event_lock);
 
diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
index ffcb39c130aa..b209b2d5b96d 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
@@ -243,6 +243,12 @@ struct vop2_video_port {
 
 	struct completion dsp_hold_completion;
 
+	/**
+	 * @enabled: CRTC fully brought up by atomic_enable(); allows
+	 * atomic_disable() to skip teardown after a failed enable.
+	 */
+	bool enabled;
+
 	/**
 	 * @win_mask: Bitmask of windows attached to the video port;
 	 */

-- 
2.55.0



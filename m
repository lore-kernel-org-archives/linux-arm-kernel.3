Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 913C4606B454
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 15:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AphJZ938;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=bkMTTc0C
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=kvRRQf3VcesMtWRZn4Vf9PO7/HvfnDGh4n87CLoKzo8=; b=AphJZ938of8heH
	Rxxouj38LhAXl/MbHDgLvlNHMqFcT+TL8E2zY23gfsk4gaf7tBfWLu50+YR+GbiIoA7DCyF58RP8P
	EaF8d6QR5p5nNa/J8l0JBQVh1HVuXJpRtNc2w0/RDYDEzFevz+pLE269h1Q3MEAulaNnKkPhfW9Ch
	u4cLku074zPWtLkL+tXFsDx5Z88FpfbbLrbBQ3v1TYzCD26VeyxjEzVhKTwRA84vQHB3X1pvGhpfl
	7JkoNpVFEqYnA50wGa5in3dEXw92GXUm592kxbERkzHGt82balS++DPwZc3vYCDQW+ollYzDVzG2y
	5b0G7VksIJxVI9TIhkjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOzrb-00000009Vr7-0HRi;
	Thu, 05 Nov 2026 15:58:56 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOzor-00000009UNX-0M0f;
	Thu, 05 Nov 2026 15:56:29 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1793894079; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=aJ7rmfyGsSMUWL0bW4IGNGVeoVmgY+HVIHrdM29w1CX2wyVcV79YQ3DlmWCexZkvm2XBmvgZw7OYdVumjY1R0gq5yIHtAg5vqFfE8bAwzJce91HVVEA4/ToOJQDC9iHtslVVTHxU8rnGHselngCiNGPJlt4o2lgb5c1Mqu2kwRM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1793894079; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=kvRRQf3VcesMtWRZn4Vf9PO7/HvfnDGh4n87CLoKzo8=; 
	b=djOpCFkXSVSb4A8FP5w5t1YhjjkSHo3GKwtBSWW3gRT8ltN4++rpc776ouzoh81lwJGXxbiK2FphxDaQ/9xawHT+ajg0E+UXE5neUZmhHWEBPgLHHqamBsX68vwsgBX998vSDhBodtXtBL3Y6J+c3v6oUJEF1INsEfLkKRVmbTo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: a=rsa-sha256; b=bkMTTc0CZLul8RwtiQ6lhaUiwM90P/4gpGOtx+M3J7y7/kjg1tv5TJ0ywFDfjCxPV4zh9+RE32Mgxll3fCxj8zwJInqqLxxWCG7gDTnnMB4PibdyDuyDI/hJsKoVbhXxzq7ZwzoENLZ/yN9oJj68nf60qAKj6PyNxBLkT+ggGzg=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=kvRRQf3VcesMtWRZn4Vf9PO7/HvfnDGh4n87CLoKzo8=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1793894078714173.08349557102235;
	Thu, 5 Nov 2026 07:54:38 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Thu, 05 Nov 2026 16:52:11 +0100
Subject: [PATCH v2 20/27] drm/connector: hdmi: Add QMS state validation and
 computation
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-vrr-limiter-uapi-v2-20-55f4215be2c2@collabora.com>
References: <20261105-vrr-limiter-uapi-v2-0-55f4215be2c2@collabora.com>
In-Reply-To: <20261105-vrr-limiter-uapi-v2-0-55f4215be2c2@collabora.com>
To: Xaver Hugl <xaver.hugl@gmail.com>, Vidith Madhu <vmadhu@nvidia.com>, 
 "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>, 
 Leo Li <sunpeng.li@amd.com>, Harry Wentland <harry.wentland@amd.com>, 
 Fangzhi Zuo <Jerry.Zuo@amd.com>, Daniel Stone <daniels@collabora.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Helge Deller <deller@gmx.de>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andyshrk@163.com>, 
 =?utf-8?q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-fbdev@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com, 
 Derek Foreman <derek.foreman@collabora.com>, 
 wayland-devel@lists.freedesktop.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_075618_157242_FBD759C7 
X-CRM114-Status: GOOD (  20.85  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add the necessary code to the HDMI state helpers' hdmi_validate_vrr
function in order to check and derive the state necessary for HDMI Quick
Media Switching (QMS) support.

Co-developed-by: Derek Foreman <derek.foreman@collabora.com>
Signed-off-by: Derek Foreman <derek.foreman@collabora.com>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/display/drm_hdmi_state_helper.c | 112 +++++++++++++++++++++++-
 1 file changed, 109 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
index 407ad28c649f..ba290eea7390 100644
--- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
@@ -2,6 +2,7 @@
 
 #include <linux/debugfs.h>
 #include <linux/export.h>
+#include <linux/gcd.h>
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_connector.h>
@@ -954,6 +955,26 @@ hdmi_generate_infoframes(const struct drm_connector *connector,
 	return 0;
 }
 
+static const struct {
+	u8 tfr_byte;
+	u32 rate_n;
+	u32 rate_d;
+} hdmi_qms_tfrs[] = {
+	{ 1, 24000, 1001 },
+	{ 2, 24, 1 },
+	{ 3, 25, 1 },
+	{ 4, 30000, 1001 },
+	{ 5, 30, 1 },
+	{ 6, 48000, 1001 },
+	{ 7, 48, 1 },
+	{ 8, 50, 1 },
+	{ 9, 60000, 1001 },
+	{ 10, 60, 1 },
+	{ 11, 100, 1 },
+	{ 12, 120000, 1001 },
+	{ 13, 120, 1 },
+};
+
 /**
  * cmp_fraction - compares two fractional numbers
  * @a: numerator of the first fraction
@@ -992,6 +1013,66 @@ static int cmp_fraction(u32 a, u32 b, u32 c, u32 d)
 	return 0;
 }
 
+/**
+ * hdmi_validate_qms - Validate HDMI QMS state
+ * @crtc_state: pointer to a &struct drm_crtc_state to run validation on
+ * @info: pointer to a &struct drm_display_info of the accompanying connector
+ *
+ * Validate that the drm_crtc_vrr_state.vrr_min_numerator and
+ * drm_crtc_vrr_state.vrr_min_denominator are acceptable for HDMI QMS, and check
+ * that the display is HDMI QMS capable.
+ *
+ * Returns:
+ *  - Negative errno on failure
+ *  - the corresponding QMS signaling byte for the target frame rate otherwise
+ */
+static int hdmi_validate_qms(struct drm_crtc_state *crtc_state,
+			     struct drm_connector_state *conn_state,
+			     const struct drm_display_info *info)
+{
+	u32 rate_n = crtc_state->vrr_state.vrr_min_n;
+	u32 rate_d = crtc_state->vrr_state.vrr_min_d;
+	u32 min_rate_n, max_rate;
+	u32 g, i;
+
+	if (conn_state->vrr_display_mode != VRR_DISPLAY_MODE_MEDIA)
+		return 0;
+
+	if (!drm_crtc_helper_vrr_is_fixed_rate(&crtc_state->vrr_state))
+		return -EINVAL;
+
+	if (info->hdmi.vrr_cap.qms_tfr_min)
+		min_rate_n = 24000;
+	else
+		min_rate_n = info->hdmi.vrr_cap.vrr_min * 1000;
+
+	if (info->hdmi.vrr_cap.qms_tfr_max)
+		max_rate = info->hdmi.vrr_cap.vrr_max;
+	else
+		max_rate = 60;
+
+	g = gcd(rate_n, rate_d);
+	if (g != 1) {
+		rate_n /= g;
+		rate_d /= g;
+	}
+
+	if (!rate_d)
+		return -EINVAL;
+
+	for (i = 0; i < ARRAY_SIZE(hdmi_qms_tfrs); i++) {
+		if (cmp_fraction(min_rate_n, 1001, hdmi_qms_tfrs[i].rate_n,
+				 hdmi_qms_tfrs[i].rate_d) > 0)
+			continue;
+		if (rate_n == hdmi_qms_tfrs[i].rate_n &&
+		    rate_d == hdmi_qms_tfrs[i].rate_d &&
+		    cmp_fraction(rate_n, rate_d, max_rate, 1) <= 0)
+			return hdmi_qms_tfrs[i].tfr_byte;
+	}
+
+	return -EINVAL;
+}
+
 static int hdmi_calculate_vtotal(const struct drm_display_mode *mode,
 				 u32 rate_n, u32 rate_d, u16 *out_vtotal,
 				 u32 *out_denom, u32 *out_frame_err)
@@ -1129,8 +1210,17 @@ static int hdmi_validate_vrr(struct drm_connector *connector,
 	if (old_conn_state)
 		old_crtc_state = drm_atomic_get_old_crtc_state(state, old_conn_state->crtc);
 
-	if (!info->hdmi.vrr_cap.supported)
-		return -EOPNOTSUPP;
+	switch (new_conn_state->vrr_display_mode) {
+	case VRR_DISPLAY_MODE_GAME:
+		if (!info->hdmi.vrr_cap.supported)
+			return -EOPNOTSUPP;
+		break;
+	case VRR_DISPLAY_MODE_MEDIA:
+		if (!info->hdmi.vrr_cap.qms_capable ||
+		    !connector->hdmi.qms_supported)
+			return -EOPNOTSUPP;
+		break;
+	}
 
 	mode_refresh = drm_mode_vrefresh(mode);
 
@@ -1145,7 +1235,10 @@ static int hdmi_validate_vrr(struct drm_connector *connector,
 		max_vfreq_n = mode_refresh;
 
 	is_fixed = drm_crtc_helper_vrr_is_fixed_rate(vrr_state);
-	if (is_fixed && info->hdmi.vrr_cap.cinema_vrr)
+	if (is_fixed && ((info->hdmi.vrr_cap.qms_tfr_min &&
+			  new_conn_state->vrr_display_mode == VRR_DISPLAY_MODE_MEDIA &&
+			  connector->hdmi.qms_supported && info->hdmi.vrr_cap.qms_capable) ||
+			 info->hdmi.vrr_cap.cinema_vrr))
 		min_vfreq_n = 24;
 
 	/* If the VRR target changed, make sure to reset the error accumulator */
@@ -1176,6 +1269,19 @@ static int hdmi_validate_vrr(struct drm_connector *connector,
 		return ret;
 	}
 
+	ret = hdmi_validate_qms(new_crtc_state, new_conn_state, info);
+	if (ret < 0) {
+		drm_dbg_kms(dev, "Invalid QMS rate: %pe\n", ERR_PTR(ret));
+		return ret;
+	}
+
+	new_conn_state->hdmi.qms_tfr_byte = ret;
+	if (!old_conn_state ||
+	    new_conn_state->hdmi.qms_tfr_byte != old_conn_state->hdmi.qms_tfr_byte)
+		vrr_state->dynamic = true;
+	else
+		vrr_state->dynamic = false;
+
 	if (!is_fixed) {
 		vrr_state->dynamic = true;
 

-- 
2.56.0



Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E331606F97C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 15:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Xgg3F+Cj;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=O68YjoBw;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=Zt2iw1oW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=6/fwN93QKXlrtEMORZyL36eAUclAA0jiIqQ2lFOaVlU=; b=Xgg3F+Cj02mo+F
	Q3rHbxl8mKDHBrRYpb+XnW4KuGd5c1JZE6qKZdpVIBuSv++lb0jqVVKWgf6tXj2M6Wy0zBxleeONv
	kIPXNAGvfmau2cS6vOz9wnMxZwgoJCghlM9P8cCdxvBR5KQoxGuFwnJMu/S1lS1uj0P8yxbF+x1iI
	/wk9GcKKgEFopS8EsN6hupSky2QI0eWPzP/zSaqeeyTT3RFvZj+2joPagBcnVX4UzR/uhGi9sSW2t
	k99rTyvANfdhW4fe/JSg6nUATa3tghQDUusqmGBxnTCwnfE0QDhtDVSrXMoUHxtdOONT5XyB2XYFb
	xx7jrqGm4S+Rv7n9Wstg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOznx-00000009Thh-0aix;
	Thu, 05 Nov 2026 15:55:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOznZ-00000009TP8-19Ov;
	Thu, 05 Nov 2026 15:54:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=6/fwN93QKXlrtEMORZyL36eAUclAA0jiIqQ2lFOaVlU=; b=O68YjoBw0pLWai9QyuMFAHcWzV
	ryLz0dMLGBqC8MShoD9e7gvlPk8isv/wQH2Mj0PQFTQRpapN0jU6VcV+MhUiPtD61PgAat3dODYQ/
	WdK3blsB6LHc6PNrnWzZYHwaKv5K6n6gl5+AMALMyMcH6NhhWVYL4XeXK9uQ2pV4tZJfLq2f9mMBD
	iGupHFo/rUO8IcvvHaiWH09rdG+i8HBq/l/eCCsH62Tv63FkD9P0mpPUxcMBrebNR0fgtB81inRxn
	bPfLsBGpgu1az4Xt55MF+eQMerwSLt7yicVorNUGj/3hV1jxJzNtm1jooevWhA6TKphc4KvXhgZJh
	MSUQWq+w==;
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOznW-00000003CX2-2FI5;
	Thu, 05 Nov 2026 15:54:44 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1793894029; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=H02ZAr5Vw9Gs31CTvx+lICyFIHdpMWyn56zfo1ZbTp7MeBADqoWSOs6ixHiX/sSnD62iZCVlC4TjfnteMCo+TCy2DaFkpzf4rkEQEtAI4PK/7mK0w7txf5Pdf/0YiY/GPZXa3hXfSeBPwHCB8hYa1vRB54VgyujhAYrINnMP1x4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1793894029; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=6/fwN93QKXlrtEMORZyL36eAUclAA0jiIqQ2lFOaVlU=; 
	b=dOwreIY/6IBxG4H2bL47N85ulMTOCgF9SbugYezL1iJsbP4uYRU4uVtFxjxztPXO8WY3koFNer3iToHObO5yjl8NIQEtsbxuq7ydJ/Tf9ATFcYFR9PhvMNtjbGwuLOCc6mUvWDgdS4ccEHU9t4qGWf5B6eeCFBjedfuE+vUwk84=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: a=rsa-sha256; b=Zt2iw1oWLewd89zpH9+Ru/LuCDkqphfaszhoj0X6axcHoAWm9w9rzkjx2LXUNK8BMstv8INg2EZoLYvPS3UCz3nzr4SBSfIhhaj9bjGXkyFVSCmnQ2yzNVW1z1Vzf067eFDUfFDuzAiM1FZ1g6wwFwsC1uGliaLYyzycvto+82k=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=6/fwN93QKXlrtEMORZyL36eAUclAA0jiIqQ2lFOaVlU=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1793894028283757.3938461427174;
	Thu, 5 Nov 2026 07:53:48 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Thu, 05 Nov 2026 16:52:03 +0100
Subject: [PATCH v2 12/27] drm/rockchip: dw_hdmi_qp: Add VRR support
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-vrr-limiter-uapi-v2-12-55f4215be2c2@collabora.com>
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
X-CRM114-CacheID: sfid-20261105_155442_762787_0813EEDC 
X-CRM114-Status: GOOD (  16.07  )
X-Spam-Score: -0.2 (/)
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

Register the vrr_capable property on the connector for RK3588, where VRR
is implemented, as well as the other VRR connector properties.

In the encoder's atomic_check callback, the vrr_capable property, if
present, is then set to true if the sink supports VRR. The display limit
properties are also updated accordingly there, using the helper.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c | 30 ++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
index f2a1ea8dfefa..dcde50bca36b 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
@@ -89,6 +89,9 @@
 #define RK_COLOR_FMT_YUV444		0x2
 #define RK_COLOR_FMT_YUV420		0x3
 
+#define RK_VRR_DISPLAY_MODES		(BIT(VRR_DISPLAY_MODE_GAME) | \
+					 BIT(VRR_DISPLAY_MODE_OFF))
+
 struct rockchip_hdmi_qp {
 	struct device *dev;
 	struct regmap *regmap;
@@ -195,6 +198,7 @@ dw_hdmi_qp_rockchip_encoder_atomic_check(struct drm_encoder *encoder,
 					 struct drm_crtc_state *crtc_state,
 					 struct drm_connector_state *conn_state)
 {
+	struct drm_connector *connector = conn_state->connector;
 	struct rockchip_crtc_state *s = to_rockchip_crtc_state(crtc_state);
 	struct rockchip_hdmi_qp *hdmi = to_rockchip_hdmi_qp(encoder);
 	union phy_configure_opts phy_cfg = {};
@@ -205,6 +209,12 @@ dw_hdmi_qp_rockchip_encoder_atomic_check(struct drm_encoder *encoder,
 	if (ingest_fmt < 0)
 		return -EINVAL;
 
+	if (connector->vrr_capable_property) {
+		drm_connector_set_vrr_capable_property(connector,
+			drm_display_info_is_vrr_capable(&connector->display_info));
+		drm_connector_hdmi_update_vrr_limits(connector, &crtc_state->mode);
+	}
+
 	if (hdmi->tmds_char_rate == conn_state->hdmi.tmds_char_rate &&
 	    s->output_bpc == conn_state->hdmi.output_bpc &&
 	    s->bus_format == ingest_fmt)
@@ -552,6 +562,7 @@ struct rockchip_hdmi_qp_cfg {
 	unsigned int port_ids[MAX_HDMI_PORT_NUM];
 	const struct rockchip_hdmi_qp_ctrl_ops *ctrl_ops;
 	const struct dw_hdmi_qp_phy_ops *phy_ops;
+	bool supports_vrr;
 };
 
 static const struct rockchip_hdmi_qp_cfg rk3576_hdmi_cfg = {
@@ -571,6 +582,7 @@ static const struct rockchip_hdmi_qp_cfg rk3588_hdmi_cfg = {
 	},
 	.ctrl_ops = &rk3588_hdmi_ctrl_ops,
 	.phy_ops = &rk3588_hdmi_phy_ops,
+	.supports_vrr = true,
 };
 
 static const struct of_device_id dw_hdmi_qp_rockchip_dt_ids[] = {
@@ -729,6 +741,24 @@ static int dw_hdmi_qp_rockchip_bind(struct device *dev, struct device *master,
 		return dev_err_probe(dev, PTR_ERR(connector),
 				     "Failed to init bridge connector\n");
 
+	if (cfg->supports_vrr) {
+		ret = drm_connector_attach_vrr_capable_property(connector);
+		if (ret)
+			return dev_err_probe(hdmi->dev, ret,
+					     "Failed to attach 'vrr_capable' property\n");
+
+		ret = drm_connector_attach_vrr_display_mode_property(connector,
+								     RK_VRR_DISPLAY_MODES);
+		if (ret)
+			return dev_err_probe(hdmi->dev, ret,
+					     "Failed to attach 'vrr_display_mode' property\n");
+
+		ret = drm_connector_attach_vrr_display_limits_properties(connector);
+		if (ret)
+			return dev_err_probe(hdmi->dev, ret,
+					     "Failed to attach VRR display limits properties\n");
+	}
+
 	platform_set_drvdata(pdev, hdmi);
 
 	return 0;

-- 
2.56.0



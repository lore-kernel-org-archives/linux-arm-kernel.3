Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ACC2606F97F
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 15:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BFNdVcSa;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=LQsqjdLL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=V8t12PM41qE6N0UG7txMe0AIGzNF1VgRYdq6fo7sYxE=; b=BFNdVcSa2p+uJ2
	9p5JDv4FHrgNCnx3Q6xsgEfq2AgbdGfbR6I5YInibC+NWvstmjKuXs89w8pgiRGdh8xiPiiYaHA0G
	V/dqGAJkb/0LKbIbMpYNhNmzNOPcsnmORHIfo1TjOs+4FYcEKsNBrfcjHxUdZ2NJ9hwS4egaf/s5o
	9VA2sQLtNr7vM0lCqtyppbJe/52DSbfGnV4F7HY7zd84rYbN/3hQJZXr6EBMoG3X0qRY4snSkTgW1
	oYp1K/kkshjgs7Oy8LaU2V3adP0jhb6nVQtvJgHw/JFPcB4Icqo/31QEAMC0zXC+AgP2PvzWZd5zk
	2n+xVjOF2JsCbOginpuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOznw-00000009Tfp-0L4K;
	Thu, 05 Nov 2026 15:55:08 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOznH-00000009THf-2YhC;
	Thu, 05 Nov 2026 15:54:45 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1793893997; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=XJieeeqpjbwGPg/ZncAQlSiJa5BakgVBSVtN48HC+RXXEhj/lrMV7tkoAjjTPpZ3nR4cv6JbOBCQybj3EYiACalGlpmG0j+bMSwOIkRUW1aEV9jqyCJC216YLppD9FfZZiQF26Bb6m8YQFy5JVvJYSb0+DG26uJQ8HB01heZuK4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1793893997; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=V8t12PM41qE6N0UG7txMe0AIGzNF1VgRYdq6fo7sYxE=; 
	b=Jb6ao9UffGRio5LbBN5zSFpaqkO/JBpUn6c5VhsZ++0Wcsu/6lKmqrT0zE/8C0vZ4k2jrW9HeNBnCRqPl0jP7Q2MDfqbOnQ4qiUvqUv64EFtEeQGBfXK/xLxc6+/uj8EDVNU1TPJdsvd1mNw7/SJ81YsTP6EmMq+102xZ/38fr0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: a=rsa-sha256; b=LQsqjdLLLAYaTVElvIHyk6zk3CZoSN935Zwc//GRVsRjwWpwY6MoPe7GlKw11qQaSktgexFqMnIAoF5DyTI31O6du3gQ59ueMD4uVQ5WtmgYOjbDP52/CtvaCAz9B6Z7w+hAzv9oCzCfJPmPzsk+7GNW2LdtyAnh8THj7yj6F+0=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=V8t12PM41qE6N0UG7txMe0AIGzNF1VgRYdq6fo7sYxE=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1793893996571563.8882394295355;
	Thu, 5 Nov 2026 07:53:16 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Thu, 05 Nov 2026 16:51:58 +0100
Subject: [PATCH v2 07/27] drm/bridge: synopsys: Add VTEM EMP support
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-vrr-limiter-uapi-v2-7-55f4215be2c2@collabora.com>
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
X-CRM114-CacheID: sfid-20261105_075429_414227_3191ED6E 
X-CRM114-Status: GOOD (  13.95  )
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

From: Derek Foreman <derek.foreman@collabora.com>

Add code to pack and schedule VTEM EMPs.

Signed-off-by: Derek Foreman <derek.foreman@collabora.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c | 50 +++++++++++++++++++++++++++-
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.h |  1 +
 2 files changed, 50 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
index b268c9376087..8b3f586dc177 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
@@ -689,6 +689,15 @@ static int dw_hdmi_qp_bridge_clear_spd_infoframe(struct drm_bridge *bridge)
 	return 0;
 }
 
+static int dw_hdmi_qp_bridge_clear_vtem_emp(struct drm_bridge *bridge)
+{
+	struct dw_hdmi_qp *hdmi = bridge->driver_private;
+
+	dw_hdmi_qp_mod(hdmi, 0, PKTSCHED_EMP_VTEM_TX_EN, PKTSCHED_PKT_EN);
+
+	return 0;
+}
+
 static int dw_hdmi_qp_bridge_clear_audio_infoframe(struct drm_bridge *bridge)
 {
 	struct dw_hdmi_qp *hdmi = bridge->driver_private;
@@ -791,6 +800,42 @@ static int dw_hdmi_qp_bridge_write_spd_infoframe(struct drm_bridge *bridge,
 	return 0;
 }
 
+static int dw_hdmi_qp_bridge_write_vtem_emp(struct drm_bridge *bridge,
+					    const u8 *buffer, size_t len)
+{
+	struct dw_hdmi_qp *hdmi = bridge->driver_private;
+	u32 val, i;
+
+	if (len != HDMI_INFOFRAME_SIZE(VTEM)) {
+		dev_err(hdmi->dev, "unsupported vtem emp packet size of %zu\n", len);
+		return -EINVAL;
+	}
+
+	val = buffer[1] << 8 | buffer[2] << 16;
+	dw_hdmi_qp_write(hdmi, val, PKT_EMP_VTEM_CONTENTS0);
+
+	val = buffer[3] | buffer[4] << 8;
+	dw_hdmi_qp_write(hdmi, val, PKT_EMP_VTEM_CONTENTS1);
+
+	val = buffer[8] << 8 | buffer[9] << 16 | buffer[10] << 24;
+	dw_hdmi_qp_write(hdmi, val, PKT_EMP_VTEM_CONTENTS2);
+
+	val = buffer[11] | buffer[12] << 8 | buffer[13] << 16;
+	dw_hdmi_qp_write(hdmi, val, PKT_EMP_VTEM_CONTENTS3);
+
+	/*
+	 * The remaining registers need to explicitly be rewritten even if they
+	 * stay at 0, as per the hardware documentation.
+	 */
+	for (i = PKT_EMP_VTEM_CONTENTS4; i <= PKT_EMP_VTEM_CONTENTS7; i += 4)
+		dw_hdmi_qp_write(hdmi, 0, i);
+
+	dw_hdmi_qp_mod(hdmi, PKTSCHED_EMP_VTEM_TX_EN, PKTSCHED_EMP_VTEM_TX_EN,
+			PKTSCHED_PKT_EN);
+
+	return 0;
+}
+
 static int dw_hdmi_qp_bridge_write_audio_infoframe(struct drm_bridge *bridge,
 						   const u8 *buffer, size_t len)
 {
@@ -1035,6 +1080,8 @@ static const struct drm_bridge_funcs dw_hdmi_qp_bridge_funcs = {
 	.hdmi_write_hdr_drm_infoframe = dw_hdmi_qp_bridge_write_hdr_drm_infoframe,
 	.hdmi_clear_spd_infoframe = dw_hdmi_qp_bridge_clear_spd_infoframe,
 	.hdmi_write_spd_infoframe = dw_hdmi_qp_bridge_write_spd_infoframe,
+	.hdmi_clear_vtem_emp = dw_hdmi_qp_bridge_clear_vtem_emp,
+	.hdmi_write_vtem_emp = dw_hdmi_qp_bridge_write_vtem_emp,
 	.hdmi_clear_audio_infoframe = dw_hdmi_qp_bridge_clear_audio_infoframe,
 	.hdmi_write_audio_infoframe = dw_hdmi_qp_bridge_write_audio_infoframe,
 	.hdmi_audio_startup = dw_hdmi_qp_audio_enable,
@@ -1154,7 +1201,8 @@ struct dw_hdmi_qp *dw_hdmi_qp_bind(struct platform_device *pdev,
 			   DRM_BRIDGE_OP_HDMI |
 			   DRM_BRIDGE_OP_HDMI_AUDIO |
 			   DRM_BRIDGE_OP_HDMI_HDR_DRM_INFOFRAME |
-			   DRM_BRIDGE_OP_HDMI_SPD_INFOFRAME;
+			   DRM_BRIDGE_OP_HDMI_SPD_INFOFRAME |
+			   DRM_BRIDGE_OP_HDMI_VTEM_EMP;
 	hdmi->bridge.of_node = pdev->dev.of_node;
 	hdmi->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
 	hdmi->bridge.vendor = "Synopsys";
diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.h b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.h
index c07847e8d7dd..6ce87064a267 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.h
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.h
@@ -210,6 +210,7 @@
 #define PKTSCHED_AVI_TX_EN				BIT(13)
 #define PKTSCHED_VSI_TX_EN				BIT(12)
 #define PKTSCHED_EMP_CVTEM_TX_EN			BIT(10)
+#define PKTSCHED_EMP_VTEM_TX_EN				BIT(9)
 #define PKTSCHED_AMD_TX_EN				BIT(8)
 #define PKTSCHED_GCP_TX_EN				BIT(3)
 #define PKTSCHED_AUDS_TX_EN				BIT(2)

-- 
2.56.0



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A91A3CCD1A5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 10:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HrnPQ0Rlpx72jXDSZpvkPNp/2H4jZn3M087QskaFqvA=; b=dLo0W7bvLHtKM+0enM7SmrZ96M
	E38YVhhCmIBTX3BcsjFl11X6zZTfR2xHzrWw/zyxE/R8pVOeqvPbTujwDg6OigDE+N+I2wYR+d8J8
	sbjErZq/uElXrW5x5+nPcjgk8TTfr/PMWJgunGLoS+W0LivzweZvutwUqMjXwT273UgBLSEjU3Gak
	JXvQYcy8XgQ2acJnX9Y0+JRwt3sAM95c3wLb2IloT85ion+Gw7rhMnI6k5C/hzPt4AdzfCKCtonVZ
	6dJweLLOhKTcAQIPjgPNDJ3op3b6llt0lHlrcFEKm9p8Pjog4xk/C/ybiRdquvxUleWoBa7nLasg+
	z984EzBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB9T1-0000000GbBY-2ka8;
	Tue, 21 Oct 2025 10:19:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB9Sz-0000000Gb7c-3I76;
	Tue, 21 Oct 2025 10:19:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=HrnPQ0Rlpx72jXDSZpvkPNp/2H4jZn3M087QskaFqvA=; b=an8aYmt9ymLINtIW/qh1yeZHCa
	EXkj1qV7rx606IQp1IXg4H5dVvbgV3d968p5IjCE+D5EQK1byW7AAL8rEIdE267zZzycFecNaGbLW
	KKbleVrjohGUQpWq/nTValT+4Xvzm77UtMTRJ7B39iEwuq2LEEdiAD9O3zjg14gdQCS4aSUm33UQu
	EuHhaPk0Xbg+E+8S25zuCvIAg56tXd0pnXlhjpVgcj3VFB0Xxn7AO2oWlXj3bhK/SCDlTnEKD6Z54
	MZPtPxgIBjZ2helZUAWj8gbA+EWOh2NdGfV7A6r8f8cyiyHGHuGrKzUms4e2l8He2ZehuB00/Lcq9
	sPFdR1Pw==;
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB8bD-00000000fae-2Q8F;
	Tue, 21 Oct 2025 09:24:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1761041970;
	bh=2cSPcRcetu19nIiABMe7i4sAQC6sGYCknXIE9y1yPg4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=I/vScD0RgKo6qV+1u18CpreOi5kY6DYeVZmAm5GSw7erjg8HIAw27q8SScgniCurG
	 Eb2LIyztM/Sum8WHvABFjs90vI2qFlVW+K3+sef2yCYxkm4+bu6yR3YHmZ5TOh3ZJp
	 he8N1EK3q+mt6j0vZCR/rb2eAF1hkG87JjYVDyeEjDkxBc8ZTEXzSm0IjzgqhfjTZI
	 pW8tQXPYkAwi5RQ2iRcmgs+4wn9L55Apai/F9IoMb8wAOoZiEHo0DBaqQ2mt2sruf5
	 r4OEMlF2D007Kfa2ANTUYDChuUCcQcZWLzIl7nnq0LvTVhIGFMFB1GL+cc7jS2GAfu
	 WsSF/97ewgWWQ==
Received: from localhost (unknown [82.79.138.145])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id DC98117E13A5;
	Tue, 21 Oct 2025 12:19:29 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 21 Oct 2025 13:19:15 +0300
Subject: [PATCH v3 2/5] drm/bridge: dw-hdmi-qp: Handle platform supported
 formats and color depth
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251021-rk3588-10bpc-v3-2-3d3eed00a6db@collabora.com>
References: <20251021-rk3588-10bpc-v3-0-3d3eed00a6db@collabora.com>
In-Reply-To: <20251021-rk3588-10bpc-v3-0-3d3eed00a6db@collabora.com>
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Daniel Stone <daniels@collabora.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_102413_357743_EE329F58 
X-CRM114-Status: GOOD (  12.69  )
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

Extend struct dw_hdmi_qp_plat_data to include the supported display
output formats and maximum bits per color channel.  When provided by the
platform driver, use them to setup the HDMI bridge accordingly.

Additionally, improve debug logging in dw_hdmi_qp_bridge_atomic_enable()
to also show the current HDMI output format and bpc.

Acked-by: Daniel Stone <daniels@collabora.com>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c | 11 +++++++++--
 include/drm/bridge/dw_hdmi_qp.h              |  4 ++++
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
index 4ba7b339eff6..fe4c026280f0 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
@@ -868,8 +868,9 @@ static void dw_hdmi_qp_bridge_atomic_enable(struct drm_bridge *bridge,
 		return;
 
 	if (connector->display_info.is_hdmi) {
-		dev_dbg(hdmi->dev, "%s mode=HDMI rate=%llu\n",
-			__func__, conn_state->hdmi.tmds_char_rate);
+		dev_dbg(hdmi->dev, "%s mode=HDMI %s rate=%llu bpc=%u\n", __func__,
+			drm_hdmi_connector_get_output_format_name(conn_state->hdmi.output_format),
+			conn_state->hdmi.tmds_char_rate, conn_state->hdmi.output_bpc);
 		op_mode = 0;
 		hdmi->tmds_char_rate = conn_state->hdmi.tmds_char_rate;
 	} else {
@@ -1287,6 +1288,12 @@ struct dw_hdmi_qp *dw_hdmi_qp_bind(struct platform_device *pdev,
 	hdmi->bridge.vendor = "Synopsys";
 	hdmi->bridge.product = "DW HDMI QP TX";
 
+	if (plat_data->supported_formats)
+		hdmi->bridge.supported_formats = plat_data->supported_formats;
+
+	if (plat_data->max_bpc)
+		hdmi->bridge.max_bpc = plat_data->max_bpc;
+
 	hdmi->bridge.ddc = dw_hdmi_qp_i2c_adapter(hdmi);
 	if (IS_ERR(hdmi->bridge.ddc))
 		return ERR_CAST(hdmi->bridge.ddc);
diff --git a/include/drm/bridge/dw_hdmi_qp.h b/include/drm/bridge/dw_hdmi_qp.h
index 76ecf3130199..3f461f6b9bbf 100644
--- a/include/drm/bridge/dw_hdmi_qp.h
+++ b/include/drm/bridge/dw_hdmi_qp.h
@@ -25,6 +25,10 @@ struct dw_hdmi_qp_plat_data {
 	int main_irq;
 	int cec_irq;
 	unsigned long ref_clk_rate;
+	/* Supported output formats: bitmask of @hdmi_colorspace */
+	unsigned int supported_formats;
+	/* Maximum bits per color channel: 8, 10 or 12 */
+	unsigned int max_bpc;
 };
 
 struct dw_hdmi_qp *dw_hdmi_qp_bind(struct platform_device *pdev,

-- 
2.51.0



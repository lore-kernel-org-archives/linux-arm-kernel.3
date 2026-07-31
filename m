Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E24BC54F54
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 15:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QMbvJkkJ6+OY44hct9gv0ADWmot6kxJicmFHg22mDiM=; b=GMjPgCzahil1cXasCl+6sf7MAR
	Bq0IFjO5j8jAPNI9c/+Oj/chNHdAsqLVh0U8O3fii5SjhM3hKBgZYvAhBxD3vBcY0H/3rDw1PtOq5
	ZWmy9Ij8sQORj7dbVA4l1ual2NsRnLV/pGuwu4CzAheZHWnPwnwCq4aac1MfFN6RBeLOow0Mbv4sp
	7WfQrdaSZD8ihd47yGusi4y/oFWTZfL090mvC6kP3RgEWv8K7764+7TRWBuMutmrCX/OWS124IIMw
	uYIPUmw/3EnBXkfoPedk3PBjbqG0uk2Pnw2h7KtmLXT85qvthNfY3Fln1E3v9l3a6c6tQny0sgqkd
	ZpqXzOnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpoRa-0000000Cm6x-3KAC;
	Fri, 31 Jul 2026 14:42:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpoRO-0000000Clnn-21hI;
	Fri, 31 Jul 2026 14:42:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=QMbvJkkJ6+OY44hct9gv0ADWmot6kxJicmFHg22mDiM=; b=eMunoELxXN2iHiIyjpI1K+Quw8
	hziaLlm7Ds4Guk5/kbqG2AAk8ikVYzeedjybKkOWTUso+191B/DmHW+aRJo5T8lQHpOSzz4zhvmEu
	3yh8f7NT4cluivn50JqNAlpI3LWsZMFi2acE6qTUTeks7q1ld1tBAS0gH/6YW5cAijSAq6dnrwexj
	D0sZw0o1243U3DhONBUDnQeCdWZB94oYz7K0DlI+/zae1Qu3LCxFWyDukOqUgy8WXMO3Yl9/mbr/Z
	/IFTz8rjV4q0u3gyOgk1G+IDzjYfW4eDEsgKR4DC6kjX9oobIr6VdilCdGZ5iI80QXLj19i1Lfq4g
	wlU/ngrw==;
Received: from bali.collaboradmins.com ([148.251.105.195])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wpoRK-00000007X3j-0vo4;
	Fri, 31 Jul 2026 14:42:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1785508929;
	bh=s0iHqJtCl7lHUc951fQ4n1fmrQDHo0lvrZa1beqvgZE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=mPnBPsuuXKu1STq0MIALYNjxznzPeBM28tUsAmkIxszH1CrShUJg6gSb15HkrkuXw
	 uivp4ofMflCoirCyU8flHifQMjy8RDVW0fhoD1t7mtVX/bwQf77m+bEEDqX8h8EvrP
	 PkfUNpStH4Ax4orNHq507voXO2bKOXdTaKnwUXK/LyVGjOLNFWlSqT7ffSFXWk0TwM
	 8IYykMzw/5UkIq1EEKTa2m05SpZP/X+UwVXLJ0UAsYZhgLBS3VRiJytV0wo+bsczFa
	 l3CfuLMAT38VZXsQpFlNPeahVZJj5kcLsMV+5o25vcAa5Bf2bSVpAdqR4rhK47GoFZ
	 qHhgZxbz327Dg==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B62FB17E0934;
	Fri, 31 Jul 2026 16:42:09 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 0E40B48004C; Fri, 31 Jul 2026 16:42:09 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 31 Jul 2026 16:42:17 +0200
Subject: [PATCH v8 12/21] drm/bridge: synopsys: dw-dp: Support software
 triggered OOB HPD
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-synopsys-dw-dp-improvements-v8-12-ac1e6a75782f@collabora.com>
References: <20260731-synopsys-dw-dp-improvements-v8-0-ac1e6a75782f@collabora.com>
In-Reply-To: <20260731-synopsys-dw-dp-improvements-v8-0-ac1e6a75782f@collabora.com>
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
 Damon Ding <damon.ding@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Alexey Charkov <alchark@flipper.net>, dri-devel@lists.freedesktop.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@collabora.com, 
 linux-arm-kernel@lists.infradead.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3664;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=s0iHqJtCl7lHUc951fQ4n1fmrQDHo0lvrZa1beqvgZE=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpstEA0rFKIsgnd0TVUKFCZj1dJzQnqTW3Pd
 NHuVGV58AUu7okCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqbLRAAAoJENju1/PI
 O/qarwAP/3BUyiZTCwFR6gYSiArPzmybwlAhXjvRURMhVCj8/sLe72jsaj2AAc22qrhjQY6SzYO
 0p9t2mB5OaxGQ3NnU4auDp8Fx0RxzkGyu+ZfxIjoeMP0QGoBj5A/BD7aMPYeLYsPzJ2NS81Lipu
 7Vxnww48Sh9jeJqpdYwKVkYoBufoLQgjTQVck69n3cPzGwRzsAFf2QRye6kF5bja8L5hAyYFOms
 dipiAzH3iKX7p5MeWDpB2lcqrKrn5xCFnnrfNJcNUbYB9/jbJhkt+o+igCgY3BBl9e7kKSJ+f2B
 0Vv57RYwe7ulkK0ovbd2QiTERoCeYL4UAQlV3UnoGLF2vyXPR+l1MeqnHv9K/9RH0S66KTayW8e
 YciLZE7fv4zBMPpWpmvR3MXdkRKMp6cTZXh3oKI/nuexpHOj3GzlUFq2g7bGPT/I1VrQUDU90Bn
 ao5j+iuyH7VWhtBZmoZAZ818Vu2nMVtxWzMR8RfwHJHHKp6eL2rTRQIFcNFd3WfvRm06ovDy/ii
 /Kh+wtkfuryo3JOQYDDnrjrEL064c9uh6F/JSrQ9qtGI7Bx3v/VxlJgU0lvmXcZon6JMJmNHB86
 /4aA+Rolk5D2iHs+DYAdz8a8/5mGUc1sXhTUUnf7k2yobpZeeyPB+qmC8k8VYOnNiZ6DQxF1aVD
 tbRIyCze8Y2h4Oa6GfRgzFA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_154222_361072_33FB601F 
X-CRM114-Status: GOOD (  15.66  )
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

Add support for USB-C DP AltMode out-of-band hotplug handling. The
handling itself is implemented in the platform specific driver as the
registers to force HPD state are not part of the Designware DisplayPort
IP itself. Instead the platform integration might provide the necessary
functionality to mux the HPD signal.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-dp.c | 38 +++++++++++++++++++++++++++++++++
 include/drm/bridge/dw_dp.h              |  3 +++
 2 files changed, 41 insertions(+)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-dp.c b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
index 7d42067df2cf..b21c2016dbd2 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
@@ -1886,6 +1886,19 @@ static void dw_dp_bridge_detach(struct drm_bridge *bridge)
 	drm_dp_aux_unregister(&dp->aux);
 }
 
+static void dw_dp_bridge_oob_notify(struct drm_bridge *bridge,
+				    struct drm_connector *connector,
+				    enum drm_connector_status status)
+{
+	bool hpd_high = status != connector_status_disconnected;
+	struct dw_dp *dp = bridge_to_dp(bridge);
+
+	if (dp->plat_data.hpd_sw_cfg)
+		dp->plat_data.hpd_sw_cfg(dp->plat_data.data, hpd_high);
+	else
+		dev_err_once(dp->dev, "Missing platform handler for OOB HPD handling\n");
+}
+
 static const struct drm_bridge_funcs dw_dp_bridge_funcs = {
 	.attach = dw_dp_bridge_attach,
 	.detach = dw_dp_bridge_detach,
@@ -1900,6 +1913,7 @@ static const struct drm_bridge_funcs dw_dp_bridge_funcs = {
 	.atomic_disable = dw_dp_bridge_atomic_disable,
 	.detect = dw_dp_bridge_detect,
 	.edid_read = dw_dp_bridge_edid_read,
+	.oob_notify = dw_dp_bridge_oob_notify,
 };
 
 static int dw_dp_link_retrain(struct dw_dp *dp)
@@ -2029,6 +2043,19 @@ static const struct regmap_config dw_dp_regmap_config = {
 	.rd_table = &dw_dp_readable_table,
 };
 
+static bool dw_dp_is_routed_to_usb_c(struct drm_encoder *encoder)
+{
+	struct drm_bridge *last_bridge __free(drm_bridge_put) = NULL;
+	struct fwnode_handle *fwnode;
+
+	last_bridge = drm_bridge_chain_get_last_bridge(encoder);
+	if (!last_bridge)
+		return false;
+
+	fwnode = of_fwnode_handle(last_bridge->of_node);
+	return fwnode_device_is_compatible(fwnode, "usb-c-connector");
+}
+
 int dw_dp_bind(struct dw_dp *dp, struct drm_encoder *encoder)
 {
 	struct drm_bridge *bridge = &dp->bridge;
@@ -2052,6 +2079,13 @@ int dw_dp_bind(struct dw_dp *dp, struct drm_encoder *encoder)
 		goto put_next_bridge;
 	}
 
+	if (dw_dp_is_routed_to_usb_c(encoder)) {
+		dev_dbg(dev, "USB-C mode\n");
+
+		if (dp->plat_data.hpd_sw_sel)
+			dp->plat_data.hpd_sw_sel(dp->plat_data.data, 1);
+	}
+
 	return 0;
 
 put_next_bridge:
@@ -2088,6 +2122,10 @@ struct dw_dp *dw_dp_probe(struct platform_device *pdev, const struct dw_dp_plat_
 
 	dp->dev = dev;
 	dp->pixel_mode = plat_data->pixel_mode;
+
+	dp->plat_data.hpd_sw_sel = plat_data->hpd_sw_sel;
+	dp->plat_data.hpd_sw_cfg = plat_data->hpd_sw_cfg;
+	dp->plat_data.data = plat_data->data;
 	dp->plat_data.max_link_rate = plat_data->max_link_rate;
 
 	init_completion(&dp->complete);
diff --git a/include/drm/bridge/dw_dp.h b/include/drm/bridge/dw_dp.h
index a82412a9e769..79b2cdf0df99 100644
--- a/include/drm/bridge/dw_dp.h
+++ b/include/drm/bridge/dw_dp.h
@@ -20,6 +20,9 @@ enum {
 struct dw_dp_plat_data {
 	u32 max_link_rate;
 	u8 pixel_mode;
+	void *data;
+	void (*hpd_sw_sel)(void *data, bool hpd);
+	void (*hpd_sw_cfg)(void *data, bool hpd);
 };
 
 int dw_dp_bind(struct dw_dp *dp, struct drm_encoder *encoder);

-- 
2.53.0



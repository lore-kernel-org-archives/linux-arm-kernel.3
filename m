Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74311CD6E57
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 22:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1h+YZ9WzTvbqg/X+1mA8eRYAiRhwnBe6+ldN01b22yg=; b=bIAo2pz2bGMb72pft3SSz4JzsY
	h8ooZ6OlEOXiXoZiyC1cNUdI8vl3g2sDL1PP1EeAltHOwhQ/uL+ZdhdGFex9A0FXkcgcYdlFVcOD1
	08MtoGfI8NlfRZ4llSWs8B0gsl5gfZE10xieeRS1WdFLKVIAkir3KBHjt0TydYpCuVaZ0zkBQ5xa2
	/fFqqfIbh7HUJtZBzwNvtaNuZeUy6Tfl4+3oGFpwiplN7I798MydO/EStHCYFb049H9FCzgdw/+sa
	6FnyNROBtgEXpDMJ+6kE/Xy1mZMj34z+pbNmK5wx7QKKM75p9VNwGhsqJgVYpCIPPkyZRbAaTAEfA
	3UjMLfMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUBOU-0000000BzjS-0nvq;
	Mon, 01 Jun 2026 22:46:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUBO8-0000000BylX-2XFf;
	Mon, 01 Jun 2026 22:45:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=1h+YZ9WzTvbqg/X+1mA8eRYAiRhwnBe6+ldN01b22yg=; b=l08zXS0iWerP5ED2SKHZINfNey
	IrfjpvMRfW0z3h/Vo56zd6Q4PMZUlnxZ+cCVXG6Csfw/qtPW/tPogKVKI7tLEFdeSOt4xxCSt0HUE
	/4Jd6xKwm+l7n8f0OTzyTmTLUfL2Uhn5RC4EhZyw6Ji/gngelZ6eqMaX6PPxqQl8k1LqlzACaC6i3
	So/mPSmDnJLpy6YOshEVDptUcvT2yZzXOKhg4lWGm3bnMnKNl+klFxzJ4qGOSLEeL4uur6WQZQYfi
	/dk3eqh94bieiZJB4YWOj4aRN0K+ZLMSWKrBU/EioXAh76B3WQlEl4h0QTwqj9I/JfkRZOIZ61col
	QZZooNeQ==;
Received: from bali.collaboradmins.com ([148.251.105.195])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUBO1-00000007sf2-0e3d;
	Mon, 01 Jun 2026 22:45:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1780353930;
	bh=I4m70wH8SD5JWU/tgjfhdZ9kfm9RujBffmi2lpXN2Yc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=LOUtazSSeLeBNHZTAyv7J12RwzOwrSBgZtOM9rQkxc7E8UjomwQWyf2jmPOFcwKfd
	 x1YBv0iGKIm21xa4qIgaFLB6YX540oNWZU2ygg4HXbIn1SFSNOtD5WpGVUPHvBWiyW
	 qC5BYAZNlebt2N2LTfPauzluKLLGx1q/w11ugjrJozbpVaR3k+ztXnne1MScxeiXeQ
	 lt4XoWX45oC3iwNK9n5Li16eRce/Wa34/wWppCWigutS1y1GgYtccsZfHsw9/tdL6p
	 QagnkO+F2N5pGWCupQgGackRm1sl7FjAS2O7lX0hyOMyLWe0GBmotGjLrQ81B6SqvE
	 wTDaovmZ3EVHA==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E9A7F17E0E6C;
	Tue,  2 Jun 2026 00:45:29 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 02 Jun 2026 01:44:26 +0300
Subject: [PATCH v7 26/30] drm/tests: connector: Add HDMI source-side
 scrambler capability tests
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260602-dw-hdmi-qp-scramb-v7-26-445eb54ee1ed@collabora.com>
References: <20260602-dw-hdmi-qp-scramb-v7-0-445eb54ee1ed@collabora.com>
In-Reply-To: <20260602-dw-hdmi-qp-scramb-v7-0-445eb54ee1ed@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, Daniel Stone <daniels@collabora.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_234533_872870_DBC29742 
X-CRM114-Status: GOOD (  11.52  )
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

Add KUnit tests covering the consistency validation between HDMI
connector's scrambler_supported flag and the .scrambler_{enable,disable}
HDMI connector callbacks that drmm_connector_hdmi_init() performs.

The four added cases cover the validation matrix:

- scrambler_supported = true with both callbacks set: success
- scrambler_supported = true with no callbacks: failure
- scrambler_supported = true with only one callback: failure
- scrambler_supported = false with both callbacks: success (callbacks
                        ignored)

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/tests/drm_connector_test.c | 132 +++++++++++++++++++++++++++++
 1 file changed, 132 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_connector_test.c b/drivers/gpu/drm/tests/drm_connector_test.c
index beb1d50a6646..b79b75be18c4 100644
--- a/drivers/gpu/drm/tests/drm_connector_test.c
+++ b/drivers/gpu/drm/tests/drm_connector_test.c
@@ -47,6 +47,41 @@ static const struct drm_connector_hdmi_funcs dummy_hdmi_funcs = {
 	},
 };
 
+static int accept_scrambler_enable(struct drm_connector *connector)
+{
+	return 0;
+}
+
+static int accept_scrambler_disable(struct drm_connector *connector)
+{
+	return 0;
+}
+
+static const struct drm_connector_hdmi_funcs dummy_hdmi_funcs_scrambler = {
+	.scrambler_enable = accept_scrambler_enable,
+	.scrambler_disable = accept_scrambler_disable,
+	.avi = {
+		.clear_infoframe = accept_infoframe_clear_infoframe,
+		.write_infoframe = accept_infoframe_write_infoframe,
+	},
+	.hdmi = {
+		.clear_infoframe = accept_infoframe_clear_infoframe,
+		.write_infoframe = accept_infoframe_write_infoframe,
+	},
+};
+
+static const struct drm_connector_hdmi_funcs dummy_hdmi_funcs_scrambler_partial = {
+	.scrambler_enable = accept_scrambler_enable,
+	.avi = {
+		.clear_infoframe = accept_infoframe_clear_infoframe,
+		.write_infoframe = accept_infoframe_write_infoframe,
+	},
+	.hdmi = {
+		.clear_infoframe = accept_infoframe_clear_infoframe,
+		.write_infoframe = accept_infoframe_write_infoframe,
+	},
+};
+
 static const struct drm_connector_funcs dummy_funcs = {
 	.atomic_destroy_state	= drm_atomic_helper_connector_destroy_state,
 	.atomic_duplicate_state	= drm_atomic_helper_connector_duplicate_state,
@@ -1254,6 +1289,99 @@ KUNIT_ARRAY_PARAM(drm_connector_hdmi_init_type_invalid,
 		  drm_connector_hdmi_init_type_invalid_tests,
 		  drm_connector_hdmi_init_type_desc);
 
+/*
+ * Test that the registration of an HDMI connector advertising source-side
+ * scrambling support succeeds when the .scrambler_{enable|disable} callbacks
+ * are provided.
+ */
+static void drm_test_connector_hdmi_init_scrambler_valid(struct kunit *test)
+{
+	struct drm_connector_init_priv *priv = test->priv;
+	int ret;
+
+	priv->connector.hdmi.scrambler_supported = true;
+
+	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
+				       "Vendor", "Product",
+				       &dummy_funcs,
+				       &dummy_hdmi_funcs_scrambler,
+				       DRM_MODE_CONNECTOR_HDMIA,
+				       &priv->ddc,
+				       BIT(DRM_OUTPUT_COLOR_FORMAT_RGB444),
+				       8);
+	KUNIT_EXPECT_EQ(test, ret, 0);
+}
+
+/*
+ * Test that the registration of an HDMI connector advertising source-side
+ * scrambling support fails when the .scrambler_{enable|disable} callbacks
+ * are not provided.
+ */
+static void drm_test_connector_hdmi_init_scrambler_no_callbacks(struct kunit *test)
+{
+	struct drm_connector_init_priv *priv = test->priv;
+	int ret;
+
+	priv->connector.hdmi.scrambler_supported = true;
+
+	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
+				       "Vendor", "Product",
+				       &dummy_funcs,
+				       &dummy_hdmi_funcs,
+				       DRM_MODE_CONNECTOR_HDMIA,
+				       &priv->ddc,
+				       BIT(DRM_OUTPUT_COLOR_FORMAT_RGB444),
+				       8);
+	KUNIT_EXPECT_LT(test, ret, 0);
+}
+
+/*
+ * Test that the registration of an HDMI connector advertising source-side
+ * scrambling support fails when only one of the .scrambler_{enable|disable}
+ * callbacks are provided.
+ */
+static void drm_test_connector_hdmi_init_scrambler_partial_callbacks(struct kunit *test)
+{
+	struct drm_connector_init_priv *priv = test->priv;
+	int ret;
+
+	priv->connector.hdmi.scrambler_supported = true;
+
+	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
+				       "Vendor", "Product",
+				       &dummy_funcs,
+				       &dummy_hdmi_funcs_scrambler_partial,
+				       DRM_MODE_CONNECTOR_HDMIA,
+				       &priv->ddc,
+				       BIT(DRM_OUTPUT_COLOR_FORMAT_RGB444),
+				       8);
+	KUNIT_EXPECT_LT(test, ret, 0);
+}
+
+/*
+ * Test that the registration of an HDMI connector not advertising source-side
+ * scrambling support succeeds, even when the .scrambler_{enable|disable}
+ * callbacks are provided, i.e. they are ignored.
+ */
+static void drm_test_connector_hdmi_init_scrambler_ignored_callbacks(struct kunit *test)
+{
+	struct drm_connector_init_priv *priv = test->priv;
+	int ret;
+
+	priv->connector.hdmi.scrambler_supported = false;
+
+	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
+				       "Vendor", "Product",
+				       &dummy_funcs,
+				       &dummy_hdmi_funcs_scrambler,
+				       DRM_MODE_CONNECTOR_HDMIA,
+				       &priv->ddc,
+				       BIT(DRM_OUTPUT_COLOR_FORMAT_RGB444),
+				       8);
+	KUNIT_EXPECT_EQ(test, ret, 0);
+	KUNIT_EXPECT_EQ(test, priv->connector.hdmi.scrambler_supported, false);
+}
+
 static struct kunit_case drmm_connector_hdmi_init_tests[] = {
 	KUNIT_CASE(drm_test_connector_hdmi_init_valid),
 	KUNIT_CASE(drm_test_connector_hdmi_init_bpc_8),
@@ -1278,6 +1406,10 @@ static struct kunit_case drmm_connector_hdmi_init_tests[] = {
 			 drm_connector_hdmi_init_type_valid_gen_params),
 	KUNIT_CASE_PARAM(drm_test_connector_hdmi_init_type_invalid,
 			 drm_connector_hdmi_init_type_invalid_gen_params),
+	KUNIT_CASE(drm_test_connector_hdmi_init_scrambler_valid),
+	KUNIT_CASE(drm_test_connector_hdmi_init_scrambler_no_callbacks),
+	KUNIT_CASE(drm_test_connector_hdmi_init_scrambler_partial_callbacks),
+	KUNIT_CASE(drm_test_connector_hdmi_init_scrambler_ignored_callbacks),
 	{ }
 };
 

-- 
2.54.0



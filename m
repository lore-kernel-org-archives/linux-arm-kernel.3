Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0C70C624D3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 18:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9xYFAzvOq/dLglAF7sCC+6w76ikvUV3J0tm5XCoZrqM=; b=eH3QVRoUrrAcByTOGLnJ/4aty4
	mpts8waWf1grhWlweqSQrl2fyWOgmU7QS8MWf3dcs2fvCz47E74UT+3uLbe/NJfxnSIE9OtN/ei4/
	jUwR5ahQF8YqAHqGnw+BOdAaLXh5g6Z/9FmqlBq6P6hfBoJEJi+oLYLZzh05ZZoEOdOeLcbsvNSXl
	fsYREkOrwSUhigg+3sy52SBnYVnqQSz8kpfscgUKCSVQ+PGmAY8OQAYE6qqlQmZELcA+k//zxQaws
	cdOzmmh13U//QPEKi4wQ6cfQAjfzSYVGlzkp5ykJ4sajHFEeWRn83ex0p5b8l+axeHjvsrMAK2mzJ
	/0sSPO2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Tc4-0000000D5my-3Ykl;
	Tue, 01 Sep 2026 18:53:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Ta0-0000000D1Tt-2DPK;
	Tue, 01 Sep 2026 18:51:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=9xYFAzvOq/dLglAF7sCC+6w76ikvUV3J0tm5XCoZrqM=; b=qW1yh3ffeIs/Pyvx3lL+O1W//N
	ccq7xF8SGhKtel9ua5Kx5gJgOWGLVG9Mu/3YD4cL4dO7JqAO4UvXi9CtAZN6FLGWi3ZZFADGKQ3gw
	IgicmHLN3s0fUC5mqurm3465AiVZ/FvsFEEQUqdoFlTvloahP96rjrusnc+g8+mlOLyG5WVsELX9a
	NqDduU7nDk1lN9twegjd9TtDHlm551NW4yFk2AftIXox/fOgOw8H7xYP/T/vv/DUm8XLdqHRWshXp
	YM8kC91ArvckxLadmGsUB2dzVHFD9XmrXjA+DFPKzRH+2+RGz9NX8iOUCVh3KXgzsx1uN1Y+O6FPL
	9JiTU+6g==;
Received: from bali.collaboradmins.com ([148.251.105.195])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x1TZw-0000000BHev-1p4h;
	Tue, 01 Sep 2026 18:51:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1788288686;
	bh=b8b0g0mwg6DkAdX6Utag8Oehr2doi4sirDk5lkqvxCs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=fdZhSfFNXwjOAH8mKpg5xLQ6jsHSqMz4pjJGrlZclsb7aabyN9ZHbot/WJWdn8C27
	 rv7zlokLosRrYM4f9zxyMrIvMn38OP8OZXpOi0N5wT3BraisKl7zbNWw2vQsPEdLeo
	 6iaYvCQr/6Xbfiwq7mRx4JmYHW/R8bZOtf7P2UTKTsZY22xbmLNcUl/pb4LkWjktd/
	 YO/ueDvFqOo7HwTY0o4eY3ft4LFnRpOQ4YMPnzgczIDr34HCFC+OJXnlXectj8ZUwn
	 bQn6YVyz6LxcTstVemaN3Ps5E4h92HB9MSe6XEiYHmOhfeuXhOt8FdfTj8s0IlJNPg
	 jePOmHLKpXvOA==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A2BA517E3C90;
	Tue, 01 Sep 2026 20:51:26 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 01 Sep 2026 21:51:26 +0300
Subject: [PATCH v11 62/74] drm/tests: connector: Convert to
 drmm_connector_hdmi_init()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-dw-hdmi-qp-scramb-v11-62-bc12954a0688@collabora.com>
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
X-CRM114-CacheID: sfid-20260901_195128_759319_328E83AA 
X-CRM114-Status: GOOD (  15.59  )
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

Switch tests over to the new drmm_connector_hdmi_init() signature, where
the vendor, product, supported_formats and max_bpc values previously
passed as arguments are now provided through struct
drm_connector_hdmi_funcs.

As a consequence, the tests exercising those values can no longer share
the static dummy_hdmi_funcs and need a modified copy of their own.
Since the connector retains a pointer to it, such a copy must not be
placed on the stack, which is gone by the time the DRM-managed actions
release the connector.  Keep it in struct drm_connector_init_priv
instead: it embeds the DRM device and is only freed via
managed.final_kfree, i.e. once drm_dev_release() has run all DRM-managed
actions, so its lifetime strictly outlives the connector.

Note that a kunit_kzalloc() buffer would not be suitable, as KUnit
releases its resources in reverse order, hence one allocated by a test
would be freed before the DRM device allocated by the suite .init().

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/tests/drm_connector_test.c | 251 ++++++++++++++---------------
 1 file changed, 119 insertions(+), 132 deletions(-)

diff --git a/drivers/gpu/drm/tests/drm_connector_test.c b/drivers/gpu/drm/tests/drm_connector_test.c
index 3368aedd4e66..c53ccce21a42 100644
--- a/drivers/gpu/drm/tests/drm_connector_test.c
+++ b/drivers/gpu/drm/tests/drm_connector_test.c
@@ -23,6 +23,8 @@ struct drm_connector_init_priv {
 	struct drm_device drm;
 	struct drm_connector connector;
 	struct i2c_adapter ddc;
+	/* Mutable copy of a static instance for test-specific overrides */
+	struct drm_connector_hdmi_funcs hdmi_funcs;
 };
 
 static int accept_infoframe_clear_infoframe(struct drm_connector *connector)
@@ -37,6 +39,11 @@ static int accept_infoframe_write_infoframe(struct drm_connector *connector,
 }
 
 static const struct drm_connector_hdmi_funcs dummy_hdmi_funcs = {
+	.vendor = "Vendor",
+	.product = "Product",
+	.supported_hdmi_ver = HDMI_VERSION_1_4,
+	.supported_formats = BIT(DRM_OUTPUT_COLOR_FORMAT_RGB444),
+	.max_bpc = 8,
 	.avi = {
 		.clear_infoframe = accept_infoframe_clear_infoframe,
 		.write_infoframe = accept_infoframe_write_infoframe,
@@ -669,14 +676,11 @@ static void drm_test_connector_hdmi_init_valid(struct kunit *test)
 	struct drm_connector_init_priv *priv = test->priv;
 	int ret;
 
-	ret = drmm_connector_hdmi_ini2(&priv->drm, &priv->connector,
-				       "Vendor", "Product",
+	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
 				       &dummy_funcs,
 				       &dummy_hdmi_funcs,
 				       DRM_MODE_CONNECTOR_HDMIA,
-				       &priv->ddc,
-				       BIT(DRM_OUTPUT_COLOR_FORMAT_RGB444),
-				       8);
+				       &priv->ddc);
 	KUNIT_EXPECT_EQ(test, ret, 0);
 }
 
@@ -689,14 +693,11 @@ static void drm_test_connector_hdmi_init_null_ddc(struct kunit *test)
 	struct drm_connector_init_priv *priv = test->priv;
 	int ret;
 
-	ret = drmm_connector_hdmi_ini2(&priv->drm, &priv->connector,
-				       "Vendor", "Product",
+	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
 				       &dummy_funcs,
 				       &dummy_hdmi_funcs,
 				       DRM_MODE_CONNECTOR_HDMIA,
-				       NULL,
-				       BIT(DRM_OUTPUT_COLOR_FORMAT_RGB444),
-				       8);
+				       NULL);
 	KUNIT_EXPECT_EQ(test, ret, 0);
 }
 
@@ -709,14 +710,14 @@ static void drm_test_connector_hdmi_init_null_vendor(struct kunit *test)
 	struct drm_connector_init_priv *priv = test->priv;
 	int ret;
 
-	ret = drmm_connector_hdmi_ini2(&priv->drm, &priv->connector,
-				       NULL, "Product",
+	priv->hdmi_funcs = dummy_hdmi_funcs;
+	priv->hdmi_funcs.vendor = NULL;
+
+	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
 				       &dummy_funcs,
-				       &dummy_hdmi_funcs,
+				       &priv->hdmi_funcs,
 				       DRM_MODE_CONNECTOR_HDMIA,
-				       &priv->ddc,
-				       BIT(DRM_OUTPUT_COLOR_FORMAT_RGB444),
-				       8);
+				       &priv->ddc);
 	KUNIT_EXPECT_LT(test, ret, 0);
 }
 
@@ -729,14 +730,14 @@ static void drm_test_connector_hdmi_init_null_product(struct kunit *test)
 	struct drm_connector_init_priv *priv = test->priv;
 	int ret;
 
-	ret = drmm_connector_hdmi_ini2(&priv->drm, &priv->connector,
-				       "Vendor", NULL,
+	priv->hdmi_funcs = dummy_hdmi_funcs;
+	priv->hdmi_funcs.product = NULL;
+
+	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
 				       &dummy_funcs,
-				       &dummy_hdmi_funcs,
+				       &priv->hdmi_funcs,
 				       DRM_MODE_CONNECTOR_HDMIA,
-				       &priv->ddc,
-				       BIT(DRM_OUTPUT_COLOR_FORMAT_RGB444),
-				       8);
+				       &priv->ddc);
 	KUNIT_EXPECT_LT(test, ret, 0);
 }
 
@@ -750,19 +751,19 @@ static void drm_test_connector_hdmi_init_product_valid(struct kunit *test)
 	const unsigned char expected_product[DRM_CONNECTOR_HDMI_PRODUCT_LEN] = {
 		'P', 'r', 'o', 'd',
 	};
-	const char *product_name = "Prod";
 	int ret;
 
-	KUNIT_ASSERT_LT(test, strlen(product_name), DRM_CONNECTOR_HDMI_PRODUCT_LEN);
+	priv->hdmi_funcs = dummy_hdmi_funcs;
+	priv->hdmi_funcs.product = "Prod";
 
-	ret = drmm_connector_hdmi_ini2(&priv->drm, &priv->connector,
-				       "Vendor", product_name,
+	KUNIT_ASSERT_LT(test, strlen(priv->hdmi_funcs.product),
+			DRM_CONNECTOR_HDMI_PRODUCT_LEN);
+
+	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
 				       &dummy_funcs,
-				       &dummy_hdmi_funcs,
+				       &priv->hdmi_funcs,
 				       DRM_MODE_CONNECTOR_HDMIA,
-				       &priv->ddc,
-				       BIT(DRM_OUTPUT_COLOR_FORMAT_RGB444),
-				       8);
+				       &priv->ddc);
 	KUNIT_EXPECT_EQ(test, ret, 0);
 	KUNIT_EXPECT_MEMEQ(test,
 			   priv->connector.hdmi.product,
@@ -783,19 +784,19 @@ static void drm_test_connector_hdmi_init_product_length_exact(struct kunit *test
 		'P', 'r', 'o', 'd', 'u', 'c', 't',
 		'P', 'r',
 	};
-	const char *product_name = "ProductProductPr";
 	int ret;
 
-	KUNIT_ASSERT_EQ(test, strlen(product_name), DRM_CONNECTOR_HDMI_PRODUCT_LEN);
+	priv->hdmi_funcs = dummy_hdmi_funcs;
+	priv->hdmi_funcs.product = "ProductProductPr";
 
-	ret = drmm_connector_hdmi_ini2(&priv->drm, &priv->connector,
-				       "Vendor", product_name,
+	KUNIT_ASSERT_EQ(test, strlen(priv->hdmi_funcs.product),
+			DRM_CONNECTOR_HDMI_PRODUCT_LEN);
+
+	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
 				       &dummy_funcs,
-				       &dummy_hdmi_funcs,
+				       &priv->hdmi_funcs,
 				       DRM_MODE_CONNECTOR_HDMIA,
-				       &priv->ddc,
-				       BIT(DRM_OUTPUT_COLOR_FORMAT_RGB444),
-				       8);
+				       &priv->ddc);
 	KUNIT_EXPECT_EQ(test, ret, 0);
 	KUNIT_EXPECT_MEMEQ(test,
 			   priv->connector.hdmi.product,
@@ -810,19 +811,19 @@ static void drm_test_connector_hdmi_init_product_length_exact(struct kunit *test
 static void drm_test_connector_hdmi_init_product_length_too_long(struct kunit *test)
 {
 	struct drm_connector_init_priv *priv = test->priv;
-	const char *product_name = "ProductProductProduct";
 	int ret;
 
-	KUNIT_ASSERT_GT(test, strlen(product_name), DRM_CONNECTOR_HDMI_PRODUCT_LEN);
+	priv->hdmi_funcs = dummy_hdmi_funcs;
+	priv->hdmi_funcs.product = "ProductProductProduct";
 
-	ret = drmm_connector_hdmi_ini2(&priv->drm, &priv->connector,
-				       "Vendor", product_name,
+	KUNIT_ASSERT_GT(test, strlen(priv->hdmi_funcs.product),
+			DRM_CONNECTOR_HDMI_PRODUCT_LEN);
+
+	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
 				       &dummy_funcs,
-				       &dummy_hdmi_funcs,
+				       &priv->hdmi_funcs,
 				       DRM_MODE_CONNECTOR_HDMIA,
-				       &priv->ddc,
-				       BIT(DRM_OUTPUT_COLOR_FORMAT_RGB444),
-				       8);
+				       &priv->ddc);
 	KUNIT_EXPECT_LT(test, ret, 0);
 }
 
@@ -836,19 +837,19 @@ static void drm_test_connector_hdmi_init_vendor_valid(struct kunit *test)
 	const char expected_vendor[DRM_CONNECTOR_HDMI_VENDOR_LEN] = {
 		'V', 'e', 'n', 'd',
 	};
-	const char *vendor_name = "Vend";
 	int ret;
 
-	KUNIT_ASSERT_LT(test, strlen(vendor_name), DRM_CONNECTOR_HDMI_VENDOR_LEN);
+	priv->hdmi_funcs = dummy_hdmi_funcs;
+	priv->hdmi_funcs.vendor = "Vend";
 
-	ret = drmm_connector_hdmi_ini2(&priv->drm, &priv->connector,
-				       vendor_name, "Product",
+	KUNIT_ASSERT_LT(test, strlen(priv->hdmi_funcs.vendor),
+			DRM_CONNECTOR_HDMI_VENDOR_LEN);
+
+	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
 				       &dummy_funcs,
-				       &dummy_hdmi_funcs,
+				       &priv->hdmi_funcs,
 				       DRM_MODE_CONNECTOR_HDMIA,
-				       &priv->ddc,
-				       BIT(DRM_OUTPUT_COLOR_FORMAT_RGB444),
-				       8);
+				       &priv->ddc);
 	KUNIT_EXPECT_EQ(test, ret, 0);
 	KUNIT_EXPECT_MEMEQ(test,
 			   priv->connector.hdmi.vendor,
@@ -868,19 +869,19 @@ static void drm_test_connector_hdmi_init_vendor_length_exact(struct kunit *test)
 		'V', 'e', 'n', 'd', 'o', 'r',
 		'V', 'e',
 	};
-	const char *vendor_name = "VendorVe";
 	int ret;
 
-	KUNIT_ASSERT_EQ(test, strlen(vendor_name), DRM_CONNECTOR_HDMI_VENDOR_LEN);
+	priv->hdmi_funcs = dummy_hdmi_funcs;
+	priv->hdmi_funcs.vendor = "VendorVe";
 
-	ret = drmm_connector_hdmi_ini2(&priv->drm, &priv->connector,
-				       vendor_name, "Product",
+	KUNIT_ASSERT_EQ(test, strlen(priv->hdmi_funcs.vendor),
+			DRM_CONNECTOR_HDMI_VENDOR_LEN);
+
+	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
 				       &dummy_funcs,
-				       &dummy_hdmi_funcs,
+				       &priv->hdmi_funcs,
 				       DRM_MODE_CONNECTOR_HDMIA,
-				       &priv->ddc,
-				       BIT(DRM_OUTPUT_COLOR_FORMAT_RGB444),
-				       8);
+				       &priv->ddc);
 	KUNIT_EXPECT_EQ(test, ret, 0);
 	KUNIT_EXPECT_MEMEQ(test,
 			   priv->connector.hdmi.vendor,
@@ -895,19 +896,17 @@ static void drm_test_connector_hdmi_init_vendor_length_exact(struct kunit *test)
 static void drm_test_connector_hdmi_init_vendor_length_too_long(struct kunit *test)
 {
 	struct drm_connector_init_priv *priv = test->priv;
-	const char *vendor_name = "VendorVendor";
 	int ret;
 
-	KUNIT_ASSERT_GT(test, strlen(vendor_name), DRM_CONNECTOR_HDMI_VENDOR_LEN);
+	priv->hdmi_funcs = dummy_hdmi_funcs;
+	priv->hdmi_funcs.vendor = "VendorVendor";
+	KUNIT_ASSERT_GT(test, strlen(priv->hdmi_funcs.vendor), DRM_CONNECTOR_HDMI_VENDOR_LEN);
 
-	ret = drmm_connector_hdmi_ini2(&priv->drm, &priv->connector,
-				       vendor_name, "Product",
+	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
 				       &dummy_funcs,
-				       &dummy_hdmi_funcs,
+				       &priv->hdmi_funcs,
 				       DRM_MODE_CONNECTOR_HDMIA,
-				       &priv->ddc,
-				       BIT(DRM_OUTPUT_COLOR_FORMAT_RGB444),
-				       8);
+				       &priv->ddc);
 	KUNIT_EXPECT_LT(test, ret, 0);
 }
 
@@ -920,14 +919,14 @@ static void drm_test_connector_hdmi_init_bpc_invalid(struct kunit *test)
 	struct drm_connector_init_priv *priv = test->priv;
 	int ret;
 
-	ret = drmm_connector_hdmi_ini2(&priv->drm, &priv->connector,
-				       "Vendor", "Product",
+	priv->hdmi_funcs = dummy_hdmi_funcs;
+	priv->hdmi_funcs.max_bpc = 9;
+
+	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
 				       &dummy_funcs,
-				       &dummy_hdmi_funcs,
+				       &priv->hdmi_funcs,
 				       DRM_MODE_CONNECTOR_HDMIA,
-				       &priv->ddc,
-				       BIT(DRM_OUTPUT_COLOR_FORMAT_RGB444),
-				       9);
+				       &priv->ddc);
 	KUNIT_EXPECT_LT(test, ret, 0);
 }
 
@@ -940,14 +939,14 @@ static void drm_test_connector_hdmi_init_bpc_null(struct kunit *test)
 	struct drm_connector_init_priv *priv = test->priv;
 	int ret;
 
-	ret = drmm_connector_hdmi_ini2(&priv->drm, &priv->connector,
-				       "Vendor", "Product",
+	priv->hdmi_funcs = dummy_hdmi_funcs;
+	priv->hdmi_funcs.max_bpc = 0;
+
+	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
 				       &dummy_funcs,
-				       &dummy_hdmi_funcs,
+				       &priv->hdmi_funcs,
 				       DRM_MODE_CONNECTOR_HDMIA,
-				       &priv->ddc,
-				       BIT(DRM_OUTPUT_COLOR_FORMAT_RGB444),
-				       0);
+				       &priv->ddc);
 	KUNIT_EXPECT_LT(test, ret, 0);
 }
 
@@ -965,14 +964,11 @@ static void drm_test_connector_hdmi_init_bpc_8(struct kunit *test)
 	uint64_t val;
 	int ret;
 
-	ret = drmm_connector_hdmi_ini2(&priv->drm, connector,
-				       "Vendor", "Product",
+	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
 				       &dummy_funcs,
 				       &dummy_hdmi_funcs,
 				       DRM_MODE_CONNECTOR_HDMIA,
-				       &priv->ddc,
-				       BIT(DRM_OUTPUT_COLOR_FORMAT_RGB444),
-				       8);
+				       &priv->ddc);
 	KUNIT_EXPECT_EQ(test, ret, 0);
 
 	prop = connector->max_bpc_property;
@@ -1006,14 +1002,14 @@ static void drm_test_connector_hdmi_init_bpc_10(struct kunit *test)
 	uint64_t val;
 	int ret;
 
-	ret = drmm_connector_hdmi_ini2(&priv->drm, connector,
-				       "Vendor", "Product",
+	priv->hdmi_funcs = dummy_hdmi_funcs;
+	priv->hdmi_funcs.max_bpc = 10;
+
+	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
 				       &dummy_funcs,
-				       &dummy_hdmi_funcs,
+				       &priv->hdmi_funcs,
 				       DRM_MODE_CONNECTOR_HDMIA,
-				       &priv->ddc,
-				       BIT(DRM_OUTPUT_COLOR_FORMAT_RGB444),
-				       10);
+				       &priv->ddc);
 	KUNIT_EXPECT_EQ(test, ret, 0);
 
 	prop = connector->max_bpc_property;
@@ -1047,14 +1043,14 @@ static void drm_test_connector_hdmi_init_bpc_12(struct kunit *test)
 	uint64_t val;
 	int ret;
 
-	ret = drmm_connector_hdmi_ini2(&priv->drm, connector,
-				       "Vendor", "Product",
+	priv->hdmi_funcs = dummy_hdmi_funcs;
+	priv->hdmi_funcs.max_bpc = 12;
+
+	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
 				       &dummy_funcs,
-				       &dummy_hdmi_funcs,
+				       &priv->hdmi_funcs,
 				       DRM_MODE_CONNECTOR_HDMIA,
-				       &priv->ddc,
-				       BIT(DRM_OUTPUT_COLOR_FORMAT_RGB444),
-				       12);
+				       &priv->ddc);
 	KUNIT_EXPECT_EQ(test, ret, 0);
 
 	prop = connector->max_bpc_property;
@@ -1083,14 +1079,14 @@ static void drm_test_connector_hdmi_init_formats_empty(struct kunit *test)
 	struct drm_connector_init_priv *priv = test->priv;
 	int ret;
 
-	ret = drmm_connector_hdmi_ini2(&priv->drm, &priv->connector,
-				       "Vendor", "Product",
+	priv->hdmi_funcs = dummy_hdmi_funcs;
+	priv->hdmi_funcs.supported_formats = 0;
+
+	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
 				       &dummy_funcs,
-				       &dummy_hdmi_funcs,
+				       &priv->hdmi_funcs,
 				       DRM_MODE_CONNECTOR_HDMIA,
-				       &priv->ddc,
-				       0,
-				       8);
+				       &priv->ddc);
 	KUNIT_EXPECT_LT(test, ret, 0);
 }
 
@@ -1103,14 +1099,14 @@ static void drm_test_connector_hdmi_init_formats_no_rgb(struct kunit *test)
 	struct drm_connector_init_priv *priv = test->priv;
 	int ret;
 
-	ret = drmm_connector_hdmi_ini2(&priv->drm, &priv->connector,
-				       "Vendor", "Product",
+	priv->hdmi_funcs = dummy_hdmi_funcs;
+	priv->hdmi_funcs.supported_formats = BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR422);
+
+	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
 				       &dummy_funcs,
-				       &dummy_hdmi_funcs,
+				       &priv->hdmi_funcs,
 				       DRM_MODE_CONNECTOR_HDMIA,
-				       &priv->ddc,
-				       BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR422),
-				       8);
+				       &priv->ddc);
 	KUNIT_EXPECT_LT(test, ret, 0);
 }
 
@@ -1161,14 +1157,14 @@ static void drm_test_connector_hdmi_init_formats_yuv420_allowed(struct kunit *te
 	params = test->param_value;
 	priv->connector.ycbcr_420_allowed = params->yuv420_allowed;
 
-	ret = drmm_connector_hdmi_ini2(&priv->drm, &priv->connector,
-				       "Vendor", "Product",
+	priv->hdmi_funcs = dummy_hdmi_funcs;
+	priv->hdmi_funcs.supported_formats = params->supported_formats;
+
+	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
 				       &dummy_funcs,
-				       &dummy_hdmi_funcs,
+				       &priv->hdmi_funcs,
 				       DRM_MODE_CONNECTOR_HDMIA,
-				       &priv->ddc,
-				       params->supported_formats,
-				       8);
+				       &priv->ddc);
 	KUNIT_EXPECT_EQ(test, ret, params->expected_result);
 }
 
@@ -1182,14 +1178,11 @@ static void drm_test_connector_hdmi_init_type_valid(struct kunit *test)
 	unsigned int connector_type = *(unsigned int *)test->param_value;
 	int ret;
 
-	ret = drmm_connector_hdmi_ini2(&priv->drm, &priv->connector,
-				       "Vendor", "Product",
+	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
 				       &dummy_funcs,
 				       &dummy_hdmi_funcs,
 				       connector_type,
-				       &priv->ddc,
-				       BIT(DRM_OUTPUT_COLOR_FORMAT_RGB444),
-				       8);
+				       &priv->ddc);
 	KUNIT_EXPECT_EQ(test, ret, 0);
 }
 
@@ -1217,14 +1210,11 @@ static void drm_test_connector_hdmi_init_type_invalid(struct kunit *test)
 	unsigned int connector_type = *(unsigned int *)test->param_value;
 	int ret;
 
-	ret = drmm_connector_hdmi_ini2(&priv->drm, &priv->connector,
-				       "Vendor", "Product",
+	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
 				       &dummy_funcs,
 				       &dummy_hdmi_funcs,
 				       connector_type,
-				       &priv->ddc,
-				       BIT(DRM_OUTPUT_COLOR_FORMAT_RGB444),
-				       8);
+				       &priv->ddc);
 	KUNIT_EXPECT_LT(test, ret, 0);
 }
 
@@ -1494,14 +1484,11 @@ static void drm_test_drm_connector_attach_broadcast_rgb_property_hdmi_connector(
 	struct drm_property *prop;
 	int ret;
 
-	ret = drmm_connector_hdmi_ini2(&priv->drm, connector,
-				       "Vendor", "Product",
+	ret = drmm_connector_hdmi_init(&priv->drm, connector,
 				       &dummy_funcs,
 				       &dummy_hdmi_funcs,
 				       DRM_MODE_CONNECTOR_HDMIA,
-				       &priv->ddc,
-				       BIT(DRM_OUTPUT_COLOR_FORMAT_RGB444),
-				       8);
+				       &priv->ddc);
 	KUNIT_EXPECT_EQ(test, ret, 0);
 
 	ret = drm_connector_attach_broadcast_rgb_property(connector);

-- 
2.55.0



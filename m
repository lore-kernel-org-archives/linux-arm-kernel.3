Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71956C4453D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 01:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0zpSccqfGxtX9NBy5CAe1yg4dpv+k/VkYuFl3aE8iDs=; b=4EqE5vyQoCfIjrpnSav4FOfVfJ
	mSZB5v/kgXy0OglzWDbNNXCjn12dr1qOmJhBDBf8fe9Y7q0Q2irOb1+eTgfkBl38iQRTMjeK/YVMZ
	fdXkBkZTmN7KdRwZCZhRlQPSYgOxvYqM0D4bUWRrDtx4ArV3rZWl9UHqtrJUw6Ei7kBSna8k7QXRG
	xQ539pm2FJduXD1nAu2CQQHgp+tHLbiaKq9dVJzgs6EG2AYf2Rcyy7gSeC+1HbMeFjd6WungUzB1B
	m7MjuNXoGOXq3TW0/SsoB6SijdSN0eLZbgeHSYp/kY4HSMQJIZXVvjhQkxJo+BkMeeaMwUyJQNMtX
	nKOTcppw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmiPt-0000000D8Ni-0L4r;
	Thu, 23 Jul 2026 01:40:05 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmiLo-0000000D3vX-0hoU;
	Thu, 23 Jul 2026 01:35:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=0zpSccqfGxtX9NBy5CAe1yg4dpv+k/VkYuFl3aE8iDs=; b=L5un/PIbqdd3YEb3znWvmes21G
	Ilne3rerwW3Cj/vTvR4YluE8OruYAWMIECQmR7Mu18AnuNU6yuY/73Bi1M6DvGY5aycxLljm9klkZ
	6Zfz0azsVLJIB6l8y6grRJCU/CfOlnGPtO8uwL7wyx5is8KIR4TF5s9Fy9S/CawcmigGxu/eAkZpV
	vuzWNMlbBvdMj98XL5aTJoS1rcL8DfCWthFC4tlCQ2sKxcn3++tcGuq9Gw0PbSUNOFrswVUVgFRaw
	HP859b+yaSqDo3XM56b+zVjfVffNckPcwqkHSX7iDFJI79Rg8rhQ6t6ht1smwXr7/LG0OiZoNA7/Z
	PCmIQ6hQ==;
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by casper.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmiLk-0000000Gvp4-0hCe;
	Thu, 23 Jul 2026 01:35:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784770543;
	bh=uLg7zYEx4PuEm5hUTroSVNr0ajJC3eSnGppIiyCnEzA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=HXHA8z2RRuAR2lvG+YYOntpyPMbEkGeVdL8Pag+3qat7UWtoqZTr55O2Px1PNZcbY
	 Ig68s9VWK2Hngk3GC8D+ibgcFsPmHXJ9JmnRP16Hv8HoumsHHZ/Yhw2ORxm8TbbMCJ
	 ecY07mX6Gfq7wBdKEmq31AeGX7BXZU1PaQnEt3ajOp8V4ecpLgJ0SFylWrGXzp4+8L
	 X3sY8qPt3RIxvKSB2Y4a3j+fdjLRzzczGp1lWd3aZEEzRpYnKfy983WPlRW9eq/EFR
	 TiaMf94yLZme88RmU2Vf0tvuzuF9eqrcx+R1AYnF3jsNEueM6p/dRWCeud1OWZHf7y
	 4+6RjlTUKCJkA==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 261CE17E37F3;
	Thu, 23 Jul 2026 03:35:43 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Thu, 23 Jul 2026 04:35:48 +0300
Subject: [PATCH v9 59/61] drm/connector: Drop redundant hdmi vendor/product
 fields
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-dw-hdmi-qp-scramb-v9-59-4fb12ea22ac9@collabora.com>
References: <20260723-dw-hdmi-qp-scramb-v9-0-4fb12ea22ac9@collabora.com>
In-Reply-To: <20260723-dw-hdmi-qp-scramb-v9-0-4fb12ea22ac9@collabora.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Chen-Yu Tsai <wens@kernel.org>, Samuel Holland <samuel@sholland.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, Algea Cao <algea.cao@rock-chips.com>, 
 Daniel Stone <daniels@collabora.com>, Liu Ying <victor.liu@nxp.com>, 
 Phong LE <ple@baylibre.com>
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-rockchip@lists.infradead.org
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_023548_300766_9B842839 
X-CRM114-Status: GOOD (  11.68  )
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

Now that all users migrated to the new drmm_connector_hdmi_init()
signature, vendor and product are provided through struct
drm_connector_hdmi_funcs, a reference to which is already stored in
drm_connector_hdmi.

Drop the redundant fields from drm_connector_hdmi and point its users to
hdmi.funcs->vendor and hdmi.funcs->product instead.

This allows simplifying the related connector registration tests by
getting rid of the now unnecessary KUNIT_EXPECT_MEMEQ() checks.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/display/drm_hdmi_state_helper.c |  4 +--
 drivers/gpu/drm/drm_connector.c                 |  4 ---
 drivers/gpu/drm/tests/drm_connector_test.c      | 41 +++----------------------
 include/drm/drm_connector.h                     | 14 ++-------
 4 files changed, 8 insertions(+), 55 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
index d112c1555517..bb4dd9d0b482 100644
--- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
@@ -784,8 +784,8 @@ static int hdmi_generate_spd_infoframe(const struct drm_connector *connector,
 		return 0;
 
 	ret = hdmi_spd_infoframe_init(frame,
-				      connector->hdmi.vendor,
-				      connector->hdmi.product);
+				      connector->hdmi.funcs->vendor,
+				      connector->hdmi.funcs->product);
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index d424d245ef71..837dbaa65eb0 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -656,10 +656,6 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
 		connector->hdmi.max_tmds_char_rate = hdmi_funcs->supported_tmds_char_rate;
 	}
 
-	/* TODO: remove after conversion to new drmm_connector_hdmi_init() */
-	strtomem_pad(connector->hdmi.vendor, hdmi_funcs->vendor, 0);
-	strtomem_pad(connector->hdmi.product, hdmi_funcs->product, 0);
-
 	/*
 	 * drm_connector_attach_max_bpc_property() requires the
 	 * connector to have a state.
diff --git a/drivers/gpu/drm/tests/drm_connector_test.c b/drivers/gpu/drm/tests/drm_connector_test.c
index 3d050ac5e5f6..1d8c30288aea 100644
--- a/drivers/gpu/drm/tests/drm_connector_test.c
+++ b/drivers/gpu/drm/tests/drm_connector_test.c
@@ -769,14 +769,11 @@ static void drm_test_connector_hdmi_init_null_product(struct kunit *test)
 
 /*
  * Test that the registration of a connector with a valid, shorter than
- * the max length, product name succeeds, and is stored padded with 0.
+ * the max length, product name succeeds.
  */
 static void drm_test_connector_hdmi_init_product_valid(struct kunit *test)
 {
 	struct drm_connector_init_priv *priv = test->priv;
-	const unsigned char expected_product[DRM_CONNECTOR_HDMI_PRODUCT_LEN] = {
-		'P', 'r', 'o', 'd',
-	};
 	struct drm_connector_hdmi_funcs hdmi_funcs = dummy_hdmi_funcs;
 	int ret;
 
@@ -790,25 +787,15 @@ static void drm_test_connector_hdmi_init_product_valid(struct kunit *test)
 				       DRM_MODE_CONNECTOR_HDMIA,
 				       &priv->ddc);
 	KUNIT_EXPECT_EQ(test, ret, 0);
-	KUNIT_EXPECT_MEMEQ(test,
-			   priv->connector.hdmi.product,
-			   expected_product,
-			   sizeof(priv->connector.hdmi.product));
 }
 
 /*
  * Test that the registration of a connector with a valid, at max
- * length, product name succeeds, and is stored padded without any
- * trailing \0.
+ * length, product name succeeds.
  */
 static void drm_test_connector_hdmi_init_product_length_exact(struct kunit *test)
 {
 	struct drm_connector_init_priv *priv = test->priv;
-	const unsigned char expected_product[DRM_CONNECTOR_HDMI_PRODUCT_LEN] = {
-		'P', 'r', 'o', 'd', 'u', 'c', 't',
-		'P', 'r', 'o', 'd', 'u', 'c', 't',
-		'P', 'r',
-	};
 	struct drm_connector_hdmi_funcs hdmi_funcs = dummy_hdmi_funcs;
 	int ret;
 
@@ -822,10 +809,6 @@ static void drm_test_connector_hdmi_init_product_length_exact(struct kunit *test
 				       DRM_MODE_CONNECTOR_HDMIA,
 				       &priv->ddc);
 	KUNIT_EXPECT_EQ(test, ret, 0);
-	KUNIT_EXPECT_MEMEQ(test,
-			   priv->connector.hdmi.product,
-			   expected_product,
-			   sizeof(priv->connector.hdmi.product));
 }
 
 /*
@@ -852,14 +835,11 @@ static void drm_test_connector_hdmi_init_product_length_too_long(struct kunit *t
 
 /*
  * Test that the registration of a connector with a vendor name smaller
- * than the maximum length succeeds, and is stored padded with zeros.
+ * than the maximum length succeeds.
  */
 static void drm_test_connector_hdmi_init_vendor_valid(struct kunit *test)
 {
 	struct drm_connector_init_priv *priv = test->priv;
-	const char expected_vendor[DRM_CONNECTOR_HDMI_VENDOR_LEN] = {
-		'V', 'e', 'n', 'd',
-	};
 	struct drm_connector_hdmi_funcs hdmi_funcs = dummy_hdmi_funcs;
 	int ret;
 
@@ -873,24 +853,15 @@ static void drm_test_connector_hdmi_init_vendor_valid(struct kunit *test)
 				       DRM_MODE_CONNECTOR_HDMIA,
 				       &priv->ddc);
 	KUNIT_EXPECT_EQ(test, ret, 0);
-	KUNIT_EXPECT_MEMEQ(test,
-			   priv->connector.hdmi.vendor,
-			   expected_vendor,
-			   sizeof(priv->connector.hdmi.vendor));
 }
 
 /*
  * Test that the registration of a connector with a vendor name at the
- * maximum length succeeds, and is stored padded without the trailing
- * zero.
+ * maximum length succeeds.
  */
 static void drm_test_connector_hdmi_init_vendor_length_exact(struct kunit *test)
 {
 	struct drm_connector_init_priv *priv = test->priv;
-	const char expected_vendor[DRM_CONNECTOR_HDMI_VENDOR_LEN] = {
-		'V', 'e', 'n', 'd', 'o', 'r',
-		'V', 'e',
-	};
 	struct drm_connector_hdmi_funcs hdmi_funcs = dummy_hdmi_funcs;
 	int ret;
 
@@ -904,10 +875,6 @@ static void drm_test_connector_hdmi_init_vendor_length_exact(struct kunit *test)
 				       DRM_MODE_CONNECTOR_HDMIA,
 				       &priv->ddc);
 	KUNIT_EXPECT_EQ(test, ret, 0);
-	KUNIT_EXPECT_MEMEQ(test,
-			   priv->connector.hdmi.vendor,
-			   expected_vendor,
-			   sizeof(priv->connector.hdmi.vendor));
 }
 
 /*
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index b80cc667604e..03f4e6751165 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -1418,11 +1418,13 @@ struct drm_connector_infoframe_funcs {
  * and controller capabilities
  */
 struct drm_connector_hdmi_funcs {
+#define DRM_CONNECTOR_HDMI_VENDOR_LEN	8
 	/**
 	 * @vendor: HDMI Controller Vendor name.
 	 */
 	const char *vendor;
 
+#define DRM_CONNECTOR_HDMI_PRODUCT_LEN	16
 	/**
 	 * @product: HDMI Controller Product name
 	 */
@@ -2117,18 +2119,6 @@ struct drm_connector_hdmi_audio {
  * struct drm_connector_hdmi - DRM Connector HDMI-related structure
  */
 struct drm_connector_hdmi {
-#define DRM_CONNECTOR_HDMI_VENDOR_LEN	8
-	/**
-	 * @vendor: HDMI Controller Vendor Name
-	 */
-	unsigned char vendor[DRM_CONNECTOR_HDMI_VENDOR_LEN] __nonstring;
-
-#define DRM_CONNECTOR_HDMI_PRODUCT_LEN	16
-	/**
-	 * @product: HDMI Controller Product Name
-	 */
-	unsigned char product[DRM_CONNECTOR_HDMI_PRODUCT_LEN] __nonstring;
-
 	/**
 	 * @supported_formats: Bitmask of @drm_output_color_format
 	 * supported by the controller.

-- 
2.55.0



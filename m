Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5160ACA5FFC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 07:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5ZqODQ5igOoBvPuYVh0rP+EhPppD6n2yhjb+6z4KnfU=; b=H9eSOiYvjuOZOIs8fudVHlK+NT
	eTGR4TbWCmCQeNEbNEpvSLD+fNHu46A6TiIukvGxBa0SbnRLqbbRRDxqsY5Yr5BK4J56A81su6Sqk
	aQRaDeB4N6TpqKWoO6AdM3AhCRL1RxfQ6Mx4Fxji2QDrJXMBeD9m2ZHnkXt5ehxkAaG56IUyupSh/
	O0471TDHFS4YXWVBGlbpJvtJ8RhvZ0fW+d0BMpYsE8ydx2WLEa6Ff+rXJwP7a1RzUhM8gutDf7zDJ
	ZEdfDXFDq3Bk/wA+M8CNAPYS62DaMFUZLl6pc8t4XnoB8ALSdKd1c6+z57KgHCxXrMHarRMa9b2Vr
	7Tli7MxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhjkX-00000001U07-1gcx;
	Mon, 19 Jan 2026 07:32:33 +0000
Received: from smtpbgau2.qq.com ([54.206.34.216])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhjkH-00000001ToK-0Q99;
	Mon, 19 Jan 2026 07:32:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1768807889;
	bh=5ZqODQ5igOoBvPuYVh0rP+EhPppD6n2yhjb+6z4KnfU=;
	h=From:To:Subject:Date:Message-Id;
	b=D+elyjcKTTFVbtpb3ndAthNniClbtm0vXyqxJHMTp4WT3S99mLAJr9cBQc2BMPVnL
	 rCYmYSTR/9bfuYVk9CP0lA/vfoPbHWjEVdojQjxr+/VTvhPyBbi8YzMiUi2R0LrOMv
	 ZPeNiLixk7h8/QLayo/CaHSLpLc2Vr0mxOS/ZYhw=
X-QQ-mid: esmtpsz17t1768807887tc6c1cd7e
X-QQ-Originating-IP: Y9Cfzzlo6OYydIEHXqhCNUVPKhYgnaX7YPgZi2JRbME=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 19 Jan 2026 15:31:21 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 14245727192888249367
From: Chaoyi Chen <kernel@airkyi.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Peter Chen <hzpeterchen@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Sandy Huang <hjc@rock-chips.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Yubing Zhang <yubing.zhang@rock-chips.com>,
	Frank Wang <frank.wang@rock-chips.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Amit Sunil Dhamne <amitsd@google.com>,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Dragan Simic <dsimic@manjaro.org>,
	Johan Jonker <jbx6244@gmail.com>,
	Diederik de Haas <didi.debian@cknow.org>,
	Peter Robinson <pbrobinson@gmail.com>
Cc: linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v14 2/9] drm/bridge: aux: Add drm_aux_bridge_register_from_node()
Date: Mon, 19 Jan 2026 15:30:53 +0800
Message-Id: <20260119073100.143-3-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260119073100.143-1-kernel@airkyi.com>
References: <20260119073100.143-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: MgOcfNUnrri+sqbCh2B7bRF7YnOvRybRTkLsFlF0iVOUCyAXF4ZU9JNC
	Npq/5bKYRsboTYSvj5t28zBYZKy5ZYc3t3qupUeg52J0apd6CbhYlLHhgbT4R77VxP0D0di
	AJ73iJ2oixavKTjRsvyxLWiaH6B3+KI5hKzw8lz9/YfI8ONSCUl2DXUFYsAotuAXjc/j1Wk
	Nq14q8h8LpOKau42zH1ryczN2TkFAAUdEKow+9Wet89dqzb6h7dpaSzFZlEBO9FlpL804/f
	Nb9h/Wywn3/FOgRt2FP/vOfkxus6eBUah2irq9bYNXbfrIQUYfdQ9BtWWDHob0rMo0Szh/S
	pxGmzvezZhmPHFucBepr2jIAc9WM4Mhjk+UaQLz5RQk9GAF0D3Ba54ibUacf+H0EfQiF8qr
	t9NYgOhap01tMR7n2bFSPwwbyGrGSUcMHdpYZtnTDosZXbglMpL61zOfERvw3/5OADvoGLb
	nx2/I1eQgu1QxXWUxxM0oy8I2pcxgaDR9FGeVVmhhN+sIq1I/yj5ZEZ9D25pissIxSBtUL6
	kMBPkHgYvI8lt687U3LzEipvmU0YY4h4kcsps08a2M4XiFZ0GT34gQ9PrMQ+bORBuXx/VRS
	+eap6hmXCFsy5d+uQRFybF9QxLdoY/REWKZyWjEYRmc/dC8K/MW24eRdVt0xYEagX7J1rDJ
	J4Y0Hah0CwMePL8i3MEZMa8nO5fTnAXhMXVwGhJDEf9H8K/d1PQcNFGibPRf+RbADQudVZw
	6cV/RqL+StNxQN0sx1KFJwvjetzpX9bgKIy0lnw8T+9Y9y5XIKtwr4Fj95poXKD0raHUkVS
	N9FoQI9SBQZKXcjn28qpVjtclkgbGBhX8NNd0NHzoBOfk6UjtDqIjmKRvB2kLegDCRzSx6/
	d9YszO6nVjZMn+eoM6zgT3XrvJyS8GupHQ7kpJp4xUF4Qp9DRCwV9PCviJzrD2m6mhVGfJy
	O+a4y5U5TTDSdxionRsc8HIOFYqL9+/6/bFmvVSfizDLEJt0xvEsKEnpZ2Z55sMEmupbTco
	FY8JL5/hdh4eYYL3h8kQZQGUc52Gqg4qaJD+1VvQ==
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260118_233221_858736_5C3F13B5 
X-CRM114-Status: GOOD (  14.31  )
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

From: Chaoyi Chen <chaoyi.chen@rock-chips.com>

The drm_aux_bridge_register() uses the device->of_node as the
bridge->of_node.

This patch adds drm_aux_bridge_register_from_node() to allow
specifying the of_node corresponding to the bridge.

Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
---

(no changes since v11)
---

 drivers/gpu/drm/bridge/aux-bridge.c | 24 ++++++++++++++++++++++--
 include/drm/bridge/aux-bridge.h     |  6 ++++++
 2 files changed, 28 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/aux-bridge.c b/drivers/gpu/drm/bridge/aux-bridge.c
index b3e4cdff61d6..52dff4601c2d 100644
--- a/drivers/gpu/drm/bridge/aux-bridge.c
+++ b/drivers/gpu/drm/bridge/aux-bridge.c
@@ -35,6 +35,7 @@ static void drm_aux_bridge_unregister_adev(void *_adev)
 /**
  * drm_aux_bridge_register - Create a simple bridge device to link the chain
  * @parent: device instance providing this bridge
+ * @np: device node pointer corresponding to this bridge instance
  *
  * Creates a simple DRM bridge that doesn't implement any drm_bridge
  * operations. Such bridges merely fill a place in the bridge chain linking
@@ -42,7 +43,7 @@ static void drm_aux_bridge_unregister_adev(void *_adev)
  *
  * Return: zero on success, negative error code on failure
  */
-int drm_aux_bridge_register(struct device *parent)
+int drm_aux_bridge_register_from_node(struct device *parent, struct device_node *np)
 {
 	struct auxiliary_device *adev;
 	int ret;
@@ -62,7 +63,10 @@ int drm_aux_bridge_register(struct device *parent)
 	adev->dev.parent = parent;
 	adev->dev.release = drm_aux_bridge_release;
 
-	device_set_of_node_from_dev(&adev->dev, parent);
+	if (np)
+		device_set_node(&adev->dev, of_fwnode_handle(np));
+	else
+		device_set_of_node_from_dev(&adev->dev, parent);
 
 	ret = auxiliary_device_init(adev);
 	if (ret) {
@@ -80,6 +84,22 @@ int drm_aux_bridge_register(struct device *parent)
 
 	return devm_add_action_or_reset(parent, drm_aux_bridge_unregister_adev, adev);
 }
+EXPORT_SYMBOL_GPL(drm_aux_bridge_register_from_node);
+
+/**
+ * drm_aux_bridge_register - Create a simple bridge device to link the chain
+ * @parent: device instance providing this bridge
+ *
+ * Creates a simple DRM bridge that doesn't implement any drm_bridge
+ * operations. Such bridges merely fill a place in the bridge chain linking
+ * surrounding DRM bridges.
+ *
+ * Return: zero on success, negative error code on failure
+ */
+int drm_aux_bridge_register(struct device *parent)
+{
+	return drm_aux_bridge_register_from_node(parent, NULL);
+}
 EXPORT_SYMBOL_GPL(drm_aux_bridge_register);
 
 struct drm_aux_bridge_data {
diff --git a/include/drm/bridge/aux-bridge.h b/include/drm/bridge/aux-bridge.h
index c2f5a855512f..7dd1f17a1354 100644
--- a/include/drm/bridge/aux-bridge.h
+++ b/include/drm/bridge/aux-bridge.h
@@ -13,11 +13,17 @@ struct auxiliary_device;
 
 #if IS_ENABLED(CONFIG_DRM_AUX_BRIDGE)
 int drm_aux_bridge_register(struct device *parent);
+int drm_aux_bridge_register_from_node(struct device *parent, struct device_node *np);
 #else
 static inline int drm_aux_bridge_register(struct device *parent)
 {
 	return 0;
 }
+
+static inline int drm_aux_bridge_register_from_node(struct device *parent, struct device_node *np)
+{
+	return 0;
+}
 #endif
 
 #if IS_ENABLED(CONFIG_DRM_AUX_HPD_BRIDGE)
-- 
2.51.1



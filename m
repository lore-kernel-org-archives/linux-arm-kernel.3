Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A4DECA5FE4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 07:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R2+PAKy3j90tO2/aruykNQqG1CqbsF2c64m7OhVP2Wo=; b=twfzRjkFqANmXJEW/P7pXjN68z
	lwh6wg3N6jJdQrNzJqC22loa8FXT9U5XQ2amNo1sJJcEVQthks+5cxRjhWMoYWgnuHGRu60egPUdF
	XLlwNmJ2cPvPvVhwqQIpZDVKPqJj/+1T+CJVhNnx3JRq6vfFCYCCKiK3UPcq7zC8NaQ5nEKUXDF2y
	FEmZ7aU6rahjVAbj+GgzSXAhYnw8csJiRu3qHHU12K3N1FTQrvv2WKmzlbiRJFVHDccE2Ug1zSe8F
	/nOCeuvl2PlyPWpPwPkzsiIBoVdqWvJ2/XSOtE4s+qTYkkPxt18FjKIoMgPoZq0tQMootBc+cAuCL
	HD9BrJuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhjl0-00000001ULI-1vnH;
	Mon, 19 Jan 2026 07:33:02 +0000
Received: from smtpbguseast2.qq.com ([54.204.34.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhjkp-00000001Twk-2YtR;
	Mon, 19 Jan 2026 07:32:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1768807919;
	bh=R2+PAKy3j90tO2/aruykNQqG1CqbsF2c64m7OhVP2Wo=;
	h=From:To:Subject:Date:Message-Id;
	b=rNZHckNKhaY6F7wiYYQiZkDYylENwPGBlwWj6V1o9vEwLLaSCzI+fkaHnMBEA4egO
	 NnrEz1tJJILZ6y0o2FWTsHRkfZtPMOuTC/F3HbtsFWxL3dHMX4SbjBsQ3knxQkLq59
	 Jt7flNPyJjdu3heAmJGxt+4GQZJZ0a7+Sh/5D7Fg=
X-QQ-mid: esmtpsz17t1768807916td2cc47e5
X-QQ-Originating-IP: 3ssUqBNd2o2Knol46BpVfLFCjgBvfw+ahn46Z46w9Z8=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 19 Jan 2026 15:31:50 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 924543254067491200
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
Subject: [PATCH v14 6/9] drm/rockchip: cdn-dp: Support handle lane info without extcon
Date: Mon, 19 Jan 2026 15:30:57 +0800
Message-Id: <20260119073100.143-7-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260119073100.143-1-kernel@airkyi.com>
References: <20260119073100.143-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: NnBlO8MsmACrglOFaBS8I5wY/8DtEHu1hfUKYZOzmRcMqDoBS2gbrF4D
	ke49P8Yu9jtoJ78WfoBf49dDBkGtyY1fUpKMPTlVcKIhZ9ZtdvWjVWIh4gzORGCcSmzK7ZT
	SccI68QPl161N+cpY4C39JnXMWn6RpcmgYPqQP+/G3TxYALQj13LhSz7STnSBcrHPquFK14
	w5+7n4FeoLkIIdWWiQm11sPCA5dZhV3chSsJMS5WFwxah5K50J6YuL1Y2EN4q2msMoEyfsI
	TaLvbcfaS4S189rZnnJFBuH0ie1rmQvAAoHEQ2g9/qw74neplEQQam4uNRsg6mB3ZdD/XJw
	fVYS1ig0vAbtb7S7i+IJgZjbp1xJWC8m96BufH0KUJBn79MX/c7xsBHAB2iF1T2Lm2Vk0yM
	tbvPPDEecSrMlQZkW0HHcRnDXnByk+sSRsTtvIA44MgQrj/qaJ5ZZ8SSScXuUQ4Kz2qgEOq
	Y9ZliBWydKQkOV/B1vT9wlzFAn+iROzAAwWQprIugHmvgFHTFWalPzD2ouz1qlso6JouitE
	vO0JUuzE8ipb6aXlJkyB4onnPkARX98oH/m8tFse6pVwrXUlrroymS0edMynItArFVvYJxT
	CJI8XfTMtsiPsIs3rJSaxWOdqRzQAShkSjMRPzt3zDxrENihvwlnNiyhbHXgMZwi4a9Taxn
	CRTnQXHTqEJ4svdLw9yQddfvt+jf3JbrOz/Tmbl6Zu1pr/Fhz2J0xWB6HXn0SvwSBvmPp3Z
	TDC9No6RDs03Jjy3NprG2qONbLX4POrd0+lQfc6rqTinZxNicG/CuuA8hPfvB2AYLBSRqOV
	F/SY0v9IIaimscWSJKnYLdLVOzssN4ksssj0DgTny35M70tsZ0r/HvFt4n1OPyFPo0lazeY
	FANvt4lxYBHvWw5t6Heot4Y3o9TfFZW7ugTliEAMcuCyK5CkWgSKS/AjCTOW65cnDe1knuT
	ub3i7E/p/A8T6FYXLU2C8ZWbD2SimS5ANrmZRNdv8RGBj9AXSW9pL7nykRKV/aumgT1ydWt
	a4apD661i6Vfsi15QeLY1Ql+thmmkJMWy9x4uHj8upXhgPcQyjoQPF/Mr9+3A=
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260118_233253_097365_77E6618A 
X-CRM114-Status: GOOD (  16.95  )
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

This patch add support for get PHY lane info without help of extcon.

There is no extcon needed if the Type-C controller is present. In this
case, the lane info can be get from PHY instead of extcon.

The extcon device should still be supported if Type-C controller is
not present.

Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
---

(no changes since v5)

Changes in v4:
- Remove cdn_dp_hpd_notify().

(no changes since v3)

Changes in v2:
- Ignore duplicate HPD events.
---

 drivers/gpu/drm/rockchip/cdn-dp-core.c | 25 +++++++++++++++++--------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/cdn-dp-core.c b/drivers/gpu/drm/rockchip/cdn-dp-core.c
index b7e3f5dcf8d5..1e27301584a4 100644
--- a/drivers/gpu/drm/rockchip/cdn-dp-core.c
+++ b/drivers/gpu/drm/rockchip/cdn-dp-core.c
@@ -156,6 +156,9 @@ static int cdn_dp_get_port_lanes(struct cdn_dp_port *port)
 	int dptx;
 	u8 lanes;
 
+	if (!edev)
+		return phy_get_bus_width(port->phy);
+
 	dptx = extcon_get_state(edev, EXTCON_DISP_DP);
 	if (dptx > 0) {
 		extcon_get_property(edev, EXTCON_DISP_DP,
@@ -219,7 +222,7 @@ static bool cdn_dp_check_sink_connection(struct cdn_dp_device *dp)
 	 * some docks need more time to power up.
 	 */
 	while (time_before(jiffies, timeout)) {
-		if (!extcon_get_state(port->extcon, EXTCON_DISP_DP))
+		if (port->extcon && !extcon_get_state(port->extcon, EXTCON_DISP_DP))
 			return false;
 
 		if (!cdn_dp_get_sink_count(dp, &sink_count))
@@ -385,11 +388,14 @@ static int cdn_dp_enable_phy(struct cdn_dp_device *dp, struct cdn_dp_port *port)
 		goto err_power_on;
 	}
 
-	ret = extcon_get_property(port->extcon, EXTCON_DISP_DP,
-				  EXTCON_PROP_USB_TYPEC_POLARITY, &property);
-	if (ret) {
-		DRM_DEV_ERROR(dp->dev, "get property failed\n");
-		goto err_power_on;
+	property.intval = 0;
+	if (port->extcon) {
+		ret = extcon_get_property(port->extcon, EXTCON_DISP_DP,
+					  EXTCON_PROP_USB_TYPEC_POLARITY, &property);
+		if (ret) {
+			DRM_DEV_ERROR(dp->dev, "get property failed\n");
+			goto err_power_on;
+		}
 	}
 
 	port->lanes = cdn_dp_get_port_lanes(port);
@@ -1028,6 +1034,9 @@ static int cdn_dp_bind(struct device *dev, struct device *master, void *data)
 	for (i = 0; i < dp->ports; i++) {
 		port = dp->port[i];
 
+		if (!port->extcon)
+			continue;
+
 		port->event_nb.notifier_call = cdn_dp_pd_event;
 		ret = devm_extcon_register_notifier(dp->dev, port->extcon,
 						    EXTCON_DISP_DP,
@@ -1120,14 +1129,14 @@ static int cdn_dp_probe(struct platform_device *pdev)
 		    PTR_ERR(phy) == -EPROBE_DEFER)
 			return -EPROBE_DEFER;
 
-		if (IS_ERR(extcon) || IS_ERR(phy))
+		if (IS_ERR(phy) || PTR_ERR(extcon) != -ENODEV)
 			continue;
 
 		port = devm_kzalloc(dev, sizeof(*port), GFP_KERNEL);
 		if (!port)
 			return -ENOMEM;
 
-		port->extcon = extcon;
+		port->extcon = IS_ERR(extcon) ? NULL : extcon;
 		port->phy = phy;
 		port->dp = dp;
 		port->id = i;
-- 
2.51.1



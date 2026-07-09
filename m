Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 881FCC44509
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 19:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cpGOn4ncQ+8uWDiuy8UlZt0278AZtJATC4pG4Ece5LE=; b=vpVzLLi9BJ/Ag8iR8EOgcF7UjL
	tTHk0dDIuqeK2txWXgsEZi7sGCioOk9MpIGykmeLwe8xasu3u7oW8d3tmsYyIZWSYkmaXlIo8BAY8
	a0FfAXSEIy4sxfzsX4cVMSblLBgl0giK60FxA7pr2nd0qS0rTwiBX+onKlwUT9x9IvhuuFNWvBiPf
	RizFQ84icIVW6WTyriMLjSLlu0HXKn1iaWMHgmRKSoio4UeGN/WpO7G+3Hv6JuI5329xrP8HLzPKf
	4jrWpE7mXhnR+rYxxECHTLeTkZql4whnUooE81bmYFFKH2LS+mzAvmTwU0dMYTG8XgG3L8YT6Uwji
	PCbBm2MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whu1g-00000003Mfc-0yrI;
	Thu, 09 Jul 2026 19:03:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whu1F-00000003LXq-20kM;
	Thu, 09 Jul 2026 19:02:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=cpGOn4ncQ+8uWDiuy8UlZt0278AZtJATC4pG4Ece5LE=; b=UXsrmi2NPirXiXirS2Zv8uso6s
	wc2rOYsDBCEhSf/CYdJzKuMGUag3h28cr53qliLJmgkMhOnk21Ys+kE1MJLKChSH/9CU3gS6Uk5W4
	6+HfQO5bhM+xpga8rDIN3WmCibPLwv9EFIvlcwXcDkgzgaYqc5XpxT8nJw9bZLUyd47ojjpeETjWT
	16m1mQVDBCYve62AODffEhzqi8YLSdDxsJGpdTmb5WcFU+23J+Y7eX4FqvE5J9IwWDfCU+4VF+GnH
	SMMipquBFOqnIdmaZEYbf3TFoYEoHdyWr2a5SOzqUb/vSQ/9jZ+KWLY/6YQvjFOKcX6WVHfyC2K9p
	Prr8pyiw==;
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1whu1A-00000009TLw-34mc;
	Thu, 09 Jul 2026 19:02:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783623751;
	bh=CMG/CUmZrtg18KmezHV3ufGYNTtkcjj1u5f9TkystVM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=InaqGypfFys1kNcd8am0xeDCHcNEl3CPdZ0Wkipan0vCi+NCC/6iUXgPRdXUixIh1
	 X3RqvB+hzqukO7hLFRwEN3yGKckrUVwUmFhHUwdAiKQkopqAsjYrbrNsZfbu5TUQhV
	 7hVobxdyQRlFrkvxXPhyWlTyT4lvx0+uPWTX6NZkvsBpjzeQs0VeicYTh76NH1EbfJ
	 zL8P6AMWMASozuDKtYxe+WmqNQclyxRCbdKRrf686VZ6atcV4TNjBgoSjRIl2yGUwA
	 GVMad97Ola2Jv3F4hYkawhUmfHy7orJ5OsR/RVAQRm8cNU3wo1cJ8Z8Osm4S5Z5oJt
	 oyDBvyIew59mw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C39DC17E102C;
	Thu, 09 Jul 2026 21:02:30 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id C3448480068; Thu, 09 Jul 2026 21:02:29 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 09 Jul 2026 21:02:45 +0200
Subject: [PATCH v11 22/36] phy: rockchip: usbdp: Use guard functions for
 mutex
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-rockchip-usbdp-cleanup-v11-22-a149ac60f76c@collabora.com>
References: <20260709-rockchip-usbdp-cleanup-v11-0-a149ac60f76c@collabora.com>
In-Reply-To: <20260709-rockchip-usbdp-cleanup-v11-0-a149ac60f76c@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Frank Wang <frank.wang@rock-chips.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Andy Yan <andy.yan@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Yubing Zhang <yubing.zhang@rock-chips.com>, 
 Alexey Charkov <alchark@flipper.net>, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 devicetree@vger.kernel.org, linux-usb@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4395;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=CMG/CUmZrtg18KmezHV3ufGYNTtkcjj1u5f9TkystVM=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpP8EVxhp9vAKY0sJqdvAcGpcODTPZ9kKKXW
 EWmI6x1wWZxhYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqT/BFAAoJENju1/PI
 O/qabD8P/i7l4fmQtvWMPGtcxmxLUuoWZFPD/YR/+jEdBeHTYIIfxeO6ubIqu5Gwy3LHH+qhEsq
 VtAQfFhMRvCJGjExRsB+jeUSc3KfQjiRZnK07OwQfIOu5aKqmoZE3tDg/3sVFjtMR2xIHSjye5X
 pv8emIRpElmwfIXIwhQvueFW+Ch2Y8dggjCK2vp2aF8jpOVcrPrxLdspDEQJ8D5e5WN7qx9rp/b
 6EC3d7RrnJdseA1O44aQxDpVKrzuomwBMDIOvc3w3Zw98tWZkXIzPkhrvj5aS2wO1ZDftJXkGj5
 eQ2CCqzx+qQCAjewIzbU6MrKN/V44k8DaaNL/onBjqfdoIa+BcC4I0WuVdLK+7BtvdbzMbNyACG
 9ztOnwp+irDDx0nMd5I7xOLmbglP0moHpyO0K3dcKpaKYaJDphmQ2qSDM+SvEkfE48NRH0QXwG4
 dZSVEFNnAkI04H+j5lRxV1Mt33weHGZ9YdRIU3uT+gJji3STTN1m7v53rCWCCQkVqE3JfTnBSUa
 sJaxeFqAktQgcbusYvtlA3EqDUm15+F2Ccqq82Ofnx18CnG7gD9ExvUJBHtKJYnrdnudRhIrDRk
 KIiK5MwS/wX9qpRJ/Ac/v/8Sa1ldiBKitRqhNr5K5qJZqO0I2t/MW0YUyw+DSwSt8bGlASREr0Z
 toPfMPSzW5LMM2AoaljA3Qg==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_200241_171388_826D0A0D 
X-CRM114-Status: GOOD (  15.08  )
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

Convert the driver to use guard functions for mutex handling as
a small cleanup. There is a small functional change in the DP PHY
power up function, which no longer sleeps if the internal powerup
code returns an error. This is not a problem as the sleep is only
relevant for successful power-up.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 54 +++++++++++++------------------
 1 file changed, 23 insertions(+), 31 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 0399cbf96e19..8c165bcab796 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -10,6 +10,7 @@
 #include <dt-bindings/phy/phy.h>
 #include <linux/bitfield.h>
 #include <linux/bits.h>
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/gpio.h>
@@ -650,14 +651,15 @@ static int rk_udphy_orien_sw_set(struct typec_switch_dev *sw,
 	struct rk_udphy *udphy = typec_switch_get_drvdata(sw);
 	bool flipped = orien == TYPEC_ORIENTATION_REVERSE;
 
-	mutex_lock(&udphy->mutex);
+	guard(mutex)(&udphy->mutex);
 
 	if (orien == TYPEC_ORIENTATION_NONE) {
 		gpiod_set_value_cansleep(udphy->sbu1_dc_gpio, 0);
 		gpiod_set_value_cansleep(udphy->sbu2_dc_gpio, 0);
 		/* unattached */
 		rk_udphy_usb_bvalid_enable(udphy, false);
-		goto unlock_ret;
+
+		return 0;
 	}
 
 	if (udphy->flip != flipped)
@@ -667,8 +669,6 @@ static int rk_udphy_orien_sw_set(struct typec_switch_dev *sw,
 	rk_udphy_set_typec_default_mapping(udphy);
 	rk_udphy_usb_bvalid_enable(udphy, true);
 
-unlock_ret:
-	mutex_unlock(&udphy->mutex);
 	return 0;
 }
 
@@ -1020,26 +1020,25 @@ static int rk_udphy_dp_phy_power_on(struct phy *phy)
 	struct rk_udphy *udphy = phy_get_drvdata(phy);
 	int ret;
 
-	mutex_lock(&udphy->mutex);
+	scoped_guard(mutex, &udphy->mutex) {
+		phy_set_bus_width(phy, udphy->dp_lanes);
 
-	phy_set_bus_width(phy, udphy->dp_lanes);
-
-	ret = rk_udphy_power_on(udphy, UDPHY_MODE_DP);
-	if (ret)
-		goto unlock;
+		ret = rk_udphy_power_on(udphy, UDPHY_MODE_DP);
+		if (ret)
+			return ret;
 
-	rk_udphy_dp_lane_enable(udphy, udphy->dp_lanes);
+		rk_udphy_dp_lane_enable(udphy, udphy->dp_lanes);
 
-	rk_udphy_dp_lane_select(udphy);
+		rk_udphy_dp_lane_select(udphy);
+	}
 
-unlock:
-	mutex_unlock(&udphy->mutex);
 	/*
 	 * If data send by aux channel too fast after phy power on,
 	 * the aux may be not ready which will cause aux error. Adding
 	 * delay to avoid this issue.
 	 */
 	usleep_range(10000, 11000);
+
 	return ret;
 }
 
@@ -1047,10 +1046,10 @@ static int rk_udphy_dp_phy_power_off(struct phy *phy)
 {
 	struct rk_udphy *udphy = phy_get_drvdata(phy);
 
-	mutex_lock(&udphy->mutex);
+	guard(mutex)(&udphy->mutex);
+
 	rk_udphy_dp_lane_enable(udphy, 0);
 	rk_udphy_power_off(udphy, UDPHY_MODE_DP);
-	mutex_unlock(&udphy->mutex);
 
 	return 0;
 }
@@ -1255,35 +1254,30 @@ static const struct phy_ops rk_udphy_dp_phy_ops = {
 static int rk_udphy_usb3_phy_init(struct phy *phy)
 {
 	struct rk_udphy *udphy = phy_get_drvdata(phy);
-	int ret = 0;
 
-	mutex_lock(&udphy->mutex);
+	guard(mutex)(&udphy->mutex);
+
 	/* DP only or high-speed, disable U3 port */
 	if (!(udphy->mode & UDPHY_MODE_USB) || udphy->hs) {
 		rk_udphy_u3_port_disable(udphy, true);
-		goto unlock;
+		return 0;
 	}
 
-	ret = rk_udphy_power_on(udphy, UDPHY_MODE_USB);
-
-unlock:
-	mutex_unlock(&udphy->mutex);
-	return ret;
+	return rk_udphy_power_on(udphy, UDPHY_MODE_USB);
 }
 
 static int rk_udphy_usb3_phy_exit(struct phy *phy)
 {
 	struct rk_udphy *udphy = phy_get_drvdata(phy);
 
-	mutex_lock(&udphy->mutex);
+	guard(mutex)(&udphy->mutex);
+
 	/* DP only or high-speed */
 	if (!(udphy->mode & UDPHY_MODE_USB) || udphy->hs)
-		goto unlock;
+		return 0;
 
 	rk_udphy_power_off(udphy, UDPHY_MODE_USB);
 
-unlock:
-	mutex_unlock(&udphy->mutex);
 	return 0;
 }
 
@@ -1315,12 +1309,10 @@ static int rk_udphy_typec_mux_set(struct typec_mux_dev *mux,
 	if (!rk_udphy_is_supported_mode(state))
 		return 0;
 
-	mutex_lock(&udphy->mutex);
+	guard(mutex)(&udphy->mutex);
 
 	rk_udphy_set_typec_state(udphy, state->mode);
 
-	mutex_unlock(&udphy->mutex);
-
 	return 0;
 }
 

-- 
2.53.0



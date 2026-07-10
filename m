Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1CDDC43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 16:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cpGOn4ncQ+8uWDiuy8UlZt0278AZtJATC4pG4Ece5LE=; b=t6ZqNxokyud76auLnj8O+FsR8I
	ml7TkuCl3o0BaV6TRXPwvh13EHwvSOLaYZnYNhu2AZT7CRgu57zrLE7AjQ74sOzL1zc4u+AZoB0eq
	T9/i96x05iBPl9cwOhYL/JnJ6JIlkr+nkMXk7fzO75xGjuk44Xg4U3++SQWVchUCKBEy6M71BXaww
	/wNlPRjG2GXzu20uq7JKsjLiqhFGlxGDnVWBfLvq5Bf2OeE7uF4/yEniA9eHHGynWSS1PcXzvKuz1
	e5FCVljCnI6V5MGGvtSdbVXe7eKFEIyToXZe1EQTHLWptk/1VzPh/Jup4LeSezJS+5SDTXIMudj6r
	B+eS9O8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiENl-00000005Kf0-2KzI;
	Fri, 10 Jul 2026 16:47:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiEMy-00000005JMQ-3q2l;
	Fri, 10 Jul 2026 16:46:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=cpGOn4ncQ+8uWDiuy8UlZt0278AZtJATC4pG4Ece5LE=; b=gYahFvSquYKxxPGCobKFCJ5ojO
	0M5FcxoAQvwLTSqrPPyP1J4wyII5DCQq10F1IqzFoqhVFRXsal5HjCznkJmnzZVJ2vWg8E9immTei
	1hbGfbnaIdulutSaacV7gp/aYX6nQ/s/kYyWkxhr7Rxc75KiZzMNVch1Q1t5J0/80OTkHnALruGku
	0HQIxX40KAeXcMJD1vgKK68io+dS7691OdAp/B7xFXQ8VdHeqZUo/1TUYDOBsGfGRMYvTqdw3Uadk
	aZ9rjHe0EoAeuyL82uklBJ3k84gPSXLk19hcUJpyuT6MOavWKabHnLgKR77C7qAL64I6okpT355xb
	87OIoG2w==;
Received: from bali.collaboradmins.com ([148.251.105.195])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wiEMw-0000000AAar-0C0z;
	Fri, 10 Jul 2026 16:46:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783701979;
	bh=CMG/CUmZrtg18KmezHV3ufGYNTtkcjj1u5f9TkystVM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=cROQ78GOps32OT7Z9xiXEn+YGZf0GpnxDB+TBDY//QzUwrEu1h6WwS/4EKl+0XG8P
	 2RlQUqAE6sYhpHCzyLZ6b1V39c5zAoMVwtk9cu1bf+cAAgX+PNlSFVuzfFZSwidW+s
	 EsYOyRkVLNx7Aj7g52QC7Zlzhb8a7MeSZtTLZLnDUdcx02Ssb54g64TCNrcr7uBrVA
	 ijWWfG47DhCVwtDppe147vMsBdbhdf9zDA5VqRi0g61FSTrdqF7JoGSYeAcYBGJ35N
	 AI3qTx1IFEQsBOf3PrsQUjYsA0zrOz+X90WhzFuv06SJm1Fp20lHedOL2WgjBAZOJN
	 zPj2IW5ftBM1g==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id F08F417E1054;
	Fri, 10 Jul 2026 18:46:18 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 08A9E480068; Fri, 10 Jul 2026 18:46:18 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 10 Jul 2026 18:45:00 +0200
Subject: [PATCH v12 22/36] phy: rockchip: usbdp: Use guard functions for
 mutex
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-rockchip-usbdp-cleanup-v12-22-8b41a9a9bef0@collabora.com>
References: <20260710-rockchip-usbdp-cleanup-v12-0-8b41a9a9bef0@collabora.com>
In-Reply-To: <20260710-rockchip-usbdp-cleanup-v12-0-8b41a9a9bef0@collabora.com>
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
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpRIdlgFcJdu3wJHuDaHEYoEZK+V8PeFOwPy
 ZRKqO38SUKdAYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqUSHZAAoJENju1/PI
 O/qanTQP/j8RkNVdr4uVg5VRbOrfqMCZqNC+AxTyrpccyu9DrQSW3OH3cyaaZ4sjzOMwVjcKkXa
 57Og1a+WLdWDthxAW2T7vcFfR00MUemIthNbZQqGVjDNc8lKZ27FnrOJJL6dZhRsZwaLC5lFMg1
 2ki1ulH+EA05+jREFUwDmTiyXlI4Co8T4mPFwoJQlUjsYIHvbRJXkARaM2v1zcbw4XHYoOn6dRg
 5/YBbt5UlUec61kKtUyg5bHkkwdfRfwT7HZV4WonZ6IxTfcAm3xK+Ns0N6mWwVoXMdPoxVB7qIv
 2EebgW7ZowJjVRiGFbi4iHsEWTdhPh57rwWMkNSnPyHmSev8ZE52SUsd2DPevt5f4COPtmi1/p6
 RuTDF5OlFls1NdmbpDj5sYH38WAp99G5hIGs7jLcAmHGPUGoEOuusElB41Ky013h9Zg714kG3BP
 f0MiPZwuTmR2svXiL+cVx8ISFm7MJ7qPRF66dFMoxesSiJsJy/Zz0WoE4+3diu54/1PLILc+B9s
 kil1AHvIm9z1MFIuCL14gsoczg7TlWrYjID6a+DGodgYlZHsqj18WyGjJbP+LYrypGHeZOOLlTr
 haN/NXKjaku0Hgvh/iWC30IR0LG4Bkw5b7hjo9lCSzv3PDsdc+7bhsWBfN83jn0MujdlwpS6chE
 H7MfjXhQzUeT4ZOmCGOwslg==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_174630_220531_3EBDBA87 
X-CRM114-Status: GOOD (  15.29  )
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



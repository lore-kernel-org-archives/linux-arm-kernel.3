Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2486CC982C3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 15:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MBcwLr113gwWZfuwFOIDKocTFAO0WGUXssn+AxWAPew=; b=kkPOXJBzrpJ6schtkzKOsLs8a8
	Zg0ofaXcXkaiYlm1tEQjHvK5tLW5UOb3JM5w8Lv4wUT3djXzVGyPOF8kMoHE3PMDs8AT2nywKY94G
	coDanPs8s34MikDn1ffbzRgHwYLxVwPSMyG+o699MBFq6t5M7ucDitOsFX/UmEjt+oRQFFssF15P3
	t0StOns3Gs+rNU42MlMiA5dAUfsQxNWe6g1KXIiNLJDUmcsvKC7YsRXtKFlnGdZivCGchy+rxFRfq
	KSm405nFPp3lBnf+HKEXFEHA+feSrcwkGXtmUr/btHqjh/YgWMVK9Jk7SVyEGri3RnG3/VcfLAJ9D
	hIl2YYqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Uvb-000000078WY-2srU;
	Tue, 15 Sep 2026 15:18:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6UvI-000000078S9-2fiM;
	Tue, 15 Sep 2026 15:18:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=MBcwLr113gwWZfuwFOIDKocTFAO0WGUXssn+AxWAPew=; b=J+vmJcCF6wrS5pkGL8yrmDymdg
	NVsOrkCyJoVhwo8GNQdZ49+c+E5sc3DxI7/APVw0u0p+Hwhd0CrXdaEjrqQq0HY+zO8Em6bwrJSKX
	kygNSTbTlL+iHA3RgmBGt1P0ifmEvmoTjXRtqu1iPnxQujmJslwvBl7ApxR7xCd/OEQtCgaW5KEWG
	hPeSWHs03KVmks78Yw5qgXrLsF6vGN57Hq0OnDIvc/bDcki/xEetshLvSkq42Tur/BP3O6fojWER0
	VQtsCBr51xEN+NdDj9OdVP0PUOF7k+RPSEHTFZJP/VgPzwR6ADU7zK5fACnjSfjZg0L72SQ1gI9AZ
	S0HHJFqA==;
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6UvF-00000006vle-3fWV;
	Tue, 15 Sep 2026 15:18:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789485488;
	bh=4ay9HedzmaAw9AOpIB2HEj425HBli4lesEM/GeDH6Ws=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=cg5t7IhUmD/nWSFCnqRs0kiBU8ihPO0fdhDugaflmmpoalPii7a0j2R089ON6QrY1
	 uRItSeFGKSn/JajS9cj78LiOPFFcKZc8NxQR05smag0ij9wof8oX6q4r/kHGAN3l+Z
	 WNNEWsdu5H/P9IYlNnFEjpeyX3e6jVOoZYjC/8XOAPvmpYpfvn5APk0ulpGR+vcJUq
	 Xt+CM3jphiWQDyEZbSvgGFyhGi6GS5QIV9pkHZniGWcG2PQcAxbOiFwnmWlWpvG8pR
	 KqeMArgv8RTCkcUJWUhv5zJAyPT/WMNEvU5J4Rznb23bpD7QzuNufkA+q4EMmZ5oUN
	 gdoc72h0GbWFQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5DFAF17E0D43;
	Tue, 15 Sep 2026 17:18:08 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id C3960480035; Tue, 15 Sep 2026 17:18:07 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 15 Sep 2026 17:17:45 +0200
Subject: [PATCH 5/5] usb: dwc3: rockchip: fix USB-C reconnect in gadget
 mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-b4-rockchip-dwc3-rockchip-glue-v1-5-763bb546824e@collabora.com>
References: <20260915-b4-rockchip-dwc3-rockchip-glue-v1-0-763bb546824e@collabora.com>
In-Reply-To: <20260915-b4-rockchip-dwc3-rockchip-glue-v1-0-763bb546824e@collabora.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-phy@lists.infradead.org, kernel@collabora.com, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2823;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=4ay9HedzmaAw9AOpIB2HEj425HBli4lesEM/GeDH6Ws=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGqpYa/a9SOAir0KW4AaNxa0ywVhpg488MTBD
 S0OITRoVLsQzYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqqWGvAAoJENju1/PI
 O/qa5RwQAKpvcFHb8bI5rMhfqAImvq7YJvT7RXR6ReF/8jl2T1nEvc6xW4/s2rJOnlbm8PQr6yj
 JesP2eExEyH6PNp1mNauTAmwALyAoeFG2iircznSMEpXFgXZjWjTzngeP2I4yW2LVfovn2oy0to
 UyiyGI4VTJ8YBiXTPT2QmaRzfN5IL+1+JHds6tAsnc1MvHG2Yq9Y2EzGFitweX3Q2LS4mSgMU6R
 fosX2KjeozFlR9Xdn9EHtmgnqjPBnkTw587QJMDeC8xXfUNXWLxgZ9eaEl3Y/IDwnCV/1jQKnQp
 fnSmknaz5xG0ChuKLhIOEJiazDS56oQcWXFO2hx85CXvDpr9TndZhSuZy/2y0Vb1BfUyWIzgts+
 MvdjtlQPoPZiV93AEL9Ib1gSjssPuU8sEPKloDX27V8wBZqhck/9aUhMbe/ku3m+Yrq13g1/qr+
 Mu8Hj2eg8whfz3OK4Ao7FZKWMTLx60UVFGrspmu6uCQDJE1vvXdMZY3nY+iGn7PjhoaZjbhAWqR
 2ug3lh5K9u2/lj3gGECQDoWMWdD0ai55PyeYKM8jPQZiwap2nUkA+sX2+s3c7wYlvoo+mpEB6AZ
 GyBXi8HOHTGN8d9wxnNNLmCCQiYaD8T4gvoEOlIgVaLiWDCFX4yV5nehFW/clwcwYEh26hbNJRq
 zTBYrZVo69pN8Vyq1904r2A==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_161814_137081_D0481843 
X-CRM114-Status: GOOD (  15.17  )
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

When USB-C is configured in gadget mode and the cable is unplugged
the USB controller is suspended. After plugging in the cable again,
the USB controller stays suspended and thus the port status remains
not-attached.

Fix this by triggering a runtime PM resume when the role is changed.
The Runtime PM reference counter is immediately decreased again - the
auto-suspend time is big enough to detect the connection status, which
will then keep its own reference.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/usb/dwc3/dwc3-rockchip.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/usb/dwc3/dwc3-rockchip.c b/drivers/usb/dwc3/dwc3-rockchip.c
index 7bdd6e2eb22d..bedec3295bb1 100644
--- a/drivers/usb/dwc3/dwc3-rockchip.c
+++ b/drivers/usb/dwc3/dwc3-rockchip.c
@@ -25,8 +25,17 @@ struct dwc3_rockchip {
 	struct dwc3		dwc;
 	struct dwc3_rk_phy_nb	usb3_phy_nb[DWC3_USB3_MAX_PORTS];
 	u8			phy_reset_active;
+	enum usb_role		role;
 };
 
+static void dwc3_rockchip_vbus_handler(struct dwc3 *dwc, bool present)
+{
+	if (!dwc->gadget || !dwc->gadget_driver)
+		return;
+
+	usb_udc_vbus_handler(dwc->gadget, present);
+}
+
 static int dwc3_usb3_phy_notify(struct notifier_block *nb,
 				unsigned long action, void *data)
 {
@@ -57,6 +66,8 @@ static int dwc3_usb3_phy_notify(struct notifier_block *nb,
 		if (!ret)
 			return NOTIFY_OK;
 
+		dwc3_rockchip_vbus_handler(dwc, false);
+
 		/*
 		 * Assert USB3 PHY soft reset within DWC3 before the external
 		 * PHY resets. This disconnects the PIPE interface, preventing
@@ -69,6 +80,7 @@ static int dwc3_usb3_phy_notify(struct notifier_block *nb,
 		reg |= DWC3_GUSB3PIPECTL_PHYSOFTRST;
 		dwc3_writel(dwc, DWC3_GUSB3PIPECTL(port), reg);
 		spin_unlock_irqrestore(&dwc->lock, flags);
+
 		break;
 
 	case PHY_NOTIFY_POST_RESET:
@@ -89,6 +101,8 @@ static int dwc3_usb3_phy_notify(struct notifier_block *nb,
 		dwc3_writel(dwc, DWC3_GUSB3PIPECTL(port), reg);
 		spin_unlock_irqrestore(&dwc->lock, flags);
 
+		dwc3_rockchip_vbus_handler(dwc, dwc_rk->role == USB_ROLE_DEVICE);
+
 		pm_runtime_put_autosuspend(dwc->dev);
 		break;
 	}
@@ -130,7 +144,16 @@ static int dwc3_rk_phy_register_notifiers(struct dwc3 *dwc)
 	return devm_add_action_or_reset(dwc->dev, dwc3_rk_phy_unregister_notifiers, dwc_rk);
 }
 
+static void dwc3_rockchip_set_role(struct dwc3 *dwc, enum usb_role role)
+{
+	struct dwc3_rockchip *dwc_rk = container_of(dwc, struct dwc3_rockchip, dwc);
+
+	dwc_rk->role = role;
+	dwc3_rockchip_vbus_handler(dwc, role == USB_ROLE_DEVICE);
+}
+
 static struct dwc3_glue_ops dwc3_rockchip_glue_ops = {
+	.pre_set_role = dwc3_rockchip_set_role,
 	.post_phy_registration = dwc3_rk_phy_register_notifiers,
 };
 

-- 
2.53.0



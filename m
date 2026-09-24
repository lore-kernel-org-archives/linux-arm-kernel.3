Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53567C98325
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 17:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lQLoppjSYZ4eXuWjqnBGhi/urt+nTFsbE0iqmDghzLU=; b=WKwT/7MafVIGNRKuk+YydxR0Vi
	aVF2LQBxz/n/SDZzHIxjyZB1nWUFmMqor+A97DqdiUwyC+oxqIZjZEydrCI4ZvMkQfJ50B6iZWFJe
	mTtAaQiYSQzC440jamVbpaS7o1L7JRPNUiTjcID46VIaQDbdNvD1m0/myXl+De/ToRc4914sg9YMN
	wI29Qp1ZuFkqSvLAfDqPtLmhPSyNOlKGCa00Q+OkLLsrwd0ssk+fEyagApIaW96M8Q++gUoEtH57U
	SGKZqrVtizxJn3x2BCxtQfGOqUmLnOk1poafK8XI2R3J/ZD+T4dIyT4FY/eJkNiCgeNyv0Yrt9uTA
	CJNk5j5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9nDY-0000000Bitl-07qf;
	Thu, 24 Sep 2026 17:26:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9nD3-0000000Bidz-1dxA;
	Thu, 24 Sep 2026 17:26:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=lQLoppjSYZ4eXuWjqnBGhi/urt+nTFsbE0iqmDghzLU=; b=mcpUXnSzvqmXLzXkrRmHfTh4aA
	LPXsl5qmyfyvPJ0zl0PyJjWf6FUVjbgbQHtsJUduN1z/tlYuf0woC8uN3XcUg2m7QTZdXvymKngfe
	Xr8045sLaJgUSFYX3zeLueraEsj3seSLwscHObHGTrfbPrEw6IBh3TXH48hM2DDeq2guS9o5thDYY
	IrPaNxowLRcimMifBr8hLjxuqN35oE8GL3pA3Q+eKG9K4XwcGbxl7xfwVRLHY5qqpe/wnvCM9rjCC
	CDbVzL2lpaVdLfpTaU/4DJanxnQkahm0Slm8Mh2AkySSB6JvqZrbflTPAf1cZ53jmIPP8PWe1YrqS
	OA9D+vjA==;
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x9nD0-0000000GF6Y-2TDx;
	Thu, 24 Sep 2026 17:26:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790270762;
	bh=YEWEtK3OAKTM8p7PXwLKo0yacKTTo23MmLht74kfYi8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ZEsiaBC9zZ+KG2q7Q7R0y5EjRpPfkC/kmcPHW7MNX9OM1w89g/o8T9vMxHOh4p1vJ
	 x6N9si/dZH0pFlyZCdY7glZUFQYBKpv2GX3zR7zL7GLcvygsx1zygi4ySnIBJknYdo
	 ++uy5pr2C9fz4ooaXfAa24vNWpvw0XSNjGkvpeijJLNF98UXczg2ZtI/SqaIIZIKtv
	 y1PXnbbOlQ7BZFFpi2V7DS32c4ZofITJ2253484g+QUgOpTZd/b+iSGvONEuuzY8a1
	 BAUE2DpQX0uhuGVzOPKdO6X3mKGCXU82rOz98TkXYqt1hxVfp8nyj0X5v3C4yrmQ09
	 xCl49Z8UHZphw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4760217E0D5D;
	Thu, 24 Sep 2026 19:26:02 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id A1908480038; Thu, 24 Sep 2026 19:26:01 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 24 Sep 2026 19:25:42 +0200
Subject: [PATCH v16 6/6] usb: dwc3: rockchip: fix USB-C reconnect in gadget
 mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-b4-rockchip-dwc3-rockchip-glue-v16-6-126a2e9133c3@collabora.com>
References: <20260924-b4-rockchip-dwc3-rockchip-glue-v16-0-126a2e9133c3@collabora.com>
In-Reply-To: <20260924-b4-rockchip-dwc3-rockchip-glue-v16-0-126a2e9133c3@collabora.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: Igor Paunovic <royalnet026@gmail.com>, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-phy@lists.infradead.org, 
 kernel@collabora.com, Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3153;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=YEWEtK3OAKTM8p7PXwLKo0yacKTTo23MmLht74kfYi8=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGq1XSlS+3KF/YdkO6CeAE9m8ZTAA49feZOcM
 GGF9k9kRzgWGYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqtV0pAAoJENju1/PI
 O/qap3sQAIFzrHsf7RhgG5KHrxkH4p1durXd17NT8Ez7CYxUZ0NqyS9rvbvRoOI3MorxKRe64/w
 SSz6fFo/0TdMlegOhmGvXSIPadXTOm9+uR6+9ry8elX4PCHgOO15gym9C3J/ZdKQ+plCL7wEGDn
 lLb+Jk/yHtMlREzB0tlDCfLC4crWkB74tZWIkDCWkIQYNzag/FoalbOaLAYZrG0Ju1nP/NTbz1R
 Vn6fo6yikBse69UFwGuUFvzICwfFX2DpTYAizd5bmAfCZj7H0CMUCa0WzNWINrtPNYRd5/xNg2s
 ltMKdEwa8E0q7qjL/4ubkpZV0yqELBWvuWF7xODtpGx1DbZ+lHYn+XEByU0qqNulzilrjnXGgOU
 bKAviin8AS/PqP0B5wMw+SlLFQ9uJQOdjM0pjwxNfLDgOE4o7/R9n13FAPnFJB9UseNM4bLB88g
 e3snrWFo+q8ONgY6hVyLNNa+rYx+VRHONuPUpzXg7Srm7nvD4YiypZZfenTk0LQK519UjMR+QOz
 x3H3aoojVUzDjEO3mj1+qXtiHi9PTJYgF2R79+ni4bVIxkC6zVWo8G93OuidRiOwWqYiwzxIxHE
 QL8uCCjoj7eHfw5RKmSYaY9P8jeTogPKmZ03vNiPUEnR6SVE/hUItgCTuFcfgIkT3bb9OcPmMw7
 J8zqghlf57Eb3+J1YDPAlNw==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_182610_867742_1C832D29 
X-CRM114-Status: GOOD (  15.01  )
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

Fix this by informing the USB core about VBUS updates when the PHY
mode changes.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/usb/dwc3/Kconfig         |  1 +
 drivers/usb/dwc3/dwc3-rockchip.c | 23 +++++++++++++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/drivers/usb/dwc3/Kconfig b/drivers/usb/dwc3/Kconfig
index 3c120ea9746d..344291daf1b2 100644
--- a/drivers/usb/dwc3/Kconfig
+++ b/drivers/usb/dwc3/Kconfig
@@ -193,6 +193,7 @@ config USB_DWC3_OCTEON
 config USB_DWC3_ROCKCHIP
 	tristate "Rockchip DWC3 Platform Driver"
 	depends on ARCH_ROCKCHIP || COMPILE_TEST
+	depends on USB_GADGET || !USB_GADGET # if USB_GADGET=m, this can't be 'y'
 	depends on OF
 	default USB_DWC3
 	help
diff --git a/drivers/usb/dwc3/dwc3-rockchip.c b/drivers/usb/dwc3/dwc3-rockchip.c
index 17b6c2ca9e19..ba8ffef2f27e 100644
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



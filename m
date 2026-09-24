Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F15D1C98324
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 17:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mpHylAvqr2SkMDhvhUGdLvZ/wGluYCgwdDfTiJn+bUg=; b=g4Z9s0LHsrlTsVghhxEN1xFxQO
	lNl//V5yCi3CpOQno6mSIHTT+P+kRVG/q4DecLMMyZKZIUvM801MfsZciv2ZbMcMh+owwFmZ4IW7C
	t3xMalvijsC6vJnkS19u0g0lXk2/RZ/hZStiVyBlIhW00yJttHBDRFhVBxNXxOMI+IJFu1DzlIUgI
	/b7OQt3afNbtLF3+JY0wbzl91nJNubiciKcNqQhxi0KOXKezbZoj/C9edLN5iwTTFt1afcfBd3kYq
	g5biJqv8mpkxdhrdjwsXVSRybUkmTLn85nr3+OKyBCfqAyyfCWo+iAQZDOSSiRcuPaXt6QR+u8Qkz
	sGgyZBiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9nDX-0000000Bisp-1t0B;
	Thu, 24 Sep 2026 17:26:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9nD0-0000000BicJ-1ZRk;
	Thu, 24 Sep 2026 17:26:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=mpHylAvqr2SkMDhvhUGdLvZ/wGluYCgwdDfTiJn+bUg=; b=Pn7eXsaqr9FNKBPBL7LcnLgaua
	rp5p9Rwn7skGYB4X6GFAYKShAMx460pYxg1dnldoJ2PGYgHysY2U1ZzYJtGuiaHF00h9ILZNTd8eD
	7YmJr47mo+z/8Y4nqMxPc9RBwhmBol6FfWZ1vWVODgx1z7xdvRo6EENMyBl++FlgxrB91kj8IdjDg
	ffSqeP7xMDKzNT6Hx9Zj1OiJXNpwcIGPPPLhtQ7rMWmQyV2rs5nz8pHy4d+pk3q0I/QJV5Y1i5qzE
	qnyxcGaVp5F/8ki2GYcmH8exgubd6S/ZjS8GUyq/m/IS9nh92etx3OGjZdydaYnNs6XK92qyia42c
	PgBl6obw==;
Received: from bali.collaboradmins.com ([148.251.105.195])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x9nCx-0000000GF5U-11Ty;
	Thu, 24 Sep 2026 17:26:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790270762;
	bh=vgyj0zwu+y/0Ls+edctXhjY5i1EXaJ5EiOLv+dh0N/0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=PoWF292WnnimvNHf78S3f2jO5QuqdMzVCnfK7R8BR7vGNvPWMtlH7akeGhXV3WA1s
	 jNzNpHtBhlM5hWBun7mbrKoRmHPvNCfDZhx/SFA6ElEqMg7k1Zo1oFVmiGuwG72joc
	 kZxWAPB8mIt8NA5YyNizjiowSKcI+bbRFsPfzoJ7F6tYCunkPn5lqcg/b4pcGCq36T
	 nAGwJZirl5RjO4wSEfubVzNYUURz3DYTOrIVp1vfudEbCEE0lizGcemJGymcAAlC/v
	 rlBtcRB8wYNzGbQWyeLKtl1RMhAZt2P6k0AaiMoMvPANjp+AjLlvYULA2ZwDYqmGwG
	 9Gx7HNBRy6D1A==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EDE8217E0A6A;
	Thu, 24 Sep 2026 19:26:01 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 9E199480031; Thu, 24 Sep 2026 19:26:01 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 24 Sep 2026 19:25:40 +0200
Subject: [PATCH v16 4/6] usb: dwc3: rockchip: support PHY reset
 notifications
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-b4-rockchip-dwc3-rockchip-glue-v16-4-126a2e9133c3@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6124;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=vgyj0zwu+y/0Ls+edctXhjY5i1EXaJ5EiOLv+dh0N/0=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGq1XSnX05C5Ib4QtOaFB124XcOl0yUkfAnig
 L1Ezm0hdBzjPokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqtV0pAAoJENju1/PI
 O/qau6YP/R+GE665LqDXQOXK0g70xDlGRfv3jiJMcu0TAB5/x4aCUsmo8eCp4c5a6acnOHCxFP9
 gyaqIv4YUnPGn2Jwo5qGbPIsYJn+C95hOv9RfnDAdTVYs9KG1WXp0Y29wyg35///+LBEYynDfv6
 56YFcM7Fo/aioFQTGOB/3fZ6XiiVD2siTfwjVwbYjxKjAoMhTU3yKyVdgYamwA5/cR7kQ9vIwjj
 I5v/oy3zA8Rl8WQWnwDWCx1XwEJN1OC3DXeUZAATIht7D0D+HnIR9Q/B5LqtsMHSd3Ua9VfDZoS
 vNWSWm5B+pQcvsc1jMOzgk7UzA+oFHOiqaO8E+rsszd1L75wnqLLVMMQ0jai/quEkBOn/i34AxA
 GsPa05WthOaNaArMRGqSUU8dkl0u25pL1TWhdSb7DjeB6RtsT99z4t4dFDY0JFRbseKsyQadtOk
 mes6luqSl59+ucrw+/wyZo7ixp+MfPg9P0hBl3slsB92Kt7MruqErltzKa8pKHEpR0tMKcdp2Te
 MxDrpmj/Eo8NarZ7c0LVplxmlbCeoMaOfKmOFyiDEudr3RelhiUqprBdqumSU+QAdO62JorJ8DT
 I3gY2tySEBjqa37yvBAvdI1Zsd1qXjhA5Uhcj1DKY+hEa4FRR1EbET9W1RNUEf4/9Fgd3e2varo
 iKgcWBBJXrd0ouKo2BiYxpg==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_182607_476375_446FD4BD 
X-CRM114-Status: GOOD (  22.92  )
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

On recent Rockchip platforms (at least RK3588 & RK3576), DWC3 IP is used
with a USBDP PHY providing USB3 and DP. This PHY needs to be reset when
the mode changes, which may happen when plugging in different USB-C
devices.

If the USBDP PHY resets with the DWC3 IP running, its internal state
corrupts resulting in the USBDP PHY not being able to lock some PLL
clocks, which effectively renders USB3 unusable.

To fix the issue this adds handling for the new PHY framework reset
notifications, which will assert PHYSOFTRST before the actual PHY
is disabled and will deassert it once the PHY returns.

Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/usb/dwc3/dwc3-rockchip.c | 127 ++++++++++++++++++++++++++++++++++++++-
 drivers/usb/dwc3/trace.c         |   3 +
 2 files changed, 129 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/dwc3-rockchip.c b/drivers/usb/dwc3/dwc3-rockchip.c
index 4129aefd6a8b..17b6c2ca9e19 100644
--- a/drivers/usb/dwc3/dwc3-rockchip.c
+++ b/drivers/usb/dwc3/dwc3-rockchip.c
@@ -2,11 +2,136 @@
 /* Copyright (c) 2026, Collabora Ltd. */
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/phy/phy.h>
 #include <linux/pm_runtime.h>
 #include "glue.h"
+#include "io.h"
+
+struct dwc3_rockchip;
+
+/**
+ * struct dwc3_rk_phy_nb - wrapper for PHY notifier block
+ * @nb: notifier block
+ * @dwc: back-pointer to the DWC3 controller
+ * @port_index: USB3 port index this notifier is registered for
+ */
+struct dwc3_rk_phy_nb {
+	struct notifier_block	nb;
+	struct dwc3_rockchip	*dwc_rk;
+	u8			port_index;
+};
 
 struct dwc3_rockchip {
 	struct dwc3		dwc;
+	struct dwc3_rk_phy_nb	usb3_phy_nb[DWC3_USB3_MAX_PORTS];
+	u8			phy_reset_active;
+};
+
+static int dwc3_usb3_phy_notify(struct notifier_block *nb,
+				unsigned long action, void *data)
+{
+	struct dwc3_rk_phy_nb *pnb = container_of(nb, struct dwc3_rk_phy_nb, nb);
+	struct dwc3_rockchip *dwc_rk = pnb->dwc_rk;
+	struct dwc3 *dwc = &dwc_rk->dwc;
+	int port = pnb->port_index;
+	unsigned long flags;
+	u32 reg;
+	int ret;
+
+	switch (action) {
+	case PHY_NOTIFY_PRE_RESET:
+		/*
+		 * If already suspended, the resume path will reinit GUSB3PIPECTL
+		 * via dwc3_core_init(). A forced resume is not possible as that
+		 * would call phy_init() resulting in a deadlock. Due to the
+		 * phy_init() in the resume path there is also no need to block
+		 * async RPM resume on our side, since the PHY synchronizes it
+		 * for us.
+		 *
+		 * pm_runtime_get_if_active() returns 0 when suspended (skip),
+		 * 1 when active (ref held), or -EINVAL when PM is disabled
+		 * (device always active). In the -EINVAL case PM ref counting
+		 * is a no-op, so the unconditional put in POST_RESET is safe.
+		 */
+		ret = pm_runtime_get_if_active(dwc->dev);
+		if (!ret)
+			return NOTIFY_OK;
+
+		/*
+		 * Assert USB3 PHY soft reset within DWC3 before the external
+		 * PHY resets. This disconnects the PIPE interface, preventing
+		 * the DWC3 from interfering with PHY reinitialization and
+		 * avoiding LCPLL lock failures.
+		 */
+		spin_lock_irqsave(&dwc->lock, flags);
+		dwc_rk->phy_reset_active |= BIT(port);
+		reg = dwc3_readl(dwc, DWC3_GUSB3PIPECTL(port));
+		reg |= DWC3_GUSB3PIPECTL_PHYSOFTRST;
+		dwc3_writel(dwc, DWC3_GUSB3PIPECTL(port), reg);
+		spin_unlock_irqrestore(&dwc->lock, flags);
+		break;
+
+	case PHY_NOTIFY_POST_RESET:
+		spin_lock_irqsave(&dwc->lock, flags);
+		if (!(dwc_rk->phy_reset_active & BIT(port))) {
+			spin_unlock_irqrestore(&dwc->lock, flags);
+			return NOTIFY_OK;
+		}
+
+		dwc_rk->phy_reset_active &= ~BIT(port);
+
+		/*
+		 * Deassert PHY soft reset to reconnect the PIPE interface
+		 * after PHY reinitialization.
+		 */
+		reg = dwc3_readl(dwc, DWC3_GUSB3PIPECTL(port));
+		reg &= ~DWC3_GUSB3PIPECTL_PHYSOFTRST;
+		dwc3_writel(dwc, DWC3_GUSB3PIPECTL(port), reg);
+		spin_unlock_irqrestore(&dwc->lock, flags);
+
+		pm_runtime_put_autosuspend(dwc->dev);
+		break;
+	}
+
+	return NOTIFY_OK;
+}
+
+static void dwc3_rk_phy_unregister_notifiers(void *data)
+{
+	struct dwc3_rockchip *dwc_rk = data;
+	struct dwc3 *dwc = &dwc_rk->dwc;
+	int i;
+
+	for (i = 0; i < dwc->num_usb3_ports; i++)
+		phy_unregister_notifier(dwc->usb3_generic_phy[i],
+					&dwc_rk->usb3_phy_nb[i].nb);
+
+	/* Release any PM references from in-flight resets */
+	for (i = 0; i < dwc->num_usb3_ports; i++) {
+		if (dwc_rk->phy_reset_active & BIT(i))
+			pm_runtime_put_autosuspend(dwc->dev);
+	}
+	dwc_rk->phy_reset_active = 0;
+}
+
+static int dwc3_rk_phy_register_notifiers(struct dwc3 *dwc)
+{
+	struct dwc3_rockchip *dwc_rk = container_of(dwc, struct dwc3_rockchip, dwc);
+	int i;
+
+	for (i = 0; i < dwc->num_usb3_ports; i++) {
+		dwc_rk->usb3_phy_nb[i].nb.notifier_call = dwc3_usb3_phy_notify;
+		dwc_rk->usb3_phy_nb[i].dwc_rk = dwc_rk;
+		dwc_rk->usb3_phy_nb[i].port_index = i;
+		phy_register_notifier(dwc->usb3_generic_phy[i],
+				      &dwc_rk->usb3_phy_nb[i].nb);
+	}
+
+	return devm_add_action_or_reset(dwc->dev, dwc3_rk_phy_unregister_notifiers, dwc_rk);
+}
+
+static struct dwc3_glue_ops dwc3_rockchip_glue_ops = {
+	.post_phy_registration = dwc3_rk_phy_register_notifiers,
 };
 
 static int dwc3_rockchip_probe(struct platform_device *pdev)
@@ -26,7 +151,7 @@ static int dwc3_rockchip_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	dwc_rk->dwc.dev = &pdev->dev;
-	dwc_rk->dwc.glue_ops = NULL;
+	dwc_rk->dwc.glue_ops = &dwc3_rockchip_glue_ops;
 
 	probe_data.dwc = &dwc_rk->dwc;
 	probe_data.res = res;
diff --git a/drivers/usb/dwc3/trace.c b/drivers/usb/dwc3/trace.c
index 088995885678..8c4e2a7b142e 100644
--- a/drivers/usb/dwc3/trace.c
+++ b/drivers/usb/dwc3/trace.c
@@ -9,3 +9,6 @@
 
 #define CREATE_TRACE_POINTS
 #include "trace.h"
+
+EXPORT_TRACEPOINT_SYMBOL_GPL(dwc3_readl);
+EXPORT_TRACEPOINT_SYMBOL_GPL(dwc3_writel);

-- 
2.53.0



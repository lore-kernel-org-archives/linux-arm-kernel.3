Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67592606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 18:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=npVTpu+f;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=LZNgwrtk;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=Tu725F5S
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q8G0zoKO5ovjy5z+eB9OIlV9JUGqwNY8eilqJ4aVXDc=; b=npVTpu+fkTnvttjCf1GdpVMhZ0
	QHRWuiKXXLSKVcigb+TvYTWpAi1LZ3AqGi9W3gn8m+ISgIpekdCMAdBGj6lE+OKViGOyvAFThDINQ
	SAfLiVyFLqs9TvZJa60PECAcm4Cq02GAvzjFgR009i+ddEzeVs3/G/sz10LykGxA9Z4ADPuI4trJM
	POtBeYUa3jfW6OkGx7lN922yJlia9QNn/qyWW89bSUzyVb2+tiiwCSE50EsZXEYStVbC6tWwIgrcT
	U+hohDjVSM5+UUPdUaB2GE+Th64zwF8r6Das+iluIWiOAMneE5zeGsqkzaMiPtLyouFl4xxuXhKW7
	3YHsfs2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJaha-0000000CcM4-1QTb;
	Wed, 21 Oct 2026 18:06:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJahG-0000000Cc5d-3rKM;
	Wed, 21 Oct 2026 18:05:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=q8G0zoKO5ovjy5z+eB9OIlV9JUGqwNY8eilqJ4aVXDc=; b=LZNgwrtkbbUs9Q1yBKPQ2q6EZi
	IzcEDQuaKORrFwelrtGILUQWqyF9IiB3gEd9y1QzlvnWsMV9xySMmLmCWl3LrStatKpOXTG8K4Xy/
	XX0S0ub/nFllUIHnZyDnl3KbBf3HwOfLEeXDqnIMKOphs4cCu0FpqPhCHcGxMIhWEPTDrKbcNWprb
	mxyJLrYhaMUDVGHVVpJdt9K+g+uIx+BmQ22pasNkucbkzRUwj8Ox93aswB+ZLdGRfEfhQw32s6VRy
	lB0wcknEamNSySpj6cKtmh055BI5YxkG4WhB6l1Jb2ebQawos2MoZa1DARQ9LLa8zEXN0VCINJFSn
	oCLi025w==;
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xJahC-000000066hV-0xbC;
	Wed, 21 Oct 2026 18:05:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1792605944;
	bh=H9yZY2oMjhME61aWYgFG+y3QHZrD67XIjzHa4/yVzXg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Tu725F5SI/lq8ej53kiVMPUHv9CMIAHmMFCQjBK+XD4ihRq1ifvkej4qU6/A5D8XK
	 22C+ysn9SzdIFNP/0bYysr6KsSCYmC59p1TINGAoAkdjJOzkI5lkRcDc1PQT9RrZHC
	 swV1lbHERScvSCQ4aruvFJMZNdfuBDKv+uHhmqXFfFyaTajfvuNMZA9cKNwM4RD+Cu
	 KGZYA22MAXVjKYj4mn3xDo18yvKcKtCiNXZlpTQzcZCUAzcOK+JrX9DK/sS5io5Yly
	 y3lnXlXhQeXlAWzS23xYvFDhznnGYMaQpSXIlQLOFpqtHrecES9B2QGjSkDFL4FqMi
	 ySmLMtk1mGpVQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EBFF317E0A5D;
	Wed, 21 Oct 2026 20:05:43 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 6896D480035; Wed, 21 Oct 2026 20:05:43 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Wed, 21 Oct 2026 20:05:30 +0200
Subject: [PATCH v18 5/7] usb: dwc3: rockchip: add USBDP PHY reset quirk
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261021-b4-rockchip-dwc3-rockchip-glue-v18-5-60000d03fca2@collabora.com>
References: <20261021-b4-rockchip-dwc3-rockchip-glue-v18-0-60000d03fca2@collabora.com>
In-Reply-To: <20261021-b4-rockchip-dwc3-rockchip-glue-v18-0-60000d03fca2@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5469;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=H9yZY2oMjhME61aWYgFG+y3QHZrD67XIjzHa4/yVzXg=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGrY/vcbTkq3txhiMaKGyQpz1p328LEZE2MXE
 Ao0uszgjtR8I4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJq2P73AAoJENju1/PI
 O/qaGZYP/214dQ4W7Z+xdnrXwkYOXDl1Fbo4g+WpYL7xOj6W1oWs/dWeDW9ufzmGIExboDJm2IY
 TRge3sZyQI5d2Blr3XNsT+A4IJVVFm/ppURLZr6ETxZh40XetGOL5bpvHEmYENaAK9tAXS15YVX
 E9cCrJbf6JfDBXrLooRgPEpwqUQN60Lv/k2D+S0k424133xdP2zEIFiMZZfvMeASY5TBFbZ6pUT
 EDt/MHos0hl8dkBLGGpA8ARoOrbIcH4+5Z1stPK1iBYxGSsTWroDrD22uzqdJRNuZMvQnu5q65w
 Dv4lp1IY95igecJyjZoe4MejQikGck0J3S3hLnm4DgxPj+/gGDp+reR+B4f/hiPPITv5zN84fRA
 bZVABLoSDSmciK8x3JUXix09lJoDnUySWvkATQJKTCaDsiZ1bqZ/dZJ4rOwwyLKs8qd/Znm4JX9
 UCVabi6espDrrNUpegQ7t+Ks2beclHQX52ynA/Xp6MfhAmjbHlcTryzCIyka4z/ZxaMHqOcZ4z8
 cOEOlK/LHqoIpQO9oN5tPdGJ9fkA7hc2N/ieavnedWb3f9l7JDL9w8ObaZFSThn2tkKbF/M30bn
 VJlbmseejl1c8LEYDj+N+bLJ/FICBPrjQS9JGy3TaRZazevyeWZmGpoDQUNwjdgEInCXq7g4s0x
 oduEd4fPAP0ifF+EFq+Mt+w==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_190550_329418_EFC81B00 
X-CRM114-Status: GOOD (  23.49  )
X-Spam-Score: -0.2 (/)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On recent Rockchip platforms (at least RK3588 & RK3576), DWC3 IP is used
with a USBDP PHY providing USB3 and DP. This PHY needs to be reset when
the mode changes, which may happen when plugging in different USB-C
devices.

If the USBDP PHY resets with the DWC3 IP running, its internal state
corrupts resulting in the USBDP PHY not being able to lock some PLL
clocks, which effectively renders USB3 unusable.

To fix the issue this adds a Rockchip USBDP specific quirk, which will
assert PHYSOFTRST before the actual PHY is disabled and will deassert it
once the PHY returns.

Note, that the same platforms also use DWC3 with a different PHY
(rockchip-naneng-combphy), so the PHY calls are protected by a
driver name check.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/usb/dwc3/Kconfig         |  1 +
 drivers/usb/dwc3/dwc3-rockchip.c | 96 +++++++++++++++++++++++++++++++++++++++-
 drivers/usb/dwc3/trace.c         |  3 ++
 3 files changed, 99 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/Kconfig b/drivers/usb/dwc3/Kconfig
index 3c120ea9746d..c86c1ac293bf 100644
--- a/drivers/usb/dwc3/Kconfig
+++ b/drivers/usb/dwc3/Kconfig
@@ -193,6 +193,7 @@ config USB_DWC3_OCTEON
 config USB_DWC3_ROCKCHIP
 	tristate "Rockchip DWC3 Platform Driver"
 	depends on ARCH_ROCKCHIP || COMPILE_TEST
+	depends on PHY_ROCKCHIP_USBDP || !PHY_ROCKCHIP_USBDP
 	depends on OF
 	default USB_DWC3
 	help
diff --git a/drivers/usb/dwc3/dwc3-rockchip.c b/drivers/usb/dwc3/dwc3-rockchip.c
index 4129aefd6a8b..75e647e04cc5 100644
--- a/drivers/usb/dwc3/dwc3-rockchip.c
+++ b/drivers/usb/dwc3/dwc3-rockchip.c
@@ -2,11 +2,105 @@
 /* Copyright (c) 2026, Collabora Ltd. */
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/phy/rockchip-usbdp.h>
 #include <linux/pm_runtime.h>
 #include "glue.h"
+#include "io.h"
 
 struct dwc3_rockchip {
 	struct dwc3		dwc;
+	u8			phy_reset_active;
+};
+
+static void dwc3_rockchip_phy_pre_reset(struct dwc3_rockchip *dwc_rk, int port)
+{
+	struct dwc3 *dwc = &dwc_rk->dwc;
+	u32 reg;
+
+	/*
+	 * If the device is runtime suspended, there is nothing to do and RPM
+	 * resume will do the necessary things. There is no need for a RPM
+	 * reference either, since DWC3 runtime suspend/resume will call phy
+	 * init/exit and that is synchronized against ongoing resets.
+	 */
+	if (!pm_runtime_active(dwc->dev))
+		return;
+
+	/*
+	 * Assert USB3 PHY soft reset within DWC3 before the external
+	 * PHY resets. This disconnects the PIPE interface, preventing
+	 * the DWC3 from interfering with PHY reinitialization and
+	 * avoiding LCPLL lock failures.
+	 */
+	scoped_guard(spinlock_irqsave, &dwc->lock) {
+		dwc_rk->phy_reset_active |= BIT(port);
+		reg = dwc3_readl(dwc, DWC3_GUSB3PIPECTL(port));
+		reg |= DWC3_GUSB3PIPECTL_PHYSOFTRST;
+		dwc3_writel(dwc, DWC3_GUSB3PIPECTL(port), reg);
+	}
+}
+
+static void dwc3_rockchip_phy_post_reset(struct dwc3_rockchip *dwc_rk, int port)
+{
+	struct dwc3 *dwc = &dwc_rk->dwc;
+	u32 reg;
+
+	scoped_guard(spinlock_irqsave, &dwc->lock) {
+		if (!(dwc_rk->phy_reset_active & BIT(port)))
+			return;
+
+		dwc_rk->phy_reset_active &= ~BIT(port);
+
+		/* Restore normal operation */
+		reg = dwc3_readl(dwc, DWC3_GUSB3PIPECTL(port));
+		reg &= ~DWC3_GUSB3PIPECTL_PHYSOFTRST;
+		dwc3_writel(dwc, DWC3_GUSB3PIPECTL(port), reg);
+	}
+}
+
+static void dwc3_rockchip_phy_reset(void *data, int port, bool pre)
+{
+	struct dwc3_rockchip *dwc_rk = data;
+
+	if (pre)
+		dwc3_rockchip_phy_pre_reset(dwc_rk, port);
+	else
+		dwc3_rockchip_phy_post_reset(dwc_rk, port);
+}
+
+static void dwc3_rk_phy_unregister_notifiers(void *data)
+{
+	struct dwc3_rockchip *dwc_rk = data;
+	struct dwc3 *dwc = &dwc_rk->dwc;
+	int i;
+
+	for (i = 0; i < dwc->num_usb3_ports; i++) {
+		struct phy *phy = dwc->usb3_generic_phy[i];
+
+		if (phy && !strcmp(dev_driver_string(phy->dev.parent), "rockchip-usbdp-phy"))
+			rk_udphy_unregister_reset_handler(phy);
+	}
+
+	WARN_ON(dwc_rk->phy_reset_active);
+}
+
+static int dwc3_rk_phy_register_reset_handler(struct dwc3 *dwc)
+{
+	struct dwc3_rockchip *dwc_rk = container_of(dwc, struct dwc3_rockchip, dwc);
+	int i;
+
+	for (i = 0; i < dwc->num_usb3_ports; i++) {
+		struct phy *phy = dwc->usb3_generic_phy[i];
+
+		if (phy && !strcmp(dev_driver_string(phy->dev.parent), "rockchip-usbdp-phy"))
+			rk_udphy_register_reset_handler(phy, dwc3_rockchip_phy_reset, dwc_rk, i);
+	}
+
+	return devm_add_action_or_reset(dwc->dev, dwc3_rk_phy_unregister_notifiers, dwc_rk);
+}
+
+static struct dwc3_glue_ops dwc3_rockchip_glue_ops = {
+	.post_phy_registration = dwc3_rk_phy_register_reset_handler,
 };
 
 static int dwc3_rockchip_probe(struct platform_device *pdev)
@@ -26,7 +120,7 @@ static int dwc3_rockchip_probe(struct platform_device *pdev)
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



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 692DCC982CD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 15:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kQsxWspdS7U3c4ivOhpT3MYJ0QjQncWXhnQYxLX/MCE=; b=bSNbuVxZUpWG+u7weBkzDD8e/T
	/3LQ3MR+dxkPGRKGdc0vJYeWoiqVR5TNhNHkxr79ObOfnww9bKuNgXCqbAS+n+fQndCjZ19Vo52ba
	THUwRGNmtn+AjlDE2VhgLC6DbSKGQmoY1+KnmQJ+yJJgqzHONbVt6kZe/QfQlXzQMy4GEoqKSXbA5
	HGjX2zrwXNWdikduAqx0TTcyWVFGIBzIaWuWhtn86/eL5o9N53vUqnVPJj4ASbgnJ6RDLjfPFrF6V
	NLFrC7uc4aknxkTBGWJyWgQwJl/Pquc/WR/fjCuUiuEHQ2JUETcDxGsoDVizDVpffLdpr33uhpHhJ
	rLb2zjPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Uvc-000000078XA-0cNY;
	Tue, 15 Sep 2026 15:18:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6UvH-000000078S7-09xD;
	Tue, 15 Sep 2026 15:18:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=kQsxWspdS7U3c4ivOhpT3MYJ0QjQncWXhnQYxLX/MCE=; b=KvZ7EtgHGihoyLQJ0s3+/G8QYN
	CwcDLOm61j35aop1gaFiSXw9Dcb36bQnbW30K+gEFPxJaB5nWsfJzHBvXxBxheuETM9EdSbcMme2l
	1ylDgxlxerzYbi+OgbQuH6CsGzMxfDQ9RrayFq4JetGogdoJMdSlvryqYN0ZqlDo0j59OVgmbekne
	VQtgp0wGSFVoKPBPpQ3ic7qAqtMW0wONTGFcfUw46HrMJFMJDpf6iS8cj6Uv/pPdsk72Et23pcYoz
	Z4NJirqKPYE4cTDnuQ4qZKRzpCrf04X2fpTJLKQGO+p2d+MVMLGiSOUbaZtMYre1kuYSJSCARdQlq
	0Wb6foQg==;
Received: from bali.collaboradmins.com ([148.251.105.195])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6UvC-00000006vkF-10m7;
	Tue, 15 Sep 2026 15:18:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789485488;
	bh=Qhn0zekKj4bR9GvLOaDUJOq2XlBpttbyt0gTlUC4p6o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=od+LUdr2tlbuo2E0JPDbIvGVK7PCqBuoSWM5Rol+I2eoNWZkOCA+jXdinLh4PLm5J
	 pwJ1gdx1Fm5m30DkRQmYotEJIpVo0uiRZjpJQ7CdSzPxATwOv4S9x4JB8IX5HnKB6g
	 1Hm97smjPaLZLzEeXXH0JTSghLG3XxIOrPCJcs+MHplkhfJwVX9O5N1XIydCTar0yE
	 Br8QqnkiaLsnbGT8ZglqnmL+eu8jMCzxn9LKOtMfR2emhFjkjKY0sJhE+jOst7gwMc
	 jzFDfBixNbJWtnZEQVGRxIbAvmE6TAF7spe7JFxclbABjiaS6nAnDIOcEcPQ+g8hof
	 6hgNnHBFjFBKg==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 119FB17E0C7E;
	Tue, 15 Sep 2026 17:18:08 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id C1ECB480031; Tue, 15 Sep 2026 17:18:07 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 15 Sep 2026 17:17:44 +0200
Subject: [PATCH 4/5] usb: dwc3: rockchip: support PHY reset notifications
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-b4-rockchip-dwc3-rockchip-glue-v1-4-763bb546824e@collabora.com>
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
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Igor Paunovic <royalnet026@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6072;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=Qhn0zekKj4bR9GvLOaDUJOq2XlBpttbyt0gTlUC4p6o=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGqpYa9EWQy52XGQUG2nVeQeoWJcilK/RTb44
 /WtTntTCmHJlIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqqWGvAAoJENju1/PI
 O/qaqs0P/3FnRSMhbAxkjmMat78LRPms7t6iFMM+SHIFaEx3ncQ6WWVSAa0iBIMBhIhNgj+94xM
 VFIsY4XLQWhSVtuNUqctqtbWF2Htq2xxZDzCDTt14wjtVMQaWWY6yoqzea1+OeRcHUHb2yjVpZr
 GGqiukcmzbpTQSnOnPMoKM7FVm28BxOLkrcX2alQKqWAnap5WFGVN4CVc6n/05R+2fY6NhbrEDJ
 nIkKL7lfYQJeaYklHdgtDjRIm+t5KfyI/ykIpqgOxDgA13Eip/+QV1F70p3BtwheEQynNd3bZTR
 hGkAfl9aKCce/H+xsuJ4gx60oQvqx5oF/aLVHr4o48OFKlWoPTta3BFOHAdT+bmwsOy8r3ixh85
 6StIN1JD0n8MtCiH50XaHsxrKUtGqC4pXywbz3HlWBBnYs6DzhFUTItSF1zhQa8rcKRxeEvYeMB
 QDDXX3+2QK1ClwnguMtQw2DgUHYr26N7B1G0EeSMJ6NnkWVixJIhypionsGUUp8/I71WFhulkOL
 PtMoSRZy+lM01sdzRoAIDC2UkM/7zK4pSZLeujaZMeBDE8JZ8XNBAWSaEBMH5SqSJdWd4X5Zl0/
 XR6vCPuja6aQDy6H2eoaJhCEcgTgOaypPMqsKvIvFMGX/vlbPail2PPfTrOU9Hy2zuw8+NcaqTP
 VQsIV8aR/srz1O3aRrIkhrg==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_161810_611966_DE2AD088 
X-CRM114-Status: GOOD (  23.41  )
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
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/usb/dwc3/dwc3-rockchip.c | 127 ++++++++++++++++++++++++++++++++++++++-
 drivers/usb/dwc3/trace.c         |   3 +
 2 files changed, 129 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/dwc3-rockchip.c b/drivers/usb/dwc3/dwc3-rockchip.c
index 62f2a03b08a2..7bdd6e2eb22d 100644
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



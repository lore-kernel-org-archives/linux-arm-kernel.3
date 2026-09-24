Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F26EC98324
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 17:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tAGT2xqmKSTqiy3+riXfehcUSUeebOKpm6qE3st51So=; b=3xq4wpogiqqptXtr1AJc6o8yDJ
	FC5PY2bQHtGkFBeSf/0evZeCMzd2GS1uySwLQVJguhe7mo9Oxab7fNrmOpU5V7QVJx9HiueiD9NEp
	KDSG/YG6nRuGDeVBAtAcjVKNMQySnSBrXvHPJS8nExvLqqtjfwENX3F3ms6ih1m5iidy7dGqJ/6Bd
	2pyYXuAuhCSFv2o19tCYlJgxmL9W3Zp5JyVoH8y66ng8WqX8ebifKKAmW2cazNtRMaWOAsL9jLvUJ
	1CemuGBTkw0P1Jklo4ZLTqEWDperpCFcLqsCp1kjjoPbINEG+/zwPHH0A9EZiknLGqyJTUVAyXy39
	73uZfntg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9nDV-0000000Biqx-17v8;
	Thu, 24 Sep 2026 17:26:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9nD1-0000000BicR-313M;
	Thu, 24 Sep 2026 17:26:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=tAGT2xqmKSTqiy3+riXfehcUSUeebOKpm6qE3st51So=; b=OZ2tT2T0OBPfNk+rJQiKIN8Qos
	E0b3OilkdR0+noG2h/9Lk59VhjfX8iLtaoLwguqetJMgOtt+5Ztf2CZ2wT5cna7Jhb81gozFVf438
	NhvUTyAxUY5bDy0SaxZ+sZ+1gtADDL84K8anr4HrTN1vg+BaoPTEQaf78MvJoEJ5svMHOxUVygtFR
	d0rIg0WB5hnZxrb5IdiBlOuRRcFb1HFZ+55dRlrhbFzN1Kx/qQFCHOPOrvaIjdlM/lnyS+UQJHeIM
	ByisktqA8ThfGPOkH3gaS0mBVQmT9IqqgBwD/9wWzhq4iCBrMu9ainc6Rb2w/HWrLwl8HRr5Sv1X3
	qLuxNStg==;
Received: from bali.collaboradmins.com ([148.251.105.195])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x9nCx-0000000GF5R-1VKj;
	Thu, 24 Sep 2026 17:26:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790270762;
	bh=2yeyJ4AlgBis5bDPW1nOEmRWXe5rRFbyw9ZOt7Xjgbs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=PDBfN5KscrWM+gQbvo1PxWqE7CIbDoGeE7JhesrscuvkI872ubsZYvUwv6u2Or+Tm
	 k84921tQuo3cRN37v2fBBAWE0+pz8gNeoo9ANs9VhvlEjBVpcVemzpxZd6svltd3fA
	 iODbG0smZo3u8v7SZW1hn5kuSzwfIBgTaXfI0ejq9Dg+/JOgCj8KUVnxvzt5auW01S
	 C/rpyE9Ww+N4fYvLPpRUBIPLCPIeeKJFCQ0kB9v+3skG5OMg8KAHvOgo1PbIFppDTw
	 CuGuBqWWy0xOeEhYv3ooRZlNLeEN3b8KwehYNNMDYhOK2bdCyfWvbw5DAHU1SyPxQx
	 JQ5nmEdja1q3g==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E705617E007B;
	Thu, 24 Sep 2026 19:26:01 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 9AB9D48002F; Thu, 24 Sep 2026 19:26:01 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 24 Sep 2026 19:25:38 +0200
Subject: [PATCH v16 2/6] usb: dwc3: rockchip: introduce glue driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-b4-rockchip-dwc3-rockchip-glue-v16-2-126a2e9133c3@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5973;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=2yeyJ4AlgBis5bDPW1nOEmRWXe5rRFbyw9ZOt7Xjgbs=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGq1XSkOGaCQoVlJZkgkbLH4f0J55ZsG1IGTx
 2ZTv6LMTHk7n4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqtV0pAAoJENju1/PI
 O/qaEJYP/jfQSVVeLB1ZyvljvBK12Yfzj5+Lk9HBQPd2SJ/zA7ins77Wt2mYKwSYKCgNumlFBuV
 T6a5rtqWM7YKSdd2+lDjvtS0+XbdcZYF5fvJMMRM/H1+pIc4RL6/K4gAgOY15mTdNBgP/tAeqRS
 QAlpmCw3d4sMB5PUdfu9Y1lmgoDVwmjpsH6LWbLcN5GZlanELjZsI7rro2MrWSIS8/Ap33cr232
 SCSleoxZa47zJj41s2nvSyK/yfRoqZ3F74CjpePlOvedIv5tb30COTH4b+IvoAsOxYc9eBir2en
 6vx3r9XmXvJBG2uTfl/6lcViQC/RT+RXMsYUAVQtBsHdYVAu6EdcbtMYMZqARXGF7Ro/tmspHac
 lRonfNPbqk54caSP8Al54BJhyKgU40BFWaJ7dAJDdRdWJ2K7TA1JaDXYL16vUgPZCekDCqbUA/u
 aKN1yGj/X6VyzuxFLyWUrLAXjz+pEr9GMORHqLnvF7OKlsmjWcOnCwrxVFxmwAJzIkZM4NK1HWF
 HuQe8JSAq3gyp3Z2HW0vHOekVSZ88vAHy8i59N1jcL5jJX9jLRa2Vhh0+lLrK6KgZgauGfxtcGb
 ePKRCjPmyQtZ+3puRV4xYdYVUXfPEY1BADkyfkJOIHRSgBTNaefeDFMfaHmnsnYGGCLCbzvcfNN
 CJ39BFObdvzXH1kwIfnssZA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_182607_510882_6C832F8B 
X-CRM114-Status: GOOD (  20.20  )
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

Introduce Rockchip specific glue code for the Synopsys DWC3 USB driver.
For now this handles things identical to the default glue.

Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/usb/dwc3/Kconfig         |  11 ++++
 drivers/usb/dwc3/Makefile        |   1 +
 drivers/usb/dwc3/core.c          |  15 ++++++
 drivers/usb/dwc3/dwc3-rockchip.c | 106 +++++++++++++++++++++++++++++++++++++++
 4 files changed, 133 insertions(+)

diff --git a/drivers/usb/dwc3/Kconfig b/drivers/usb/dwc3/Kconfig
index 18169727a413..3c120ea9746d 100644
--- a/drivers/usb/dwc3/Kconfig
+++ b/drivers/usb/dwc3/Kconfig
@@ -190,6 +190,17 @@ config USB_DWC3_OCTEON
 	  Only the host mode is currently supported.
 	  Say 'Y' or 'M' here if you have one such device.
 
+config USB_DWC3_ROCKCHIP
+	tristate "Rockchip DWC3 Platform Driver"
+	depends on ARCH_ROCKCHIP || COMPILE_TEST
+	depends on OF
+	default USB_DWC3
+	help
+	  Rockchip SoCs with DesignWare Core USB3 IP inside,
+	  and IP Core configured for USB 2.0 and USB 3.0 in host
+	  or dual-role mode.
+	  Say 'Y' or 'M' if you have such device.
+
 config USB_DWC3_RTK
 	tristate "Realtek DWC3 Platform Driver"
 	depends on OF && ARCH_REALTEK
diff --git a/drivers/usb/dwc3/Makefile b/drivers/usb/dwc3/Makefile
index f37971197203..444e7e7f34b2 100644
--- a/drivers/usb/dwc3/Makefile
+++ b/drivers/usb/dwc3/Makefile
@@ -58,6 +58,7 @@ obj-$(CONFIG_USB_DWC3_IMX8MP)		+= dwc3-imx8mp.o
 obj-$(CONFIG_USB_DWC3_IMX)		+= dwc3-imx.o
 obj-$(CONFIG_USB_DWC3_XILINX)		+= dwc3-xilinx.o
 obj-$(CONFIG_USB_DWC3_OCTEON)		+= dwc3-octeon.o
+obj-$(CONFIG_USB_DWC3_ROCKCHIP)		+= dwc3-rockchip.o
 obj-$(CONFIG_USB_DWC3_RTK)		+= dwc3-rtk.o
 obj-$(CONFIG_USB_DWC3_GENERIC_PLAT)	+= dwc3-generic-plat.o
 obj-$(CONFIG_USB_DWC3_GOOGLE)		+= dwc3-google.o
diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index fd5c2cd36c59..4b7132887a03 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -2448,11 +2448,26 @@ int dwc3_core_probe(const struct dwc3_probe_data *data)
 }
 EXPORT_SYMBOL_GPL(dwc3_core_probe);
 
+/*
+ * List of compatibles, which have "synopsys,dwc3" as a fallback
+ * compatible, but have a vendor specific glue driver that should
+ * be used instead of this one.
+ */
+static const char *const dwc3_compatible_blocklist[] = {
+	"rockchip,rk3588-dwc3",
+	"rockchip,rk3576-dwc3",
+};
+
 static int dwc3_probe(struct platform_device *pdev)
 {
 	struct dwc3_probe_data probe_data = {};
 	struct resource *res;
 	struct dwc3 *dwc;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(dwc3_compatible_blocklist); i++)
+		if (device_is_compatible(&pdev->dev, dwc3_compatible_blocklist[i]))
+			return -ENODEV;
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (!res) {
diff --git a/drivers/usb/dwc3/dwc3-rockchip.c b/drivers/usb/dwc3/dwc3-rockchip.c
new file mode 100644
index 000000000000..4129aefd6a8b
--- /dev/null
+++ b/drivers/usb/dwc3/dwc3-rockchip.c
@@ -0,0 +1,106 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright (c) 2026, Collabora Ltd. */
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include "glue.h"
+
+struct dwc3_rockchip {
+	struct dwc3		dwc;
+};
+
+static int dwc3_rockchip_probe(struct platform_device *pdev)
+{
+	struct dwc3_probe_data probe_data = {};
+	struct resource *res;
+	struct dwc3_rockchip *dwc_rk;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res) {
+		dev_err(&pdev->dev, "missing memory resource\n");
+		return -ENODEV;
+	}
+
+	dwc_rk = devm_kzalloc(&pdev->dev, sizeof(*dwc_rk), GFP_KERNEL);
+	if (!dwc_rk)
+		return -ENOMEM;
+
+	dwc_rk->dwc.dev = &pdev->dev;
+	dwc_rk->dwc.glue_ops = NULL;
+
+	probe_data.dwc = &dwc_rk->dwc;
+	probe_data.res = res;
+	probe_data.properties = DWC3_DEFAULT_PROPERTIES;
+
+	return dwc3_core_probe(&probe_data);
+}
+
+static void dwc3_rockchip_remove(struct platform_device *pdev)
+{
+	dwc3_core_remove(platform_get_drvdata(pdev));
+}
+
+static int dwc3_rockchip_runtime_suspend(struct device *dev)
+{
+	return dwc3_runtime_suspend(dev_get_drvdata(dev));
+}
+
+static int dwc3_rockchip_runtime_resume(struct device *dev)
+{
+	return dwc3_runtime_resume(dev_get_drvdata(dev));
+}
+
+static int dwc3_rockchip_runtime_idle(struct device *dev)
+{
+	return dwc3_runtime_idle(dev_get_drvdata(dev));
+}
+
+static int dwc3_rockchip_suspend(struct device *dev)
+{
+	return dwc3_pm_suspend(dev_get_drvdata(dev));
+}
+
+static int dwc3_rockchip_resume(struct device *dev)
+{
+	return dwc3_pm_resume(dev_get_drvdata(dev));
+}
+
+static void dwc3_rockchip_complete(struct device *dev)
+{
+	dwc3_pm_complete(dev_get_drvdata(dev));
+}
+
+static int dwc3_rockchip_prepare(struct device *dev)
+{
+	return dwc3_pm_prepare(dev_get_drvdata(dev));
+}
+
+static const struct dev_pm_ops dwc3_rockchip_dev_pm_ops = {
+	SYSTEM_SLEEP_PM_OPS(dwc3_rockchip_suspend, dwc3_rockchip_resume)
+	RUNTIME_PM_OPS(dwc3_rockchip_runtime_suspend, dwc3_rockchip_runtime_resume,
+		       dwc3_rockchip_runtime_idle)
+	.complete = pm_sleep_ptr(dwc3_rockchip_complete),
+	.prepare = pm_sleep_ptr(dwc3_rockchip_prepare),
+};
+
+static const struct of_device_id dwc3_rockchip_of_match[] = {
+	{ .compatible = "rockchip,rk3588-dwc3" },
+	{ .compatible = "rockchip,rk3576-dwc3" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, dwc3_rockchip_of_match);
+
+static struct platform_driver dwc3_rockchip_driver = {
+	.probe		= dwc3_rockchip_probe,
+	.remove		= dwc3_rockchip_remove,
+	.driver		= {
+		.name	= "dwc3-rockchip",
+		.pm	= pm_ptr(&dwc3_rockchip_dev_pm_ops),
+		.of_match_table	= dwc3_rockchip_of_match,
+	},
+};
+
+module_platform_driver(dwc3_rockchip_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("DesignWare DWC3 Rockchip Glue Driver");

-- 
2.53.0



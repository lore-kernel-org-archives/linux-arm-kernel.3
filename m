Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13E78606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 18:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jNOUdNRw;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=M5DbOMw4;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=RSuf21aX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AJCrdCDNjGUfUWfP/t17vdtV3ZAlW99PLvfAiw3Nk4g=; b=jNOUdNRwPCUR02QHoVvaxb9ys0
	ZgRnR7SrkUCUqBeCISdfvwVd1UWKxmma+uVt21PyJYr1g9svaCLX8p1kZ1VwKaSIq2liAA5AZuTqE
	w9YB6WXl1EOYUfNHYO7vhppU7igAplYgxFK6lAgDQDTZm6Y8UiEk4dfn1I+SqDZ04PP2ppriZdWzJ
	6nhxDLfeEGJYCRa3y6KdjIdSRqZggv7zk/oDzx8QB1J8xO3oxRj2jldoTEhpJLpwznIShv41/v6fw
	RykqsI36hGjus8s1V4euLUQX7VukARZbu9B3MMAeGvoSFEtSAHKWREftZucYwjNvntiWdGzYMo5tG
	ZHNXijcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJahY-0000000CcHb-0VyW;
	Wed, 21 Oct 2026 18:06:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJahF-0000000Cc4y-09qy;
	Wed, 21 Oct 2026 18:05:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=AJCrdCDNjGUfUWfP/t17vdtV3ZAlW99PLvfAiw3Nk4g=; b=M5DbOMw4GQSHXj8Vv0hkhuZ9q+
	X75ekx9zMGe9irBmZM1kGNK5ffeK5Gm8bOGBhypIfUs0wt4UBxy9iHmAmcnPkqfeizdALILisHuNL
	Ulij2YcuF50j29kEu3ZC9ym76iiQV+O5fRjStMmSE02rr/EpMjIPS+Y2bFWp63xD507C45QvkRI7/
	FgxXlhdtSdU2DvNPlofw2kU98SMzBMClNAGYY1wM7ahXkydH2kqR+e//86KulY8CPMaQmydyY3OnK
	RVVmYN7IvYxQED/7AJcGDfVmhZWpf7ZuluL8q2P++fxx+mcz76kKzhioZll7h+bi1YeoE4Ju+aKnj
	tPcGHlzQ==;
Received: from bali.collaboradmins.com ([148.251.105.195])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xJahC-000000066hH-0TI0;
	Wed, 21 Oct 2026 18:05:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1792605943;
	bh=P4mI3jVORdFOS0hLbLmfPfeRfTH3pEbYoF72Q6pG7+Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=RSuf21aXdyPZWIyhF9vwsgBeIkdUZV60wvudJ4vRzZm1KVyrRxRJgfNngK+o0bMCA
	 zMhMYLV6ryIivoj9uWI6Cm/KrTWI4+78fd1e7YZk0wB5PO7Onq2oc/oxxR8K6++17C
	 d0LLU7g+qz3WYuYL9rU6XOE6X7dUfLcakZt6beJXwp/yz6yxKg30JGnCQYxHwJf5i4
	 /MBa0hs3rWBoDYYXBGwlZHnXJNiGeJwaCMFcMnJz82CJOTx6RvOm9TT8s7+fG+LAHt
	 vYiCoO/Bzk5K2jjlyzXZeFTvFCuuYU/vDtobujyW96YkbaUYhLb5ZzzrCNX5KKBFGH
	 bfqZNvHrA6+pQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A02CE17E08D8;
	Wed, 21 Oct 2026 20:05:43 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 6357848002F; Wed, 21 Oct 2026 20:05:43 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Wed, 21 Oct 2026 20:05:27 +0200
Subject: [PATCH v18 2/7] phy: rockchip: usbdp: Add reset hook support for
 dwc3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261021-b4-rockchip-dwc3-rockchip-glue-v18-2-60000d03fca2@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5053;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=P4mI3jVORdFOS0hLbLmfPfeRfTH3pEbYoF72Q6pG7+Q=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGrY/vfJ60A/eFrS1inhBnPWu50D0qonUw6jS
 RzZy2yoUNxjC4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJq2P73AAoJENju1/PI
 O/qaQKQP/jeggayT5hQ8EMcCSEr5qB9OuapKcw6neMxNBT7BoOnCUIU3yobpKeOXIrxf9puRX0Q
 KEaQko0sVkWQXVeqLIPuA/qif2YNh1IfONiBdypGmXdw8QYPzy41zENlFRNEo076AGk/xHx+b5a
 g02hInf5Oixt2PQi3iR7cw/TFXk36oLHZCxHnXW55RdLeFbXr16Eo3IONIpFNVEHyQxExyYa8AR
 c367B9SKKbpkbC/DGewnBsRhnvbUZDO1n6s9XVtXgiLeLjetE9KeExZERcvuzbFfAPX25PrnihE
 QgvGgpIcsKa4pXuXUJr4apPxQ6CAnf2uw3HJjN6nOsCLHsZs33FbnVbyPMsd79qKtDgI4XqI4Uh
 MkofvMS3L6o5zuaZkP8oI5Kh30BQ5IRKAFhdJqiDXvRZ41j5KKKJ9R9QxXwMAy0YKMbvtPq5Xma
 2VPxDD6ExErAc2jnSO4Cfg9dQT1BUbfa3qq1CmpqxhIqOUNEsIAJavz4xtK++hhS/ZMMyEONBUs
 I6xP0rSxo/Rpc2IqS5NE0AISgZjaHETxNkmP8b7SbDA2+nxOBaqUQkczyQ9kcJVh7nqyOBY/tf9
 CeiORhWiDNW73HiRw6XyLPQNWBPqdcPEtMiShXcfFFN8PbBA40qmGgdlixbnAK9ajbE9vNVIBq6
 jicWoPXLZaI5q7M5GbAAxeA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_190550_282067_71B8AE41 
X-CRM114-Status: GOOD (  22.03  )
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

When TCPM (Type-C Port Manager) triggers a orientation or mux
change, the PHY needs to reset. This results in the PHY no longer
providing a clock to the USB controller. If the USB controller
registers are accessed without the clock, SErrors are generated.

This can be avoided by switching the clock provider for the USB
controller. But after switching the clock, the USB PHY sometimes does
not succeed to lock its "cmn ana lcpll" PLLs again. I suspect this is
due to a clock glitch and after some debugging figured out that this
can be avoided by disabling the USB controller's PIPE interface while
the PHY reset is ongoing.

Implement an API that allows the USBDP to actively request a reset
from DWC3 as a quirk.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 60 +++++++++++++++++++++++++++++--
 include/linux/phy/rockchip-usbdp.h        | 31 ++++++++++++++++
 2 files changed, 89 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index cb1f455accf8..6fb6b0c0860b 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -19,6 +19,7 @@
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/phy/phy.h>
+#include <linux/phy/rockchip-usbdp.h>
 #include <linux/platform_device.h>
 #include <linux/property.h>
 #include <linux/regmap.h>
@@ -179,6 +180,9 @@ struct rk_udphy {
 
 	/* utilized for USB */
 	bool hs; /* flag for high-speed */
+	void (*dwc3_reset_handler)(void *data, int port, bool pre);
+	void *dwc3_reset_data;
+	int dwc3_reset_port;
 
 	/* utilized for DP */
 	struct gpio_desc *sbu1_dc_gpio;
@@ -995,6 +999,46 @@ static int rk_udphy_parse_dt(struct rk_udphy *udphy)
 	return rk_udphy_reset_init(udphy, dev);
 }
 
+static void rk_udphy_run_reset_handler(struct rk_udphy *udphy, bool pre)
+{
+	if (!udphy->dwc3_reset_handler)
+		return;
+
+	if (!(udphy->sw_mode & UDPHY_MODE_USB))
+		return;
+
+	if (udphy->hs)
+		return;
+
+	udphy->dwc3_reset_handler(udphy->dwc3_reset_data, udphy->dwc3_reset_port, pre);
+}
+
+void rk_udphy_unregister_reset_handler(struct phy *phy)
+{
+	struct rk_udphy *udphy = phy_get_drvdata(phy);
+
+	guard(mutex)(&udphy->mutex);
+
+	udphy->dwc3_reset_handler = NULL;
+	udphy->dwc3_reset_data = NULL;
+	udphy->dwc3_reset_port = 0;
+}
+EXPORT_SYMBOL(rk_udphy_unregister_reset_handler);
+
+void rk_udphy_register_reset_handler(struct phy *phy,
+				     void (*reset_handler)(void *data, int port, bool pre),
+				     void *data, int port)
+{
+	struct rk_udphy *udphy = phy_get_drvdata(phy);
+
+	guard(mutex)(&udphy->mutex);
+
+	udphy->dwc3_reset_handler = reset_handler;
+	udphy->dwc3_reset_data = data;
+	udphy->dwc3_reset_port = port;
+}
+EXPORT_SYMBOL(rk_udphy_register_reset_handler);
+
 static int rk_udphy_power_on(struct rk_udphy *udphy, u8 mode)
 {
 	int ret;
@@ -1005,24 +1049,36 @@ static int rk_udphy_power_on(struct rk_udphy *udphy, u8 mode)
 	}
 
 	if (udphy->status == UDPHY_MODE_NONE) {
+		rk_udphy_run_reset_handler(udphy, true);
+
 		ret = rk_udphy_setup(udphy);
-		if (ret)
+		if (ret) {
+			rk_udphy_run_reset_handler(udphy, false);
 			return ret;
+		}
 
 		if (!udphy->hs && udphy->mode & UDPHY_MODE_USB)
 			rk_udphy_u3_port_disable(udphy, false);
 		udphy->phy_needs_reinit = false;
+
+		rk_udphy_run_reset_handler(udphy, false);
 	} else if (udphy->phy_needs_reinit) {
+		rk_udphy_run_reset_handler(udphy, true);
+
 		rk_udphy_u3_port_disable(udphy, true);
 		udelay(10);
 
 		ret = rk_udphy_init(udphy);
-		if (ret)
+		if (ret) {
+			rk_udphy_run_reset_handler(udphy, false);
 			return ret;
+		}
 
 		if (!udphy->hs && udphy->mode & UDPHY_MODE_USB)
 			rk_udphy_u3_port_disable(udphy, false);
 		udphy->phy_needs_reinit = false;
+
+		rk_udphy_run_reset_handler(udphy, false);
 	}
 
 	udphy->status |= mode;
diff --git a/include/linux/phy/rockchip-usbdp.h b/include/linux/phy/rockchip-usbdp.h
new file mode 100644
index 000000000000..44e0bc7d1d40
--- /dev/null
+++ b/include/linux/phy/rockchip-usbdp.h
@@ -0,0 +1,31 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Rockchip USBDP Combo PHY with Samsung IP block driver
+ *
+ * Copyright (C) 2026 Collabora Ltd
+ */
+
+#ifndef __ROCKCHIP_USBDP
+#define __ROCKCHIP_USBDP
+
+#include <linux/phy/phy.h>
+
+#if IS_ENABLED(CONFIG_PHY_ROCKCHIP_USBDP)
+
+void rk_udphy_unregister_reset_handler(struct phy *phy);
+void rk_udphy_register_reset_handler(struct phy *phy,
+				     void (*reset_handler)(void *data, int port, bool pre),
+				     void *data, int port);
+
+#else
+
+static inline void rk_udphy_unregister_reset_handler(struct phy *phy)
+{ }
+static inline void rk_udphy_register_reset_handler(struct phy *phy,
+					    void (*reset_handler)(void *data, int port, bool pre),
+					    void *data, int port)
+{ }
+
+#endif
+
+#endif

-- 
2.53.0



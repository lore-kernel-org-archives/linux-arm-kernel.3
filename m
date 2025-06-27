Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39969C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 11:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2d+t0sjYkGVxJngGv1bxh+pmY+L1S9m5/92l2aB7BIQ=; b=xrsOa9uYTkAh/1heoLojA2Y79y
	eDW3AnXVacslTDfA329boBcYHEpPm7nTqLMH1a7hagMBL0wmH83IZdZ/+IEGl8MEAff/5oMQNmiIT
	onbjiI0+Q8Oto7uAIXKjb7/jdcm5RBe4XQzx32yHKvkGVyK5UtQ6lkxd+aqtBHeLRyTcdVn667Vf+
	TRLYpbEx7QuyK80rK4Z/H3dilMRy855MuMRq9NJ5hXJjpznYy9GdT1VuxqXNqnVpTMrYPDwYfSevG
	d9P343h8dtlgStCiEUg8PXQrauVnBtkLGPEHFylj+FEtofTBeVyen5/m6vehvjtE/jYqIzZ5ClXFP
	28t/aj1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV6zI-0000000ER1o-2zbb;
	Fri, 27 Jun 2025 11:11:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV6ir-0000000EMxv-0IeF
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 27 Jun 2025 10:54:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=2d+t0sjYkGVxJngGv1bxh+pmY+L1S9m5/92l2aB7BIQ=; b=iGcG5q47HPbRJEnTlfipV/vvMN
	qyyIqGU5erh2sb7gPLK9HHisAUMqSK8O7zN2BgZih4dwUzXw0b2MQlxsOJdhtCIeKUlQqFz6OgNsJ
	vYdDUWbTNVt9HamgVfg8H5zpJ+UGJYGX5CST097fzP1itLGauhEwQzqMtrBdGG45zJLUr0QGMrkR1
	BD7rQ1aZCLHG0bxO46e3QQJSkFsJE61t0egi8U2DECmn8lBe9WxP3tSbNmCNpQTnHrPZVq7mqXU3v
	P34cqvkLg8k6YO6al4PPydiP/RCJ+y8oTN7z/pivQWnK+T+iKKzA1cWXX4hHtOiroLgpZwlzVtNIl
	zjMXn4Cg==;
Received: from smtp-42ad.mail.infomaniak.ch ([2001:1600:7:10::42ad])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV6io-00000006J78-0miO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 10:54:19 +0000
Received: from smtp-4-0001.mail.infomaniak.ch (smtp-4-0001.mail.infomaniak.ch [10.7.10.108])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4bTC9N0HHJzZJB;
	Fri, 27 Jun 2025 12:54:16 +0200 (CEST)
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4bTC9L6XsKzvrY;
	Fri, 27 Jun 2025 12:54:14 +0200 (CEST)
From: Quentin Schulz <foss+kernel@0leil.net>
Date: Fri, 27 Jun 2025 12:53:55 +0200
Subject: [PATCH v4 3/5] arm64: dts: rockchip: add header for RK8XX PMIC
 constants
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250627-rk8xx-rst-fun-v4-3-ce05d041b45f@cherry.de>
References: <20250627-rk8xx-rst-fun-v4-0-ce05d041b45f@cherry.de>
In-Reply-To: <20250627-rk8xx-rst-fun-v4-0-ce05d041b45f@cherry.de>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Lukasz Czechowski <lukasz.czechowski@thaumatec.com>, 
 Daniel Semkowicz <dse@thaumatec.com>, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_115418_374726_EABBE08F 
X-CRM114-Status: UNSURE (   9.80  )
X-CRM114-Notice: Please train this message.
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

From: Quentin Schulz <quentin.schulz@cherry.de>

To make it easier to read the device tree, let's add constants for the
rockchip,reset-mode property values that are currently only applicable
to RK806 PMIC.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 arch/arm64/boot/dts/rockchip/rk8xx.h | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk8xx.h b/arch/arm64/boot/dts/rockchip/rk8xx.h
new file mode 100644
index 0000000000000000000000000000000000000000..a6fbef71c06493c35b0f3697476167aaafa24f30
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk8xx.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: (GPL-2.0-or-later OR MIT) */
+/*
+ * Device Tree defines for Rockchip RK8xx PMICs
+ *
+ * Copyright 2025 Cherry Embedded Solutions GmbH
+ *
+ * Author: Quentin Schulz <quentin.schulz@cherry.de>
+ */
+
+#ifndef _DT_MFD_ROCKCHIP_RK8XX_H
+#define _DT_MFD_ROCKCHIP_RK8XX_H
+
+/* For use with rockchip,reset-mode property */
+#define RK806_RESTART		0
+#define RK806_RESET		1
+#define RK806_RESET_NOTIFY	2
+
+#endif

-- 
2.50.0



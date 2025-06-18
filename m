Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1449AC71157
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 12:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bh37kQDDjXu1k1pG3eSAsUPvg/k2ZgHb7BdzEwf2t2c=; b=GJEV3Ju2+54baDQT5hVacUuYUO
	ELAP+Z1FWC581IBagdYe6CpTG6mP7wm34xrEn3DB2HHzefx0U5ip/IECWvevNh1BWNtI5yyZYRikD
	tzEOBwBcyfMC+0FXoSUvMkEUUzjs+qkbfpIK75TMoOkm1mqLRfPgoBQxjt7vYEpmoGX2WZ4UTO5Nj
	eIND0XdEQT6treihpz+bknRnLTjSLD8LP8eZK+cw/9ZngK4bbaMlw+LfbqXQh+Q+7ZCutJtyRcSqV
	jLsMQraS4DiurAXWERS8ZQFbLK9veqCi+89d+auUtOEbUqNm+akuElXWrkzCDHnxdwGFTmjn5On99
	cQDGMnlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRrvO-0000000A8By-3eTb;
	Wed, 18 Jun 2025 12:29:54 +0000
Received: from smtp-190f.mail.infomaniak.ch ([185.125.25.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRq6F-00000009nhQ-3XqR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 10:33:03 +0000
Received: from smtp-4-0001.mail.infomaniak.ch (smtp-4-0001.mail.infomaniak.ch [10.7.10.108])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4bMg6w1KkYzS5R;
	Wed, 18 Jun 2025 12:32:56 +0200 (CEST)
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4bMg6v37RyzDJZ;
	Wed, 18 Jun 2025 12:32:55 +0200 (CEST)
From: Quentin Schulz <foss+kernel@0leil.net>
Date: Wed, 18 Jun 2025 12:32:42 +0200
Subject: [PATCH v3 3/5] arm64: dts: rockchip: add header for RK8XX PMIC
 constants
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250618-rk8xx-rst-fun-v3-3-081f02d3d348@cherry.de>
References: <20250618-rk8xx-rst-fun-v3-0-081f02d3d348@cherry.de>
In-Reply-To: <20250618-rk8xx-rst-fun-v3-0-081f02d3d348@cherry.de>
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
X-CRM114-CacheID: sfid-20250618_033300_019343_570C2251 
X-CRM114-Status: GOOD (  10.34  )
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
2.49.0



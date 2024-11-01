Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B198E674BB
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 08:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qD0wX5O/+PZzOlzLxmLKEIZ22luwS3SNzXL4a7DEAzI=; b=STMIuUR75vrtSuW/DvLhe6MBhG
	kAG/wzfOhcM3LB/xG5NPh3yEVGwh9kApjiCKxZJ1H8ECauM3blKfIOUgVJ1zwNqrcx8IGpMTDL7z8
	l8pUhCdOr5LRFmtZx9UnqJ8LKTRKMZP1cDm6v3npN6kLMcqW1Tp04VYsLAKC5D2XFO99Five30roa
	QdtoPJkZ5G3EiurfZG254eH2DL92z0hYm0OC0d8wBT7s39NfA2WPbl1Oh9pGAS6M9OU8zdrRsATsE
	YVux33515+C7tW7AMRpRALq9b58+9Xghj84On2Nll/cPNGrJbknzRDHpS7kJxAcTc3W4YzljMW1JD
	Mz227xgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6n8L-00000006I7b-0dg3;
	Fri, 01 Nov 2024 08:35:53 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6n05-00000006Gbw-46cv;
	Fri, 01 Nov 2024 08:27:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6A547A40EBF;
	Fri,  1 Nov 2024 08:25:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 994DDC4CED5;
	Fri,  1 Nov 2024 08:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730449640;
	bh=dGSJKKibBdsxpLP+p+OmdmQOfOzLfl3woFtR4N/TQBE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=IKEN5X5pG3QE2X/Wr4RMzypsRq+bt7lLisG/x5dEu/kCrjEfN9Ltz77NPK1f51Zjs
	 wXKJpr4b9CJValsKe5RhtAmSXx9sC6+yMIN3xL8Yd/o+K7P5hdexvHp/7GxxnwppLr
	 Y3l+t+qcSTmCOUhcY+kzcN7nuKNaBoOeSUYUov+woAdTvDFEGVl9QF96J1vRY9hqXW
	 HDHVVhUEiF+ZVoxuaLGH/rX5NvRELgqSICxSfnx7bCI5e4++rILoZeNCs6OlmT2a+S
	 TUAhRob78wH0QG+bbJi9x68YQXcVcdsw+po68fMYzLpLu6FW0WxHMC/VtXiyVhZpCp
	 e82l+bqpnG9Fg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CAFCE674B7;
	Fri,  1 Nov 2024 08:27:20 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Fri, 01 Nov 2024 16:27:17 +0800
Subject: [PATCH RFC v4 1/4] dt-bindings: pinctrl: Add support for Amlogic
 A4 SoCs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241101-a4_pinctrl-v4-1-efd98edc3ad4@amlogic.com>
References: <20241101-a4_pinctrl-v4-0-efd98edc3ad4@amlogic.com>
In-Reply-To: <20241101-a4_pinctrl-v4-0-efd98edc3ad4@amlogic.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730449638; l=2697;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=bJ9PuDYnWANl7P1yiHKRKdX2JeV+qu35Ep5kAka2CKo=;
 b=ZZqw0wsF7CTMNHzqWqYHFmOXXeZmyJ5Q4ZbK+2iG4CMo70y8TGx/ep/Pw/nrM+bVztZjk5uuN
 fvJgnfAJ/ngC0Wg93qVHKJa5Bg+TX8xgzFDnS07lX+2H5HsnD34vFdi
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_012722_234277_0A4391DB 
X-CRM114-Status: GOOD (  11.81  )
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
Reply-To: xianwei.zhao@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

Add the new compatible name for Amlogic A4 pin controller, and add
a new dt-binding header file which document the GPIO bank names of
all Amlogic subsequent SoCs.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 .../bindings/pinctrl/amlogic,meson-pinctrl-a1.yaml |  2 +
 include/dt-bindings/gpio/amlogic-gpio.h            | 50 ++++++++++++++++++++++
 2 files changed, 52 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-a1.yaml b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-a1.yaml
index d9e0b2c48e84..f5eefa0fab5b 100644
--- a/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-a1.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-a1.yaml
@@ -15,6 +15,8 @@ allOf:
 properties:
   compatible:
     enum:
+      - amlogic,a4-aobus-pinctrl
+      - amlogic,a4-periphs-pinctrl
       - amlogic,c3-periphs-pinctrl
       - amlogic,t7-periphs-pinctrl
       - amlogic,meson-a1-periphs-pinctrl
diff --git a/include/dt-bindings/gpio/amlogic-gpio.h b/include/dt-bindings/gpio/amlogic-gpio.h
new file mode 100644
index 000000000000..37bb688d41d8
--- /dev/null
+++ b/include/dt-bindings/gpio/amlogic-gpio.h
@@ -0,0 +1,50 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
+/*
+ * Copyright (c) 2024 Amlogic, Inc. All rights reserved.
+ * Author: Xianwei Zhao <xianwei.zhao@amlogic.com>
+ */
+
+#ifndef _DT_BINDINGS_AMLOGIC_GPIO_H
+#define _DT_BINDINGS_AMLOGIC_GPIO_H
+
+#include <dt-bindings/gpio/gpio.h>
+
+/* Normal GPIO bank */
+#define AMLOGIC_GPIO_A		0
+#define AMLOGIC_GPIO_B		1
+#define AMLOGIC_GPIO_C		2
+#define AMLOGIC_GPIO_D		3
+#define AMLOGIC_GPIO_E		4
+#define AMLOGIC_GPIO_F		5
+#define AMLOGIC_GPIO_G		6
+#define AMLOGIC_GPIO_H		7
+#define AMLOGIC_GPIO_I		8
+#define AMLOGIC_GPIO_J		9
+#define AMLOGIC_GPIO_K		10
+#define AMLOGIC_GPIO_L		11
+#define AMLOGIC_GPIO_M		12
+#define AMLOGIC_GPIO_N		13
+#define AMLOGIC_GPIO_O		14
+#define AMLOGIC_GPIO_P		15
+#define AMLOGIC_GPIO_Q		16
+#define AMLOGIC_GPIO_R		17
+#define AMLOGIC_GPIO_S		18
+#define AMLOGIC_GPIO_T		19
+#define AMLOGIC_GPIO_U		20
+#define AMLOGIC_GPIO_V		21
+#define AMLOGIC_GPIO_W		22
+#define AMLOGIC_GPIO_X		23
+#define AMLOGIC_GPIO_Y		24
+#define AMLOGIC_GPIO_Z		25
+/* Special GPIO bank */
+#define AMLOGIC_GPIO_DV		26
+#define AMLOGIC_GPIO_AO		27
+#define AMLOGIC_GPIO_CC		28
+#define AMLOGIC_GPIO_TEST_N	29
+
+#define AMLOGIC_GPIO(bank, offset)	(((bank) << 8) + (offset))
+
+#define AMLOGIC_BANK(gpio)		((gpio) >> 8)
+#define AMLOGIC_OFFSET(gpio)		((gpio) & 0xff)
+
+#endif /* _DT_BINDINGS_AMLOGIC_GPIO_H */

-- 
2.37.1




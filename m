Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCF25CCD195
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 06:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OiKjnIH7axPYhQrFUMzaoOKSY3uvx+hrVR2YyHXGONM=; b=h5wRooDS/GU07ZKRynkVlRZZeL
	EQoE/N9L7Gxhv72H/dJTBq2rw6UmHCzbRXc8v8hkICYE2Y4J9R4p9bSX9LmhsjjXyxJFH1YIKvqY1
	HYc4YQXOIb1x6/DpDt/jxcSraEM6J9YmmB+C9CwrJ6WsdzLuiLEC7iuzY3ba1vEGpoNeDwprIIwOB
	3fYJy6r8kyBXCCMEvWSuE7YW3BvzUgO3kCqHfVPGrkgcSOVvubbTmO2ApEE1wv9dVM+F4LTMpGYNZ
	BwiQYK9820xniJuhiDaPbmGCVNm0uzVnFABmBhQMBjoiYj6eCAImWm/JhK5fhefqw9vtkkyDtzAc/
	RDj2OJIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9ePv-00000006uAp-1w91;
	Fri, 17 Oct 2025 06:58:23 +0000
Received: from mail-m3289.qiye.163.com ([220.197.32.89])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9ePs-00000006u98-2FRL;
	Fri, 17 Oct 2025 06:58:21 +0000
Received: from xf.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 263eafd10;
	Fri, 17 Oct 2025 14:58:17 +0800 (GMT+08:00)
From: Finley Xiao <finley.xiao@rock-chips.com>
To: heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	ulf.hansson@linaro.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	zhangqing@rock-chips.com,
	sugar.zhang@rock-chips.com,
	Finley Xiao <finley.xiao@rock-chips.com>
Subject: [PATCH v3 1/2] dt-bindings: power: rockchip: Add support for RV1126B
Date: Fri, 17 Oct 2025 14:56:45 +0800
Message-ID: <20251017065646.320643-2-finley.xiao@rock-chips.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251017065646.320643-1-finley.xiao@rock-chips.com>
References: <20251017065646.320643-1-finley.xiao@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a99f0f64b5903a9kunmca707a471243fd
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQh9KSFYeSENMS0lPT0hCTh9WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=bm1RcU4I3s9QZiaX4EHeHpSbXrLwW+xKrblrpu4PH+lUmq95N8jynyNO6jbjdzFcmC3uwBw1fjFdPwBemRbTPh5C++0c6Y4DZZGsZKevsZdFFLF/gYRhQWVyznZoVL0fubtP2mSv+rkOJVTbidhlucI8c7RqX1rS0r+T2kwSTEw=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=OiKjnIH7axPYhQrFUMzaoOKSY3uvx+hrVR2YyHXGONM=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_235820_746295_F0FD62D7 
X-CRM114-Status: GOOD (  11.74  )
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

Add power domain IDs for RV1126B SoC.
Add a new compatible because register fields have changed.

Signed-off-by: Finley Xiao <finley.xiao@rock-chips.com>
---

Changes in v3:
- modify the patch format

Changes in v2:
- update the commit message
- update the license
- rename AISP to AIISP

 .../power/rockchip,power-controller.yaml        |  2 ++
 .../dt-bindings/power/rockchip,rv1126b-power.h  | 17 +++++++++++++++++
 2 files changed, 19 insertions(+)
 create mode 100644 include/dt-bindings/power/rockchip,rv1126b-power.h

diff --git a/Documentation/devicetree/bindings/power/rockchip,power-controller.yaml b/Documentation/devicetree/bindings/power/rockchip,power-controller.yaml
index a884e49c995f..f9db602de258 100644
--- a/Documentation/devicetree/bindings/power/rockchip,power-controller.yaml
+++ b/Documentation/devicetree/bindings/power/rockchip,power-controller.yaml
@@ -46,6 +46,7 @@ properties:
       - rockchip,rk3576-power-controller
       - rockchip,rk3588-power-controller
       - rockchip,rv1126-power-controller
+      - rockchip,rv1126b-power-controller
 
   "#power-domain-cells":
     const: 1
@@ -126,6 +127,7 @@ $defs:
           "include/dt-bindings/power/rk3568-power.h"
           "include/dt-bindings/power/rk3588-power.h"
           "include/dt-bindings/power/rockchip,rv1126-power.h"
+          "include/dt-bindings/power/rockchip,rv1126b-power.h"
 
       clocks:
         minItems: 1
diff --git a/include/dt-bindings/power/rockchip,rv1126b-power.h b/include/dt-bindings/power/rockchip,rv1126b-power.h
new file mode 100644
index 000000000000..beb692bd8e72
--- /dev/null
+++ b/include/dt-bindings/power/rockchip,rv1126b-power.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
+/*
+ * Copyright (c) 2024 Rockchip Electronics Co., Ltd.
+ * Author: Finley Xiao <finley.xiao@rock-chips.com>
+ */
+
+#ifndef __DT_BINDINGS_POWER_RV1126B_POWER_H__
+#define __DT_BINDINGS_POWER_RV1126B_POWER_H__
+
+/* VD_NPU */
+#define RV1126B_PD_NPU		0
+
+/* VD_LOGIC */
+#define RV1126B_PD_VDO		1
+#define RV1126B_PD_AIISP	2
+
+#endif
-- 
2.43.0



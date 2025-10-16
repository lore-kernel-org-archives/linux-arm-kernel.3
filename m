Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E30ECCD195
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 13:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nv98wqplN2+zIis/g/iKLtF3JuIQw/bcfzKqgmtzFSw=; b=BYI7QP3iSOJoRQYTCg6GWQP6dA
	hf//ZCwM1xjxBp9z2/F8+Po32R0Xg2r0eYffMuyeUm8MjUwETeOCvjdsbQ1e0CSqVNBPUQpXWRzDL
	w/iBb7Lw7eLkteDLcIcqBi6QDA7LZ3CY6tyf4A9P6tRZ+6/0RHRe1DhuXuWreqnCHI520uZ/iJiET
	winT1h8ogXzYBZ/+Y74Fbw1ekKd+kOycs900c9LDFsqd+5evo5mL9Kdga+tkTWfmCcYTYk1C0WbeS
	Wj+w6CIqwZ3tfr4WEirv+WYkGtBSIUIFXo2Jv/jw7J5QnPzaaCYBYhmv5DyOaDJUqN2PgkC0e9JGe
	ofmz4ByQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9OEy-00000004uWG-2hM3;
	Thu, 16 Oct 2025 13:42:00 +0000
Received: from mail-m21469.qiye.163.com ([117.135.214.69])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9OEs-00000004uT0-3zTM;
	Thu, 16 Oct 2025 13:41:57 +0000
Received: from xf.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 26283fe38;
	Thu, 16 Oct 2025 21:41:47 +0800 (GMT+08:00)
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
	finley.xiao@rock-chips.com,
	zhangqing@rock-chips.com,
	sugar.zhang@rock-chips.com,
	huangtao@rock-chips.com
Subject: [PATCH v1 1/2] dt-bindings: power: rockchip: Add support for RV1126B
Date: Thu, 16 Oct 2025 21:41:02 +0800
Message-ID: <20251016134103.294636-2-finley.xiao@rock-chips.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251016134103.294636-1-finley.xiao@rock-chips.com>
References: <20251016134103.294636-1-finley.xiao@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a99ed4159e403a9kunm0a0c6b9d28655
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQklJHVYYGhpKGBpNT08ZSk1WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=I9vI8nQczWQy3DP95bfgsPAay2QjLm0Psn+mKGGRSoFPjubpTPXz7RpluqFeD+iB3cZrzHn3IHvvujyor7k5geUxta5GJOU5pmtleOWqfJzRKefytNIWRZPvp7XafwH5YMJ4HTkZjDy7kynCGMG5AOOLm5u39v8k+nMSQCJjCok=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=nv98wqplN2+zIis/g/iKLtF3JuIQw/bcfzKqgmtzFSw=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_064155_256207_F35765B7 
X-CRM114-Status: GOOD (  10.48  )
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

Add the compatible string and power domain IDs for RV1126B SoC.

signed-off-by: Finley Xiao <finley.xiao@rock-chips.com>
---
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
index 000000000000..0a418f16e4ea
--- /dev/null
+++ b/include/dt-bindings/power/rockchip,rv1126b-power.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: (GPL-2.0+ OR MIT) */
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
+#define RV1126B_PD_AISP		2
+
+#endif
-- 
2.43.0



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6039C021BE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 11:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F7HQgVZMPu9CDnT8TQDoSbjTr8/jpTklnmLuWptRTyk=; b=PIOpcotIZ9L+ea4LwICYdmzIuT
	UKUI+rxVrRwhSx+z3eVFUiGNZdCRDEw1qWi6AlYjehhAcsQ8EWHi5RrPsyy9W4TbGv1j3ncMtgKp6
	KBOC8Hgx8hHGfuu1k+OoiQvfwWV6jHVldNpMvZ/Ww5NLOIT3QFEH28moAsjvjkCfXwHTQ/cIoS4rO
	XjIcR+wXZG5R13Z8fbIpjNuhqspnKHEAPC2STlcyNVtt2wQbq8iNgBqOVqUs0uE441DTv48EwJmrQ
	kae4tiv9r19XHODGHEymV2I06lB+McLvbT8aA+d8BwQxKBUNRNh2VG0+9S5WJf7zsi1SpSs98qMCd
	XKAuVUmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnbqL-000000077ok-2ON7;
	Thu, 27 Feb 2025 11:14:17 +0000
Received: from mail-m3292.qiye.163.com ([220.197.32.92])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnbcz-000000074i6-2blY;
	Thu, 27 Feb 2025 11:00:30 +0000
Received: from localhost.localdomain (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id c6596abe;
	Thu, 27 Feb 2025 19:00:24 +0800 (GMT+08:00)
From: Kever Yang <kever.yang@rock-chips.com>
To: heiko@sntech.de
Cc: linux-rockchip@lists.infradead.org,
	Finley Xiao <finley.xiao@rock-chips.com>,
	Kever Yang <kever.yang@rock-chips.com>,
	devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Elaine Zhang <zhangqing@rock-chips.com>,
	linux-arm-kernel@lists.infradead.org,
	Ulf Hansson <ulf.hansson@linaro.org>
Subject: [PATCH v3 1/2] dt-bindings: power: rockchip: Add support for RK3562 SoC
Date: Thu, 27 Feb 2025 18:59:56 +0800
Message-Id: <20250227105957.2341107-2-kever.yang@rock-chips.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250227105957.2341107-1-kever.yang@rock-chips.com>
References: <20250227105957.2341107-1-kever.yang@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGkxCTVZOTxoZTU9CHx9DT0lWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
X-HM-Tid: 0a954710995b03afkunmc6596abe
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6KzY6ECo4QzIIDQ0sEhk1OTI0
	LRUaCzlVSlVKTE9LTU5PS0lNSE9MVTMWGhIXVRAeDR4JVQIaFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFJT09MNwY+
DKIM-Signature: a=rsa-sha256;
	b=eh7FZq46Jgp3a7HHUM5GsYUxXIrnqFiadwIPFDRTI0I2Na+jmtSTQAGUqq7a0pAQDwuV52ld7zETileUCJ/O5gPDfah+/oQmtND5ePB2sVZjBia6vuW5yJjk+Vj8Mrmyn8K20HHZmJJmmqglxp5kf0YWAn7u9cEMlbMKBK0b9H0=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=F7HQgVZMPu9CDnT8TQDoSbjTr8/jpTklnmLuWptRTyk=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_030029_850903_F89B5434 
X-CRM114-Status: GOOD (  11.48  )
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

From: Finley Xiao <finley.xiao@rock-chips.com>

According to a description from TRM, add all the power domains.

Signed-off-by: Finley Xiao <finley.xiao@rock-chips.com>
Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
---

Changes in v3:
- squash the header file and the binding document
- Update license

Changes in v2:
- rename to rockchip,rk3562-power.h
- update the subject
- use dual license

 .../power/rockchip,power-controller.yaml      |  1 +
 .../dt-bindings/power/rockchip,rk3562-power.h | 35 +++++++++++++++++++
 2 files changed, 36 insertions(+)
 create mode 100644 include/dt-bindings/power/rockchip,rk3562-power.h

diff --git a/Documentation/devicetree/bindings/power/rockchip,power-controller.yaml b/Documentation/devicetree/bindings/power/rockchip,power-controller.yaml
index 650dc0aae6f5..79b948518f0c 100644
--- a/Documentation/devicetree/bindings/power/rockchip,power-controller.yaml
+++ b/Documentation/devicetree/bindings/power/rockchip,power-controller.yaml
@@ -40,6 +40,7 @@ properties:
       - rockchip,rk3366-power-controller
       - rockchip,rk3368-power-controller
       - rockchip,rk3399-power-controller
+      - rockchip,rk3562-power-controller
       - rockchip,rk3568-power-controller
       - rockchip,rk3576-power-controller
       - rockchip,rk3588-power-controller
diff --git a/include/dt-bindings/power/rockchip,rk3562-power.h b/include/dt-bindings/power/rockchip,rk3562-power.h
new file mode 100644
index 000000000000..5182c2427a55
--- /dev/null
+++ b/include/dt-bindings/power/rockchip,rk3562-power.h
@@ -0,0 +1,35 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2022-2024 Rockchip Electronics Co., Ltd.
+ */
+#ifndef __DT_BINDINGS_POWER_RK3562_POWER_H__
+#define __DT_BINDINGS_POWER_RK3562_POWER_H__
+
+/* VD_CORE */
+#define RK3562_PD_CPU_0		0
+#define RK3562_PD_CPU_1		1
+#define RK3562_PD_CPU_2		2
+#define RK3562_PD_CPU_3		3
+#define RK3562_PD_CORE_ALIVE	4
+
+/* VD_PMU */
+#define RK3562_PD_PMU		5
+#define RK3562_PD_PMU_ALIVE	6
+
+/* VD_NPU */
+#define RK3562_PD_NPU		7
+
+/* VD_GPU */
+#define RK3562_PD_GPU		8
+
+/* VD_LOGIC */
+#define RK3562_PD_DDR		9
+#define RK3562_PD_VEPU		10
+#define RK3562_PD_VDPU		11
+#define RK3562_PD_VI		12
+#define RK3562_PD_VO		13
+#define RK3562_PD_RGA		14
+#define RK3562_PD_PHP		15
+#define RK3562_PD_LOGIC_ALIVE	16
+
+#endif
-- 
2.25.1



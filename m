Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E625CA0FE9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 14:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uZAHJoTzFkFSwdJEDEE6kE8Hstw0OjkoDeHonO8xhD8=; b=lwVigKK7h9Bx4JR7DAaZ2UoBsT
	jvc4Je3ZEg8byJprClcY5ovsoYHLrk9f0nUakEx0k7GgGvB4mAlkQtUGJqAlWN269oyXG8Gk5ef2S
	6Y04SjIbl1jOZeOK2pDUaLSwdQmMimByrxrDAtDgG+P0E1x+GH+a0AJ/cS4HEKrnzI62Lw11zEgPX
	96ik7r5qfcqI7/eZPuWQasoHFGSGG3o9YA1jSDw+Wb5Y3UHaiYQ9Bg2nTm6cy/gPuKfGyY68QtSY/
	6H88rSEFbxH+VU25Q96I2qSAfcIdbT8EyVfnOLcb3qUAplilpj8jsbmH7TkTJfkhu9knltqRC7CFu
	g81K5YiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upSaf-00000002k12-3N7I;
	Fri, 22 Aug 2025 14:18:01 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upKWp-00000001bns-0xuW;
	Fri, 22 Aug 2025 05:41:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6853F5C6D17;
	Fri, 22 Aug 2025 05:41:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 09532C113CF;
	Fri, 22 Aug 2025 05:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755841289;
	bh=MkL21viVLE82recvc2SokjMWpd4F/UILyRs//82QGlE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=A2FW8kaxWLxFoIEn8WF6eH5qTF+uVqSyCDmMciNOPclVw4GYbVczzZwOqhXi0DnuE
	 s3DI2YhQPF9O8d28Izc/Mhr6tq+1Z4fWV2nabrD+8FESSfRuC2DT6ev6aQiOV9fOUc
	 ARxMkbfG54Zf6wd82kmLUtIGo6zTPEWWxnrFmnZg0/Ze0h9vXZFw/P1i3JUrD/25kb
	 vwO/Q8puDvGHvqgmEOW7RUV0D9N+a+R6STWkKxwS+DcLGb7nIfQcvEycjiS5R1+Q2Z
	 r4MbotS+N2u6yIYfmmR3YB/sYYpD4DCRhK4a5n6W033qnwfFlsdo8Di/zwg55oQwrW
	 D3pxX61DKU/NQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAAB8CA0EED;
	Fri, 22 Aug 2025 05:41:28 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Fri, 22 Aug 2025 13:39:55 +0800
Subject: [PATCH 1/5] dt-bindings: power: add Amlogic S6 S7 S7D power
 domains
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250822-pm-s6-s7-s7d-v1-1-82e3f3aff327@amlogic.com>
References: <20250822-pm-s6-s7-s7d-v1-0-82e3f3aff327@amlogic.com>
In-Reply-To: <20250822-pm-s6-s7-s7d-v1-0-82e3f3aff327@amlogic.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jianxin Pan <jianxin.pan@amlogic.com>, Ulf Hansson <ulf.hansson@linaro.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 "hongyu.chen1" <hongyu.chen1@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755841286; l=4197;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=rDe2MvG1qbv0VUQE4y/E8LC5I45fmELEIBYCB0B5NkY=;
 b=MxArxjiZLEg5X5S2V8GYItRjycPJtxsQAxo+PCbv7Qh+80U93vSBt/w1iFUzp2AIkO+OCPim/
 aNKISq1F598C8eEN6/OwOEHW1ECi7huZNruPlQjTep8MrYjxtTKVaW9
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_224131_355972_F3C7469A 
X-CRM114-Status: GOOD (  10.60  )
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

From: "hongyu.chen1" <hongyu.chen1@amlogic.com>

Add devicetree binding document and related header file for
Amlogic S6 S7 S7D secure power domains.

Signed-off-by: hongyu.chen1 <hongyu.chen1@amlogic.com>
Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 .../bindings/power/amlogic,meson-sec-pwrc.yaml     |  3 +++
 include/dt-bindings/power/amlogic,s6-pwrc.h        | 29 ++++++++++++++++++++++
 include/dt-bindings/power/amlogic,s7-pwrc.h        | 20 +++++++++++++++
 include/dt-bindings/power/amlogic,s7d-pwrc.h       | 27 ++++++++++++++++++++
 4 files changed, 79 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/amlogic,meson-sec-pwrc.yaml b/Documentation/devicetree/bindings/power/amlogic,meson-sec-pwrc.yaml
index 15d74138baa3..12b71688dd34 100644
--- a/Documentation/devicetree/bindings/power/amlogic,meson-sec-pwrc.yaml
+++ b/Documentation/devicetree/bindings/power/amlogic,meson-sec-pwrc.yaml
@@ -24,6 +24,9 @@ properties:
       - amlogic,a5-pwrc
       - amlogic,c3-pwrc
       - amlogic,t7-pwrc
+      - amlogic,s6-pwrc
+      - amlogic,s7-pwrc
+      - amlogic,s7d-pwrc
 
   "#power-domain-cells":
     const: 1
diff --git a/include/dt-bindings/power/amlogic,s6-pwrc.h b/include/dt-bindings/power/amlogic,s6-pwrc.h
new file mode 100644
index 000000000000..2c005864ae73
--- /dev/null
+++ b/include/dt-bindings/power/amlogic,s6-pwrc.h
@@ -0,0 +1,29 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
+/*
+ * Copyright (C) 2025 Amlogic, Inc. All rights reserved
+ */
+#ifndef _DT_BINDINGS_AMLOGIC_S6_POWER_H
+#define _DT_BINDINGS_AMLOGIC_S6_POWER_H
+
+#define PWRC_S6_DSPA_ID				0
+#define PWRC_S6_DOS_HEVC_ID			1
+#define PWRC_S6_DOS_VDEC_ID			2
+#define PWRC_S6_VPU_HDMI_ID			3
+#define PWRC_S6_U2DRD_ID			4
+#define PWRC_S6_U3DRD_ID			5
+#define PWRC_S6_SD_EMMC_C_ID			6
+#define PWRC_S6_GE2D_ID				7
+#define PWRC_S6_AMFC_ID				8
+#define PWRC_S6_VC9000E_ID			9
+#define PWRC_S6_DEWARP_ID			10
+#define PWRC_S6_VICP_ID				11
+#define PWRC_S6_SD_EMMC_A_ID			12
+#define PWRC_S6_SD_EMMC_B_ID			13
+#define PWRC_S6_ETH_ID				14
+#define PWRC_S6_PCIE_ID				15
+#define PWRC_S6_NNA_4T_ID			16
+#define PWRC_S6_AUDIO_ID			17
+#define PWRC_S6_AUCPU_ID			18
+#define PWRC_S6_ADAPT_ID			19
+
+#endif
diff --git a/include/dt-bindings/power/amlogic,s7-pwrc.h b/include/dt-bindings/power/amlogic,s7-pwrc.h
new file mode 100644
index 000000000000..3f21d095f784
--- /dev/null
+++ b/include/dt-bindings/power/amlogic,s7-pwrc.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
+/*
+ * Copyright (C) 2025 Amlogic, Inc. All rights reserved
+ */
+#ifndef _DT_BINDINGS_AMLOGIC_S7_POWER_H
+#define _DT_BINDINGS_AMLOGIC_S7_POWER_H
+
+#define PWRC_S7_DOS_HEVC_ID			0
+#define PWRC_S7_DOS_VDEC_ID		        1
+#define PWRC_S7_VPU_HDMI_ID		        2
+#define PWRC_S7_USB_COMB_ID		        3
+#define PWRC_S7_SD_EMMC_C_ID			4
+#define PWRC_S7_GE2D_ID				5
+#define PWRC_S7_SD_EMMC_A_ID			6
+#define PWRC_S7_SD_EMMC_B_ID			7
+#define PWRC_S7_ETH_ID				8
+#define PWRC_S7_AUCPU_ID			9
+#define PWRC_S7_AUDIO_ID			10
+
+#endif
diff --git a/include/dt-bindings/power/amlogic,s7d-pwrc.h b/include/dt-bindings/power/amlogic,s7d-pwrc.h
new file mode 100644
index 000000000000..c6998553670a
--- /dev/null
+++ b/include/dt-bindings/power/amlogic,s7d-pwrc.h
@@ -0,0 +1,27 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
+/*
+ * Copyright (C) 2025 Amlogic, Inc. All rights reserved
+ */
+#ifndef _DT_BINDINGS_AMLOGIC_S7D_POWER_H
+#define _DT_BINDINGS_AMLOGIC_S7D_POWER_H
+
+#define PWRC_S7D_DOS_HCODEC_ID			0
+#define PWRC_S7D_DOS_HEVC_ID			1
+#define PWRC_S7D_DOS_VDEC_ID			2
+#define PWRC_S7D_VPU_HDMI_ID			3
+#define PWRC_S7D_USB_U2DRD_ID			4
+#define PWRC_S7D_USB_U2H_ID			5
+#define PWRC_S7D_SSD_EMMC_C_ID			6
+#define PWRC_S7D_GE2D_ID			7
+#define PWRC_S7D_AMFC_ID			8
+#define PWRC_S7D_EMMC_A_ID			9
+#define PWRC_S7D_EMMC_B_ID			10
+#define PWRC_S7D_ETH_ID				11
+#define PWRC_S7D_AUCPU_ID			12
+#define PWRC_S7D_AUDIO_ID			13
+#define PWRC_S7D_SRAMA_ID			14
+#define PWRC_S7D_DMC0_ID			15
+#define PWRC_S7D_DMC1_ID			16
+#define PWRC_S7D_DDR_ID				17
+
+#endif

-- 
2.37.1




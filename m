Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4CC9C4453B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 08:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GLqTDFf+yaI1zcaeHquthcodU43L5YYnHROE3/GqIJk=; b=FA1shf5Jwup5XLuxMhm2D0mRsa
	LlH5nLoaNDGPtUc/jkDT3DbZ26E9gH/YBp54YX9LDAKMqHPWcqWhI+BTouwSJCmuzWaFMBWwJ0SjE
	P4AVKsAGMKB0bncZcOk49IPEJIs0Re2dST/q2f5C/qyU/veeyGiA4ANcPqNMkkb6JNrTBQQuu07tQ
	EddZbNXbi/MNo4CPYtaHW3MD0Lb8HyECCaoDYpAi3uxZ3S2c6aFejdx04AHxsWOf6PeUjt7oP9qTf
	r48H9xP6j+x6/06/F7UXzfm/VkYRaBlIdFRXwSvLSpiCUdKhXuMEbxlwP7xt0ozwbKvEXsrdzbX/g
	jmUHCL0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmSUL-0000000BHQm-2wFF;
	Wed, 22 Jul 2026 08:39:37 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmSUL-0000000BHPu-0Kzx;
	Wed, 22 Jul 2026 08:39:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CE478418C3;
	Wed, 22 Jul 2026 08:39:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A69C0C2BD00;
	Wed, 22 Jul 2026 08:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784709576;
	bh=/CtfcRiNZmIDjw0LmLMal82IJMGbUeAVONk2Kky6N14=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=oNHdOlraHo+Y14/Ovs6YzBJBV36uW+MUta/e+nK4VatrdD1OCMINZDd6AsESFUjW4
	 R+lrppCBOUs2iXb0NLZWzyFhD+emjmGeAgN9vbA/fMCiAzjW62BegG+fQKW2p8pdWE
	 gEQqCzG+e7BvVjhpWbAXExzzyWT7Cg+UPF8CqgzrFtFq3iH5f7e2/fJ9vZEM+LdLzQ
	 o7c1/FtRL9j3Ww5Z+WYF87rGro3tXesyn0+DoobiNzixatFX81XrfAbT7v8KA+MvEl
	 fLsLG28Rv3ZYj0R5cqXPUGPX2kvF/iBm8DyKC2D3SuMUbcFxTgmTUesm8JjbcoxfXj
	 kyg50pSITti6g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9299FC44533;
	Wed, 22 Jul 2026 08:39:36 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Wed, 22 Jul 2026 08:39:33 +0000
Subject: [PATCH 3/3] arm64: dts: amlogic: a9: Add power domain controller
 node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-a9-pm-v1-3-1fe20a44bf2d@amlogic.com>
References: <20260722-a9-pm-v1-0-1fe20a44bf2d@amlogic.com>
In-Reply-To: <20260722-a9-pm-v1-0-1fe20a44bf2d@amlogic.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jianxin Pan <jianxin.pan@amlogic.com>, Ulf Hansson <ulfh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784709572; l=1059;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=xo1Aubxoy/JqFSkmWDscfP/W3QukIsgCeqLnk3l3H2c=;
 b=8m2xj7Wdhudv3R9CMZS9z6M+V7M9mHlKRD7/9v7ugrfgIHOsm2Z43TnkReKOjQANfg6+hGJW7
 CJVRk7lvnCpBLpygK1jOTD3xy+wTNafcwO0b2uGVTJhA5kLx7f2QAbf
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=dWwxtWCxC6FHRurOmxEtr34SuBYU+WJowV/ZmRJ7H+k=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20251216 with
 auth_id=578
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
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

Add power domain controller node for Amlogic A9 SoC.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-a9.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-a9.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-a9.dtsi
index b0e0fadeed82..3652b2034c96 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-a9.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-a9.dtsi
@@ -7,6 +7,7 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/pinctrl/amlogic,pinctrl.h>
+#include <dt-bindings/power/amlogic,a9-pwrc.h>
 
 / {
 	interrupt-parent = <&gic>;
@@ -72,6 +73,15 @@ cpu7: cpu@700 {
 		};
 	};
 
+	sm: secure-monitor {
+		compatible = "amlogic,meson-gxbb-sm";
+
+		pwrc: power-controller {
+			compatible = "amlogic,a9-pwrc";
+			#power-domain-cells = <1>;
+		};
+	};
+
 	timer {
 		compatible = "arm,armv8-timer";
 		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,

-- 
2.52.0




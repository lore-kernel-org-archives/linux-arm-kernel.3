Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FB63C5DF85
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 14:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pTvmOLf2cnvYtnWCj0T/kHsrS3V5GxEZ8qTiqEwrp6c=; b=tgYMxnNU1XPb9PVx47TvDthvQu
	EKiVPf2sioaUPUZ4+AbKA780bNQ6OsNcjePuc759SVcUhDv0N1aAQ3edSsuFwtH+qQ0jTT6DYPutg
	00kdafMV3iFdkjLEOyLakdXgTtzxk0izajccVsPdtt1oN8XQQtJlz4GceDdpdx4paZsNKRxtXsTot
	hztDF1mhpSW6ty73yPBLPMMjCDcvFseRW4LpQF/9xWPXqHedkMQ7AUJUJvAEsTHuvLhMSZXX1KAZW
	H81OdsexQRrtmNqQFtaab3PabBdiLogxQ22zGNmcbqE+LgyrhVApT7GrreyGojfBRwENLD5esm1p9
	cQ+wUUow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx3gR-0000000BgwA-2Ac9;
	Thu, 20 Aug 2026 14:23:55 +0000
Received: from smtp.forwardemail.net ([149.28.215.223])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx3gO-0000000Bgut-05t0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 14:23:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lineageos.org;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-2eefaa527c;
 t=1787235831; bh=pTvmOLf2cnvYtnWCj0T/kHsrS3V5GxEZ8qTiqEwrp6c=;
 b=gvDq0lvGPP/kOrlJr3m64+a236T86IOLP/U+GCCjxuUwLnAz5xqHxkcEw8J8cX07a19TJ49bF
 yyS9y5c0+qodwscr8YZ3Mfiv2WmAZr5H1C3Cp/+qQmt10EX3VbpDgJ/5SiBhhHQ++yT6n234xzq
 QzbNz7pidCwIx/E02D1/JJo=
X-Forward-Email-ID: 6a870df37f958f0d9fc1b839
X-Forward-Email-Sender: rfc822; tturner@lineageos.org,
 smtp.forwardemail.net, 149.28.215.223
X-Forward-Email-Version: 2.13.16
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Thomas Turner <tturner@lineageos.org>
To: krzysztof.kozlowski@oss.qualcomm.com
Cc: semen.protsenko@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	peter.griffin@linaro.org,
	alim.akhtar@samsung.com,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Thomas Turner <tturner@lineageos.org>
Subject: [PATCH v2 2/2] arm64: dts: exynos850: Add GPU/Mali Bifrost node
Date: Thu, 20 Aug 2026 15:23:30 +0100
Message-ID: <20260820142330.84514-3-tturner@lineageos.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260820142330.84514-1-tturner@lineageos.org>
References: <GVYP280MB12139AB976CA7ACF49FEB768A1A52@GVYP280MB1213.SWEP280.PROD.OUTLOOK.COM>
 <20260820142330.84514-1-tturner@lineageos.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_072352_065573_A4E2EF3F 
X-CRM114-Status: UNSURE (   9.49  )
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

This can provide basic GPU functionality for the Exynos850 platform.
Tested on the SM-A217F device. Does not provide support for temperature
throttling, DVFS, power domains, governor support, boosting and voltage
control. Once PMIC is properly implemented, support will hopefully
increase. However the panfrost driver probes, the Mali-G52 GPU
initializes and the core clock is set-up.

Signed-off-by: Thomas Turner <tturner@lineageos.org>
---
 arch/arm64/boot/dts/exynos/exynos850.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot/dts/exynos/exynos850.dtsi
index 3881f573ec08..8ed85c125030 100644
--- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
@@ -296,6 +296,18 @@ cmu_g3d: clock-controller@11400000 {
 			clock-names = "oscclk", "dout_g3d_switch";
 		};
 
+		gpu: gpu@11500000 {
+			compatible = "samsung,exynos850-mali", "arm,mali-bifrost";
+			reg = <0x11500000 0x5000>;
+			interrupts = <GIC_SPI 126 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 127 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "job", "mmu", "gpu";
+			clocks = <&cmu_g3d CLK_GOUT_G3D_GPU_CLK>;
+			clock-names = "core";
+			status = "disabled";
+		};
+
 		cmu_apm: clock-controller@11800000 {
 			compatible = "samsung,exynos850-cmu-apm";
 			reg = <0x11800000 0x8000>;
-- 
2.47.3



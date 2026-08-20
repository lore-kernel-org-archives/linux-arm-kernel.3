Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8500C5DF85
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 13:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pTvmOLf2cnvYtnWCj0T/kHsrS3V5GxEZ8qTiqEwrp6c=; b=gOWwKBsG0z8n+61FN82+yk0jgC
	hynjOqbgBtlh461myK98EmK4gUUcAwALOvBM02phVE1ypYRA/flhqg8cCgKDne3Nr17cvib/wdjQ6
	yK5Fi1B94WOpHzTkrGO4m5PMlDbLOTS24fMwLfmAeQkkZOPIByHgfvacmA7O9hO1r9uM3dJFkd4Az
	BpQ37vYPZlfgmZHPwUMZNtFZYMKfgQJrukLRmqDD97yL7feqH4xONA8KmKetVTuS2gwj85kIuHaz/
	n04mpR1QBzKOaOXHUnXfDDEhN+1rkMXRxaBUnmiZCNoXR4HJo/1ibVCIEoazZCynHJBT1F46C/b7c
	LQ2BdreA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx2xC-0000000Bcyq-0Gtu;
	Thu, 20 Aug 2026 13:37:10 +0000
Received: from smtp.forwardemail.net ([121.127.44.66])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx2x9-0000000BcyP-1btv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 13:37:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lineageos.org;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-2eefaa527c;
 t=1787233024; bh=pTvmOLf2cnvYtnWCj0T/kHsrS3V5GxEZ8qTiqEwrp6c=;
 b=Ztx53eFYO+oeWbrkIuOn3chOsxRwGmkkQkLT3X/XKasJ2mh8uxaId3u6ffPOQg3LWf3IdzC4Q
 1E7mNUE8aui22ZKZPfDaa47M+33w9Zv5T/8miQHfCn+QLXq3hEuAR01TbbPAY356v4IG3jAMMyn
 pzkrD98DpTacoaoZ/6NbA+s=
X-Forward-Email-ID: 6a8702fef33af0a2f9210495
X-Forward-Email-Sender: rfc822; tturner@lineageos.org,
 smtp.forwardemail.net, 121.127.44.66
X-Forward-Email-Version: 2.13.16
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Thomas Turner <tturner@lineageos.org>
To: semen.protsenko@linaro.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	peter.griffin@linaro.org,
	alim.akhtar@samsung.com,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Thomas Turner <tturner@lineageos.org>
Subject: [PATCH] arm64: dts: exynos850: Add GPU/Mali Bifrost node
Date: Thu, 20 Aug 2026 14:35:56 +0100
Message-ID: <20260820133556.76300-1-tturner@lineageos.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <GVYP280MB12139AB976CA7ACF49FEB768A1A52@GVYP280MB1213.SWEP280.PROD.OUTLOOK.COM>
References: <GVYP280MB12139AB976CA7ACF49FEB768A1A52@GVYP280MB1213.SWEP280.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_063707_528236_F8AA5EE8 
X-CRM114-Status: UNSURE (   9.68  )
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



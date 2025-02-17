Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFE8EC021A9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 21:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jHfOQdgLhXd1GxZLYHAG3M/avLMbTGSQr7ywGKz31Vs=; b=A73GciDbTsZau2NBV6y+j3T+I3
	RBEdPznY6rNuIQxeaUXI8zvlQmbkhdlbn1HUs80NEsS2gFoHcdu6veFDMBz96LYCXFtLor+IFg5ME
	7UABi5fuakuhz1yR2+jrjxH9bAaEun5Oj9rYj5Y57qUAhqT36FE7ivMlbBSCaWTqzeBW8pAjRSB3p
	7BILFE12+ZUV9Yux/hLg6AzcAwz65wF9Kyzy+Ht86rutu07YkBUXFQRE+NB86w4gbCfdurQjvxwW2
	V+fORvN0aOMgiYMxLlXubXDnind4HHIOplRKap+NQjKHMYvVlM5Ajxff18dhnmQ7u7NDCNtv//HxX
	XIjl285A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk8qI-000000062mn-2mvP;
	Mon, 17 Feb 2025 21:39:54 +0000
Received: from sendmail.purelymail.com ([34.202.193.197])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tk8jS-000000061Vv-3G90
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 21:32:51 +0000
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256; b=SLWwuPCUbrEIR1Wrs83suedPkUIgjYtCpYfJ2+OVRW1VLYaRF7KCdEfwovjAMPsjGiX1zNLPHSUVxHWDKqWEhw5LWvVOMOXV2f6UCvMQ4a3Z70Hb3eKckGsUNQTyj1dM4/yO+VAK+3dXdEds4G4oXOJ0Nbo0iHRn2RdXQNjkcpi9YfhGL18bhjHksGPSAlFSwFES26rCUTc+wC1wV1ehXvKiLkcYMYrIvfR2iROM3f8Lahz/9BSxl+fScDaAydxq5l1eYqQ0HqLiP6Yh53LdLs0q00YNyZoFr+m3rTU9MAVZDGXuaaecmMTOQE0EB0zH/5PDBhCe+OV/qCClUYJgyA==; s=purelymail3; d=purelymail.com; v=1; bh=RujWy5FU1WCa/8rts2CXrRAZV0s0wmf4pJU9jEL4iK0=; h=Feedback-ID:Received:From:Date:Subject:To;
Feedback-ID: 68247:10037:null:purelymail
X-Pm-Original-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 42194286;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Mon, 17 Feb 2025 21:32:35 +0000 (UTC)
From: Igor Belwon <igor.belwon@mentallysanemainliners.org>
Date: Mon, 17 Feb 2025 22:32:04 +0100
Subject: [PATCH 2/5] arm64: dts: exynos990: Add USB nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250217-exynos990-dt-changes-febuary-v1-2-99935218cbf4@mentallysanemainliners.org>
References: <20250217-exynos990-dt-changes-febuary-v1-0-99935218cbf4@mentallysanemainliners.org>
In-Reply-To: <20250217-exynos990-dt-changes-febuary-v1-0-99935218cbf4@mentallysanemainliners.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Igor Belwon <igor.belwon@mentallysanemainliners.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739827951; l=1950;
 i=igor.belwon@mentallysanemainliners.org; s=20241206;
 h=from:subject:message-id; bh=RujWy5FU1WCa/8rts2CXrRAZV0s0wmf4pJU9jEL4iK0=;
 b=y68Za606iO3ebmQoVh25l7jjW2Yb/6o2h0KljE4oZEhNbhTn+31w6h9WQ0MZxplRsMxMMlLvK
 d6UC1vHfSgDAobwTzh20xbWR2tyD6T0deWvmRRXW6/HnEBbd83tsrD/
X-Developer-Key: i=igor.belwon@mentallysanemainliners.org; a=ed25519;
 pk=qKAuSTWKTaGQM0vwBxV0p6hPKMN4vh0CwZ+bozrG5lY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_133250_917629_8FF52B2E 
X-CRM114-Status: UNSURE (   8.69  )
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

Add USB controller and USB PHY controller nodes for use in
the Exynos990 SoC.

This SoC supports USB full-speed, high-speed and super-speed modes.

Due to the inability to test PIPE3, USB super-speed is not enabled, and
the USB PHY is only configured for UTMI+ operation for now.

Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
---
 arch/arm64/boot/dts/exynos/exynos990.dtsi | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos990.dtsi b/arch/arm64/boot/dts/exynos/exynos990.dtsi
index 4446a1a54ba2de56879353c9c4a898b1d697fc13..b5239472be40a164d496ca4564f5270132012c0e 100644
--- a/arch/arm64/boot/dts/exynos/exynos990.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos990.dtsi
@@ -278,6 +278,37 @@ cmu_hsi0: clock-controller@10a00000 {
 				      "dpgtc";
 		};
 
+		usbdrd: usb@10e00000 {
+			compatible = "samsung,exynos990-dwusb3",
+				     "samsung,exynos850-dwusb3";
+			ranges = <0x0 0x10e00000 0x10000>;
+			clocks = <&cmu_hsi0 CLK_GOUT_HSI0_USB31DRD_BUS_CLK_EARLY>,
+				 <&cmu_hsi0 CLK_GOUT_HSI0_USB31DRD_USB31DRD_REF_CLK_40>;
+			clock-names = "bus_early", "ref";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			status = "disabled";
+
+			usbdrd_dwc3: usb@0 {
+				compatible = "snps,dwc3";
+				reg = <0x0 0x10000>;
+				interrupts = <GIC_SPI 310 IRQ_TYPE_LEVEL_HIGH>;
+				phys = <&usbdrd_phy 0>;
+				phy-names = "usb2-phy";
+			};
+		};
+
+		usbdrd_phy: phy@10c00000 {
+			compatible = "samsung,exynos990-usbdrd-phy";
+			reg = <0x10c00000 0x100>;
+			clocks = <&cmu_hsi0 CLK_GOUT_HSI0_USB31DRD_ACLK_PHYCTRL>,
+				 <&oscclk>;
+			clock-names = "phy", "ref";
+			samsung,pmu-syscon = <&pmu_system_controller>;
+			#phy-cells = <1>;
+			status = "disabled";
+		};
+
 		pinctrl_hsi1: pinctrl@13040000 {
 			compatible = "samsung,exynos990-pinctrl";
 			reg = <0x13040000 0x1000>;

-- 
2.47.2



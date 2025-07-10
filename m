Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71991C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 19:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=galIp613DyIXR6hZ86K7m+eKkGszrP9iZB3AR7DPD8M=; b=3LoE/k3k0dzJ/ZxSAPB/iwHY9I
	ZQBmElia2NmsOzbcq7JTm2gK2GD277AWd70lvKGLSjXV4XF51UGEgeO9IjNF6gq/zyHdea+JbClm6
	nsegfwLGqQbKtLl/iQbdsoVxSbRhBpbkMFBaKc3egdZpHcS8R0yXE5fy6sL45fRVegzLfLsEmV2Sn
	7umAHXfhRDzcREvkVZ6xtJ4UoekkvzfDcMRCMS61AeVu1VGYhscJ5Ww/QeE/oG16NcvzUqRh25b5h
	o2oYRCIViM5CWB2AeKH1yHapJfplsKr379U5VYUz5Xz6pgQKcUZlX7FFe3ExvfTb8FjcMbTxvydgf
	nhKE2n9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZwyF-0000000Comy-1bV2;
	Thu, 10 Jul 2025 19:30:15 +0000
Received: from sendmail.purelymail.com ([34.202.193.197])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZuUR-0000000CVR4-34kX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 16:51:20 +0000
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256; b=hA57riP9ilplNUC9lxhigzrnbuJoTuzqGA+Pf1dsLsG4sJFE6rPayh1SBGcND7paED7Zu6l/P/7/F4nXflqnFxBKA5bflQYCio8GaejZOvqaPU0sNnZ+ccgOtww5U3544sUn5aQTMmYyqvZaXMQzBAv4PdvuZg7v8Y+QUIirNYn7xbjQmjsdyMxB99QWBysmhg30BcIjWqX51DByNgLZ0M90VO1FsvOaXhXj0Y7Ze/xhcyHNa5rAP6gCQUiR5azKMCj19weRzYckd0qQkf6NCVhyzV5N/aNjHzyAYz1SePN2SyGDldYw91hbH8K5wvrLvFJQ2EV+XGU0DTrnPswo+Q==; s=purelymail3; d=purelymail.com; v=1; bh=1/lgcU6J91Nah6llXW2IKKlaxLEotdEdEftqQWx/RQk=; h=Feedback-ID:Received:From:Date:Subject:To;
Feedback-ID: 68247:10037:null:purelymail
X-Pm-Original-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1992400030;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Thu, 10 Jul 2025 16:50:39 +0000 (UTC)
From: Igor Belwon <igor.belwon@mentallysanemainliners.org>
Date: Thu, 10 Jul 2025 18:50:06 +0200
Subject: [PATCH v2 2/5] arm64: dts: exynos990: Add USB nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-resends-july-exynos990-dt-v2-2-55033f73d1b0@mentallysanemainliners.org>
References: <20250710-resends-july-exynos990-dt-v2-0-55033f73d1b0@mentallysanemainliners.org>
In-Reply-To: <20250710-resends-july-exynos990-dt-v2-0-55033f73d1b0@mentallysanemainliners.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Igor Belwon <igor.belwon@mentallysanemainliners.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752166235; l=1950;
 i=igor.belwon@mentallysanemainliners.org; s=20241206;
 h=from:subject:message-id; bh=1/lgcU6J91Nah6llXW2IKKlaxLEotdEdEftqQWx/RQk=;
 b=gNdTB+SazTGvUEOySHF1DzzjAQr3SsdgnqbRRzof8PUYQnaio5ON375X3MrWNhmc7Zsj4eNwa
 VGjsC/VeyutDl3Ja5I/egjjgQ6wh4tSkmW0HGlxxTXTycIsGd42jq36
X-Developer-Key: i=igor.belwon@mentallysanemainliners.org; a=ed25519;
 pk=qKAuSTWKTaGQM0vwBxV0p6hPKMN4vh0CwZ+bozrG5lY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_095119_849548_7E178455 
X-CRM114-Status: UNSURE (   9.09  )
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
index 4446a1a54ba2de56879353c9c4a898b1d697fc13..bd5e086ac46d3010ace413e2eeb2cd30d7f7672c 100644
--- a/arch/arm64/boot/dts/exynos/exynos990.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos990.dtsi
@@ -278,6 +278,37 @@ cmu_hsi0: clock-controller@10a00000 {
 				      "dpgtc";
 		};
 
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
 		pinctrl_hsi1: pinctrl@13040000 {
 			compatible = "samsung,exynos990-pinctrl";
 			reg = <0x13040000 0x1000>;

-- 
2.47.2



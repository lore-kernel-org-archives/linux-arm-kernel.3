Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 034FFCCF2D3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 05:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2YKOUOcqlf/jhBc2Amo176pZLS9eddz9Qiil9Inca28=; b=Nnya9imKoWZnNhMhabCv2mFvSY
	+UML6L4IbfQAPasUEdxt4o3peTsW7XcpgBd6iCiJuQfxkCZOwsWj39fDfSnOe/xqhdfZ72ihVZalr
	fg7EI+s06lO88oLdkSv15JhflayAoncGwz87bJtzjsS9XwupZwUtQRv8T+BEzs0Py2rPhpV/tJPk6
	Y+CumGMZOnQ68JsqD2oTvzpOUoCfGRwTFLlL3d7CZNYGzriNmUYEaza/I6ZM2F63xzY1kWB/KO9tR
	7JJSriNh4XJs9IkF4HaxzgsCYV4YWqOF7pCmhJ/egrzfTdrcTvMRalWTXIJGqQ3C29vDrz5RLkFLQ
	D6jPKVuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIfpm-00000006d9J-2rxr;
	Mon, 19 Oct 2026 05:22:54 +0000
Received: from mail-m10230.netease.com ([154.81.10.230])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIfpj-00000006d8q-18oD;
	Mon, 19 Oct 2026 05:22:53 +0000
Received: from localhost.localdomain (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 518080e91;
	Mon, 19 Oct 2026 13:22:38 +0800 (GMT+08:00)
From: Shawn Lin <shawn.lin@rock-chips.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Shawn Lin <shawn.lin@rock-chips.com>
Subject: [PATCH] arm64: dts: rockchip: rk3568-evb1: enable PCIe3x2
Date: Mon, 19 Oct 2026 13:22:29 +0800
Message-Id: <1792387349-86262-1-git-send-email-shawn.lin@rock-chips.com>
X-Mailer: git-send-email 2.7.4
X-HM-Tid: 0aa1529c9c8803a4kunmb7170bb964a91b
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1kYFggdWUFKV1ktWUFJV1kPCRoVCBIfWUFZQklCS1ZMGh4dSBlIGk
	hPHhhWFRQJFhoXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0
	tIVUpLSU9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=EiSMxUAMU9NWJAnpomFtM/SYCLemTt/A+YcLj45L1KtpRadRp/RyUKwBSpYlzqnbGAPpRc/yYp0I9aZ3SeJEQjj4+eRhA7YR8SA2CRpym3oBHjJcTQ9mTimIJgvuCt8IZ881uBYUXR4pMB8Qz0C7VQSWScVI+l59Xv8UwaH7lhA=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=2YKOUOcqlf/jhBc2Amo176pZLS9eddz9Qiil9Inca28=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261018_222251_872388_21F558A3 
X-CRM114-Status: UNSURE (   9.18  )
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

Enable the PCIe3x2 controller on the RK3568 EVB1 board: add the GPIO
controlled vcc3v3_pcie supply along with its pinctrl entry, and wire
the PERST# reset pin and the supply to the controller node.

Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>
---

 arch/arm64/boot/dts/rockchip/rk3568-evb1-v10.dts | 34 ++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568-evb1-v10.dts b/arch/arm64/boot/dts/rockchip/rk3568-evb1-v10.dts
index b01f952..cab8c2d 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-evb1-v10.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-evb1-v10.dts
@@ -92,6 +92,19 @@
 		vin-supply = <&dc_12v>;
 	};
 
+	vcc3v3_pcie: regulator-vcc3v3-pcie {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpio = <&gpio0 RK_PD4 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&vcc3v3_pcie_en_pin>;
+		regulator-name = "vcc3v3_pcie";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		startup-delay-us = <5000>;
+		vin-supply = <&vcc5v0_sys>;
+	};
+
 	vcc5v0_sys: regulator-vcc5v0-sys {
 		compatible = "regulator-fixed";
 		regulator-name = "vcc5v0_sys";
@@ -576,6 +589,18 @@
 	};
 };
 
+&pcie30phy {
+	status = "okay";
+};
+
+&pcie3x2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie_reset_pin>;
+	reset-gpios = <&gpio2 RK_PD6 GPIO_ACTIVE_HIGH>;
+	vpcie3v3-supply = <&vcc3v3_pcie>;
+	status = "okay";
+};
+
 &pinctrl {
 	display {
 		vcc3v3_lcd0_n_en: vcc3v3_lcd0_n_en {
@@ -592,6 +617,15 @@
 		};
 	};
 
+	pcie {
+		pcie_reset_pin: pcie-reset-pin {
+			rockchip,pins = <2 RK_PD6 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+		vcc3v3_pcie_en_pin: vcc3v3-pcie-en-pin {
+			rockchip,pins = <0 RK_PD4 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
 	pmic {
 		pmic_int: pmic_int {
 			rockchip,pins =
-- 
2.7.4



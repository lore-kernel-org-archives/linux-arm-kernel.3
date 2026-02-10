Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA37AEA8104
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Feb 2026 12:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MA8XtkyTeXl7r9NYADWLTbBNblgwxWj94nMGkruZhVo=; b=b//wMBBs6N4Kl6nM/G3RIr4FGJ
	uEZnmnvhL+YnC2F1BHzDvaCU0I4Cyzo5Narimc6c84ySMjfYoUuiRQxtmkBoWWywzNgQXNq9IFchW
	bvu8ANSAGlbn9xae29mZJtyoiW0sDITRvPStDOSDXwHiWtn8411FJ9EgOoRzRQ0lYhgCEzFCmchzD
	6cHz1Z3qdlGEURD7+Rtcfz+L1EbrOE1gkooRFoAO9++Vnv0HHrWBnv3g0kQ9D68IrZ0ZAWvbwQSnw
	bgLB9J1kguze0Q3l3eTjdinJU030Ufwj/6wb4FhnMh7B5r4zhKL6mmZ1+ij4R93V3zxtyBqhIEkqX
	ueSiQaGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpmRe-0000000Guml-22s9;
	Tue, 10 Feb 2026 12:02:18 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpmRb-0000000GumA-2cuC;
	Tue, 10 Feb 2026 12:02:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Reply-To:Content-Type:In-Reply-To:References;
	bh=MA8XtkyTeXl7r9NYADWLTbBNblgwxWj94nMGkruZhVo=; b=Pz/kwafXMpzn18HUjhM6RMkhj6
	L52/VJwnl7fwM/YF93KhyrTRBjSOkP5odXCCUy0ymCtlyynt+8hd5xGgByI9BJjWL2gd6/aLtZPVV
	N8APRQ1nVr0MYDw86JVuT3t1zK9cKE6/AHnlUNbF493OIkM2mefUYPiON/vMw34/mYVIPf8BTxwso
	BjhvlIMEIEU6RPlLJWQlAMrzZ36j3Wlaq5UKD0CMNB3LgEELABTxsAZrd6Edhyzwp5BsyNh/akF3c
	rSX8cn2kzH2eJyVPFFDd0eulKChVb8uL7qFw7WleQmFQNpwiRQftP+h1YkjKI5eexSTPM8QVx2DeP
	f9HdBcMA==;
Received: from i53875a81.versanet.de ([83.135.90.129] helo=phil..)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vpmRY-007wxR-CX; Tue, 10 Feb 2026 13:02:12 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jan Palus <jpalus@fastmail.com>,
	Peter Robinson <pbrobinson@gmail.com>,
	Thorsten Leemhuis <regressions@leemhuis.info>,
	stable@vger.kernel.org
Subject: [PATCH] Revert "arm64: dts: rockchip: Further describe the WiFi for the Pinebook Pro"
Date: Tue, 10 Feb 2026 13:01:42 +0100
Message-ID: <20260210120142.698512-1-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_040215_722903_FE78380A 
X-CRM114-Status: GOOD (  11.72  )
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

This reverts commit 6d54d935062e2d4a7d3f779ceb9eeff108d0535d.

It seems there are different variants of the Wifi chipset in use on the
Pinebook Pro. And according to the reported regression - see Closes
below, the reverted change causes issues with one Wifi chipset.

The original commit message indicates a "further description" only and
does not indicate this would fix an actual problem, so a revert should
not cause further problems.

Fixes: 6d54d935062e ("arm64: dts: rockchip: Further describe the WiFi for the Pinebook Pro")
Cc: Jan Palus <jpalus@fastmail.com>
Cc: Peter Robinson <pbrobinson@gmail.com>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: stable@vger.kernel.org
Closes: https://lore.kernel.org/r/aUKOlj-RvTYlrpiS@rock.grzadka/
Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 .../boot/dts/rockchip/rk3399-pinebook-pro.dts  | 18 ------------------
 1 file changed, 18 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts b/arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts
index 810ab6ff4e67..7c23971920f0 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts
@@ -883,12 +883,6 @@ vcc5v0_host_en_pin: vcc5v0-host-en-pin {
 		};
 	};
 
-	wifi {
-		wifi_host_wake_l: wifi-host-wake-l {
-			rockchip,pins = <0 RK_PA3 RK_FUNC_GPIO &pcfg_pull_none>;
-		};
-	};
-
 	wireless-bluetooth {
 		bt_wake_pin: bt-wake-pin {
 			rockchip,pins = <2 RK_PD3 RK_FUNC_GPIO &pcfg_pull_none>;
@@ -946,19 +940,7 @@ &sdio0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&sdio0_bus4 &sdio0_cmd &sdio0_clk>;
 	sd-uhs-sdr104;
-	#address-cells = <1>;
-	#size-cells = <0>;
 	status = "okay";
-
-	brcmf: wifi@1 {
-		compatible = "brcm,bcm4329-fmac";
-		reg = <1>;
-		interrupt-parent = <&gpio0>;
-		interrupts = <RK_PA3 IRQ_TYPE_LEVEL_HIGH>;
-		interrupt-names = "host-wake";
-		pinctrl-names = "default";
-		pinctrl-0 = <&wifi_host_wake_l>;
-	};
 };
 
 &sdhci {
-- 
2.47.2



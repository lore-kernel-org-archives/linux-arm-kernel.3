Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8159CC54F98
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 12:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xJuNsq0R54HUWt1Xt7iwFDsJyYa9pnCsrSpzmk28zOE=; b=Z7or+4GYTzi21qq/LGeGh7gipH
	4ggn592pzxCKjokqGkrxHWHBuaMO6ACjeLM8LRbVPmUVple250CRGfXubW+4Np1VNtww8JinbZ8Qx
	596MX5yz6841Lifvw9937AOkYSgBQwMtUS4LOUxaQGlmNhXmxuapiFAP0jTtUECZ0HtBuRXzaKcsU
	aRciS6oyg14KAHUmw5di1rmSXyYblJ2OYp/r2/p7dSp0pty2/HLzOpUUwHCWfdU15vEu7GMj0At9T
	tAGP2xmRt5VWoa88vUQHtGgHIOOh8TWtTzDfjkGexbjoruAxw/MOd+vgBEeLXnN9mtppekz520Zoy
	xBXQWnWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wogVz-00000005ACV-02h9;
	Tue, 28 Jul 2026 12:02:31 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wogVx-00000005A9T-0iZ0;
	Tue, 28 Jul 2026 12:02:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A8D4343B24;
	Tue, 28 Jul 2026 12:02:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 81FF2C2BCFA;
	Tue, 28 Jul 2026 12:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785240148;
	bh=0StYnzO+BlIiuZfxctwX7lmcEaDWryBiXL9T1hKk/fc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=jQaxMHPKk2uiDrApWvLTxdWtBQ3Abw2DHYML/egf6JKzfJZQLOCUj9NfHHF/yPo6h
	 KIR9QJAINcs671RjcAGRwWcdMbmNUtcUOpYl+PfzCJe03RD2anCUhnbqgnzc1P+j1+
	 6ZtSt42D5fGuXKuNQs2hdRLlQ+d1UmQ4XyrN3b2dFQYeFmLgec0XZ9VtNT4Ii590ZX
	 MIL5exMZOJ2VHOHIG4A2/rdH0oM+fFnLZK6tp5PV1PilEBXAr1dZRM6oup+aVWn01n
	 pY03Og5N+s5K5Vy1gtNqs1tqzjlUBSDDTj2mqB5QbnPuQ5OMiMsrQ7oyH/zgPFMe6A
	 RVgb0Cc8SKJyw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61089C54F4C;
	Tue, 28 Jul 2026 12:02:28 +0000 (UTC)
From: Joachim Eastwood via B4 Relay <devnull+joachim.eastwood.gmail.com@kernel.org>
Date: Tue, 28 Jul 2026 14:00:29 +0200
Subject: [PATCH v5 02/12] arm64: dts: rockchip: rk3588s-nanopi-r6: fix
 missing sdmmc cd pinctrl
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-nanopi-m6-v5-2-cbc1eb0d8d56@gmail.com>
References: <20260728-nanopi-m6-v5-0-cbc1eb0d8d56@gmail.com>
In-Reply-To: <20260728-nanopi-m6-v5-0-cbc1eb0d8d56@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, diederik@cknow-tech.com, 
 jonas@kwiboo.se, Joachim Eastwood <joachim.eastwood@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785240146; l=1141;
 i=joachim.eastwood@gmail.com; s=20260701; h=from:subject:message-id;
 bh=kI3ZjJonY+6nqEWc8m+ryhZH4GnBusVZIougapTsu48=;
 b=mZTwnP0ApdptokhifkjpEi4DCtTRju3VOwM9fuEKZAOdHqvMaEwP4NoeeC6rrr+HY2Uv3eMTG
 rypRnfaoD5KDm9rT1eZASu7Ptyxlo6SZlEhUenE3AiMd+VhCmISNpXD
X-Developer-Key: i=joachim.eastwood@gmail.com; a=ed25519;
 pk=ZN/8xWtdYaSd5oEfloYSZ1a+/ri0n0VZqjlEeHlbXFU=
X-Endpoint-Received: by B4 Relay for joachim.eastwood@gmail.com/20260701
 with auth_id=846
X-Original-From: Joachim Eastwood <joachim.eastwood@gmail.com>
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
Reply-To: joachim.eastwood@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Joachim Eastwood <joachim.eastwood@gmail.com>

The cd (card detect) pin is used, but not reserved through pinctrl.

Fixes: 95147bb42bc1 ("arm64: dts: rockchip: Fix the SD card detection on NanoPi R6C/R6S")
Signed-off-by: Joachim Eastwood <joachim.eastwood@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi
index 91b6eefd7abf..3ee6853b8752 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi
@@ -421,6 +421,10 @@ rtc_int: rtc-int {
 	};
 
 	sdmmc {
+		sdmmc_det_pin: sdmmc-det-pin {
+			rockchip,pins = <0 RK_PA4 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+
 		sd_s0_pwr: sd-s0-pwr {
 			rockchip,pins = <4 RK_PB4 RK_FUNC_GPIO &pcfg_pull_up>;
 		};
@@ -496,6 +500,8 @@ &sdmmc {
 	no-mmc;
 	no-sdio;
 	sd-uhs-sdr104;
+	pinctrl-names = "default";
+	pinctrl-0 = <&sdmmc_bus4 &sdmmc_clk &sdmmc_cmd &sdmmc_det_pin>;
 	vmmc-supply = <&vcc_3v3_sd_s0>;
 	vqmmc-supply = <&vccio_sd_s0>;
 	status = "okay";

-- 
2.55.0




Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 800FBCA5FCE
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Oct 2026 22:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yeL+tqV9B+AEp/kqMcCgdeSnw6MJnhOAjYzN5tkPjHo=; b=IVEhuKBpypId6jGATlKWiwgJFX
	mOrAEXOOZ42Q5HYZ4XygQrbn7HNQMq9gAlbpsYAO4jB7fh5uBxZFv/yIzx56HXCT22AfvMwDNzzdr
	GIWWcoEcw5Q7z5WsImNswizO57YCCdKvghz96yDCKAKqmF5Khd5XdLqrwdBN76l0UPhq9vC+LN7yg
	HzazAwzZzwoHq1Xk4kvfut2HroYrjdpZOpZi56hCoBeknh6OuZbIZw8yTUHtGSdXG58i8jYlSNqo9
	G2Lb9CRziMkuDUX9w6KwNkrrb8c1tmsGT6yvdTU2dcfHahxawXb1PdKb8//shS9A0sTZwVrHXeLH9
	lTZasi8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDUsF-0000000FRDq-0rgW;
	Sun, 04 Oct 2026 22:40:03 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDUsD-0000000FRDP-2aHf;
	Sun, 04 Oct 2026 22:40:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A8A6F60200;
	Sun,  4 Oct 2026 22:40:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 235EFC2BCB9;
	Sun,  4 Oct 2026 22:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791153600;
	bh=u1lLC1WSbIv1AIKWpV3FLRj7881n0ba0sc0bTNDIolA=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=ea8WjSwbKtae6TmcoxiznkZwKEZcoR7xm5yfx2rK37Ycln38B9eDIPLSAOP9aTxby
	 SJcV+ppApv7QbmOzi2azBynpR17T5mE6f8h2viokik6I74aD+fTRjHcvUEVBTwqVcV
	 IQcsBbTYPN7EKmNN9srJCkTbNwGbAWzg3EaG0gw7lzUCTQbd97ojT/ssLsNXXZhvy2
	 qYvTKlizqtDekJfNhQlOurDf792KsoV1Q1mGtd3A5FZ7nn3tHm4qiIGj3zWZ0Fb8GS
	 EYcTEX9uNntha3U7VsgJSjmQUkGza3YobBNie8OIWgGfDNn9UTiayCDBoRnByDAMdF
	 dUfC6l1ky+93g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F1BCCA5FCE;
	Sun,  4 Oct 2026 22:40:00 +0000 (UTC)
From: Igor Velkov via B4 Relay <devnull+iav.iav.lv@kernel.org>
Date: Sun, 04 Oct 2026 22:39:58 +0000
Subject: [PATCH] arm64: dts: rockchip: Add the battery charger to Kobol
 Helios64
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261004-helios64-dc-charger-v1-1-0eabf0274d47@iav.lv>
X-B4-Tracking: v=1; b=H4sIAL3VwmoC/x2MQQqAMAwEv1JyNtAWrehXxIO0sQZEJQURpH83C
 HMZmN0XCglTgdG8IHRz4fNQcY2BuC1HJuSkDt764KztcKOdzxJaTBG1kEyClGI7KEO0PejyElr
 5+V+nudYPz9yeUGUAAAA=
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Igor Velkov <iav@iav.lv>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2197; i=iav@iav.lv;
 h=from:subject:message-id;
 bh=DAhlfIUWqvGqD77K4GZRu5rOeDoaIBCJ6zw/SQS3zzI=;
 b=owGbwMvMwCVmNH1q96v4SmbG02pJDFmHru7Lig//2vTZPf/F63ncxZ1qTC/Md11Zp3Lm0+k0w
 w++ArWWHaUsDGJcDLJiiiwTDmncylhy9a+/h/kDmDmsTCBDGLg4BWAiLsoM/7OWJcyrnVq08Nm1
 lR9ZUift6rt/PSTI0cU++PmWY/8r36xiZNjWXfb2yb+pVWrX365/6X253ThbzUxTYn1y6QbRO7c
 fcbACAA==
X-Developer-Key: i=iav@iav.lv; a=openpgp;
 fpr=90C228DA68A4D5FD4F4837E03297958BEA5F7903
X-Endpoint-Received: by B4 Relay for iav@iav.lv/default with auth_id=1060
X-Original-From: Igor Velkov <iav@iav.lv>
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
Reply-To: iav@iav.lv
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Igor Velkov <iav@iav.lv>

Helios64 has a battery backup built around a BQ24133 charger. The
charger works on its own; the SoC only sees two status lines:

- VCC12V_DCIN_GOOD on GPIO0_A2, a divider from the 12 V input, high
  while the mains adapter powers the board;
- CHARGER_STATUS# on GPIO2_D3, the inverted STAT output of the charger,
  high while the battery is charging.

Describe them as a gpio-charger. Both lines have external resistors, so
the pins get no pull.

Assisted-by: LLM
Signed-off-by: Igor Velkov <iav@iav.lv>
---
Tested on 7.3-rc5: online follows the mains adapter, status reads
Charging while the battery recharges and Not charging once it is full.

Schematic, sheets 9, 15 and 29:
https://wiki.kobol.io/helios64/files/schematics/Helios64_Schematics_Rev1.2.pdf
---
 .../arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts b/arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts
index d146e5075b4f..813a39964357 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts
@@ -62,6 +62,15 @@ chosen {
 		stdout-path = "serial2:1500000n8";
 	};
 
+	dc-charger {
+		compatible = "gpio-charger";
+		charger-type = "mains";
+		gpios = <&gpio0 RK_PA2 GPIO_ACTIVE_HIGH>;
+		charge-status-gpios = <&gpio2 RK_PD3 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&dcin_good>, <&charger_status>;
+	};
+
 	clkin_gmac: external-gmac-clock {
 		compatible = "fixed-clock";
 		clock-frequency = <125000000>;
@@ -493,6 +502,16 @@ user1_btn: user1-btn {
 		};
 	};
 
+	charger {
+		charger_status: charger-status {
+			rockchip,pins = <2 RK_PD3 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		dcin_good: dcin-good {
+			rockchip,pins = <0 RK_PA2 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
 	gmac {
 		gphy_reset: gphy-reset {
 			rockchip,pins = <3 RK_PB7 RK_FUNC_GPIO &pcfg_output_low>;

---
base-commit: 36bd12104f6e9462f6e97989fd8ef9eb1609623f
change-id: 20261005-helios64-dc-charger-edc49c499c07

Best regards,
-- 
Igor Velkov <iav@iav.lv>




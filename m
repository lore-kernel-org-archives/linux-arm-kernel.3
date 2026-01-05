Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55026C79FBC
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 19:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yvVPbxb+Jf0fLe9ecX0ZIOIZVlGQSF1bFG8YI0gWLvM=; b=4vPc+DtGMMrEV8qjj1M8Q7VOO+
	DuSVvSGugiaqGHBxAM6lVX/AS10hMr31NuxI3CcyRT0skjPG4sA0kQqdRxYCQ7YoBvMIYxZ1hv51c
	iCM/3z68RInfuoJuAEM2vBOQ/T+4F9+8jfX0GiyagRLsJXhPbIBJbRnNdkwTX3WIl+bk0M8r0eb77
	kj8jB3PVztMbyR6c+pcNluliJUeNWLdWqmSTA/OKHKxqkQWlNV6dhp6ngfuxoeZa9WK39Ym4bWRnn
	h7GxUGdVattKMGe+MHDwMpCApLmAL+VvMXKjjLLMbODMaQiRMsuqpDuN7Gqa7i1A9ghBwziL9b/YF
	ifHABv9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcqK3-0000000Byzg-3l4F;
	Mon, 05 Jan 2026 19:32:59 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcqK1-0000000ByzB-2X8w;
	Mon, 05 Jan 2026 19:32:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B91D0429F0;
	Mon,  5 Jan 2026 19:32:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F2D5C116D0;
	Mon,  5 Jan 2026 19:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767641576;
	bh=PR0XZGtoFMCwR/4sKrH7vwiahr0M5+UDd/92nG3vRBw=;
	h=From:To:Cc:Subject:Date:From;
	b=tOTeemel9LzhhV2R0rp4vgWHp2RszJDuT6i+62e73KKXmsRJBXZHpyCV2bM1SEUdg
	 NE22EJugKYqQqNYFRBcYSXOQZBMI55Z1V93vriFPFUP7+7b45PmPjG6yJUguyLJZJe
	 ExYY5K56RryzSXW0OqgSiOBRkPg0WLmzPKTcLBvMKABr0wyjAnZU2XRyBQsrVEj23a
	 ODcmLv5psMxHSZ4k10qHiApN4EBUU5oCyyERB1FBW6zTDNZzrW8IVQgU2xQ6ovi20H
	 zuLzwZ6ewSBrFl9fH9lzEDtgiF64nUoxtGKRin6KESo2GJ5bqHbs2ZgYxQKr5/Uohh
	 4FXgaMEFAw/1g==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: rockchip: rk3399-roc-pc-plus: Add missing everest,es8388 supplies
Date: Mon,  5 Jan 2026 13:32:44 -0600
Message-ID: <20260105193245.3167500-1-robh@kernel.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_113257_660903_01D24F99 
X-CRM114-Status: GOOD (  11.15  )
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

The regulator supplies for everest,es8388 audio codec are missing and
are required. Add them based on the schematics found here:

https://personalbsd.org/download/Documents/SCH/ROC-RK3399-PC-PLUS-V20-20210809.pdf

With this, "regulator-always-on" should no longer be necessary for LDO5.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
I don't have this h/w, so completely untested.
---
 arch/arm64/boot/dts/rockchip/rk3399-roc-pc-plus.dts | 4 ++++
 arch/arm64/boot/dts/rockchip/rk3399-roc-pc.dtsi     | 1 -
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-roc-pc-plus.dts b/arch/arm64/boot/dts/rockchip/rk3399-roc-pc-plus.dts
index 8e3858cf988c..4f2831097624 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-roc-pc-plus.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-roc-pc-plus.dts
@@ -116,6 +116,10 @@ es8388: es8388@11 {
 		reg = <0x11>;
 		clocks = <&cru SCLK_I2S_8CH_OUT>;
 		#sound-dai-cells = <0>;
+		AVDD-supply = <&vcca3v0_codec>;
+		DVDD-supply = <&vcca1v8_codec>;
+		HPVDD-supply = <&vcca3v0_codec>;
+		PVDD-supply = <&vcca1v8_codec>;
 	};
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3399-roc-pc.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-roc-pc.dtsi
index fc9279627ef6..ac62e8f5d9f5 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-roc-pc.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399-roc-pc.dtsi
@@ -408,7 +408,6 @@ regulator-state-mem {
 
 			vcca3v0_codec: LDO_REG5 {
 				regulator-name = "vcca3v0_codec";
-				regulator-always-on;
 				regulator-boot-on;
 				regulator-min-microvolt = <3000000>;
 				regulator-max-microvolt = <3000000>;
-- 
2.51.0



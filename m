Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1455CCCA470
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Oct 2025 08:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=H8SPZkt6+sp/5jeMGqBWc/VCT7Uionl7zaKARBI8kLs=; b=jmRJ/eedHXRt3Qe9iBFLK8oLsT
	hskSCbz85kbhgrkfd4cEbiDpfzgPrFyITXQ9PbbhWsmPrPa/u7SjjGuTcBz0cNnZpMmCroX+2PFMM
	LBTEyGZZCFF7wpgqIfZo/r/eOJbi8w2JJr++cAwfcbbYSB7jRV8Phdvzx+S6oHTS/GOTTT6ZWaDo+
	dAZwjJb10aAZRgB2j1AXnRjf64/AQFoHbyvxnH3gl7MAXbL9FpXOAKUniNfkSjdYO92rPijd0f7ax
	E7nC3QgJba8n1voWXgS5aQ64YYGumhM5vBm3Pi2LYze/6VfnUznHq+cOrY22bJt1iGghiAxJ0aVVR
	gUHbJoIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6PR0-00000003SOG-3Eft;
	Wed, 08 Oct 2025 08:22:06 +0000
Received: from out-179.mta1.migadu.com ([95.215.58.179])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6PQx-00000003SNw-2Qwr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Oct 2025 08:22:05 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1759911719;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=H8SPZkt6+sp/5jeMGqBWc/VCT7Uionl7zaKARBI8kLs=;
	b=mQCC8b7qJVTJ2Gh3LAMFqp3KGOlG7jriSk0cpd84DiSOlgRAkKL+A3k30friRJSM/2L7JZ
	5YKRrU4J1Q/GLnkw4b88ld7CyL2IVWbJjKuaeBpaO5UX8+c2DNJ7zB/Dl+TgzKLO0I6gXi
	YNsJggxr4usXcSfziAd+Cxy3GrEGN/a9uj3Un0hCYseiQkoAVkJmTf+bo61XsHXZfiVrjm
	mDjkeZFbKRIJlNkvmlFrct/H/CtWHml4fRGuXKM24/7WjMid3iXSPP5wLtaEuDz81Wr0NW
	FIcFAi35WN4gZ4et/POS89hqSWQuydEmZJRQS0auvEq7p3GMy9zcCxhEwhRMow==
From: Diederik de Haas <didi.debian@cknow.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Johan Jonker <jbx6244@gmail.com>,
	Alex Bee <knaerzche@gmail.com>,
	Diederik de Haas <didi.debian@cknow.org>
Subject: [PATCH] arm64: dts: rockchip: Drop 'rockchip,grf' prop from tsadc on rk3328
Date: Wed,  8 Oct 2025 10:21:22 +0200
Message-ID: <20251008082143.242270-1-didi.debian@cknow.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_012204_281703_0C3610D6 
X-CRM114-Status: UNSURE (   9.08  )
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

The 'rockchip,grf' property for tsadc in rk3328 wasn't actually used in
the driver and is no longer allowed in the DT since commit
e881662aa06a ("dt-bindings: thermal: rockchip: Tighten grf requirements")

So remove that property which fixes the following DT validation issue

  tsadc@ff250000 (rockchip,rk3328-tsadc): rockchip,grf: False schema does not allow [[58]]

Signed-off-by: Diederik de Haas <didi.debian@cknow.org>
---
 arch/arm64/boot/dts/rockchip/rk3328.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3328.dtsi b/arch/arm64/boot/dts/rockchip/rk3328.dtsi
index 283d9cbc4368..03b7c4313750 100644
--- a/arch/arm64/boot/dts/rockchip/rk3328.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3328.dtsi
@@ -598,7 +598,6 @@ tsadc: tsadc@ff250000 {
 		pinctrl-2 = <&otp_pin>;
 		resets = <&cru SRST_TSADC>;
 		reset-names = "tsadc-apb";
-		rockchip,grf = <&grf>;
 		rockchip,hw-tshut-temp = <100000>;
 		#thermal-sensor-cells = <1>;
 		status = "disabled";
-- 
2.51.0



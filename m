Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A57CAC43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 12:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rTQPPhDVeTbGbJ1qfR9lTcAhGLsRnezT+O5gDJeLhT4=; b=4rVMKHBtYHlwcWg3HDNa/9WGWh
	qPEDgyWbD2I87UG66VRGN2nDm5bqiQor1cT1g2cT6UHEfMOBkiesayw8DrMLR98qwEqyphJu/n6wB
	r8eVWCF3iGx7x4JTx2cgALfZh2bEssT1cFfuQ9UH/v1ColoNyKJWlUktXq6NwPSLa/ddznSnXSI4V
	x9DowU9waHfxWXYpuQNrEZbrf/DzcoQ63WFE+tGl1ToekgKeDsjn77cSEftoYJFEk2kqAAnnJLGbc
	jdFFydzsWaYgYRRRA2X+Ny7TBaXvnSL4ZA3hgOeY7fk6p+LXmTaB6pSBgAuBJe3qlC4dMugBbXDfb
	4URpOVPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfdG2-00000006zq3-3snj;
	Fri, 03 Jul 2026 12:44:38 +0000
Received: from chaosmail.tech ([77.81.229.115])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfdFz-00000006zo8-039W
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 12:44:36 +0000
Received: by chaosmail.tech (Postfix) id 7C8601CC222;
	Fri, 03 Jul 2026 12:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1783082671;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rTQPPhDVeTbGbJ1qfR9lTcAhGLsRnezT+O5gDJeLhT4=;
	b=nna0ZAbgfE+raie1SEfLKDyU1rZAk2SWuar1szhT9MXZtCV/rnnR774F91hbKNJDVaqP9u
	Xcx1m6W+YkXgIA/TtSneOwkxrrXyS290mOz50iyJhg4/4uUbyrJ5uDpTWxlsP9n1uaABKw
	BPSg+7hHoGQFwTYOK8vcleF9QappsC8=
From: Sasha Finkelstein <k@chaosmail.tech>
Date: Fri, 03 Jul 2026 14:44:13 +0200
Subject: [PATCH v2 3/3] arm64: dts: apple: Add pmgr-misc nodes to t60xx
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-pmgr-misc-v2-3-4b26ba10c5a4@chaosmail.tech>
References: <20260703-pmgr-misc-v2-0-4b26ba10c5a4@chaosmail.tech>
In-Reply-To: <20260703-pmgr-misc-v2-0-4b26ba10c5a4@chaosmail.tech>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Sasha Finkelstein <k@chaosmail.tech>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783082668; l=1610;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=y/nTCCubfQIHxjED5Vxzczov4TsOcbe98Fn/E9FqjtI=;
 b=NcUH7DaXmKG24ycJYKmxrayyvP32EBz/OBB2MJk3hgPnmt3IsTokCyRAZE7Z/CntY3mXDpMja
 /5TS8hw6kTbDSVyfkdXRuxU2iIPTl64WgrUNAh4B3+Mis3J0cDAIKd8
X-Developer-Key: i=k@chaosmail.tech; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_054435_513011_46434AFD 
X-CRM114-Status: UNSURE (   8.18  )
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

Adds the PMGR misc control nodes for M1/2 Pro/Max/Ultra series devices.

Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
---
 arch/arm64/boot/dts/apple/t600x-die0.dtsi | 7 +++++++
 arch/arm64/boot/dts/apple/t602x-die0.dtsi | 7 +++++++
 2 files changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t600x-die0.dtsi b/arch/arm64/boot/dts/apple/t600x-die0.dtsi
index f715b19efd16..3271d234b483 100644
--- a/arch/arm64/boot/dts/apple/t600x-die0.dtsi
+++ b/arch/arm64/boot/dts/apple/t600x-die0.dtsi
@@ -24,6 +24,13 @@ aic: interrupt-controller@28e100000 {
 		power-domains = <&ps_aic>;
 	};
 
+	pmgr_misc: power-management@28e20c000 {
+		compatible = "apple,t6000-pmgr-misc";
+		reg = <0x2 0x8e20c000 0 0x400>,
+			<0x2 0x8e20c800 0 0x400>;
+		reg-names = "fabric-ps", "dcs-ps";
+	};
+
 	smc: smc@290400000 {
 		compatible = "apple,t6000-smc", "apple,smc";
 		reg = <0x2 0x90400000 0x0 0x4000>,
diff --git a/arch/arm64/boot/dts/apple/t602x-die0.dtsi b/arch/arm64/boot/dts/apple/t602x-die0.dtsi
index 8622ddea7b44..121f2cf75915 100644
--- a/arch/arm64/boot/dts/apple/t602x-die0.dtsi
+++ b/arch/arm64/boot/dts/apple/t602x-die0.dtsi
@@ -23,6 +23,13 @@ aic: interrupt-controller@28e100000 {
 		power-domains = <&ps_aic>;
 	};
 
+	pmgr_misc: power-management@28e20c000 {
+		compatible = "apple,t6020-pmgr-misc";
+		reg = <0x2 0x8e20c000 0 0x400>,
+			<0x2 0x8e20c400 0 0x400>;
+		reg-names = "fabric-ps", "dcs-ps";
+	};
+
 	nub_spmi0: spmi@29e114000 {
 		compatible = "apple,t6020-spmi", "apple,t8103-spmi";
 		reg = <0x2 0x9e114000 0x0 0x100>;

-- 
2.55.0



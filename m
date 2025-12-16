Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83EC4D5E130
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 11:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5j9l0lLB+dk89q67g1lccxwm1ZlWz1b1cNTFiRu4h/M=; b=tczto9HTjUP6D42oJHAPBNUUV6
	udq7BLniBvmIUGWUuz0m2al9dcXLsHESwX1fGt5ivVR0VPZtRnDKl5QleYN+k31cRPvpaFbwodU7A
	2NogAmU+3HGC6YMFPEdo3vdiuhooDFHxPg1rrCyFc6m6PAb1XRSn27LiS/J7Cbzv6/FuwFn4Sdk0s
	eZzzKBBTIGws/+YMJSXfPWsMn2s+NVzwa4eyuJYFBKGw+KpPaCAyCNmci9TwFIE6TBJqunUK1bFA/
	qHR9elPqkdCoWdItO7xpdwMY6pX+WM/MFQPj3wcb7Z3OY5KCJFrD434W9xLG5dIBSvM0qiLMDFWJA
	+9upDdbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVSoC-0000000558Z-05ll;
	Tue, 16 Dec 2025 11:01:36 +0000
Received: from mx.socionext.com ([202.248.49.38])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVSo7-0000000555G-2Fw3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 11:01:32 +0000
Received: from unknown (HELO kinkan3-ex.css.socionext.com) ([172.31.9.52])
  by mx.socionext.com with ESMTP; 16 Dec 2025 20:01:30 +0900
Received: from mail.mfilter.local (mail-arc01.css.socionext.com [10.213.46.36])
	by kinkan3-ex.css.socionext.com (Postfix) with ESMTP id A92D12069FC4;
	Tue, 16 Dec 2025 20:01:30 +0900 (JST)
Received: from kinkan3.css.socionext.com ([172.31.9.51]) by m-FILTER with ESMTP; Tue, 16 Dec 2025 20:01:30 +0900
Received: from plum.e01.socionext.com (unknown [10.212.245.39])
	by kinkan3.css.socionext.com (Postfix) with ESMTP id 2C3871C52;
	Tue, 16 Dec 2025 20:01:30 +0900 (JST)
From: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Masami Hiramatsu <mhiramat@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Subject: [PATCH 5/5] arm64: dts: uniphier: Remove smpctrl nodes
Date: Tue, 16 Dec 2025 20:01:13 +0900
Message-Id: <20251216110113.1801245-6-hayashi.kunihiko@socionext.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251216110113.1801245-1-hayashi.kunihiko@socionext.com>
References: <20251216110113.1801245-1-hayashi.kunihiko@socionext.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_030131_696205_876CC0D6 
X-CRM114-Status: GOOD (  11.63  )
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

This node has no bindings definition and does not affect various
functions, so remove the nodes from .dtsi files to avoid warnings.

  arch/arm64/boot/dts/socionext/uniphier-ld20-ref.dtb: /soc@0/smpctrl@59801000:
  failed to match any schema with compatible: ['socionext,uniphier-smpctrl']

Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
---
 arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi | 5 -----
 arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi | 5 -----
 arch/arm64/boot/dts/socionext/uniphier-pxs3.dtsi | 5 -----
 3 files changed, 15 deletions(-)

diff --git a/arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi b/arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi
index 4680571c264d..62c7980e86ce 100644
--- a/arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi
+++ b/arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi
@@ -414,11 +414,6 @@ system_bus: system-bus@58c00000 {
 			pinctrl-0 = <&pinctrl_system_bus>;
 		};
 
-		smpctrl@59801000 {
-			compatible = "socionext,uniphier-smpctrl";
-			reg = <0x59801000 0x400>;
-		};
-
 		syscon@59810000 {
 			compatible = "socionext,uniphier-ld11-sdctrl",
 				     "simple-mfd", "syscon";
diff --git a/arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi b/arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi
index c3858666550c..5afe04325657 100644
--- a/arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi
+++ b/arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi
@@ -547,11 +547,6 @@ system_bus: system-bus@58c00000 {
 			pinctrl-0 = <&pinctrl_system_bus>;
 		};
 
-		smpctrl@59801000 {
-			compatible = "socionext,uniphier-smpctrl";
-			reg = <0x59801000 0x400>;
-		};
-
 		sdctrl: syscon@59810000 {
 			compatible = "socionext,uniphier-ld20-sdctrl",
 				     "simple-mfd", "syscon";
diff --git a/arch/arm64/boot/dts/socionext/uniphier-pxs3.dtsi b/arch/arm64/boot/dts/socionext/uniphier-pxs3.dtsi
index e00a5caed822..eba9927f439e 100644
--- a/arch/arm64/boot/dts/socionext/uniphier-pxs3.dtsi
+++ b/arch/arm64/boot/dts/socionext/uniphier-pxs3.dtsi
@@ -367,11 +367,6 @@ system_bus: system-bus@58c00000 {
 			pinctrl-0 = <&pinctrl_system_bus>;
 		};
 
-		smpctrl@59801000 {
-			compatible = "socionext,uniphier-smpctrl";
-			reg = <0x59801000 0x400>;
-		};
-
 		sdctrl: syscon@59810000 {
 			compatible = "socionext,uniphier-pxs3-sdctrl",
 				     "simple-mfd", "syscon";
-- 
2.34.1



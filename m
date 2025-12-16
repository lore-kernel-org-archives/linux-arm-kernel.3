Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28057D5E125
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 11:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o5NCMjdPGTpLuM+M5zrdQpON/0WHeqrq8L/VrDSW83k=; b=MwBkHlzbdfqn+72T6vznao2a4Z
	xBqwl4iJuJkTf1Ll0O5yzl530Z1CeTRpvkup3XZtNN9POOD5LtAS49JpDJyzZTBeIXg9RMYiQq03T
	R2wiqTwMOM5VAJum5p2+qjHWSnlOV5ixPJvkSCEkKL18gzoyja7eJeox8OoHa0qc7DLEfNQtRrGcm
	VbZDSclVmuxZdDUo/TCUZQtRBmWO3+ljhFMWOECgZkJ4UrbIThvyTiGbIMF//vDn8UO7qG/pv4Tgi
	oHaYAiA3KbXAktyXYJLOcVa6z8n93Oz9E+JVyFaPN89/3Fgca9RKNmWtgAwXEjm/BHia365Vatkvm
	iPnIKLqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVSoB-0000000557W-1Ujz;
	Tue, 16 Dec 2025 11:01:35 +0000
Received: from mx.socionext.com ([202.248.49.38])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVSo6-0000000552Y-0We2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 11:01:31 +0000
Received: from unknown (HELO iyokan3-ex.css.socionext.com) ([172.31.9.54])
  by mx.socionext.com with ESMTP; 16 Dec 2025 20:01:29 +0900
Received: from mail.mfilter.local (mail-arc02.css.socionext.com [10.213.46.40])
	by iyokan3-ex.css.socionext.com (Postfix) with ESMTP id C7EE02091499;
	Tue, 16 Dec 2025 20:01:29 +0900 (JST)
Received: from kinkan3.css.socionext.com ([172.31.9.51]) by m-FILTER with ESMTP; Tue, 16 Dec 2025 20:01:29 +0900
Received: from plum.e01.socionext.com (unknown [10.212.245.39])
	by kinkan3.css.socionext.com (Postfix) with ESMTP id 5EE1E1C55;
	Tue, 16 Dec 2025 20:01:29 +0900 (JST)
From: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Masami Hiramatsu <mhiramat@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Subject: [PATCH 4/5] ARM: dts: uniphier: Remove "smpctrl" nodes
Date: Tue, 16 Dec 2025 20:01:12 +0900
Message-Id: <20251216110113.1801245-5-hayashi.kunihiko@socionext.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251216110113.1801245-1-hayashi.kunihiko@socionext.com>
References: <20251216110113.1801245-1-hayashi.kunihiko@socionext.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_030130_566831_DCDD82B7 
X-CRM114-Status: GOOD (  11.16  )
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

This node has no binding definition and does not affect various
functions, so remove the nodes from .dtsi files to avoid warnings.

  arch/arm/boot/dts/socionext/uniphier-pxs2-gentil.dtb: /soc/smpctrl@59801000:
  failed to match any schema with compatible: ['socionext,uniphier-smpctrl']

Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
---
 arch/arm/boot/dts/socionext/uniphier-ld4.dtsi  | 5 -----
 arch/arm/boot/dts/socionext/uniphier-pro4.dtsi | 5 -----
 arch/arm/boot/dts/socionext/uniphier-pro5.dtsi | 5 -----
 arch/arm/boot/dts/socionext/uniphier-pxs2.dtsi | 5 -----
 arch/arm/boot/dts/socionext/uniphier-sld8.dtsi | 5 -----
 5 files changed, 25 deletions(-)

diff --git a/arch/arm/boot/dts/socionext/uniphier-ld4.dtsi b/arch/arm/boot/dts/socionext/uniphier-ld4.dtsi
index df2de7a40211..0cb5cb6fa19e 100644
--- a/arch/arm/boot/dts/socionext/uniphier-ld4.dtsi
+++ b/arch/arm/boot/dts/socionext/uniphier-ld4.dtsi
@@ -202,11 +202,6 @@ system_bus: system-bus@58c00000 {
 			pinctrl-0 = <&pinctrl_system_bus>;
 		};
 
-		smpctrl@59801000 {
-			compatible = "socionext,uniphier-smpctrl";
-			reg = <0x59801000 0x400>;
-		};
-
 		syscon@59810000 {
 			compatible = "socionext,uniphier-ld4-mioctrl",
 				     "simple-mfd", "syscon";
diff --git a/arch/arm/boot/dts/socionext/uniphier-pro4.dtsi b/arch/arm/boot/dts/socionext/uniphier-pro4.dtsi
index 041add88347b..4dffa06474a1 100644
--- a/arch/arm/boot/dts/socionext/uniphier-pro4.dtsi
+++ b/arch/arm/boot/dts/socionext/uniphier-pro4.dtsi
@@ -236,11 +236,6 @@ system_bus: system-bus@58c00000 {
 			pinctrl-0 = <&pinctrl_system_bus>;
 		};
 
-		smpctrl@59801000 {
-			compatible = "socionext,uniphier-smpctrl";
-			reg = <0x59801000 0x400>;
-		};
-
 		mioctrl: syscon@59810000 {
 			compatible = "socionext,uniphier-pro4-mioctrl",
 				     "simple-mfd", "syscon";
diff --git a/arch/arm/boot/dts/socionext/uniphier-pro5.dtsi b/arch/arm/boot/dts/socionext/uniphier-pro5.dtsi
index be9a2c40bd7c..cc61a4b5c1de 100644
--- a/arch/arm/boot/dts/socionext/uniphier-pro5.dtsi
+++ b/arch/arm/boot/dts/socionext/uniphier-pro5.dtsi
@@ -336,11 +336,6 @@ system_bus: system-bus@58c00000 {
 			pinctrl-0 = <&pinctrl_system_bus>;
 		};
 
-		smpctrl@59801000 {
-			compatible = "socionext,uniphier-smpctrl";
-			reg = <0x59801000 0x400>;
-		};
-
 		sdctrl: syscon@59810000 {
 			compatible = "socionext,uniphier-pro5-sdctrl",
 				     "simple-mfd", "syscon";
diff --git a/arch/arm/boot/dts/socionext/uniphier-pxs2.dtsi b/arch/arm/boot/dts/socionext/uniphier-pxs2.dtsi
index ef94fa0517a6..15927956b4f8 100644
--- a/arch/arm/boot/dts/socionext/uniphier-pxs2.dtsi
+++ b/arch/arm/boot/dts/socionext/uniphier-pxs2.dtsi
@@ -417,11 +417,6 @@ system_bus: system-bus@58c00000 {
 			pinctrl-0 = <&pinctrl_system_bus>;
 		};
 
-		smpctrl@59801000 {
-			compatible = "socionext,uniphier-smpctrl";
-			reg = <0x59801000 0x400>;
-		};
-
 		sdctrl: syscon@59810000 {
 			compatible = "socionext,uniphier-pxs2-sdctrl",
 				     "simple-mfd", "syscon";
diff --git a/arch/arm/boot/dts/socionext/uniphier-sld8.dtsi b/arch/arm/boot/dts/socionext/uniphier-sld8.dtsi
index 0b840a8415dd..fe0a7ff8a7c5 100644
--- a/arch/arm/boot/dts/socionext/uniphier-sld8.dtsi
+++ b/arch/arm/boot/dts/socionext/uniphier-sld8.dtsi
@@ -206,11 +206,6 @@ system_bus: system-bus@58c00000 {
 			pinctrl-0 = <&pinctrl_system_bus>;
 		};
 
-		smpctrl@59801000 {
-			compatible = "socionext,uniphier-smpctrl";
-			reg = <0x59801000 0x400>;
-		};
-
 		mioctrl: syscon@59810000 {
 			compatible = "socionext,uniphier-sld8-mioctrl",
 				     "simple-mfd", "syscon";
-- 
2.34.1



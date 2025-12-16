Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79CB7D5E12A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 11:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A1QzZaVmrTzA6tPEKlBYwGzDFSKSNgULE1tC6K7xBBI=; b=REq+PZtQLR0bzFcLUGpdqYje2G
	+WHX5UBCshauuKTabCQTgZp9H64cvKfAZG6UoL7w7UkUyqjtkMn6AwpMQlIf9mzbzXdNrMcg++L44
	Sgr9/1NTwBnlWZDE+jX+XgG6/wrqTMGKkPmRFp6GPbOdX2/ctfUPMsDnmlqzWyJPo/yY8nKk9CIU+
	7sRXzk2/dmTmhbKFQ4ZJauFW3VL49eHJ7vYkSP7x1J3ZToG0JeoPvsNGMj0XbDotnyM6YVi0F+1o7
	LYxjrqxvOy04FpbcPrEfXitwPRwvmEOiLnNTiCuVfOvB87koOOqwcKnu6jugy1RhX+YBhYtjDCRIE
	GmqOI/EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVSo7-0000000555q-3De2;
	Tue, 16 Dec 2025 11:01:31 +0000
Received: from mx.socionext.com ([202.248.49.38])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVSo2-0000000552Y-1yZw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 11:01:28 +0000
Received: from unknown (HELO iyokan3-ex.css.socionext.com) ([172.31.9.54])
  by mx.socionext.com with ESMTP; 16 Dec 2025 20:01:26 +0900
Received: from mail.mfilter.local (mail-arc01.css.socionext.com [10.213.46.36])
	by iyokan3-ex.css.socionext.com (Postfix) with ESMTP id 2638E2091499;
	Tue, 16 Dec 2025 20:01:26 +0900 (JST)
Received: from kinkan3.css.socionext.com ([172.31.9.51]) by m-FILTER with ESMTP; Tue, 16 Dec 2025 20:01:26 +0900
Received: from plum.e01.socionext.com (unknown [10.212.245.39])
	by kinkan3.css.socionext.com (Postfix) with ESMTP id 7C7941C52;
	Tue, 16 Dec 2025 20:01:25 +0900 (JST)
From: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Masami Hiramatsu <mhiramat@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Subject: [PATCH 1/5] ARM: dts: uniphier: Add missing watchdog nodes
Date: Tue, 16 Dec 2025 20:01:09 +0900
Message-Id: <20251216110113.1801245-2-hayashi.kunihiko@socionext.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251216110113.1801245-1-hayashi.kunihiko@socionext.com>
References: <20251216110113.1801245-1-hayashi.kunihiko@socionext.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_030126_617142_241E961A 
X-CRM114-Status: GOOD (  11.21  )
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

Some UniPhier armv7 SoCs also have watchdog functions and are available.

Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
---
 arch/arm/boot/dts/socionext/uniphier-pro4.dtsi | 4 ++++
 arch/arm/boot/dts/socionext/uniphier-pro5.dtsi | 4 ++++
 arch/arm/boot/dts/socionext/uniphier-pxs2.dtsi | 4 ++++
 arch/arm/boot/dts/socionext/uniphier-sld8.dtsi | 4 ++++
 4 files changed, 16 insertions(+)

diff --git a/arch/arm/boot/dts/socionext/uniphier-pro4.dtsi b/arch/arm/boot/dts/socionext/uniphier-pro4.dtsi
index ba55af30e904..041add88347b 100644
--- a/arch/arm/boot/dts/socionext/uniphier-pro4.dtsi
+++ b/arch/arm/boot/dts/socionext/uniphier-pro4.dtsi
@@ -496,6 +496,10 @@ sys_rst: reset-controller {
 				compatible = "socionext,uniphier-pro4-reset";
 				#reset-cells = <1>;
 			};
+
+			watchdog {
+				compatible = "socionext,uniphier-wdt";
+			};
 		};
 
 		eth: ethernet@65000000 {
diff --git a/arch/arm/boot/dts/socionext/uniphier-pro5.dtsi b/arch/arm/boot/dts/socionext/uniphier-pro5.dtsi
index 2d8591cdddb8..3d21fb822219 100644
--- a/arch/arm/boot/dts/socionext/uniphier-pro5.dtsi
+++ b/arch/arm/boot/dts/socionext/uniphier-pro5.dtsi
@@ -470,6 +470,10 @@ sys_rst: reset-controller {
 				compatible = "socionext,uniphier-pro5-reset";
 				#reset-cells = <1>;
 			};
+
+			watchdog {
+				compatible = "socionext,uniphier-wdt";
+			};
 		};
 
 		usb0: usb@65a00000 {
diff --git a/arch/arm/boot/dts/socionext/uniphier-pxs2.dtsi b/arch/arm/boot/dts/socionext/uniphier-pxs2.dtsi
index f97a57222101..ef94fa0517a6 100644
--- a/arch/arm/boot/dts/socionext/uniphier-pxs2.dtsi
+++ b/arch/arm/boot/dts/socionext/uniphier-pxs2.dtsi
@@ -572,6 +572,10 @@ sys_rst: reset-controller {
 				#reset-cells = <1>;
 			};
 
+			watchdog {
+				compatible = "socionext,uniphier-wdt";
+			};
+
 			pvtctl: thermal-sensor {
 				compatible = "socionext,uniphier-pxs2-thermal";
 				interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
diff --git a/arch/arm/boot/dts/socionext/uniphier-sld8.dtsi b/arch/arm/boot/dts/socionext/uniphier-sld8.dtsi
index f876282760e9..0b840a8415dd 100644
--- a/arch/arm/boot/dts/socionext/uniphier-sld8.dtsi
+++ b/arch/arm/boot/dts/socionext/uniphier-sld8.dtsi
@@ -413,6 +413,10 @@ sys_rst: reset-controller {
 				compatible = "socionext,uniphier-sld8-reset";
 				#reset-cells = <1>;
 			};
+
+			watchdog {
+				compatible = "socionext,uniphier-wdt";
+			};
 		};
 
 		nand: nand-controller@68000000 {
-- 
2.34.1



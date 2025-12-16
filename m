Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D2A6D5E130
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 11:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0lpqVVYjdoKjXXJjthkFHboWKiWq965wuOMw1kdNtW4=; b=i+xE12xszpeGvnEtwLaRgTijha
	60G5SVqvwTOoDtSRfqjZtB+hJB6YbKT9aP7LEKWL2Mc2XumF3IG6zNz753xmupQnrwItAH+v93ySg
	QEsUxunGE1msjpGkHdUo/YmTfO1i7LbI9mhSmif7iR8GJayrx41zZA/xhkPAtJS37xPz0yZKWU9fD
	6/HqrzIp6e6epDEI1BiZ7SwEdMozprCJVzyjSaezLOfKL1fGeOv44K+MhASzfvTEIEHzdXvAeFOj+
	rskBVooz3f9Gr5Xhv3wWD8cXOVL+OIbAXSdhp2F5eFTv6fbg8FM99vEd1UL913qEd675e9++Np5z6
	UnLvpAgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVSoB-00000005574-0FZz;
	Tue, 16 Dec 2025 11:01:35 +0000
Received: from mx.socionext.com ([202.248.49.38])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVSo4-0000000553Z-1P5D
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 11:01:31 +0000
Received: from unknown (HELO kinkan3-ex.css.socionext.com) ([172.31.9.52])
  by mx.socionext.com with ESMTP; 16 Dec 2025 20:01:27 +0900
Received: from mail.mfilter.local (mail-arc01.css.socionext.com [10.213.46.36])
	by kinkan3-ex.css.socionext.com (Postfix) with ESMTP id A2FF92069FC4;
	Tue, 16 Dec 2025 20:01:27 +0900 (JST)
Received: from kinkan3.css.socionext.com ([172.31.9.51]) by m-FILTER with ESMTP; Tue, 16 Dec 2025 20:01:27 +0900
Received: from plum.e01.socionext.com (unknown [10.212.245.39])
	by kinkan3.css.socionext.com (Postfix) with ESMTP id 4F9661C52;
	Tue, 16 Dec 2025 20:01:27 +0900 (JST)
From: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Masami Hiramatsu <mhiramat@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Subject: [PATCH 2/5] ARM: dts: uniphier: Add missing thermal-sensor node for Pro5
Date: Tue, 16 Dec 2025 20:01:10 +0900
Message-Id: <20251216110113.1801245-3-hayashi.kunihiko@socionext.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251216110113.1801245-1-hayashi.kunihiko@socionext.com>
References: <20251216110113.1801245-1-hayashi.kunihiko@socionext.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_030128_793683_05D92177 
X-CRM114-Status: GOOD (  11.43  )
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

UniPhier Pro5 SoC also has a thermal sensor and is available.

Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
---
 arch/arm/boot/dts/socionext/uniphier-pro5.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/socionext/uniphier-pro5.dtsi b/arch/arm/boot/dts/socionext/uniphier-pro5.dtsi
index 3d21fb822219..be9a2c40bd7c 100644
--- a/arch/arm/boot/dts/socionext/uniphier-pro5.dtsi
+++ b/arch/arm/boot/dts/socionext/uniphier-pro5.dtsi
@@ -474,6 +474,13 @@ sys_rst: reset-controller {
 			watchdog {
 				compatible = "socionext,uniphier-wdt";
 			};
+
+			pvtctl: thermal-sensor {
+				compatible = "socionext,uniphier-pxs2-thermal";
+				interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
+				#thermal-sensor-cells = <0>;
+				socionext,tmod-calibration = <0x0f86 0x6844>;
+			};
 		};
 
 		usb0: usb@65a00000 {
-- 
2.34.1



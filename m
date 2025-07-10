Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4B77C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 19:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WeyWvK56Gz4dHDkKikTZ+ehni9evsCvlBef063tqcas=; b=F3B1UFMvgrKrzePGw87SOM3Srz
	W73Y6w2DjAGqsYHNiVX4pfkrGgsCF0vDd3DpKdLbnnf94655pxWdYDm7TXEcmokZuWX5BQYyq3lS0
	+m0lTyyvfpE7UR4M4VTh+2enoId5BKGb3MuikMVx1RXqSkYtj/ywSRwzE5E2HKlEVUxB7U3t6VJ3s
	prgJ0oQGE5QMa1CvYK4ZivLk9A7IYXk6Nw4QwSOo3w1XB51W3eHnYKTLW/ZyIEAPL/NnHds+Srb10
	ERGSyWZQGjB1sSDHO4ayFvl5LiGNMjo6MiK2/cT52kXvHqu6xIHArYNMA0pNsIbqN141t4rfa3BFD
	uufZ7ucw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZwvw-0000000Codq-2ul5;
	Thu, 10 Jul 2025 19:27:52 +0000
Received: from sendmail.purelymail.com ([34.202.193.197])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZuUQ-0000000CVQp-27ku
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 16:51:19 +0000
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256; b=FGAvR0Vnmqx0SatLPRyP1DkZi8vetTQl0iHi7cvaP3dqxKoqaODOxKGZ3TXJCr0FqFQ3kSLJEE1ZR+4qTdzKyBPyBfx7FdnuBYrnmFH44iKaziy1Z/Ln9FYXP+nDEBIwwVhjEwS7PsZldvZu+ftDtvBG8MIJKB9fjwISGf54jrKbwCi9DwK5bspL9MhNdalGIz1y6XbBiOSnYNUcLGsajaXHl/65Ntwqs1YO9ZRr/OVzaMDSQgMu1wU06l9c2RLj9htcstW5XLLodMVc8rxVBqrUEM8/z91eHeh6DByTndbJsVYRJBbla7PYpM7Zq1ECUBbE0xvTUdVraLEc04PoOg==; s=purelymail3; d=purelymail.com; v=1; bh=clxVsQKkrnR9wv8DKul25lTsvvLat2HJc7+oSMFkZlk=; h=Feedback-ID:Received:From:Date:Subject:To;
Feedback-ID: 68247:10037:null:purelymail
X-Pm-Original-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1992400030;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Thu, 10 Jul 2025 16:50:42 +0000 (UTC)
From: Igor Belwon <igor.belwon@mentallysanemainliners.org>
Date: Thu, 10 Jul 2025 18:50:08 +0200
Subject: [PATCH v2 4/5] arm64: dts: exynos990-c1s: Enable USB
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-resends-july-exynos990-dt-v2-4-55033f73d1b0@mentallysanemainliners.org>
References: <20250710-resends-july-exynos990-dt-v2-0-55033f73d1b0@mentallysanemainliners.org>
In-Reply-To: <20250710-resends-july-exynos990-dt-v2-0-55033f73d1b0@mentallysanemainliners.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Igor Belwon <igor.belwon@mentallysanemainliners.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752166235; l=1236;
 i=igor.belwon@mentallysanemainliners.org; s=20241206;
 h=from:subject:message-id; bh=clxVsQKkrnR9wv8DKul25lTsvvLat2HJc7+oSMFkZlk=;
 b=1wJaa5+YsmwD3pHwjOLrqecSCac9cHVyVOiwr8MaubnbBiW/Q1ZK5LLvwSNZH2LMpiXp6HKnV
 XI2nZIreuHoABl5Fdy5UWiQW76M5E7tpBax81YEn+Wd8kT+KCD6jG3Q
X-Developer-Key: i=igor.belwon@mentallysanemainliners.org; a=ed25519;
 pk=qKAuSTWKTaGQM0vwBxV0p6hPKMN4vh0CwZ+bozrG5lY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_095118_615342_0F8E3A78 
X-CRM114-Status: UNSURE (   8.51  )
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

Enable both the USB PHY as well as the DWC3 controller nodes.

Since we do not have any PMIC for USB implemented yet, use dummy
regulators until we do.

Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
---
 arch/arm64/boot/dts/exynos/exynos990-c1s.dts | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos990-c1s.dts b/arch/arm64/boot/dts/exynos/exynos990-c1s.dts
index 36a6f1377e92b40716c606cceb752f642ae603e3..9f0ad4f9673a87b4d75f3c7d208c8c37bb51fe2d 100644
--- a/arch/arm64/boot/dts/exynos/exynos990-c1s.dts
+++ b/arch/arm64/boot/dts/exynos/exynos990-c1s.dts
@@ -44,6 +44,12 @@ memory@80000000 {
 		      <0x8 0x80000000 0x1 0x7ec00000>;
 	};
 
+	/* TODO: Remove this once PMIC is implemented */
+	reg_dummy: regulator-0 {
+		compatible = "regulator-fixed";
+		regulator-name = "dummy_reg";
+	};
+
 	reserved-memory {
 		#address-cells = <2>;
 		#size-cells = <2>;
@@ -113,3 +119,13 @@ key_volup: key-volup-pins {
 		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
 	};
 };
+
+&usbdrd {
+	status = "okay";
+	vdd10-supply = <&reg_dummy>;
+	vdd33-supply = <&reg_dummy>;
+};
+
+&usbdrd_phy {
+	status = "okay";
+};

-- 
2.47.2



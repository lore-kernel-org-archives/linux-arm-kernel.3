Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ED67C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 19:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZRcH/eHQm5mS4X7voC0Jy7SUfTjo7Kv8eDq6w4o/DDU=; b=tdO6iNiV4m5ssDqai5R6iXE5CC
	yl7SKUHpZh6JbLY0AEjL2LjnUTge8pO/GNXnUssyudPok22EOAQ1x3lm7CKgdyuH7niF12EkBQfe/
	FBed+1GpsPrFyeCEGMUOW+t1jpMGvWa+ioixVxPdGeyxjg3iOYu53sc/Myh4J16Qbf8bK2dC0VJ8W
	Sh97EfV4S1xtHdOdGWkcCMmOMcgYyhTpm9xtQz85ZZ78mnH7QnnnxA1RAT4qME11bhZkUrCqKU0bF
	bJ8tCgX5bvBFs0opVGc/UW70A9rQnBJvI4NLxY9MqusypV7XzR2rW03E9PpfGlDBLDPXDB+aVIEg9
	To5Kp7tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZx2r-0000000CpGV-34vg;
	Thu, 10 Jul 2025 19:35:01 +0000
Received: from sendmail.purelymail.com ([34.202.193.197])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZuf8-0000000CWay-3hSU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 17:02:24 +0000
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256; b=L76XS+hKOD8ApKRkKj8a913AobIqyRrLPXK1bGS+OfVWOFrcoIZgE69W7luqJZu5heDPAnc01EOKmhaMlZ/BNO/LAX4qJx7ooFdaFKrGuQ1RMhtVZGxaEnIjAgkTWgZx0s0vgKBKDDlS6CdCo6emKCm30bsmFyc6kqomBIWaRTCx58OKPVtsLrH1Dr6iQV1WTz64crkcL04nK5EGA4eMxA5aSra/asG8juTGrrlrKBummXm4YVFxmIujkaL32CvXgh4F5HC+zxvPUwFSw3KAGO+zUmPBySDKUmLKVYMhy73bU6E22HZaso0u217jROgSTWT1ow/djKTxqg+C7P+/Vg==; s=purelymail3; d=purelymail.com; v=1; bh=d90e+aG/dLPhZ45Wax0yq+hKJxVgTdMsCYq09/QZQ0s=; h=Feedback-ID:Received:From:Date:Subject:To;
Feedback-ID: 68247:10037:null:purelymail
X-Pm-Original-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1992400030;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Thu, 10 Jul 2025 16:50:41 +0000 (UTC)
From: Igor Belwon <igor.belwon@mentallysanemainliners.org>
Date: Thu, 10 Jul 2025 18:50:07 +0200
Subject: [PATCH v2 3/5] arm64: dts: exynos990-x1s-common: Enable USB
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-resends-july-exynos990-dt-v2-3-55033f73d1b0@mentallysanemainliners.org>
References: <20250710-resends-july-exynos990-dt-v2-0-55033f73d1b0@mentallysanemainliners.org>
In-Reply-To: <20250710-resends-july-exynos990-dt-v2-0-55033f73d1b0@mentallysanemainliners.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Igor Belwon <igor.belwon@mentallysanemainliners.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752166235; l=1301;
 i=igor.belwon@mentallysanemainliners.org; s=20241206;
 h=from:subject:message-id; bh=d90e+aG/dLPhZ45Wax0yq+hKJxVgTdMsCYq09/QZQ0s=;
 b=DJQ55NTYx9pLwW/yp6Ykfs9HFU1x2wgbHI33WReelNFvAhuJcejHgP/Lxg4gUwKeQKZrFCNmO
 iK+FJOhdMw4CgCCEj3C/yGuZFPZOknIFosUVBCF3Hkp1j7soO0Zlcv8
X-Developer-Key: i=igor.belwon@mentallysanemainliners.org; a=ed25519;
 pk=qKAuSTWKTaGQM0vwBxV0p6hPKMN4vh0CwZ+bozrG5lY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_100222_992919_6A96BF3C 
X-CRM114-Status: UNSURE (   8.99  )
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

The x1s family uses a shared USB configuration. Enable both the
USB PHY as well as the DWC3 controller.

Since we do not have any PMIC for USB implemented yet, use dummy
regulators until we do.

Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
---
 arch/arm64/boot/dts/exynos/exynos990-x1s-common.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos990-x1s-common.dtsi b/arch/arm64/boot/dts/exynos/exynos990-x1s-common.dtsi
index 55fa8e9e05db8af51109d20d74cbd7b9a2af38df..7b97220cccb7442dbc5a9f31ae9b9124bee85c62 100644
--- a/arch/arm64/boot/dts/exynos/exynos990-x1s-common.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos990-x1s-common.dtsi
@@ -27,6 +27,12 @@ framebuffer0: framebuffer@f1000000 {
 		};
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
@@ -96,3 +102,13 @@ key_volup: key-volup-pins {
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



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2084AC5AC67
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 02:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KWMwlHvU9gSi7icyvD9gEKtDUM9vFD6hRmzH2Pd6GIg=; b=URYAbZolwtMCEdZzH5L9SNhD0Z
	maUY3doN/BDeN+GnkJheSxI7A5vhOhmdzS3P5KxeIna+tvKL/Jjq6srNbi/NFVQvXcPpsgdwoTmIU
	EAxvAyOUxYEcRqDv0blbGLJOz6b73SxJT6zpoHxHLW9SH11PQOQ7uEu0Bzu5M7fL6rGZ6FsxVjpGT
	iC9+qbZjfcUjIPQbFL4GHjuaaATRXajhOfSTdTK6Ldr8ETxz4CzwN19ED5sJQbRJ7Px+doG9v12V3
	u8WQbsRivaJlWXM53LJP732U5grB6MxHD5MGoCCuK5wvLpN4wkYIPgmIbn1w/d0FVFoVZ2gSAEpUg
	JcHOpstQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtyco-0000000FGe6-1NaH;
	Wed, 12 Aug 2026 02:23:26 +0000
Received: from mail-m103131191148.xmail.ntesmail.com ([103.131.191.148])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtyck-0000000FGcs-0vzr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 02:23:25 +0000
Received: from [127.0.1.1] (unknown [36.129.139.90])
	by smtp.qiye.163.com (Hmail) with ESMTP id 49a56c4b7;
	Wed, 12 Aug 2026 10:23:15 +0800 (GMT+08:00)
From: Hongyang Zhao <hongyang.zhao@thundersoft.com>
Date: Wed, 12 Aug 2026 10:22:38 +0800
Subject: [PATCH v3 1/2] arm64: dts: qcom: qcs6490-rubikpi3: Add 3.3 V
 output supply
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260812-rubikpi-next-20260615-v3-1-06e21232d8e4@thundersoft.com>
References: <20260812-rubikpi-next-20260615-v3-0-06e21232d8e4@thundersoft.com>
In-Reply-To: <20260812-rubikpi-next-20260615-v3-0-06e21232d8e4@thundersoft.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Roger Shimizu <rosh@debian.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Hongyang Zhao <hongyang.zhao@thundersoft.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786501394; l=1688;
 i=hongyang.zhao@thundersoft.com; s=20260127; h=from:subject:message-id;
 bh=4AUkVZdED8INaKxYXi8vIBzZp+pos8MPvKlYMVmdfpw=;
 b=olDCzWoPw1qOj+rvq7y1J+YcWz4J6V3EMdvfgrf0OIkb/PiyN7l6OOOM0HZ+hPL7AJDnwX8Zy
 tCtl9HhN0qNAhEOTFM2dfghvWPMxdVLosYXfbRzTQdQenpkXiVEgQHv
X-Developer-Key: i=hongyang.zhao@thundersoft.com; a=ed25519;
 pk=D9yL5W9Zj0lPBDAq9gzY++1849VlXuTWAkROzZ88J/4=
X-HM-Tid: 0a9ff3c7f48f09d5kunm2a4e641d37f494
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZGhhKVk0dQkpISR5LThkeHVYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlITVVKSUJVSkhCVUJLWVdZFhoPEhUdFFlBWU9LSFVKS0
	lPT09LVUpLS1VLWQY+
DKIM-Signature: a=rsa-sha256;
	b=gdTFfhtSZs1rFItb+RETNpXpg/EtDqIk+5ctIxKNYFnpOCVOdFkXF7YycykygZzS23ZPgvZgCrrSJsnFPnGL5F1F5nSGTyJaP9nei6uGIFUjThxBLroXhoVA2d4NaNF0fRnsbdKcB1TAeAUuOXc1OJvKAL5S2OAxcNp4UjbgJGs=; c=relaxed/relaxed; s=default; d=thundersoft.com; v=1;
	bh=KWMwlHvU9gSi7icyvD9gEKtDUM9vFD6hRmzH2Pd6GIg=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_192322_575684_B5A80B13 
X-CRM114-Status: UNSURE (   7.50  )
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

Describe the GPIO-controlled VCC3V3_OUTPUT rail. This board-level rail
supplies the two camera connectors and the 40-pin expansion header.

Keep the rail enabled because expansion-header consumers are not
represented in the Device Tree.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
---
 .../boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts | 23 ++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
index 13e8e62f6205..0f21777c480b 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
@@ -214,6 +214,22 @@ vreg_usbhub_rest_1v8: regulator-usbhub-rest-1v8 {
 		regulator-boot-on;
 	};
 
+	vreg_vcc3v3_output: regulator-vcc3v3-output {
+		compatible = "regulator-fixed";
+
+		regulator-name = "vcc3v3_output";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&tlmm 14 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&vcc3v3_output_en>;
+		pinctrl-names = "default";
+
+		regulator-always-on;
+	};
+
 	vph_pwr: regulator-vph-pwr {
 		compatible = "regulator-fixed";
 
@@ -1251,6 +1267,13 @@ usb_eth_power: usb-eth-power-state {
 		bias-disable;
 	};
 
+	vcc3v3_output_en: vcc3v3-output-en-state {
+		pins = "gpio14";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
 	wifi_reset_active: wifi-reset-active-state {
 		pins = "gpio16";
 		function = "gpio";

-- 
2.43.0



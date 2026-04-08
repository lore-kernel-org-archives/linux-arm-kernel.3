Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 390A410FC456
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 22:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V7coPJCiAbtPMojrn2TDI1q01XTne5x9shCS1+tfkHU=; b=r2iEuk8j+GkQPkvBIl0SUPFmws
	u4d7cH/vIrbpOunY1LokkIGlAfIgm44mE9JzZjpKjavOpV9KAZp5jJThGOq0OZvsBqo/McqQiQ7R/
	JX9abJrEoBHpR/FAhlfvAE1i21k5lPvNdjB8/jjywqkfgaX46Kn1Kgv/bO1eWBGINKkdQEiv5H4Oy
	7hxqD6DNAYWOJ2o1wCn0AKHW1t8PgTxpgdlcryxcwoqwAV5OzGa7QR+SJxm9qhI858+QZgOsmpSEC
	wDSD4/M/XmRqmkljgfmzAK4/Q1TCLO4aV8nTrJ/L2h4Ibo0OW76FB0RfLaiw0rTfn/M7n99XCJY19
	rGz5yqhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAbBv-00000009TNY-1bmn;
	Wed, 08 Apr 2026 22:16:07 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAbBi-00000009TBK-2n6q
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Apr 2026 22:15:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7B99744599;
	Wed,  8 Apr 2026 22:15:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 50842C19421;
	Wed,  8 Apr 2026 22:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775686551;
	bh=kHakWtc7I/4KMZNxyXdf4ZZNQ6CPJJ3HAz/w/Rhm82s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=kiS7skWTNXTLnFDt5YrRaai+6DODIhvjR5X7zhUCsOePFByb0p8CQrwuJ0X3qUUhE
	 rb0XwpCbi/avsNQ3hCv4HW7CmdWM2QokjMnIRyKTfK//S2kqoWqh8uSvlI//SgvbNt
	 Ui6keRgohDd/3pd2QDPTyC70ZtICYR/yhjuFtc4Kh0JDA4/aEYRtudVMPsWGIVeElS
	 STWW+Zkpy115UsYLfHzlsKrHaxXOjWJ3sEk5ayitbQb23/J1kwYB83st1YQDn0lXuQ
	 RISAMdzNhdWdLNUKk8qQCJLDE7dA74PZ0kaLpFHym5odD1GZ1sRoTaadhHCfWHs8ql
	 0OdUwDB7reFRA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4525510FC45F;
	Wed,  8 Apr 2026 22:15:51 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Thu, 09 Apr 2026 00:15:54 +0200
Subject: [PATCH v4 11/11] arm64: dts: qcom: sdm845-google: Add STM FTS
 touchscreen support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260409-stmfts5-v4-11-64fe62027db5@ixit.cz>
References: <20260409-stmfts5-v4-0-64fe62027db5@ixit.cz>
In-Reply-To: <20260409-stmfts5-v4-0-64fe62027db5@ixit.cz>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Henrik Rydberg <rydberg@bitmath.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Petr Hodina <petr.hodina@protonmail.com>, linux-input@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1856; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=7SvlmHIP51I6dk+k6+tvNP3/MABqkfu3zdnv9py6gtI=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBp1tOSbkFU6aEYu1WSXcSny3Bib98zFWA+1DYun
 thcrml6diuJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCadbTkgAKCRBgAj/E00kg
 coutD/0XMKWSj++FRSkStRFByRa+K5bf/KenIGUw9yS6Emc+5dhSrjiUP+MpBY961IreoJ7GvfA
 2vv1TiTcJsZ65jxJpzQ0Dz0w4G9hoWi8V1iEGA6t7yFRB89rDaFcn4n7ORsObw2oPZz0tn59Gjy
 ayEx4qzSg2gXL6/h0DP1uUGrt+jgj0CWgd+wk0sRhgK1igWwfNwndn3Om+ZUClgSJPyAStUHSvS
 vCT0K3LrxFviAxkQXgNEVhg0WizdwahTXTwcSicUqPHBlXncNhhY2tvBFZb3xyRL+5zo4/XUkdf
 wZS6EBXa67Y7GnaUdBBbQNyDwsFryaOZQbWr6g17LR5z/igz1xeDIu5Fal6KQW5hDiM4XoWD2bT
 EtTpeSWcSGQc9zB/mroFJkiO0HiMWA06AmRYFR/6uUdUstqeaxoa18VTfps7musntig5wbFXYN2
 2VWIWJAxALeJV+3HC/x5qWlG8dpret/2INQuh/DwxaLunH4DidZOUwRPlfiTtxxTwgoIH7YnXIq
 B1FKqjLUQn2b0VwY6t3G7Coj7i2FmbcNGK8Svd4EGsdS8mTf/SK4vYqGQFTE0q2AoD/2x978zi7
 4s5zM8RcB2+W0VAnaOJaWVLV4eQhZIQ1meN7PGjQKlH7oDtcpkX+FcJOtG0wjoMbtrs4izGXKLm
 zqjJzSVm9qTBp5g==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_151554_766193_D3B1279B 
X-CRM114-Status: GOOD (  11.05  )
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
Reply-To: david@ixit.cz
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Petr Hodina <petr.hodina@protonmail.com>

Basic touchscreen connected to second i2c bus.

Signed-off-by: Petr Hodina <petr.hodina@protonmail.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Co-developed-by: David Heidelberg <david@ixit.cz>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 arch/arm64/boot/dts/qcom/sdm845-google-blueline.dts | 19 ++++++++++++++++++-
 arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi  |  2 +-
 2 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-google-blueline.dts b/arch/arm64/boot/dts/qcom/sdm845-google-blueline.dts
index fa89be500fb85..8fb988130b551 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-google-blueline.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-google-blueline.dts
@@ -26,7 +26,24 @@ &i2c2 {
 
 	status = "okay";
 
-	/* ST,FTS @ 49 */
+	touchscreen@49 {
+		compatible = "st,stmfts5";
+		reg = <0x49>;
+
+		pinctrl-0 = <&touchscreen_irq_n>, <&touchscreen_reset>;
+		pinctrl-names = "default";
+
+		interrupts-extended = <&tlmm 125 IRQ_TYPE_LEVEL_LOW>;
+
+		mode-switch-gpios = <&tlmm 136 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
+
+		avdd-supply = <&vreg_l14a_1p8>;
+		vdd-supply = <&vreg_l19a_3p3>;
+
+		touchscreen-size-x = <1080>;
+		touchscreen-size-y = <2160>;
+	};
 };
 
 &mdss_dsi0 {
diff --git a/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi
index 6930066857768..4653c63ec26d2 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi
@@ -466,7 +466,7 @@ touchscreen_reset: ts-reset-state {
 		bias-pull-up;
 	};
 
-	touchscreen_pins: ts-pins-gpio-state {
+	touchscreen_irq_n: ts-irq-n-gpio-state {
 		pins = "gpio125";
 		function = "gpio";
 		drive-strength = <2>;

-- 
2.53.0




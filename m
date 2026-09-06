Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDE29C79F8C
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Sep 2026 16:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mcrd7ID/ruS1dUeeFbqBUStWGoHT3hDklacOW94m57A=; b=zC+LVkztbIKhOUMS66r6NdtzF+
	LyucjB/sDtpf+xYIns5hoYpD5z+FRa/1s4AhAHQt9JPRpPmZnlv621fiexUsrMYzLQYd88jHhTffx
	Lsv1pm9UDn8bHzl7n//+b0aG4HsPibMvNYGW3gtBzwgEIdre5iIXNMLAzADVxYHy83WhRXS48SNuI
	DksvQuSmjpCyt/0qyX9XznjKnzoMN33VaWC/lou0idtqJNLs/NxU6IH83sbXE6gvjsAX8T9A02pBt
	RRxvqO44eRZFUBtFMRzin2565Tfxan27IwPLjwPFsmdSJtwSdGkvIh9CAbeFtofQRjgfoXbZLOf48
	rcsciPcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Foe-00000005BNR-0koD;
	Sun, 06 Sep 2026 16:34:00 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3FoZ-00000005BMO-0g3G
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Sep 2026 16:33:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8B0FC4403D;
	Sun,  6 Sep 2026 16:33:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5044CC2BD00;
	Sun,  6 Sep 2026 16:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788712434;
	bh=GTKCuKerEVjbEq+ru51jw6Xl/RomTGKgH6W2wG3Nmm8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ZoQ3oFPwoNw9uiHW4BQLLbE0rsLeOl+zQrlsWmeTLmFUmw5bTA5YftJ7/wmZkATZ0
	 +3Eblv5JM3tmGohRuKIUizIiW2ezU2SBilw6UF8u6JC0UjWtJzsl3fm08mWvcQL8m2
	 HH4VTacIb/JQjMh2o3/9Ps4e4ex6+hgMLaIzNXIBOBsmWPz5kolfMyRByQJBzQ0S72
	 4x546Q70u51aIdYefGVpNanY7QF6oUkb8xcCnoTILbiQ7WvmFKk8dOCVBn8AL3hRfb
	 1YljXUEWNOE1VV2plxetkZ4Kr1VaPj9Zv2RuG3GX5dI1CzlkmBmOOHSG/bd37Eg27K
	 Jd1zZH/X1rDyg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36C51C79F85;
	Sun,  6 Sep 2026 16:33:54 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sun, 06 Sep 2026 18:33:51 +0200
Subject: [PATCH v6 3/3] arm64: dts: qcom: sdm845-google: Add STM FTS
 touchscreen support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260906-stmfts5-v6-3-50fbf6af8718@ixit.cz>
References: <20260906-stmfts5-v6-0-50fbf6af8718@ixit.cz>
In-Reply-To: <20260906-stmfts5-v6-0-50fbf6af8718@ixit.cz>
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
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2317; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=UYybbePhFZQL67dBaI7ZZMSBOFWG/ciE0qllsHbgzEk=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBqnZXweyV+w1DXqt1mMsyGPwwNYULoSaJ+5XDXl
 CX8VS1RRnGJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCap2V8AAKCRBgAj/E00kg
 cpbAD/4+PL3GBlMtZ7FWZ6NoUDM1965ux0TqDTVHiZv91Sn09Lfqy5NPwLsgc6dqt6JeE+fJeRP
 LsJPNGteE0kWPSAUYJ0cYsz76ikj3NLYY7x1oQgSp/ASmFlw455D7GNY4Aae/ifQoBA4EivZA4r
 ecKs6GlKv1xvYhCQxH6DN6ILzIrn6IfhRAAWJ3ROJzyj4xwGh9Jw5kTenCqE9KPma7Qj6D6MLim
 ZAaLBZg8hYEpFVE3N5iNyDkRFZF70fOcQ3azh05Q1EbOoL5L+1yx9ZXPOmKHt70LnkDb/GlK3in
 WzjITu4HA9hcKRMEC63JiHdIQikf+1mDlBgutJ+MKqrMldLZMlxJa3pmTNL+dULO2+vZz84Iozu
 qfTX38VRKYpScCUH6kdugXYZ/3g/5dU81fTEkhNiV/9cGwukoX37K923zBL/RUf5UqbdfEXvSRL
 lLYP4oT9Y8Jn6xnpAN7vcclCH5ZtuCpQwbqHQbIPo/6SD+mnl2IdT76JpviKzmMMjPTIBvgCAC7
 wWYzxK0rw6sNTGMOWRrhZoGY0p2pqYl9zbqUR2Pbha94ICczVNxXdKrkFq6WcRk3vrexqi7TZv/
 dC8nZ4CYwvy4m5etjLAmmJLWH/XqmsOLuUdUfbOUj22VgN6y/chZUchbRs8XO1HcWIRlxwRgAg7
 qYGgCrzDVyhH4IA==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
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
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Co-developed-by: David Heidelberg <david@ixit.cz>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 arch/arm64/boot/dts/qcom/sdm845-google-blueline.dts | 19 ++++++++++++++++++-
 arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi  |  2 +-
 2 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-google-blueline.dts b/arch/arm64/boot/dts/qcom/sdm845-google-blueline.dts
index fa89be500fb85..51c835dca43f1 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-google-blueline.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-google-blueline.dts
@@ -21,17 +21,34 @@ &framebuffer0 {
 	stride = <(1080 * 4)>;
 };
 
 &i2c2 {
 	clock-frequency = <1000000>;
 
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
+		avdd-supply = <&vreg_l19a_3p3>;
+		vdd-supply = <&vreg_l14a_1p8>;
+
+		touchscreen-size-x = <1080>;
+		touchscreen-size-y = <2160>;
+	};
 };
 
 &mdss_dsi0 {
 	vdda-supply = <&vdda_mipi_dsi0_1p2>;
 
 	status = "okay";
 
 	panel@0 {
diff --git a/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi
index 9e952f9862f24..c9db3ea50f5ed 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi
@@ -492,17 +492,17 @@ nfc_enable_default: nfc-enable-default-state {
 
 	touchscreen_reset: ts-reset-state {
 		pins = "gpio99";
 		function = "gpio";
 		drive-strength = <8>;
 		bias-pull-up;
 	};
 
-	touchscreen_pins: ts-pins-gpio-state {
+	touchscreen_irq_n: ts-irq-n-gpio-state {
 		pins = "gpio125";
 		function = "gpio";
 		drive-strength = <2>;
 		bias-disable;
 	};
 
 	touchscreen_i2c_pins: qup-i2c2-gpio-state {
 		pins = "gpio27", "gpio28";

-- 
2.55.0




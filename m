Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C8A1E85388
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Apr 2026 17:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YG7fNuJUBCYRWmTlRu3DTTb3Bq5L/8phvGL52NL1GgA=; b=H5kfbjdemsNL3r9QNQ8x8HRLu3
	NPJ3Q6UaMqB6YeGqvmYXcDjIDwJVWuYZn6dj2qS8Q4oma6vtxY6+l+mZCaTqO/pqklVFtS7N5BKaG
	MJjLANjxX74B780A3+VJgWq3UfzsD2YRV8bOdGyDK5rJCvlFXr2KFyw2b7cMIwEnNPkpSAeyk1x+p
	n2ZomRPaULDTKRWDBsm3SKSdjnOvELYZtQ4swDO1HqunNgTsmSVQQOwvGsftZwdMPanhAbn1MlWQw
	lFVrbMy+HeDQ9LRGO+PKyXbyZlzGVkX0dfKBphXq4AeQ9zGCW0zB4XPwJqPDmnkdSurvZEHdkKIIE
	s70xlm3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8i0j-00000002MtT-2Tl9;
	Fri, 03 Apr 2026 17:08:45 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8i0e-00000002Mnj-2r9l
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Apr 2026 17:08:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8423844754;
	Fri,  3 Apr 2026 17:08:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 519D7C4AF19;
	Fri,  3 Apr 2026 17:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775236118;
	bh=TdrKbk/IAUXNS6Sk9zy9AdX94k46z6QijMe7AIc7bWA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Lj5P/7snoFUsjral5txOxDHgw9vRFkIdWG6hA6XGpF/oNTs/Q7IFxbsYNMdwgXUrp
	 CLgtgGidd75uqZsFjOuaT2STcZsx3Xqm9KoD8UCcj1kEEeobnbtvxANsEMQokHeFDq
	 hEsw1IRvmER1lPC2SGDpoxC13QmvIj05Dd8Kup9GDAUR8zYicV+ar2bXiWtXxuCz9S
	 Z40F3Ku3ehs+kFjQr6bykCrC3zhbyaNwTDklkshawPnA7DjAXBtlPyNq0o3IxuZQ59
	 2auLFyKEoiQ6JKdHTopHFyHSDkVj5cnDg/my1jZd9KhFVa7deZYG4lD76f0G530UTl
	 5enlCA/qA8LfQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45F77E85385;
	Fri,  3 Apr 2026 17:08:38 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Fri, 03 Apr 2026 19:08:40 +0200
Subject: [PATCH WIP v3 11/11] arm64: dts: qcom: sdm845-google: Add STM FTS
 touchscreen support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260403-stmfts5-v3-11-5da768cfd201@ixit.cz>
References: <20260403-stmfts5-v3-0-5da768cfd201@ixit.cz>
In-Reply-To: <20260403-stmfts5-v3-0-5da768cfd201@ixit.cz>
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
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1795; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=TQFq+PWyeQhZg/mK5NDBcGQfwDmMOnudDkXhMTWZo0k=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpz/QQaX/GLHPgoCPSGD4vNqAN8c8Vp77YqqTST
 i8q9/7tueKJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCac/0EAAKCRBgAj/E00kg
 cnt3EAC9+/iOdH/C6Es8Y3zt7BHJHf73YRjGK9TxmQWh0Se913LW/Ngdu9eFlAJWY68ZVPNjmVQ
 fz1LCUrEtsNRrP6s7heETZ+K/mqf/w2eUlTxqf1HET5boZNzsCktlhmZdoKCssdMlnv43oebS10
 I5Vk+JD8virH49O9TKrew6a+jI1giQqXSwSz3LfCGo0TaVTPYhmui1VI50ths7OddPmZ6HXHi3N
 XV4Gz2OWsBluDhNmPrCVBCwFXcjNolDz5jpeZcUEAlIczTmx0NdhGx+6djhB0HZ3We7WsbdyjL2
 6AGdgeIbfDwb/Wkx5YjSFgk+3fb+aqDi1DCobwtW12vOmp4E1LUNq8Vn2Cu8k8Jvpd5HccMpjDK
 Yk1r5QGsPcrwnH/9LX69W+5nT74tYVGtULwB8Rkd5q9E0QFp0XST3zfBGdT+RwuJL7PhHuGMh6U
 O1vX5VOfABaqlEAVllwLw06IcmAUPhtO229992eu/kc3i5RAdybgdklByl4cMq8qTwdcuCB3kbB
 DC1Fj6lCVj5NJ27yaa4GiQ0ZlfC1/cHmBYNhnk+9oAe12lDGa0YoZruthb6uyZMSbDb2qgeEqY/
 zurHwlr0x55LAv4y5pM00T9QB3Rc+fGWK4RJoWy+zJLIyrQwKTaDeZxf3LtdeO6ZKtpbf5D7zvD
 iYVCEiUAlCVnGyg==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_100840_815507_5CF457A4 
X-CRM114-Status: GOOD (  11.07  )
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




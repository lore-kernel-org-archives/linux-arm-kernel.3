Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24158CA5FA3
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Sep 2026 14:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5nrSYf3dzV9j/wgOLX9H7WgAKvX0DINjeA+ZCeFYlAY=; b=nz+0cq0bcBNt3O7ddjGRlGvRi3
	dvY18j08dgx9LZWDqq5dB8haPQDDsDkAYfC7aHxdRwnbXztYR04O6Vv6ipePSAO4+HwBcj/67f6pl
	bEu5942f3YkfjsZmJkrOzO2+dA/tUNiapH9pdUebddBDOljTtRC26RD6BODZtLgKw8YhURouh8wkm
	SrY9yADR7dEusDhg3r0wQxzQoU7n+vIakeJwCWVBOUnOtGUPpO060g83Ym4AQ2Uvte5zqXAMqtRXx
	yNYXg5arSMnzCQacO33MbQD2eZTiznIcLEnn6gQXxHr4yDXgogV55xN5hPFvbdOdVorFF0lHvpZN/
	tmkPaufw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xApsR-0000000GRSl-1WBr;
	Sun, 27 Sep 2026 14:29:15 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xApsP-0000000GRR1-31u0;
	Sun, 27 Sep 2026 14:29:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EBC184479F;
	Sun, 27 Sep 2026 14:29:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CDB3DC4AF1B;
	Sun, 27 Sep 2026 14:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790519352;
	bh=g3hAkf9W/vr7BpQ8UYXpH31/lviipldJ9tzwqwC/8dQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=fPAKn4kV3aszA+bfPH35ayVW9Hn4yCSItgVzD6n03vRHV1sP1EWfHczPiFKyn1Mmn
	 RBdTkDeI9iLIa77SO2fzSz/lnAkMtYDoKyNCEFkPwNIaL/OOivbQrVIvfsdevEd2sC
	 cES78jCkdWSYxLeVEmJQkK4FIu3cXGAr+WZ2FgBrPW5/KtoQDlTVwOz7D+t6shvkjZ
	 nYUEFzOK4J9+kd8u9uC0aDZboJMwwhRE1GTv4/bUk5g8Y753PesOYH7da9d8lsZvo0
	 k2T9hsgFJD/aatk5j8nssXlUnHXvg2tSALjhKLQy4g/0+GwxkgWBlVsoQDBbFrus0M
	 o3ppyld4ydjjQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B694BCA5FA1;
	Sun, 27 Sep 2026 14:29:12 +0000 (UTC)
From: Ronald Claveau via B4 Relay <devnull+linux-kernel-dev.aliel.fr@kernel.org>
Date: Sun, 27 Sep 2026 16:28:17 +0200
Subject: [PATCH v3 3/3] arm64: dts: amlogic: a1-c3-s4-t7: Add core clock to
 PWM controller nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260927-add-t7-sys-pwm-clk-v3-3-18d66abea4d1@aliel.fr>
References: <20260927-add-t7-sys-pwm-clk-v3-0-18d66abea4d1@aliel.fr>
In-Reply-To: <20260927-add-t7-sys-pwm-clk-v3-0-18d66abea4d1@aliel.fr>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=10330;
 i=linux-kernel-dev@aliel.fr; h=from:subject:message-id;
 bh=C3NO3PtCg00JImmbX1tfG8UCVQEaYYnaSJ0e3MaOdYs=;
 b=owGbwMvMwCWm1SvKXP3cUInxtFoSQ9ZODYNjV2Jnf1i+IOqT5uab5r0uj+9fYI098UVL3J/96
 ivf+V57OkpZGMS4GGTFFFn651qeeHf56Jmve9RTYOawMoEMYeDiFICJTApn+M2SfOn2uhnhtavm
 bgq1atT9NO28EHNi9T7Z1UHrzi1lDH7DyPDu3ifxW4y/XP9s3aJ+54LO/tUKErNlgng6Tp7b/oh
 rtREXAA==
X-Developer-Key: i=linux-kernel-dev@aliel.fr; a=openpgp;
 fpr=DFD863F61375BF917F0012173953305EF1D0EC3E
X-Endpoint-Received: by B4 Relay for linux-kernel-dev@aliel.fr/default with
 auth_id=744
X-Original-From: Ronald Claveau <linux-kernel-dev@aliel.fr>
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
Reply-To: linux-kernel-dev@aliel.fr
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Ronald Claveau <linux-kernel-dev@aliel.fr>

Describe the system clock of each PWM controller as a third clock,
and add the clock-names property expected by the updated binding:
"channel-a", "channel-b" and "core".

Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
---
 arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi | 28 +++++++++++++++++++++-------
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 28 +++++++++++++++++++++-------
 arch/arm64/boot/dts/amlogic/meson-a1.dtsi   | 12 +++++++++---
 arch/arm64/boot/dts/amlogic/meson-s4.dtsi   | 20 +++++++++++++++-----
 4 files changed, 66 insertions(+), 22 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi
index 4e6757a57fb9a..a27e9bba22e5d 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi
@@ -824,7 +824,9 @@ pwm_mn: pwm@54000 {
 					     "amlogic,meson-s4-pwm";
 				reg = <0x0 0x54000 0x0 0x24>;
 				clocks = <&clkc_periphs CLKID_PWM_M>,
-					 <&clkc_periphs CLKID_PWM_N>;
+					 <&clkc_periphs CLKID_PWM_N>,
+					 <&clkc_periphs CLKID_SYS_PWM_MN>;
+				clock-names = "channel-a", "channel-b", "core";
 				#pwm-cells = <3>;
 				status = "disabled";
 			};
@@ -843,7 +845,9 @@ pwm_ab: pwm@58000 {
 					     "amlogic,meson-s4-pwm";
 				reg = <0x0 0x58000 0x0 0x24>;
 				clocks = <&clkc_periphs CLKID_PWM_A>,
-					 <&clkc_periphs CLKID_PWM_B>;
+					 <&clkc_periphs CLKID_PWM_B>,
+					 <&clkc_periphs CLKID_SYS_PWM_AB>;
+				clock-names = "channel-a", "channel-b", "core";
 				#pwm-cells = <3>;
 				status = "disabled";
 			};
@@ -853,7 +857,9 @@ pwm_cd: pwm@5a000 {
 					     "amlogic,meson-s4-pwm";
 				reg = <0x0 0x5a000 0x0 0x24>;
 				clocks = <&clkc_periphs CLKID_PWM_C>,
-					 <&clkc_periphs CLKID_PWM_D>;
+					 <&clkc_periphs CLKID_PWM_D>,
+					 <&clkc_periphs CLKID_SYS_PWM_CD>;
+				clock-names = "channel-a", "channel-b", "core";
 				#pwm-cells = <3>;
 				status = "disabled";
 			};
@@ -863,7 +869,9 @@ pwm_ef: pwm@5c000 {
 					     "amlogic,meson-s4-pwm";
 				reg = <0x0 0x5c000 0x0 0x24>;
 				clocks = <&clkc_periphs CLKID_PWM_E>,
-					 <&clkc_periphs CLKID_PWM_F>;
+					 <&clkc_periphs CLKID_PWM_F>,
+					 <&clkc_periphs CLKID_SYS_PWM_EF>;
+				clock-names = "channel-a", "channel-b", "core";
 				#pwm-cells = <3>;
 				status = "disabled";
 			};
@@ -873,7 +881,9 @@ pwm_gh: pwm@5e000 {
 					     "amlogic,meson-s4-pwm";
 				reg = <0x0 0x5e000 0x0 0x24>;
 				clocks = <&clkc_periphs CLKID_PWM_G>,
-					 <&clkc_periphs CLKID_PWM_H>;
+					 <&clkc_periphs CLKID_PWM_H>,
+					 <&clkc_periphs CLKID_SYS_PWM_GH>;
+				clock-names = "channel-a", "channel-b", "core";
 				#pwm-cells = <3>;
 				status = "disabled";
 			};
@@ -883,7 +893,9 @@ pwm_ij: pwm@60000 {
 					     "amlogic,meson-s4-pwm";
 				reg = <0x0 0x60000 0x0 0x24>;
 				clocks = <&clkc_periphs CLKID_PWM_I>,
-					 <&clkc_periphs CLKID_PWM_J>;
+					 <&clkc_periphs CLKID_PWM_J>,
+					 <&clkc_periphs CLKID_SYS_PWM_IJ>;
+				clock-names = "channel-a", "channel-b", "core";
 				#pwm-cells = <3>;
 				status = "disabled";
 			};
@@ -893,7 +905,9 @@ pwm_kl: pwm@62000 {
 					     "amlogic,meson-s4-pwm";
 				reg = <0x0 0x62000 0x0 0x24>;
 				clocks = <&clkc_periphs CLKID_PWM_K>,
-					 <&clkc_periphs CLKID_PWM_L>;
+					 <&clkc_periphs CLKID_PWM_L>,
+					 <&clkc_periphs CLKID_SYS_PWM_KL>;
+				clock-names = "channel-a", "channel-b", "core";
 				#pwm-cells = <3>;
 				status = "disabled";
 			};
diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
index 8f3f1c0579a0f..8a148af5ed442 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
@@ -692,7 +692,9 @@ pwm_ao_ef: pwm@30000 {
 				compatible = "amlogic,t7-pwm", "amlogic,meson-s4-pwm";
 				reg = <0x0 0x30000 0x0 0x24>;
 				clocks = <&clkc_periphs CLKID_PWM_AO_E>,
-					 <&clkc_periphs CLKID_PWM_AO_F>;
+					 <&clkc_periphs CLKID_PWM_AO_F>,
+					 <&clkc_periphs CLKID_SYS_PWM_AO_EF>;
+				clock-names = "channel-a", "channel-b", "core";
 				#pwm-cells = <3>;
 				status = "disabled";
 			};
@@ -701,7 +703,9 @@ pwm_ao_gh: pwm@32000 {
 				compatible = "amlogic,t7-pwm", "amlogic,meson-s4-pwm";
 				reg = <0x0 0x32000 0x0 0x24>;
 				clocks = <&clkc_periphs CLKID_PWM_AO_G>,
-					 <&clkc_periphs CLKID_PWM_AO_H>;
+					 <&clkc_periphs CLKID_PWM_AO_H>,
+					 <&clkc_periphs CLKID_SYS_PWM_AO_GH>;
+				clock-names = "channel-a", "channel-b", "core";
 				#pwm-cells = <3>;
 				status = "disabled";
 			};
@@ -715,7 +719,9 @@ pwm_ab: pwm@58000 {
 				compatible = "amlogic,t7-pwm", "amlogic,meson-s4-pwm";
 				reg = <0x0 0x58000 0x0 0x24>;
 				clocks = <&clkc_periphs CLKID_PWM_A>,
-					 <&clkc_periphs CLKID_PWM_B>;
+					 <&clkc_periphs CLKID_PWM_B>,
+					 <&clkc_periphs CLKID_SYS_PWM_AB>;
+				clock-names = "channel-a", "channel-b", "core";
 				#pwm-cells = <3>;
 				status = "disabled";
 			};
@@ -724,7 +730,9 @@ pwm_cd: pwm@5a000 {
 				compatible = "amlogic,t7-pwm", "amlogic,meson-s4-pwm";
 				reg = <0x0 0x5a000 0x0 0x24>;
 				clocks = <&clkc_periphs CLKID_PWM_C>,
-					 <&clkc_periphs CLKID_PWM_D>;
+					 <&clkc_periphs CLKID_PWM_D>,
+					 <&clkc_periphs CLKID_SYS_PWM_CD>;
+				clock-names = "channel-a", "channel-b", "core";
 				#pwm-cells = <3>;
 				status = "disabled";
 			};
@@ -733,7 +741,9 @@ pwm_ef: pwm@5c000 {
 				compatible = "amlogic,t7-pwm", "amlogic,meson-s4-pwm";
 				reg = <0x0 0x5c000 0x0 0x24>;
 				clocks = <&clkc_periphs CLKID_PWM_E>,
-					 <&clkc_periphs CLKID_PWM_F>;
+					 <&clkc_periphs CLKID_PWM_F>,
+					 <&clkc_periphs CLKID_SYS_PWM_EF>;
+				clock-names = "channel-a", "channel-b", "core";
 				#pwm-cells = <3>;
 				status = "disabled";
 			};
@@ -742,7 +752,9 @@ pwm_ao_ab: pwm@5e000 {
 				compatible = "amlogic,t7-pwm", "amlogic,meson-s4-pwm";
 				reg = <0x0 0x5e000 0x0 0x24>;
 				clocks = <&clkc_periphs CLKID_PWM_AO_A>,
-					 <&clkc_periphs CLKID_PWM_AO_B>;
+					 <&clkc_periphs CLKID_PWM_AO_B>,
+					 <&clkc_periphs CLKID_SYS_PWM_AO_AB>;
+				clock-names = "channel-a", "channel-b", "core";
 				#pwm-cells = <3>;
 				status = "disabled";
 			};
@@ -751,7 +763,9 @@ pwm_ao_cd: pwm@60000 {
 				compatible = "amlogic,t7-pwm", "amlogic,meson-s4-pwm";
 				reg = <0x0 0x60000 0x0 0x24>;
 				clocks = <&clkc_periphs CLKID_PWM_AO_C>,
-					 <&clkc_periphs CLKID_PWM_AO_D>;
+					 <&clkc_periphs CLKID_PWM_AO_D>,
+					 <&clkc_periphs CLKID_SYS_PWM_AO_CD>;
+				clock-names = "channel-a", "channel-b", "core";
 				#pwm-cells = <3>;
 				status = "disabled";
 			};
diff --git a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
index 6f6a6145cba12..b9761893c666d 100644
--- a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
@@ -544,7 +544,9 @@ pwm_ab: pwm@2400 {
 				reg = <0x0 0x2400 0x0 0x24>;
 				#pwm-cells = <3>;
 				clocks = <&clkc_periphs CLKID_PWM_A>,
-					 <&clkc_periphs CLKID_PWM_B>;
+					 <&clkc_periphs CLKID_PWM_B>,
+					 <&clkc_periphs CLKID_PWM_AB>;
+				clock-names = "channel-a", "channel-b", "core";
 				power-domains = <&pwrc PWRC_I2C_ID>;
 				status = "disabled";
 			};
@@ -555,7 +557,9 @@ pwm_cd: pwm@2800 {
 				reg = <0x0 0x2800 0x0 0x24>;
 				#pwm-cells = <3>;
 				clocks = <&clkc_periphs CLKID_PWM_C>,
-					 <&clkc_periphs CLKID_PWM_D>;
+					 <&clkc_periphs CLKID_PWM_D>,
+					 <&clkc_periphs CLKID_PWM_CD>;
+				clock-names = "channel-a", "channel-b", "core";
 				power-domains = <&pwrc PWRC_I2C_ID>;
 				status = "disabled";
 			};
@@ -655,7 +659,9 @@ pwm_ef: pwm@5400 {
 				reg = <0x0 0x5400 0x0 0x24>;
 				#pwm-cells = <3>;
 				clocks = <&clkc_periphs CLKID_PWM_E>,
-					 <&clkc_periphs CLKID_PWM_F>;
+					 <&clkc_periphs CLKID_PWM_F>,
+					 <&clkc_periphs CLKID_PWM_EF>;
+				clock-names = "channel-a", "channel-b", "core";
 				power-domains = <&pwrc PWRC_I2C_ID>;
 				status = "disabled";
 			};
diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
index 2a6fbd5308362..ca9abbf857178 100644
--- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
@@ -685,7 +685,9 @@ pwm_ab: pwm@58000 {
 				compatible = "amlogic,meson-s4-pwm";
 				reg = <0x0 0x58000 0x0 0x24>;
 				clocks = <&clkc_periphs CLKID_PWM_A>,
-					 <&clkc_periphs CLKID_PWM_B>;
+					 <&clkc_periphs CLKID_PWM_B>,
+					 <&clkc_periphs CLKID_PWM_AB>;
+				clock-names = "channel-a", "channel-b", "core";
 				#pwm-cells = <3>;
 				status = "disabled";
 			};
@@ -694,7 +696,9 @@ pwm_cd: pwm@5a000 {
 				compatible = "amlogic,meson-s4-pwm";
 				reg = <0x0 0x5a000 0x0 0x24>;
 				clocks = <&clkc_periphs CLKID_PWM_C>,
-					 <&clkc_periphs CLKID_PWM_D>;
+					 <&clkc_periphs CLKID_PWM_D>,
+					 <&clkc_periphs CLKID_PWM_CD>;
+				clock-names = "channel-a", "channel-b", "core";
 				#pwm-cells = <3>;
 				status = "disabled";
 			};
@@ -703,7 +707,9 @@ pwm_ef: pwm@5c000 {
 				compatible = "amlogic,meson-s4-pwm";
 				reg = <0x0 0x5c000 0x0 0x24>;
 				clocks = <&clkc_periphs CLKID_PWM_E>,
-					 <&clkc_periphs CLKID_PWM_F>;
+					 <&clkc_periphs CLKID_PWM_F>,
+					 <&clkc_periphs CLKID_PWM_EF>;
+				clock-names = "channel-a", "channel-b", "core";
 				#pwm-cells = <3>;
 				status = "disabled";
 			};
@@ -712,7 +718,9 @@ pwm_gh: pwm@5e000 {
 				compatible = "amlogic,meson-s4-pwm";
 				reg = <0x0 0x5e000 0x0 0x24>;
 				clocks = <&clkc_periphs CLKID_PWM_G>,
-					 <&clkc_periphs CLKID_PWM_H>;
+					 <&clkc_periphs CLKID_PWM_H>,
+					 <&clkc_periphs CLKID_PWM_GH>;
+				clock-names = "channel-a", "channel-b", "core";
 				#pwm-cells = <3>;
 				status = "disabled";
 			};
@@ -721,7 +729,9 @@ pwm_ij: pwm@60000 {
 				compatible = "amlogic,meson-s4-pwm";
 				reg = <0x0 0x60000 0x0 0x24>;
 				clocks = <&clkc_periphs CLKID_PWM_I>,
-					 <&clkc_periphs CLKID_PWM_J>;
+					 <&clkc_periphs CLKID_PWM_J>,
+					 <&clkc_periphs CLKID_PWM_IJ>;
+				clock-names = "channel-a", "channel-b", "core";
 				#pwm-cells = <3>;
 				status = "disabled";
 			};

-- 
2.49.0




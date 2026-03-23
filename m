Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 518FBEC01B6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 09:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QaFGfxQXbP3z6y6NEJS5OVsmc8hPCEqM4rPTfyXnlMM=; b=OQYlngj7eKWS/x8RQFRRpsEPFP
	L3dLofTT6eXQqt6WHvjiH4nobLJIZtHYsq5rN8FXAka6Bvtfc6vkwpj/TjUWg6IvNp2cNCjgLNdOP
	c7/s7kLx5f2wA6pdPmhiIiHJwpFX7ao4pXo80ULVLK4+4L4WeeG6NvEIkStk6k6M8FRi5LHShXwh3
	4BhrnSBSIdNQ9TmmIGtcQMJDdbtrD5RJm4auvI8QohlzMeEW8d4hxcPIGu87st93TcL9XvfXz0nuO
	hS7RfU3WXLa4HX5vYP9C48NWrmnSVMeQi42mKFKKzlWSFjv25yUEERYgddAsDu41BfpQJSyiWV3m1
	kfV+WOkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4c3p-0000000GR4Q-3Zrm;
	Mon, 23 Mar 2026 09:59:01 +0000
Received: from [2a01:4f9:c011:1c83::1] (helo=courrier.aliel.fr)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4c3K-0000000GQY5-0bF7;
	Mon, 23 Mar 2026 09:58:32 +0000
From: Ronald Claveau <linux-kernel-dev@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1774259901;
	bh=AO4tgBsQ5yd9Qo2dDaY+wcNu1us7EFs06fTrqRlHBYM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Jh2jvneyE74Am2thzy9WlW47Gi0DtfluNkcEjr7ZRHfcR5zVN/4audqf7fagm2pxO
	 FsV+ySupdlB3PiRryb3FNbCKtX9bgfEE5kagpR0auZ9JbbGjMVMYz1ATDj6yY1n611
	 4tp1es03xYgthWOnCQsMmdVRobzSMAH6yIb/EltE=
Date: Mon, 23 Mar 2026 10:55:30 +0100
Subject: [PATCH v3 5/9] arm64: dts: amlogic: t7: Add PWM controller nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-add-emmc-t7-vim4-v3-5-5159d90a984c@aliel.fr>
References: <20260323-add-emmc-t7-vim4-v3-0-5159d90a984c@aliel.fr>
In-Reply-To: <20260323-add-emmc-t7-vim4-v3-0-5159d90a984c@aliel.fr>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
 Johannes Berg <johannes@sipsolutions.net>, van Spriel <arend@broadcom.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mmc@vger.kernel.org, linux-wireless@vger.kernel.org, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>, Nick Xie <nick@khadas.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openssh-sha256; t=1774259895; l=2868;
 i=linux-kernel-dev@aliel.fr; s=id_ed25519; h=from:subject:message-id;
 bh=AO4tgBsQ5yd9Qo2dDaY+wcNu1us7EFs06fTrqRlHBYM=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgMGec55oxeeisqykQiUedekMYyOnR9
 BG9E/7rDWyqdNoAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QJZSR1SMHxPM+6QdLs5pPY8OawAIsaGLhfGtKLJB4Nlbb0tJsEL5bhXobDp4DjYkDd1IsmXRpDo
 CrkA2mHLA/A8=
X-Developer-Key: i=linux-kernel-dev@aliel.fr; a=openssh;
 fpr=SHA256:kch4osYZ6A1BrPps5AUs6KnfdE2wm4ocMtyTc8TmZMs
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_025830_484141_BCB877A1 
X-CRM114-Status: UNSURE (   7.88  )
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

Add device tree nodes for the seven PWM controllers available
on the Amlogic T7 SoC, using amlogic,meson-s4-pwm as fallback compatible.
All nodes are disabled by default and should be
enabled in the board-specific DTS file.

Co-developed-by: Nick Xie <nick@khadas.com>
Signed-off-by: Nick Xie <nick@khadas.com>
Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
---
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 63 +++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
index 6d41de6f895b4..a0261cd8eadfc 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
@@ -511,6 +511,69 @@ sec_ao: ao-secure@10220 {
 				amlogic,has-chip-id;
 			};
 
+			pwm_ao_ef: pwm@30000 {
+				compatible = "amlogic,t7-pwm", "amlogic,meson-s4-pwm";
+				reg = <0x0 0x30000 0x0 0x24>;
+				clocks = <&clkc_periphs CLKID_PWM_AO_E>,
+					 <&clkc_periphs CLKID_PWM_AO_F>;
+				#pwm-cells = <3>;
+				status = "disabled";
+			};
+
+			pwm_ao_gh: pwm@32000 {
+				compatible = "amlogic,t7-pwm", "amlogic,meson-s4-pwm";
+				reg = <0x0 0x32000 0x0 0x24>;
+				clocks = <&clkc_periphs CLKID_PWM_AO_G>,
+					 <&clkc_periphs CLKID_PWM_AO_H>;
+				#pwm-cells = <3>;
+				status = "disabled";
+			};
+
+			pwm_ab: pwm@58000 {
+				compatible = "amlogic,t7-pwm", "amlogic,meson-s4-pwm";
+				reg = <0x0 0x58000 0x0 0x24>;
+				clocks = <&clkc_periphs CLKID_PWM_A>,
+					 <&clkc_periphs CLKID_PWM_B>;
+				#pwm-cells = <3>;
+				status = "disabled";
+			};
+
+			pwm_cd: pwm@5a000 {
+				compatible = "amlogic,t7-pwm", "amlogic,meson-s4-pwm";
+				reg = <0x0 0x5a000 0x0 0x24>;
+				clocks = <&clkc_periphs CLKID_PWM_C>,
+					 <&clkc_periphs CLKID_PWM_D>;
+				#pwm-cells = <3>;
+				status = "disabled";
+			};
+
+			pwm_ef: pwm@5c000 {
+				compatible = "amlogic,t7-pwm", "amlogic,meson-s4-pwm";
+				reg = <0x0 0x5c000 0x0 0x24>;
+				clocks = <&clkc_periphs CLKID_PWM_E>,
+					 <&clkc_periphs CLKID_PWM_F>;
+				#pwm-cells = <3>;
+				status = "disabled";
+			};
+
+			pwm_ao_ab: pwm@5e000 {
+				compatible = "amlogic,t7-pwm", "amlogic,meson-s4-pwm";
+				reg = <0x0 0x5e000 0x0 0x24>;
+				clocks = <&clkc_periphs CLKID_PWM_AO_A>,
+					 <&clkc_periphs CLKID_PWM_AO_B>;
+				#pwm-cells = <3>;
+				status = "disabled";
+			};
+
+			pwm_ao_cd: pwm@60000 {
+				compatible = "amlogic,t7-pwm", "amlogic,meson-s4-pwm";
+				reg = <0x0 0x60000 0x0 0x24>;
+				clocks = <&clkc_periphs CLKID_PWM_AO_C>,
+					 <&clkc_periphs CLKID_PWM_AO_D>;
+				#pwm-cells = <3>;
+				status = "disabled";
+			};
+
 			sd_emmc_a: mmc@88000 {
 				compatible = "amlogic,t7-mmc", "amlogic,meson-axg-mmc";
 				reg = <0x0 0x88000 0x0 0x800>;

-- 
2.49.0



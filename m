Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91978106F317
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 10:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lpuPvpputmXigP9y/MoLpfUohF7Jc5dVewdkHY2iCSE=; b=nUx89v/2dtCgdRyVda63q256Yo
	ZvsoV7gQ1oA9bCqq1R4UaZyO18u8xy/nbwYsAsAu5qjo77llDoR0zxZwcvzOXzNcm9BwYMGaYEfux
	yy1bti6f8upf0pTEfu1nBJkHqSgspuXvjjvHwCOs9PPUlMUd/+G7Xz8t8IPAffYJez6V6pJx9knkn
	l2eWEXGWIulGpbhV1KYoGbCwxpTfgj23B5A+TNYhStPOG5XC+71+jza7MHLrZiNBln5+AFkJr9kpg
	HORjhoxnTMR8HoNgsew+VgCDgIo6P3Bs8oFEg+hBH6fEcnFDNRbuXaYALridtnz7hQyM00Zi2Pggu
	14x3jyyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5hXc-00000005D01-3szG;
	Thu, 26 Mar 2026 10:02:16 +0000
Received: from courrier.aliel.fr ([2a01:4f9:c011:1c83::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5hXM-00000005Cq5-1ayX;
	Thu, 26 Mar 2026 10:02:08 +0000
From: Ronald Claveau <linux-kernel-dev@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1774519318;
	bh=DBkxcqH8i/zndCGuudhfjwFmiLRr9uowI0ejXxxndhk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=AKlO01B+ZurdfFkAk74Gujz1YFqPvnAyPJxR1a6frh11NsVrcmjPlFjvrTtZJjrYG
	 IYt/lc0ji+0CiOLJyGhsxDAIKmQ9bSnaIL1LAsQS06ted3TLUaCoWhiTWFOdbJpC++
	 acHNN0yAo02iUdr5KTuSGRflqpLVHTBIpBh2zHfg=
Date: Thu, 26 Mar 2026 10:59:15 +0100
Subject: [PATCH v5 4/9] arm64: dts: amlogic: t7: Add PWM pinctrl nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260326-add-emmc-t7-vim4-v5-4-d3f182b48e9d@aliel.fr>
References: <20260326-add-emmc-t7-vim4-v5-0-d3f182b48e9d@aliel.fr>
In-Reply-To: <20260326-add-emmc-t7-vim4-v5-0-d3f182b48e9d@aliel.fr>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
 Johannes Berg <johannes@sipsolutions.net>, van Spriel <arend@broadcom.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mmc@vger.kernel.org, linux-wireless@vger.kernel.org, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openssh-sha256; t=1774519312; l=3203;
 i=linux-kernel-dev@aliel.fr; s=id_ed25519; h=from:subject:message-id;
 bh=DBkxcqH8i/zndCGuudhfjwFmiLRr9uowI0ejXxxndhk=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgMGec55oxeeisqykQiUedekMYyOnR9
 BG9E/7rDWyqdNoAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QMN+pOUFbhr/CVtM6NNlwHSfhEHtqbR4WXmVkyo2v1uNUZmy84V6T5hHmKsKSCId6fG1CCQezrj
 o+F+2uH3ORw8=
X-Developer-Key: i=linux-kernel-dev@aliel.fr; a=openssh;
 fpr=SHA256:kch4osYZ6A1BrPps5AUs6KnfdE2wm4ocMtyTc8TmZMs
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_030201_834203_839B5DF8 
X-CRM114-Status: UNSURE (   6.71  )
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

These pinctrl nodes are required by the PWM drivers to configure
pin muxing at runtime.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
---
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 136 ++++++++++++++++++++++++++++
 1 file changed, 136 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
index fe1ced0a58967..b66b3d10288f6 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
@@ -307,6 +307,142 @@ mux {
 					};
 				};
 
+				pwm_a_pins: pwm-a {
+					mux {
+						groups = "pwm_a";
+						function = "pwm_a";
+						bias-disable;
+					};
+				};
+
+				pwm_ao_a_pins: pwm-ao-a {
+					mux {
+						groups = "pwm_ao_a";
+						function = "pwm_ao_a";
+						bias-disable;
+					};
+				};
+
+				pwm_ao_b_pins: pwm-ao-b {
+					mux {
+						groups = "pwm_ao_b";
+						function = "pwm_ao_b";
+						bias-disable;
+					};
+				};
+
+				pwm_ao_c_pins: pwm-ao-c {
+					mux {
+						groups = "pwm_ao_c";
+						function = "pwm_ao_c";
+						bias-disable;
+					};
+				};
+
+				pwm_ao_c_hiz_pins: pwm-ao-c-hiz {
+					mux {
+						groups = "pwm_ao_c_hiz";
+						function = "pwm_ao_c_hiz";
+						bias-disable;
+					};
+				};
+
+				pwm_ao_d_pins: pwm-ao-d {
+					mux {
+						groups = "pwm_ao_d";
+						function = "pwm_ao_d";
+						bias-disable;
+					};
+				};
+
+				pwm_ao_e_pins: pwm-ao-e {
+					mux {
+						groups = "pwm_ao_e";
+						function = "pwm_ao_e";
+						bias-disable;
+					};
+				};
+
+				pwm_ao_f_pins: pwm-ao-f {
+					mux {
+						groups = "pwm_ao_f";
+						function = "pwm_ao_f";
+						bias-disable;
+					};
+				};
+
+				pwm_ao_g_pins: pwm-ao-g {
+					mux {
+						groups = "pwm_ao_g";
+						function = "pwm_ao_g";
+						bias-disable;
+					};
+				};
+
+				pwm_ao_g_hiz_pins: pwm-ao-g-hiz {
+					mux {
+						groups = "pwm_ao_g_hiz";
+						function = "pwm_ao_g_hiz";
+						bias-disable;
+					};
+				};
+
+				pwm_ao_h_pins: pwm-ao-h {
+					mux {
+						groups = "pwm_ao_h";
+						function = "pwm_ao_h";
+						bias-disable;
+					};
+				};
+
+				pwm_b_pins: pwm-b {
+					mux {
+						groups = "pwm_b";
+						function = "pwm_b";
+						bias-disable;
+					};
+				};
+
+				pwm_c_pins: pwm-c {
+					mux {
+						groups = "pwm_c";
+						function = "pwm_c";
+						bias-disable;
+					};
+				};
+
+				pwm_d_pins: pwm-d {
+					mux {
+						groups = "pwm_d";
+						function = "pwm_d";
+						bias-disable;
+					};
+				};
+
+				pwm_e_pins: pwm-e {
+					mux {
+						groups = "pwm_e";
+						function = "pwm_e";
+						bias-disable;
+					};
+				};
+
+				pwm_f_pins: pwm-f {
+					mux {
+						groups = "pwm_f";
+						function = "pwm_f";
+						bias-disable;
+					};
+				};
+
+				pwm_vs_pins: pwm-vs {
+					mux {
+						groups = "pwm_vs";
+						function = "pwm_vs";
+						bias-disable;
+					};
+				};
+
 				sdcard_pins: sdcard {
 					mux {
 						groups = "sdcard_d0",

-- 
2.49.0



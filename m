Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EACFE85385
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Apr 2026 16:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f+uHMPmn65nf4xfn83FGk5CdKaMUfgweu+nZ5kCt3uw=; b=YAcMMA1Uh6Bi6ezrnLw/fAamHG
	Pn9bPGIH0fZxw76+1mQVLXQrX124G8TcXuRz96il1muYiLpZDbtInkiPdy5W2pWZnTDSW6fpziHXQ
	wvF/DTyX3yy3OJ02vBaGeFlnHDoW6ZVsLxjbXxMEy19lSdwX8gBlA999PEOkyAXHfJV0RV+SQrrtE
	An+zxJh/95hMAH8W/p2F8nJpaIHdLxId42r7nWaSHolqUPQ06ZrhbEQZVzV43BPXlyjFpllE9dIk0
	/9gZh926e4je5Mk0HAAyJUogkTrgvATltlB4QpoZtVXJsmIGnaNMBRNtTpY4oowcWzwDRTM3u3+/B
	xSXRDUJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8h5N-00000002GB2-3PFg;
	Fri, 03 Apr 2026 16:09:29 +0000
Received: from courrier.aliel.fr ([65.21.61.41])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8h5K-00000002G6j-0JOj;
	Fri, 03 Apr 2026 16:09:27 +0000
From: Ronald Claveau <linux-kernel-dev@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1775232561;
	bh=Y66wwsu4uCJ5vCnrkH5iYoYFi2DeQ8efaTE8Rt+0Rik=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=LnTvwpkMx771x6nRMdFlVudAEKFabKfAf9/d0xkkrYpRZWgqam3aViXjyt8shUWDu
	 GJbBHxwtoybWR+mL8YHwO685pYILWhjVCeAPHoVJ58u3W1HrDLQjsu1ec/yxxVbU/P
	 Lvd3uyDWUMlk1KZsAO3V7Woudt4xm8Q/DyXamun4=
Date: Fri, 03 Apr 2026 18:08:39 +0200
Subject: [PATCH v2 6/8] arm64: dts: amlogic: t7: Add i2c pinctrl node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260403-add-mcu-fan-khadas-vim4-v2-6-70536b22439a@aliel.fr>
References: <20260403-add-mcu-fan-khadas-vim4-v2-0-70536b22439a@aliel.fr>
In-Reply-To: <20260403-add-mcu-fan-khadas-vim4-v2-0-70536b22439a@aliel.fr>
To: Neil Armstrong <neil.armstrong@linaro.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Beniamino Galvani <b.galvani@gmail.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openssh-sha256; t=1775232553; l=835;
 i=linux-kernel-dev@aliel.fr; s=id_ed25519; h=from:subject:message-id;
 bh=Y66wwsu4uCJ5vCnrkH5iYoYFi2DeQ8efaTE8Rt+0Rik=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgMGec55oxeeisqykQiUedekMYyOnR9
 BG9E/7rDWyqdNoAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QPsdm36JJcZByW1pADuyo5JpuH9aWQy2RcwjJ+3DsRcX8aJUcMiuWkoxy6rs3MsOcOzR0qTWkVM
 R0IKuLXm1ZAw=
X-Developer-Key: i=linux-kernel-dev@aliel.fr; a=openssh;
 fpr=SHA256:kch4osYZ6A1BrPps5AUs6KnfdE2wm4ocMtyTc8TmZMs
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_090926_273688_EA9E4A45 
X-CRM114-Status: UNSURE (   7.71  )
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

Add the T7 pinctrl used by the Khadas VIM4 for MCU communication.

Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
---
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
index 7fe72c94ed623..e96fe10b251a0 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
@@ -376,6 +376,16 @@ mux {
 					};
 				};
 
+				i2c0_ao_d_pins: i2c0-ao-d {
+					mux {
+						groups = "i2c0_ao_sck_d",
+							 "i2c0_ao_sda_d";
+						function = "i2c0_ao";
+						bias-disable;
+						drive-strength-microamp = <3000>;
+					};
+				};
+
 				pwm_a_pins: pwm-a {
 					mux {
 						groups = "pwm_a";

-- 
2.49.0



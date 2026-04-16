Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60710F8A145
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Apr 2026 08:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vkqdIt7AZKVz+ZUnqIYZDMDrZ1Obg+4QA04OEZQ9DZA=; b=c1hzBgYwXk+62VXHmidToA0CBv
	VCN/sK11/Fyb4W7ES62n4bD5tVAHGqmbMY9OwlQvk/n4LtOJbtJqLKNy5CUGeh9qyyHoLvtcoghE+
	GEqPNC82cv7JKPHKNQmD3bPjGFNqTB2/UOsF1kWz6jSjBguq9YrRXEZP3yhWZfdSbMZFYPC2e9zkH
	0y7ZMvEV9obTLfoc52BXeLTfxGPJE2kP8HHlZpMv5U7E5WF4o6VPveyR6GOuJAZWV7/dLKTdzRaFu
	yhvaORoLQ30sLsjDVMQmKi56JVVYODN5Dno9yiNBo0BdrRdlhP8mRcJOPDmzxhHEJD5/vep61wX41
	oIHqjCEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDIVK-00000002CEI-3KTh;
	Thu, 16 Apr 2026 08:55:18 +0000
Received: from courrier.aliel.fr ([65.21.61.41])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDIVD-00000002CAr-1yiF;
	Thu, 16 Apr 2026 08:55:14 +0000
From: Ronald Claveau <linux-kernel-dev@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1776329705;
	bh=5dwFJADDv48q8TA8PHHEBjFP0VQQwZ8DdLYNIrtO1DM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Iq5somVuCyWlQilOgH/ZxtHnN1jxREwHZzBPSmAyaSelKk9tIpqVt/uegn+SV8cwh
	 Md5ztRSjNk2xngY1fIRyh1KvQR+Xgki4+f3IdYnZ+DyYAAYINiz1s3mIyQ0O7mJnbd
	 KlLvvRrbcqICEqPNHRdfFvSNLJb1IHJvoh4DSlHk=
Date: Thu, 16 Apr 2026 10:54:42 +0200
Subject: [PATCH v2 3/3] arm64: dts: amlogic: t7: khadas-vim4: Enable
 Bluetooth
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260416-add-bluetooth-t7-vim4-v2-3-9a57098fd055@aliel.fr>
References: <20260416-add-bluetooth-t7-vim4-v2-0-9a57098fd055@aliel.fr>
In-Reply-To: <20260416-add-bluetooth-t7-vim4-v2-0-9a57098fd055@aliel.fr>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openssh-sha256; t=1776329703; l=1625;
 i=linux-kernel-dev@aliel.fr; s=id_ed25519; h=from:subject:message-id;
 bh=5dwFJADDv48q8TA8PHHEBjFP0VQQwZ8DdLYNIrtO1DM=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgMGec55oxeeisqykQiUedekMYyOnR9
 BG9E/7rDWyqdNoAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QIXwE2g0xgSsmV0hMeQZGNLsN5zJJxnJdIYbj2GsE+ydRVdwZz4D3k2FSgT+Uoz5xMvr/XOJKQx
 xERIPUljPBwc=
X-Developer-Key: i=linux-kernel-dev@aliel.fr; a=openssh;
 fpr=SHA256:kch4osYZ6A1BrPps5AUs6KnfdE2wm4ocMtyTc8TmZMs
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260416_015511_673999_80C2181C 
X-CRM114-Status: UNSURE (   8.50  )
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

Enable UART C on the Khadas VIM4 board and attach the BCM43438
 compatible Bluetooth controller to it. The node configures the RTS/CTS
hardware flow control, the associated pinmux, the power supplies (vddao_3v3
and vddao_1v8), the 32 kHz LPO clock shared with the wifi32k fixed
clock, and the GPIO lines used for host wakeup, device wakeup and
shutdown.

Remove clocks and clock-names for UART A, as they are defined in DTSI.

Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
---
 .../dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts   | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
index 69d6118ba57e7..8ea7ae609fbd5 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
@@ -250,6 +250,23 @@ &sd_emmc_c {
 
 &uart_a {
 	status = "okay";
-	clocks = <&xtal>, <&xtal>, <&xtal>;
-	clock-names = "xtal", "pclk", "baud";
+};
+
+&uart_c {
+	status = "okay";
+	pinctrl-0 = <&uart_c_pins>;
+	pinctrl-names = "default";
+	uart-has-rtscts;
+
+	bluetooth {
+		compatible = "brcm,bcm43438-bt";
+		shutdown-gpios = <&gpio GPIOX_17 GPIO_ACTIVE_HIGH>;
+		host-wakeup-gpios = <&gpio GPIOX_18 GPIO_ACTIVE_HIGH>;
+		device-wakeup-gpios = <&gpio GPIOX_19 GPIO_ACTIVE_HIGH>;
+		max-speed = <3000000>;
+		clocks = <&wifi32k>;
+		clock-names = "lpo";
+		vbat-supply = <&vddao_3v3>;
+		vddio-supply = <&vddao_1v8>;
+	};
 };

-- 
2.49.0



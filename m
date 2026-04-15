Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE129F41994
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 11:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s9lYJru2GM+FKW8Jl5yMMBWMFfrylLGdUZlT1eQ7Tow=; b=5CPWyZPLtuufs4n9/LqDVcWG+K
	IrvUD9e46ISXGjjdhFdJ5YT4bSfLILx+/WHtZFJ7WO25vLmA7qSy6LwHWjWNz4LnIvntvZGEuV0od
	/skj2CBYTk5ae+z1314Du7N0Ewv6+GImchqQ23zIQjQx5KG21R14J9InGP07Wut0lHm8Y59iHwuRC
	IVrYy34VRPC/X4AQewUCtMLwRVdtCaaT3d1sBM0Kt7OE11bMq4sZo9telu1bKr1vbvlCAFMoZE51S
	+PsoZBVdEzap8ai33Vkt79/LfhKKlOhNe8BHs2khBX5l/9MwB+SoKyBlo2Cccd0nC54sWFG0fdMqm
	PaAFo1yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCyFB-000000011x9-14Pd;
	Wed, 15 Apr 2026 11:17:17 +0000
Received: from courrier.aliel.fr ([65.21.61.41])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCyF2-000000011ru-0eQv;
	Wed, 15 Apr 2026 11:17:11 +0000
From: Ronald Claveau <linux-kernel-dev@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1776251824;
	bh=DPF5oLsd+wIQDlajlz7/DrzffaotuK1YeTV2FHM1dXA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=GsP1+XjDJww6lCTw794owyPZ3ca2t0rhzZVINkruIhQCdzjo9P34XbJ6t9GUn5N1a
	 B4Faeqx4cce/dJM93jcwc677jxKpnMJgHQyfbENIQOEvNLwuOwzHcWXakv44JRkThE
	 Qnmlhgzw/PWESlL+qe6CtXlpQUrqsh67ZiPPDikU=
Date: Wed, 15 Apr 2026 13:16:15 +0200
Subject: [PATCH 3/3] arm64: dts: amlogic: t7: khadas-vim4: Enable Bluetooth
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260415-add-bluetooth-t7-vim4-v1-3-0ba0746cc1d6@aliel.fr>
References: <20260415-add-bluetooth-t7-vim4-v1-0-0ba0746cc1d6@aliel.fr>
In-Reply-To: <20260415-add-bluetooth-t7-vim4-v1-0-0ba0746cc1d6@aliel.fr>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openssh-sha256; t=1776251821; l=1497;
 i=linux-kernel-dev@aliel.fr; s=id_ed25519; h=from:subject:message-id;
 bh=DPF5oLsd+wIQDlajlz7/DrzffaotuK1YeTV2FHM1dXA=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgMGec55oxeeisqykQiUedekMYyOnR9
 BG9E/7rDWyqdNoAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QHMu5b9QHNxDA3A4bpPrtdDYFK+0IKIqopw2UudLPschxzYakCFITJJZ2h6EMjD4t4JxAa5DZ7a
 jCTwma54TBwA=
X-Developer-Key: i=linux-kernel-dev@aliel.fr; a=openssh;
 fpr=SHA256:kch4osYZ6A1BrPps5AUs6KnfdE2wm4ocMtyTc8TmZMs
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_041708_618088_10E8A673 
X-CRM114-Status: UNSURE (   6.97  )
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

Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
---
 .../dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts     | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
index 69d6118ba57e7..16f648908090f 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
@@ -253,3 +253,22 @@ &uart_a {
 	clocks = <&xtal>, <&xtal>, <&xtal>;
 	clock-names = "xtal", "pclk", "baud";
 };
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
+};

-- 
2.49.0



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5B8BF36C5E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 11:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6b8uJQbxrFh/Xc4Hnzw/IbQYOxVmTn03NkXuWKFvoe0=; b=Epk9+sPRtpquQcaMUEApDbleYS
	R3txNxJS+tQrujACJuuYpTsEQeSSa4HYJdppVjvkCYDOxJiMv+m5a08SB99N0QoaZUBEhL39z8hZJ
	ujbdYpwvrHAqnawJ23nyrszkz/OnqKAStY61W1Qu4mJfR4ZP87Zb655uUHVWim/i3S7uqyo7ATLkL
	Xou9DP+E/qPGimQUNvQMoXl/hpAQRAPraIVB0sxXbIgo3BSvfMIKC4KWNjMbIvkjGyIy2iKbDwsZ7
	JVZ0i3i98Kd1fdPwh4KH02wje498EjOxDAu9pzO+0z88gilAinPIf62lGvQaz0lzsFvTBUFDdHUXS
	FlGRTrRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEnGu-00000006ple-0HS8;
	Mon, 20 Apr 2026 11:58:37 +0000
Received: from courrier.aliel.fr ([65.21.61.41])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEnGq-00000006piS-1Tdw;
	Mon, 20 Apr 2026 11:58:34 +0000
From: Ronald Claveau <linux-kernel-dev@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1776686308;
	bh=lyciA6D1svothfyq1FxMYi4aiIW3PQdO74tZM2hpXA4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=dpm+XCED6KKE42lYOacYUaSZMwedLU7WM+KkajzWdwy3k8OKdVB8fDglKi/6r792f
	 m4vm9GA4d6Uey+xUOWsn+6wEsLbtKPzj5SDDMn5+FBPBuE8cykOVXmy3VZ0BlyTsQO
	 ytPLuyi5eEmzfV1zhyqQxtBLDW2HgYC1XSun0wLg=
Date: Mon, 20 Apr 2026 13:58:09 +0200
Subject: [PATCH v3 1/4] arm64: dts: amlogic: t7: Add uart_c pinctrl pins
 group
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260420-add-bluetooth-t7-vim4-v3-1-669cd2530ae5@aliel.fr>
References: <20260420-add-bluetooth-t7-vim4-v3-0-669cd2530ae5@aliel.fr>
In-Reply-To: <20260420-add-bluetooth-t7-vim4-v3-0-669cd2530ae5@aliel.fr>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openssh-sha256; t=1776686305; l=985;
 i=linux-kernel-dev@aliel.fr; s=id_ed25519; h=from:subject:message-id;
 bh=lyciA6D1svothfyq1FxMYi4aiIW3PQdO74tZM2hpXA4=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgMGec55oxeeisqykQiUedekMYyOnR9
 BG9E/7rDWyqdNoAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QIXP3GgOE1T359EuuEL+ssPLRwBHZFf5VYd7Zwf5tg1+ZcPGtb9cZ3ErTKRQI8EIKrJ05twK2Hu
 LLRC45H0RPAA=
X-Developer-Key: i=linux-kernel-dev@aliel.fr; a=openssh;
 fpr=SHA256:kch4osYZ6A1BrPps5AUs6KnfdE2wm4ocMtyTc8TmZMs
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_045832_840993_588A6BA4 
X-CRM114-Status: UNSURE (   6.90  )
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

Add the pin multiplexing configuration for UART C (TX, RX, CTS, RTS)
in the T7 SoC pinctrl node, required to route the UART C signals
through the correct pads before enabling the controller.

Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
---
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
index 7fe72c94ed623..4a55d9641bc9b 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
@@ -553,6 +553,18 @@ mux {
 						bias-pull-up;
 					};
 				};
+
+				uart_c_pins: uart-c {
+					mux {
+						groups = "uart_c_tx",
+							 "uart_c_rx",
+							 "uart_c_cts",
+							 "uart_c_rts";
+						bias-pull-up;
+						output-high;
+						function = "uart_c";
+					};
+				};
 			};
 
 			gpio_intc: interrupt-controller@4080 {

-- 
2.49.0



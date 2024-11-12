Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D3ECD32D8E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 10:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bCuegBBVW1sjOHehuh1xA9YfcZ3csRC5BV5QDD496AU=; b=NSJucoAQbCFQ2XvnXUe+PWsz97
	MXMOZ2VAP6DfXvW4ZaVGkyZdcvshRvsPYhzzOHq87zolx76mpImTxY6LquTd549iKcD615rsIpnih
	fKPFrDhFJQqFDwqrW8GCpJgzwlK8BqieWcRhxSY548vaHUK4RTD0+PNp6X9DVDUt36DE9byfuCXGm
	Gm82xFuy1MP9AVWyf0gsAPugipGdjLG+YaBL02BG9mS3J8oEJJwtt9fdya6m61cDCuXiY+fGWInFx
	7yNYks//43/4ods3feSHp57c/3tHC3a++KOffDtwkncZ6bpW619r4v51XWjJMzmzcb7Y22kfV+JAY
	bLm1g7Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAoRP-000000036i8-1JMD;
	Tue, 12 Nov 2024 10:48:11 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAo6x-000000032fT-0RZn;
	Tue, 12 Nov 2024 10:27:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 409725C487C;
	Tue, 12 Nov 2024 10:26:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E25D5C4CEE2;
	Tue, 12 Nov 2024 10:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731407221;
	bh=vtW0zqCvu/7PcjVcBMetFW5EL06QFiJJsTszr/QpcAM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=cR6FWSOJq9rpCwwXdgxVmQP7R5knRpOhqay/DNAjzKAiWPh+HYrE6Zza0lF+qc18w
	 NgTyNg2X4bhOjPVEBCoLxLNA7rhyS/X0itPIRQX02CeDGTbEtLKh1+qYfAZGwGq6+p
	 nkIcU2h3/lXZbnzuKWWTPRvKKiXBDZOViC/U/87gmsVfM6isjm4y0HC5yVWIqzl63/
	 tOsffAyOexNuOT3aaxL7GkJz35Qps4V7owN5ANQab+ruIgsrnsyPFxc+XmMoyts4rr
	 qyzaOsGihuhK5OKhEh6G++xjddbWv7tmRrrC9EUY9MCEPyC7nexL+8LNke2/RJ+pvJ
	 pvlSOuH0d3AxA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8FCED32D8E;
	Tue, 12 Nov 2024 10:27:01 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Tue, 12 Nov 2024 18:26:59 +0800
Subject: [PATCH v5 5/5] arm64: dts: amlogic: a4: add pinctrl node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241112-a4_pinctrl-v5-5-3460ce10c480@amlogic.com>
References: <20241112-a4_pinctrl-v5-0-3460ce10c480@amlogic.com>
In-Reply-To: <20241112-a4_pinctrl-v5-0-3460ce10c480@amlogic.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1731407219; l=1565;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=nKCCbUPNk3y0XRbQQLJjYPANI2XzJmIa9kc9W/f1TVs=;
 b=rrPl0ceaIeueiBSBwRdlMVROk2yPQ3909huui40HC2imttx0oDKbPeBIivUFU/BmEw/zVjAJv
 VcLbfewBb2MAPingnxO6l+sfB0hP+/uk96UXrgk6BpyZpg+gB7pK2EC
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_022703_348923_6965907C 
X-CRM114-Status: UNSURE (   9.38  )
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
Reply-To: xianwei.zhao@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

Add pinctrl device to support Amlogic A4.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi | 36 +++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi
index de10e7aebf21..a176faf7f1ef 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi
@@ -5,6 +5,7 @@
 
 #include "amlogic-a4-common.dtsi"
 #include <dt-bindings/power/amlogic,a4-pwrc.h>
+#include <dt-bindings/gpio/amlogic-gpio.h>
 / {
 	cpus {
 		#address-cells = <2>;
@@ -48,3 +49,38 @@ pwrc: power-controller {
 		};
 	};
 };
+
+&apb {
+	periphs_pinctrl: pinctrl@4000 {
+		compatible = "amlogic,a4-periphs-pinctrl";
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges = <0x0 0x0 0x0 0x4000 0x0 0x02e0>;
+
+		gpio: bank@0 {
+			reg = <0x0 0x0 0x0 0x0050>,
+			      <0x0 0xc0 0x0 0x0220>;
+			reg-names = "mux", "gpio";
+			gpio-controller;
+			#gpio-cells = <3>;
+			gpio-ranges = <&periphs_pinctrl 0 0 73>;
+		};
+	};
+
+	aobus_pinctrl: pinctrl@8e700 {
+		compatible = "amlogic,a4-aobus-pinctrl";
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges = <0x0 0x0 0x0 0x8e700 0x0 0x0064>;
+
+		ao_gpio: bank@0 {
+			reg = <0x0 0x00 0x0 0x04>,
+			      <0x0 0x04 0x0 0x60>;
+			reg-names = "mux", "gpio";
+			gpio-controller;
+			#gpio-cells = <3>;
+			gpio-ranges = <&aobus_pinctrl 0 0 8>;
+		};
+	};
+
+};

-- 
2.37.1




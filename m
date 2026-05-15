Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13379CD4F25
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 01:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FPD6IywSZnrD27yDLSyDvvak94+4lO6RGWvtYSIoN0c=; b=vprGX4EVSPGElnlPOEjKA8SEle
	KItN/I4VYNQl7HBO+mcrWDiNBDBnFKh9OOG7E2uuW2xUewvQZqcPRUEczVJIVcFbCj0cRBXW8Q77D
	OiMGMzOh3x1aGKnh5wfoQkfvlieG6qH7Gd2Et6JHAX7mRrpCwy8TFqVo7mJ2DR+RmY5/+4WBjXWOx
	jlMFWReioZFTPP+mJTRB97d/56vS6PIjRXneg21F2kAZffh/yHKatSiuCjdw5vXQDjegIe8iu6Rm0
	YU3CZ2j7zNSRKqEtOZ83oPqlmQ+IZET3ubEnwIcdY7wFb1qZIx6vYXRFpEmNMihyCvXSuq5AMujcr
	M3Nnfp1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNhBF-00000006zOV-244T;
	Fri, 15 May 2026 01:17:33 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNhBC-00000006zNU-2jfE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 01:17:31 +0000
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c69:1da4:3c70:f102:9ea:5df7])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id F2EEE8FA;
	Fri, 15 May 2026 03:17:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778807839;
	bh=p5dIUacsdc61vj2qf0gBR53uOK91lDwLXjQqK5PFL8Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=mJGm0w54tTrC7/itkWlkuDEBnEo2Pu/83IJTuhSOjKaCzXMCydD+3As4stKeYrfSL
	 A3qkoRF1fksdzN/I39SGMf7Tl1I5SdEcYUP7DMcshuI8jQFoSFD45W/xM73fnTb6Ry
	 JhmBeq8p4m5C0p7uXl7cCFt1r3+WlBfCcV7hBN/A=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Fri, 15 May 2026 06:46:36 +0530
Subject: [PATCH v2 1/4] arm64: dts: ti: k3-am67a-beagley-ai: Add I2C2
 pinctrl
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-beagley-cameras-v2-1-f6acb66c9995@ideasonboard.com>
References: <20260515-beagley-cameras-v2-0-f6acb66c9995@ideasonboard.com>
In-Reply-To: <20260515-beagley-cameras-v2-0-f6acb66c9995@ideasonboard.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Robert Nelson <robertcnelson@gmail.com>, Andrew Davis <afd@ti.com>, 
 Devarsh Thakkar <devarsht@ti.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1102;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=p5dIUacsdc61vj2qf0gBR53uOK91lDwLXjQqK5PFL8Q=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBqBnQZiQzcrY3I0fuPDmOcfwFksh1ewRRpO4sVX
 aAkga6Klw6JAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCagZ0GQAKCRBD3pH5JJpx
 RfHxD/4t5tXUm8X/HEfntVHw9mTx1AuCZqXjhPJFyUsjJWAwosLxLejG35K4EnpaebVB46f+ENe
 XFGKPqNgMJGCkDwOKnGURTq0QbBAM7O0WVbujBYQKrbqMI4R/pnIKWqoUDvqNbkqa9PszJsCCQr
 noQAWwixPhoW8jOLjw6lm1kJvYtClXeB5Tzt82JkGaATO4wiJedO2rkKcZ5mF52ZN/EvPsjiuhc
 DrYWvIvUgF2ENRea9R+gqdvxKmkK+2DrNYZQEmMmo7ISP9RLol9yAnZwRvcsVYtUYH0Sr//7+Sz
 7GwE5he6mmzFrxR/9PoOUtg8ucCifYOXXuxabSg3MhAYzvXjDvz5C0PjLCN1UTGlfHK6Nlbmjcg
 9qrIr5gfIAM+96PV01G5RACj9tiRlBuS71+xkr1F7k59/3aiu4VpzLgrGGgWu+ziOfC5IPPbybQ
 02nhHB5ePM9Ww7GIRUneoE10FOvT8+xv5Z1WhbEu7RJ1+wp+5epLoQvB780mfHB7hZWw9AxVgzR
 XuEwst+T/zkTzk7YHPE7xfN5bCEdjNso8lAYBo2gfPZuUOXfshz7UlPM7myWY+JxGCwaK1RxBOk
 Y7ozDfyHkT+TqFKcYscpNIfL2SLvZIg3kyQeO1W+JJRtPDsmM6bu4sZZJv6Zcwowokh1aJYTEvc
 gfbD1JJ/I16ffNA==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_181730_824850_459FEB69 
X-CRM114-Status: UNSURE (   7.92  )
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

I2C2 is used by camera sensor devices connected on the 22-pin CSI0
connector. Add the pin definition here so I2C2 may be enabled by the
camera sensor overlays.

Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts b/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts
index 5255e04b9ac7..06aac02a7668 100644
--- a/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts
+++ b/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts
@@ -157,6 +157,13 @@ J722S_IOPAD(0x01e4, PIN_INPUT_PULLUP, 0) /* (B22) I2C0_SDA */
 		bootph-all;
 	};
 
+	main_i2c2_pins_default: main-i2c2-default-pins {
+		pinctrl-single,pins = <
+			J722S_IOPAD(0x00b0, PIN_INPUT_PULLUP, 1) /* (P22) GPMC0_CSn2.I2C2_SCL */
+			J722S_IOPAD(0x00b4, PIN_INPUT_PULLUP, 1) /* (P23) GPMC0_CSn3.I2C2_SDA */
+		>;
+	};
+
 	main_uart0_pins_default: main-uart0-default-pins {
 		pinctrl-single,pins = <
 			J722S_IOPAD(0x01c8, PIN_INPUT, 0)	/* (A22) UART0_RXD */

-- 
2.54.0



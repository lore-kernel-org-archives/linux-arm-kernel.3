Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD8EFC624DE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 09:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uRcOLGshUwMubr13sEH22itNKo4w87gkUAg3RBs8XTQ=; b=xdoQ3cOxvJo5I+Ey2KtxYZLEBP
	n6hQopIFuvkE/BQ5o0ymBb0WovQf8gvkGwA1jcX/TPHeOyeEXk5p/GBfYnEyT+ZUyZl6e7guIibTO
	ba1IzHoQorI8qxiSAOGoqjHF0iFXzaPYHEV/GrM27w5WP5VGjxgNlszBigEZkhatOBKjfoGS4XKxm
	+gemoKQDQd6QGrFI9BzUiOPs9gHzqkP3Rho3F3ThUbcLAKcW7Jy65M+4PRLYbZ3koUoFvbcdHYLYS
	7BR++QmxhOXMbJUphQlYfmXhba2w6XGTyx0UY/02qBE5S92hWQ4tpSshjagGnbx1zkdXTrZdNR0OJ
	wV0VO2Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2QA1-00000001WjN-0NbM;
	Fri, 04 Sep 2026 09:24:37 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Q9y-00000001WiO-0MfQ;
	Fri, 04 Sep 2026 09:24:35 +0000
From: Gregor Herburger <gregor.herburger@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788513871;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=uRcOLGshUwMubr13sEH22itNKo4w87gkUAg3RBs8XTQ=;
	b=OA4bB5V25fI+w4ai7W7aokYoIrX/nQl+0naRsjtCoXRNjmEuuTFq1PuWdizMPoClS1FqLY
	lVu+cM7k0zNSdsccXWtay++qOZS+kiMtYduivc0XDPY3xdAy1QfQ/wTUof+WEasrjRt3RK
	hwtM96pj7/VCtERby0OcKR/kFRZHXNpJ6+kauu1QT9/p779xzATS9Ulw5ro6jrbJxl0LF9
	G+E146o2iAeupwtuCCQLG1YuLnb7AZAk8h93sCnSTwsQJqSMn+fPxT33uyvtLGVLwfwN1c
	DkwMKHLJfYfUsyeq52G5XF4dlHLV4zH51dgj9XjGA52K7DWlaSeHtlRrfyRX7g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788513871;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=uRcOLGshUwMubr13sEH22itNKo4w87gkUAg3RBs8XTQ=;
	b=yDfu2oAZvECB0128kbj5Vdz9Z3FA9krI/MsoYFD24//pc6aOM5W+D77sJeTuZDBX0EfgDu
	ZzZAUQEVIGkvUCAA==
Date: Fri, 04 Sep 2026 11:24:24 +0200
Subject: [PATCH v2] arm64: dts: broadcom: bcm2712-rpi-5-b: add spi0
 interface
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-bcm2712-spi-v2-1-6f8fdfb030bc@linutronix.de>
X-B4-Tracking: v=1; b=H4sIAEeOmmoC/22NwQ6CMBAFf4Xs2Zq2VEo88R+Ggy1bWaMtaQvBE
 P5dwKvHSebNWyBhJExwLRaIOFGi4DeQpwJsf/cPZNRtDJLLitdCMGPfUgvJ0kCsUspo7hBL42B
 bDBEdzUft1v44jeaJNu+J3egp5RA/x90kdu9/eRKMM2WF5nVXXpQxzYv8mGPwNJ87hHZd1y/0p
 1+evAAAAA==
X-Change-ID: 20260811-bcm2712-spi-644b70fee3bf
To: Andrea della Porta <andrea.porta@suse.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Gregor Herburger <gregor.herburger@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788513871; l=2137;
 i=gregor.herburger@linutronix.de; s=20260226; h=from:subject:message-id;
 bh=o5iSOI7M/lthq0a5VG6OAVfUQXjNS9w7x0iv3wmBH4Q=;
 b=nYsKLuV/n3m1wF05Y1Z3yx+f9hUSqV8pKBK/zWzHzGy/jt4PhwKDzV8spWRiZ0hXu21KP16p6
 IepOf1ACcl1D/UrrZwnDpOMFidcRjVkuc/CGN26Y5pVqe6r/7mXaLZn
X-Developer-Key: i=gregor.herburger@linutronix.de; a=ed25519;
 pk=u72Lv7+/lS5CC1hmSrb17lv/6CK7HBh4Lvz77PHA5LM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_022434_269761_69575295 
X-CRM114-Status: UNSURE (   9.73  )
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

The Raspberry Pi 5 routes the spi0 of the rp1 chip to the pin header.
Add the rp1_spi0 node and its pinctrl node to the devicetree to enable
the spi interface.

Signed-off-by: Gregor Herburger <gregor.herburger@linutronix.de>
---
The RP1 chip, found on the raspberry Pi 5, has nine spi controllers. The
spi0 is routed to the pin header. Add the rp1 nodes and enable it for
the Raspberry Pi 5.
---
Changes in v2:
- Drop first patch as it got already applied: https://lore.kernel.org/lkml/20260903194624.2038562-1-florian.fainelli@broadcom.com/
- add cs gpios to rp1_gpio for pinctrl
- Link to v1: https://patch.msgid.link/20260811-bcm2712-spi-v1-0-4c1708d354bb@linutronix.de
---
 arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
index 0fc57e72632ed..0de3d78100a5d 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
+++ b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
@@ -69,6 +69,20 @@ usb_vbus_default_state: usb-vbus-default-state {
 		groups = "vbus1";
 	};
 
+	rp1_spi0_default_state: rp1-spi0-default-state {
+		function = "spi0";
+		groups = "spi0";
+		bias-disable;
+		drive-strength = <12>;
+		slew-rate = <1>;
+	};
+
+	rp1_spi0_cs_default_state: rp1-spi0-cs-default-state {
+		function = "gpio";
+		pins = "gpio7", "gpio8";
+		bias-pull-up;
+	};
+
 	rp1_i2c4_default_state: rp1-i2c4-default-state {
 		function = "i2c4";
 		groups = "i2c4_2";
@@ -94,6 +108,14 @@ &rp1_i2c6 {
 	pinctrl-names = "default";
 };
 
+&rp1_spi0 {
+	pinctrl-0 = <&rp1_spi0_default_state &rp1_spi0_cs_default_state>;
+	pinctrl-names = "default";
+
+	num-cs = <2>;
+	cs-gpios = <&rp1_gpio 8 GPIO_ACTIVE_LOW &rp1_gpio 7 GPIO_ACTIVE_LOW>;
+};
+
 &rp1_usb0 {
 	pinctrl-0 = <&usb_vbus_default_state>;
 	pinctrl-names = "default";

---
base-commit: db2ddb87143519e20a95aa36c60b36107b736a58
change-id: 20260811-bcm2712-spi-644b70fee3bf

Best regards,
--  
Gregor Herburger <gregor.herburger@linutronix.de>



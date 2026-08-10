Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAE7BC5AD55
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 11:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8Awn8zlaZXi7jR36kN4PdMr9Rfn05NBCDgVEntOe8AQ=; b=J2DRUyVH4YkTb+eVGQ1VWMgKHm
	UJOI1cq8LCelJJpSpbzWbwg6+5p8xktY28fXAtaLJFP8OA64vIFh0D170qcFedT1cmV173NC7HyMK
	Sz0HWifpaitUWJuBFKKJHRbI4KwF+NXjiJh0q6bA9bwlADSkPGYmSHb8l2o4BKJhb3ysuC2zijV3A
	RhzUp2nJhONWA9Br+Hq5IdTLeGLwoZ8Hljz12Jr6c9yG8PqlExpNNAehXQa8inKqgMn0Qzpf6Remt
	9QMYAR1oJ1QDbGK6oOEt7JsXMSmPmVSYKF6wz3T28fVuaHD6yb64X5Wmqc/kVxOG05Br1tZrtn1vo
	HynATVmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtOSs-0000000Bf2I-0ThY;
	Mon, 10 Aug 2026 11:46:46 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtOSn-0000000Beyv-1njn;
	Mon, 10 Aug 2026 11:46:42 +0000
From: Gregor Herburger <gregor.herburger@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1786362397;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8Awn8zlaZXi7jR36kN4PdMr9Rfn05NBCDgVEntOe8AQ=;
	b=epiPuh7f+6fSEbyzXbih/w2Kp+nQC2h7Sv2/yksd2smi/42WThIsI4oUkMlkyy7rYrWkoQ
	gwSwi/Z1wvPnk2zTk6Yh6+9LcBs4mRALnEUBKeIMNjiHU5ZvZxd6WKuX9Rv348Dt1lYmG+
	RTvbSVXUHhvha/k5r4kaoimU4YoPE99bWFLejbsjDgONJCWmtWl7LiKftV3lodRjQgrQqJ
	h6T5KVuF26Sj9ZpM3T3+ceeFb0TEU8z7xEQiq6qi5H6qq2Ellt/zPqSdniL+4brxVkRFBR
	jrtQqkQr8Auk3P/pio0ZOZ3Mbs+jfxnYhcd/tG4uy5K+uSIHOBzGf6v7Q8Ttjg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1786362397;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8Awn8zlaZXi7jR36kN4PdMr9Rfn05NBCDgVEntOe8AQ=;
	b=NC/iBeHufKzyMEk/3JlShOnP+MxT9Fhz4GuAL0ftCUXd8/CHP25p35+dtt74qrLah8BVQr
	TphxTZTQ/3N3FIAA==
Date: Mon, 10 Aug 2026 13:46:34 +0200
Subject: [PATCH v4 2/2] arm64: dts: broadcom: bcm2712-d-rpi-5-b: add
 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260810-bcm2712-d-stepping-compatible-v4-2-73f74479539c@linutronix.de>
References: <20260810-bcm2712-d-stepping-compatible-v4-0-73f74479539c@linutronix.de>
In-Reply-To: <20260810-bcm2712-d-stepping-compatible-v4-0-73f74479539c@linutronix.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Eric Anholt <eric@anholt.net>, Stefan Wahren <wahrenst@gmx.net>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Gregor Herburger <gregor.herburger@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786362397; l=1361;
 i=gregor.herburger@linutronix.de; s=20260226; h=from:subject:message-id;
 bh=Ii58RXGxpJr9hwDGS1ZAAJhAGvQaWwv4kU6x/v3mamk=;
 b=+WAlGB2PNCMoo3RnO6z4TF5oFjO0zV10Hs3eJvTbPRTInbnrkqL84RU9Ob3NyxKbPYdLTLKJE
 3OH7eu0Lv29DtcSEnEVKj0OkwH7rnrLXv3sQzBNXIBIwKWVlvNEAs3+
X-Developer-Key: i=gregor.herburger@linutronix.de; a=ed25519;
 pk=u72Lv7+/lS5CC1hmSrb17lv/6CK7HBh4Lvz77PHA5LM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_044641_617360_E7647449 
X-CRM114-Status: GOOD (  10.02  )
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

The bcm2712 found on the Raspberry Pi 5 is available in the d Stepping
and in a c Stepping. There are two separate dts files. The
bcm2712-rpi-5-b.dts for the c Stepping and the bcm2712-d-rpi-5-b.dts for
the d Stepping. The d stepping does not set its own compatible/model
string but uses "raspberrypi,5-model-b" through its include.

These two steppings are not compatible. Booting with the wrong dtb file
causes a crash at boot.

Add a compatibles string "raspberrypi,5-model-b-d0" together with a
"bcm2712-d0" string to allow us to distinguish between those two
steppings.

Fixes: 44839e2ac8ec ("arm64: dts: broadcom: Add DT for D-step version of BCM2712")
Signed-off-by: Gregor Herburger <gregor.herburger@linutronix.de>
---
 arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts b/arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts
index 127be0fc27c22..ae4b7c587dbc5 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts
+++ b/arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts
@@ -3,6 +3,11 @@
 
 #include "bcm2712-rpi-5-b.dts"
 
+/ {
+	compatible = "raspberrypi,5-model-b-d0", "brcm,bcm2712-d0";
+	model = "Raspberry Pi 5 d0 Stepping";
+};
+
 &gio_aon {
 	brcm,gpio-bank-widths = <15 6>;
 

-- 
2.47.3



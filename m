Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51270C55184
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 10:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9P9bubSjejExvocqDDS92y3ppWHsNSy9m2WTpszexZM=; b=FomCa2O2YNWhY0hd/SZ2M2xpBT
	ulh5D388ux+9oZ9pWqTt7DJUYBQp8HPVvZjtJAtaoPxSdaTSKzJzZC5IDWVlPnHU786I4PQ2iyAK4
	Tlk3v2rhWf6hEs516ZeCQoxfu15D+JIzHriTx+AzSz2liYFPF50/yEQYlz7rnBdJANsJ1exR9GLmG
	Vw/KmbYvhn9p4WXJ0aaeqg19m1g7CJD1+GdSfnKncZNgV1LZstqZywrN8qhBRmZxOYECCJufuJJOK
	cW2j5Uo2/T+rHBjGplAw2HMEv9VUl7/gOVq5cPJ/sBCwTePYdNiJgbPNJt7yh5IeYxlgTqX0BhP7g
	INDoqdXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqpZQ-0000000GmES-2g8V;
	Mon, 03 Aug 2026 10:06:56 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqpZM-0000000GmBi-02WO;
	Mon, 03 Aug 2026 10:06:54 +0000
From: Gregor Herburger <gregor.herburger@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1785751608;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9P9bubSjejExvocqDDS92y3ppWHsNSy9m2WTpszexZM=;
	b=tvMCjtePIo+htCYbYVLOO/gMz4x+hw/GmLVIBRimrXBzm2WWtTUCoClPp/yR2QgpoVzEOn
	BtQS/ujqC3VUEoTGxB9Pl8R9aJXPJtFb08LFV7TgD+ZOcbcaNvZiFFWzqRzWr9qPJYWuxQ
	EF5oub9GbDBgmIaeeFULf1dQP+a4hH+LnjscLF8L74cCnqEsUG4a2Qvq8OeSeWTKTi9xZl
	iZvytM5QvS9A4dfQzNdrzSaUOkVVL+g3jG1qUGy2R04L8RV6pBs4vq9sLINgCit/yDVSnR
	euJ5dccWom9KGtbL7wSUaN+RwpvNqA6V9cMVyyBh3SKlABNcUPEcx4oG4ki10g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1785751608;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9P9bubSjejExvocqDDS92y3ppWHsNSy9m2WTpszexZM=;
	b=cyGS1kDPsvBg+5P1O46UoU/N+o3u3VOMGfpEzXo7Koxbp3RdaMaVTiPM7L+8+EFonry4d7
	/rrju/ysZxzzgaAg==
Date: Mon, 03 Aug 2026 12:06:42 +0200
Subject: [PATCH 2/2] arm64: dts: broadcom: bcm2712-d-rpi-5-b: add
 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-bcm2712-d-stepping-compatible-v1-2-401934357a44@linutronix.de>
References: <20260803-bcm2712-d-stepping-compatible-v1-0-401934357a44@linutronix.de>
In-Reply-To: <20260803-bcm2712-d-stepping-compatible-v1-0-401934357a44@linutronix.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Eric Anholt <eric@anholt.net>, Stefan Wahren <wahrenst@gmx.net>
Cc: devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Gregor Herburger <gregor.herburger@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785751607; l=1240;
 i=gregor.herburger@linutronix.de; s=20260226; h=from:subject:message-id;
 bh=DSPSDoGviOFyo8k3qvSQl5w8Jy3UBcbhVpFibB9/rT0=;
 b=VLpAZ7NDEZhh1OyXF/WX0FJjof4ksB++8EvPwHlUO/rzcttuBR9BZn9bllNAbQSYrc/DYe7lQ
 BhwNbv8FY4YB0cXdTlWIHCu46B2VICjWgGcPkWLe8UWbVzTSfYYkjVh
X-Developer-Key: i=gregor.herburger@linutronix.de; a=ed25519;
 pk=u72Lv7+/lS5CC1hmSrb17lv/6CK7HBh4Lvz77PHA5LM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_030652_195921_BFC52B4A 
X-CRM114-Status: GOOD (  10.32  )
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
string but uses "raspberrypi,5-model-b".

These two steppings are not compatible. Booting with the wrong dtb file
causes a crash at boot.

Add a compatibles string "raspberrypi,5-model-b-d0" to allow us to
distinguish between those two steppings.

Signed-off-by: Gregor Herburger <gregor.herburger@linutronix.de>
---
 arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts b/arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts
index 127be0fc27c2..11a38cd53401 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts
+++ b/arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts
@@ -3,6 +3,11 @@
 
 #include "bcm2712-rpi-5-b.dts"
 
+/ {
+	compatible = "raspberrypi,5-model-b-d0", "raspberrypi,5-model-b", "brcm,bcm2712";
+	model = "Raspberry Pi 5 d0 Stepping";
+};
+
 &gio_aon {
 	brcm,gpio-bank-widths = <15 6>;
 

-- 
2.47.3



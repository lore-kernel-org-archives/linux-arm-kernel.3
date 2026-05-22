Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13F0BCD5BB0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 15:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e571YxZZj8gyO1yRbMno9e5ALDgboYntuW/WsLJaO3E=; b=Sbc/Mlh3k3sjb6jdKItsRqIOrO
	ZdKzoNKX0B7WdbI/f4eINLBH6PnUnRcMXqhj69DAmXzn5OZFVx8nWsREwibhEhQzexyNU+BedvqEO
	O2h4uhF+Z/abMvqzTDiVVSpdU3q7NsQK+rq25BI6BlTKDVyE3wR47XLXONSYeiLjTuEChpjZZ9MoQ
	+oNsLKiJbko04D940CXOsSfJGeIjJHBPZPjpfLXcQrvCESp4QgYa0kKpiLRcRord2YnPxvep8axWh
	1JLfRfy4MrGBDmo+6h3zmCJoolAdDR8Xb2owTc/tkZsx6EGtHv6VHtNuGrVDeoZSxvgolNilmjq65
	CjVt7Zog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQRz0-0000000BHxc-1HVr;
	Fri, 22 May 2026 15:40:18 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQRyt-0000000BHqa-1lTW;
	Fri, 22 May 2026 15:40:13 +0000
From: Gregor Herburger <gregor.herburger@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779464408;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e571YxZZj8gyO1yRbMno9e5ALDgboYntuW/WsLJaO3E=;
	b=L3KHMcbPUskhBGOWh2gaa8GcGuh9MJC2yVWT3+AMIyei9r0ouNHbfDtK59o/3RYzrnbOB1
	JGQbdQfSOe+/yqfRjQluIi5y+9N+fwzp444RKZeu/idOs0aFprmA3LwlIyqxDwsRzzLv8F
	1hQpRlycKKxB5SIc+BedkgqIi1J4hR72Z/XDF5vqEtxmgqwMRJuse/lxpdZy+pBtT6qhZE
	aElU3yljCudT2s3wxVtMpcuyL9Mto9WZJKvyttq28s6rk+Xqn9CHYVFw+jke9njlrjTPX8
	y1heWjwlc3Vy0Bc34CjhWozwLcfgXJOZBOCVPSUyWcsNtftt/13sEpgkmzsJAQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779464408;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e571YxZZj8gyO1yRbMno9e5ALDgboYntuW/WsLJaO3E=;
	b=izsKWg4LVCP4kDh5I5r9pM+zlCZOwAQfpCoTtMVoj4oGbfPbWAQGlQPPp5A0jjgan6WcDf
	uyCTgrXKyU00TTCQ==
Date: Fri, 22 May 2026 17:40:03 +0200
Subject: [PATCH v6 03/10] dt-bindings: raspberrypi,bcm2835-firmware: Add
 bcm2712-firmware compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-rpi-otp-driver-v6-3-b0eac97d1428@linutronix.de>
References: <20260522-rpi-otp-driver-v6-0-b0eac97d1428@linutronix.de>
In-Reply-To: <20260522-rpi-otp-driver-v6-0-b0eac97d1428@linutronix.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Eric Anholt <eric@anholt.net>, Stefan Wahren <wahrenst@gmx.net>, 
 Srinivas Kandagatla <srini@kernel.org>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
 Russell King <linux@armlinux.org.uk>
Cc: devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-hardening@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, 
 Gregor Herburger <gregor.herburger@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779464406; l=1250;
 i=gregor.herburger@linutronix.de; s=20260226; h=from:subject:message-id;
 bh=qD30315sFDKvQ1zxeTxTP4/+d92pYx/4B3/nMfkSHxk=;
 b=q/QVJSLY9Sm34v48tDRySt9gYiLoBmdLykB6cLhVZQtjLPjYUFeFJeiB6tPHnqKmY2iiAP6EW
 xtMh1bty8OsCFL7442lh571bGMJgMw9sQbgGD8ZoPRYRKpuy96Yvs6v
X-Developer-Key: i=gregor.herburger@linutronix.de; a=ed25519;
 pk=u72Lv7+/lS5CC1hmSrb17lv/6CK7HBh4Lvz77PHA5LM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_084011_606860_FA7A17DD 
X-CRM114-Status: UNSURE (   7.83  )
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

Add a compatible string for the bcm2712 firmware. The bcm2712-firmware
is compatible with the bcm2835-firmware so allow the bcm2835-firmware as
fallback.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Gregor Herburger <gregor.herburger@linutronix.de>
---
 .../bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml        | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml b/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml
index 983ea80eaec97..a3a5243b91706 100644
--- a/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml
+++ b/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml
@@ -21,9 +21,14 @@ select:
 
 properties:
   compatible:
-    items:
-      - const: raspberrypi,bcm2835-firmware
-      - const: simple-mfd
+    oneOf:
+      - items:
+          - const: raspberrypi,bcm2835-firmware
+          - const: simple-mfd
+      - items:
+          - const: raspberrypi,bcm2712-firmware
+          - const: raspberrypi,bcm2835-firmware
+          - const: simple-mfd
 
   mboxes:
     maxItems: 1

-- 
2.47.3



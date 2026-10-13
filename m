Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEE71CA9ED0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 03:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YOy/dOpoBafqGK5/qCqut1ohPP87T977IurV7U9ByV0=; b=oHBvhisuuDQXbjrM5b2wRH+GYB
	+6tU2ng6cjmfSxG89xm0umqO4t5AdoG4giyJqPLJiw8//xNcKvKlN0zSXVyFEs8BJrEvl02mMvER0
	cx9XYWdxiWrEwIFkBsqc0ef138N5NwruBZoTUFQD+s60KxNARo51PytgY68mVqxnQNAay75vjiJ8r
	T2I/dtGKWbXUd7lgd831gLlYCqqecXgX4ocMysxVgf+m8xHgNvIO7ECXgyXoWEziz+YUdZ1/f/rHl
	uf1mQGH/69w8JE5r6wS2dNG/67OTjeCkVPY2wIRJMtSNS4oLnilRLUt0qYo3Ycwj+3oxt1uYbmQDv
	5T8e8ylw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGTTl-0000000Bujt-0AIm;
	Tue, 13 Oct 2026 03:47:05 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGTTh-0000000Bueq-3T9z
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 03:47:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8189E447E0;
	Tue, 13 Oct 2026 03:47:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 52CDDC2BCFA;
	Tue, 13 Oct 2026 03:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791863221;
	bh=Fc3v+sAfUFif61yc1m5RkBfsjoDptWTKM2sW8+Rf9hA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=OD7iu+pBpUWQ22JlV+FEF53ft9TOvWL/gVFuQiNLXtjiJxmkfeUUeBrGpyD5rToi4
	 yWdiS6N7EazHYkOLz+rqrKYv3e1JY6tTIudDLqZKDaStPdexuLU92VzwnqKxZOWvIZ
	 kEVoGJxa38XIdGyK+8F4gU3tLwtG6CfFbqUFgp8DiAMhw7kSmtyWdAFRcCs8MnHroG
	 I7gblBlg/zkmibZE5Aah2SU9BbIu5R0z+87Ypx4ouKmEk527Br2cTzHnR32TgzOD3q
	 71PAf36lPogNTJJ+OnJHsCN/GIGlkFQjT1cQUvj0I6JqDSxhId8cZIFwgXEtACHnhs
	 fFePTEIw2Uabw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EE4ECC6B09;
	Tue, 13 Oct 2026 03:47:01 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Date: Tue, 13 Oct 2026 06:47:09 +0300
Subject: [PATCH v2 11/11] MAINTAINERS: Add Cortina Systems CS75xx interrupt
 controller, GPIO and I2C
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-b4-cs75xx-s2-v2-11-94f8c0a90cda@gmail.com>
References: <20261013-b4-cs75xx-s2-v2-0-94f8c0a90cda@gmail.com>
In-Reply-To: <20261013-b4-cs75xx-s2-v2-0-94f8c0a90cda@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Russell King <linux@armlinux.org.uk>, 
 Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-i2c@vger.kernel.org, linux-watchdog@vger.kernel.org, 
 Fil Dunsky <filipp.dunsky@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791863218; l=1164;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=8born+lqbJWHHfA9yx4+qhsEyHSP/MdbnsbUcNAg5HU=;
 b=OjNTRpBwm7+styelTVABzZsjoLC2URQ+UUV3d/JL3nx7F2z9ZI0k8C51Yde9/79AFIg6EV2pq
 2x3+2Tx9/XMCw9PV/yIWJDirVgp7ynI2YlO715uYMYpP8rklVOP2sUe
X-Developer-Key: i=filipp.dunsky@gmail.com; a=ed25519;
 pk=JAYP8e2rJ54DHOmhNtXud8rl1igAaAXoOHxtJmVXI1g=
X-Endpoint-Received: by B4 Relay for filipp.dunsky@gmail.com/20260930 with
 auth_id=1085
X-Original-From: Fil Dunsky <filipp.dunsky@gmail.com>
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
Reply-To: filipp.dunsky@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Fil Dunsky <filipp.dunsky@gmail.com>

List the new Cortina Systems CS75xx interrupt controller, GPIO and I2C
drivers and their bindings in the CS75xx entry.

Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 53f6fa1c5..604993705 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2925,10 +2925,16 @@ M:	Fil Dunsky <filipp.dunsky@gmail.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 F:	Documentation/devicetree/bindings/arm/cortina.yaml
+F:	Documentation/devicetree/bindings/gpio/cortina,cs7542-gpio.yaml
+F:	Documentation/devicetree/bindings/i2c/cortina,cs7542-i2c.yaml
+F:	Documentation/devicetree/bindings/interrupt-controller/cortina,cs7542-intc.yaml
 F:	Documentation/devicetree/bindings/serial/cortina,cs7542-uart.yaml
 F:	arch/arm/boot/dts/cortina/
 F:	arch/arm/include/debug/cs75xx.S
 F:	arch/arm/mach-goldengate/
+F:	drivers/gpio/gpio-cs75xx.c
+F:	drivers/i2c/busses/i2c-cs75xx.c
+F:	drivers/irqchip/irq-cs75xx.c
 F:	drivers/tty/serial/cortina-uart.c
 
 ARM/CORTINA SYSTEMS GEMINI ARM ARCHITECTURE

-- 
2.53.0




Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3831CC5DF7D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 10:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M8ar9tbsiYgARXHHdxhtlB0hv95W7gFeDvqFh7J36R4=; b=J1rFZgxo5P4r1q0jk0pHcuJVLp
	9H94cnyS6spAdgRtgYLo85mC8dCOiM3NzD5TFTjyjzYv3xod8RTX1+E/NTRLCzvFVUWL8PpKJ1GyH
	8MAgIkjKUhZL9jzAv3fJwXpnBOC3VtwRhxw0GB/FJI/fY7V6uANSPmA12B40trwJJZgxQVPorjf6+
	6aPyiytuMloemFkYizb6hRyA6VldM5aWkuWbl7BGs3SdCjww3Q3+4voCO4koPBuBvm9DOdk/lL+CO
	ryI82nJEYZrxEZjyElHqlWaxbiPknvFuqBK9cLlNzP+S0IxYhZgxBCVtkpR7BTy62lCR/7Rh9LJbG
	sSKs0gLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwH7R-00000007jPL-1GMI;
	Tue, 18 Aug 2026 10:32:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwH79-00000007j5X-2tPB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 10:32:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B97AB44079;
	Tue, 18 Aug 2026 10:32:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 91965C2BD00;
	Tue, 18 Aug 2026 10:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787049134;
	bh=Bb36BfGeVG00O5acHqEedqkrcVnPEN+C2tMnqCVjfps=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=cxEGbg9akGWhslNkUnpvGOYgjYFvlG8RUICRl72778pTxnW3tnuZxyB4KoSOaeWRb
	 qiKkjCk6xyzajQt0crSTGwE7HfoNwmhCn2QF/yPf6OZcuJ0R0ry6mwGx9y9RspM+ow
	 B3lL4rZxD0Tmq/e4iqwV2QupyHpLlTQ0rghEjdVtNWPJM70+5vr9vsM9P4FhwvsmSj
	 vsaJrHHybEGw5cs5KZ1jBHj9Gf+KPe91JusBO+zRl6PcKIlKYGxX7yaHZKQlKdRvrl
	 H5XSv+eGMA6zYbMVBG7GUE1leWbYOEUcfz1YMJwKLcY5utPuFDWhx1pbB8U+5Yo1gL
	 1lQYTelHwxd3A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B3B0C5DF70;
	Tue, 18 Aug 2026 10:32:14 +0000 (UTC)
From: Long Zhao via B4 Relay <devnull+longzhao.ambarella.com@kernel.org>
Date: Tue, 18 Aug 2026 18:31:26 +0800
Subject: [PATCH v5 12/12] MAINTAINERS: add ARM/AMBARELLA SoC support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260818-cv75-v5-v5-12-7bbb12f0360f@ambarella.com>
References: <20260818-cv75-v5-v5-0-7bbb12f0360f@ambarella.com>
In-Reply-To: <20260818-cv75-v5-v5-0-7bbb12f0360f@ambarella.com>
To: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, soc@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Brian Masney <bmasney@redhat.com>, 
 Lee Jones <lee@kernel.org>, mfd@lists.linux.dev, 
 Long Zhao <zl020895@163.com>, Long Zhao <longzhao@ambarella.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787049131; l=1312;
 i=longzhao@ambarella.com; s=20260730; h=from:subject:message-id;
 bh=qRk4o9fqrbJ/RTe53ZqQZzJC7nitoycd8NIbTSpQATc=;
 b=22jZKHSk4JLzNo9O8aGxR1ZHXYovNN3EMRSWAxCkRINCuJDf+fH7BEi0M1am6EfDNoaT9CyzQ
 GaOtRr7cdbOCbblt/GRQZFAws6QRfB1pNBOAALqZOdSrlL4fz1xTMEJ
X-Developer-Key: i=longzhao@ambarella.com; a=ed25519;
 pk=/xGhPTOX0/eYsyTWzyjjgAIW1Z/YD+IlnOnvcdRozow=
X-Endpoint-Received: by B4 Relay for longzhao@ambarella.com/20260730 with
 auth_id=903
X-Original-From: Long Zhao <longzhao@ambarella.com>
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
Reply-To: longzhao@ambarella.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Long Zhao <longzhao@ambarella.com>

Add a maintainer entry covering Ambarella CV75 bindings, DTS and
related drivers.

Signed-off-by: Long Zhao <longzhao@ambarella.com>
---
 MAINTAINERS | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 803b60ad628f..4352a2dc1e3d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2502,6 +2502,22 @@ F:	drivers/clocksource/asm9260_timer.c
 F:	drivers/rtc/rtc-asm9260.c
 F:	drivers/watchdog/asm9260_wdt.c
 
+ARM/AMBARELLA SOC SUPPORT
+M:	Long Zhao <longzhao@ambarella.com>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+L:	devicetree@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/arm/ambarella.yaml
+F:	Documentation/devicetree/bindings/clock/ambarella,cv75-rct.yaml
+F:	Documentation/devicetree/bindings/pinctrl/ambarella,cv75-pinctrl.yaml
+F:	Documentation/devicetree/bindings/serial/ambarella,cv75-uart.yaml
+F:	arch/arm64/boot/dts/ambarella/
+F:	drivers/clk/ambarella/
+F:	drivers/pinctrl/pinctrl-ambarella*
+F:	drivers/tty/serial/8250/8250_ambarella.c
+F:	include/dt-bindings/clock/ambarella,cv75-rct.h
+N:	ambarella
+
 ARM/AMD PENSANDO ARM64 ARCHITECTURE
 M:	Brad Larson <blarson@amd.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)

-- 
2.34.1




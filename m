Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CCC1C982F1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 04:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Na+yNwADVHtT0+06vQ945iPzbZLRjZ92Pxuevq6zNF8=; b=KSgM1xXQ2e8fOTCUqkAK7+bf8r
	N8re83a4gyo1cDxVGP0lwmdZ7i8et9F1zwrL1PoapGe8ptD7RvoteeZLRFPfl8RzFKbboSUwlEuCl
	SF9whQDlc5tiBsC2ZK73DmrYXkFxHwL7qdQhPbXkRqBK/M7bYZYkdDrrYPb0dv4ORgDVnZ5LYCzYl
	n6tXHqZTKjXnh+MDGeLKgbf+UjzOHSr6yB+r4jYfrVBqVj0lY2UXJhDOlllAC0cnkqqiXRpWyd067
	uVUI5zY3qEns9QnHK22f0j5sxj9IQKnuHKbqiXZzEM7L8OGzrdAECzNu6IiYGm5NGLyHfFEqNsKKa
	EbrZz9RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8VZ8-00000000ofm-29qy;
	Mon, 21 Sep 2026 04:23:42 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8VZ1-00000000oV4-3fiC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 04:23:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CC47F44980;
	Mon, 21 Sep 2026 04:23:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9D0D8C2BD00;
	Mon, 21 Sep 2026 04:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789964614;
	bh=zgU3iQM72YbxnsGmykO32NltLNkwhLgTNSOphGXHrLE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ERU9SdEMeMctXWCW8214q8AQqnELC5pAedsn65NzsyUxEAqpZinG23NZeobCS/IzK
	 Pu+CneDjxSCDr5xuwaKVFnyBv1aSZGrRqgP9FrPw9ZZCJHwsd5AE1mXTcHaBDZZDeY
	 kgYecPX0BNQjKCcXzi8r+S0IbzTAVukfN7alUsH7Q3kBJFn5zFGIb0NGRyK6OBe1T3
	 O2s+FUNjpRoaTHRNehx+HqEcg5wnkA2MRWiUIhD2dabD9G2hRzz3DLqghkZRoGCi01
	 vx2WFB1zBCTrmM83AZCHX25k61qfHm2GL7LlWL/ZyfKups8fyXv3BuFQLUoyd4bQEf
	 VWnRZgS0YFPlg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B5D2C982F1;
	Mon, 21 Sep 2026 04:23:34 +0000 (UTC)
From: Long Zhao via B4 Relay <devnull+longzhao.ambarella.com@kernel.org>
Date: Mon, 21 Sep 2026 12:23:37 +0800
Subject: [PATCH v8 18/18] MAINTAINERS: add ARM/AMBARELLA SoC support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-cv75-v5-v8-18-282ff5d98dda@ambarella.com>
References: <20260921-cv75-v5-v8-0-282ff5d98dda@ambarella.com>
In-Reply-To: <20260921-cv75-v5-v8-0-282ff5d98dda@ambarella.com>
To: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, soc@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
Cc: Long Zhao <longzhao@ambarella.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>, 
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Long Zhao <zl020895@163.com>, Lee Jones <lee@kernel.org>, 
 mfd@lists.linux.dev, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789964609; l=1241;
 i=longzhao@ambarella.com; s=20260730; h=from:subject:message-id;
 bh=66/FpPmSuU75AtQewU8cj7mu+Qa/5qamx4Km8ySoeYo=;
 b=ZcB9Kw+0TS4NBh047YvqdlTucwksnHv6Jzs2vgmfTu+GGoB4zAkT3OgmRRaYANUW/Dvz7eMeK
 Z1K7boRmfs3DJVX054GrV5aiJrcQfiKsyKmk9I1NNu/oWYOSHaCDjXM
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

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Long Zhao <longzhao@ambarella.com>
---
 MAINTAINERS | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 803b60ad628f..59e5b32d7a02 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2502,6 +2502,20 @@ F:	drivers/clocksource/asm9260_timer.c
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
+F:	arch/arm64/boot/dts/ambarella/
+F:	drivers/clk/ambarella/
+F:	drivers/pinctrl/pinctrl-ambarella*
+F:	include/dt-bindings/clock/ambarella,cv75-rct.h
+N:	ambarella
+
 ARM/AMD PENSANDO ARM64 ARCHITECTURE
 M:	Brad Larson <blarson@amd.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)

-- 
2.34.1




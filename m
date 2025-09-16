Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16361CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 20:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EIPTIfOgbrI1/kQX4pqlvD9cW4CnOplyEfrARZiwVN8=; b=d8ZS95R8JY8NrD9h9uZFpgYVTc
	lbdZ0bICO1WP2OW/xUqwrSXdhRfYBO09GcMmkN8758ZaW03/fBKvBeEls3jnRcwAg3yGuV71s7fjK
	1azy+rTB17PEO417IF4TUwt+hLbjGlSZ7WQ6kfczoWPT85Jthg+dGSQ8nHz7lH0vE05Xw+ABhj3UG
	ygcd1qORE1hGXTUk6oFwDILXR8GPQJGahrhxhZ2f1haUKl59p12fyM2DrMdbbQWASoEr+OI/0rrYp
	MxIi7fTP9OKE5Nfb8zfx1JmN9BvfHj8yXXfcLIrRcTTSDy01kBZ0F9k0VivyESzjwl/L1OJ16Sn7q
	SMeLXa/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uycFP-000000091FH-2oiU;
	Tue, 16 Sep 2025 20:25:55 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uycEy-000000090lw-2Lxh;
	Tue, 16 Sep 2025 20:25:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 108AC44D70;
	Tue, 16 Sep 2025 20:25:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B5992C4CEF7;
	Tue, 16 Sep 2025 20:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758054325;
	bh=Czlyuawt5NCDFtRIIQsXB+M6g7mpoAg3GuJazRPrBeI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Hf7kCTiORGTrm++NtElPg+BLvT/tPCYisK3L/uNUGqwouBOJH5KqTtG77kVaKuPlv
	 wZJ1tVfBM+oD739xcpDYDCm0BfU/eDAXJtAwN6cHwz9XToI3Pi4NvC01sA9V6vN6Sy
	 Hjav5hHyCHxfiBa5chtv4H0ACWzUGO9z9TWLBzYUW2h35Oh+c+1csTW9nEDhF8LQ5K
	 6o8xc0/nkiRGA5ZEIldbknzWtd5+v/Kx7snPjIgIPGEp8KcQEJeHds/KUDKRF1xvRd
	 UI8qqvf17+peTy8L8rjLkGAdBlmYwPHtCP01ycoS8dOCdVzmK/J4uB3WwIH8VY+3OL
	 3Byo5FzCSJn6Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA26DCAC592;
	Tue, 16 Sep 2025 20:25:25 +0000 (UTC)
From: Dang Huynh via B4 Relay <devnull+dang.huynh.mainlining.org@kernel.org>
Date: Wed, 17 Sep 2025 03:25:10 +0700
Subject: [PATCH 13/25] dts: unisoc: orangepi: Disable UART with no users
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250917-rda8810pl-drivers-v1-13-9ca9184ca977@mainlining.org>
References: <20250917-rda8810pl-drivers-v1-0-9ca9184ca977@mainlining.org>
In-Reply-To: <20250917-rda8810pl-drivers-v1-0-9ca9184ca977@mainlining.org>
To: Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Sebastian Reichel <sre@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-unisoc@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-pm@vger.kernel.org, 
 dmaengine@vger.kernel.org, linux-hardening@vger.kernel.org, 
 linux-mmc@vger.kernel.org, Dang Huynh <dang.huynh@mainlining.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758054322; l=1477;
 i=dang.huynh@mainlining.org; s=20250917; h=from:subject:message-id;
 bh=XPO5kEJS5ocnBL76vZ0w5j7Lye5wuRkS9bNnKxmO9oo=;
 b=2zBM9XKo6rOYbZUNQpD9eFH0E5hNGPLBqV3M7IJCdwPx3vmKRrOd+pPLTcttmUftfCu1MJTme
 +esbSs3Nw5mA0QSS7+wm41hH4xrahHriqA1Ce8uMeTupFJtX3yQzKCr
X-Developer-Key: i=dang.huynh@mainlining.org; a=ed25519;
 pk=RyzH4CL4YU/ItXYUurA51EVBidfx4lIy8/E4EKRJCUk=
X-Endpoint-Received: by B4 Relay for dang.huynh@mainlining.org/20250917
 with auth_id=526
X-Original-From: Dang Huynh <dang.huynh@mainlining.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_132528_743850_D79A2515 
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
Reply-To: dang.huynh@mainlining.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Dang Huynh <dang.huynh@mainlining.org>

By default, we should keep unused peripherals disabled.

Signed-off-by: Dang Huynh <dang.huynh@mainlining.org>
---
 arch/arm/boot/dts/unisoc/rda8810pl-orangepi-2g-iot.dts | 10 ----------
 arch/arm/boot/dts/unisoc/rda8810pl-orangepi-i96.dts    | 10 ----------
 2 files changed, 20 deletions(-)

diff --git a/arch/arm/boot/dts/unisoc/rda8810pl-orangepi-2g-iot.dts b/arch/arm/boot/dts/unisoc/rda8810pl-orangepi-2g-iot.dts
index 98e34248ae80b1fcd673ff01fe045db412d5bcc9..46ccb9ad510c0df142b845d6fc5633b69c2298dd 100644
--- a/arch/arm/boot/dts/unisoc/rda8810pl-orangepi-2g-iot.dts
+++ b/arch/arm/boot/dts/unisoc/rda8810pl-orangepi-2g-iot.dts
@@ -34,16 +34,6 @@ uart_clk: uart-clk {
 	};
 };
 
-&uart1 {
-	status = "okay";
-	clocks = <&uart_clk>;
-};
-
-&uart2 {
-	status = "okay";
-	clocks = <&uart_clk>;
-};
-
 &uart3 {
 	status = "okay";
 	clocks = <&uart_clk>;
diff --git a/arch/arm/boot/dts/unisoc/rda8810pl-orangepi-i96.dts b/arch/arm/boot/dts/unisoc/rda8810pl-orangepi-i96.dts
index 728f76931b995fdfc036b586f899b15a7f07528b..a1d61ef138d12bb3ecb4b24513cc1a7dfbac3107 100644
--- a/arch/arm/boot/dts/unisoc/rda8810pl-orangepi-i96.dts
+++ b/arch/arm/boot/dts/unisoc/rda8810pl-orangepi-i96.dts
@@ -34,16 +34,6 @@ uart_clk: uart-clk {
 	};
 };
 
-&uart1 {
-	status = "okay";
-	clocks = <&uart_clk>;
-};
-
-&uart2 {
-	status = "okay";
-	clocks = <&uart_clk>;
-};
-
 &uart3 {
 	status = "okay";
 	clocks = <&uart_clk>;

-- 
2.51.0




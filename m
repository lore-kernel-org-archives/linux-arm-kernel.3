Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EBDDCCF9E5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Oct 2025 14:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LC0+zcIydPD/Gq4mpjXFhLnbmE4dOBwasRhB+ht+bGg=; b=CXVE7z3uZx8Sy2HusCfDVocQVN
	WTw+5DUIRFLkf16SL7eH9PCsmFnBrSUoBsByn1YvyCkvY91VcupqnyVOXHVaS+w4MaNPfgYfDUVH4
	GdE1wIL0jBmVtFl41WA5soMQLIJyEGAz3/CnOJ/Gv/yNuWDKTwYU/QLFh088U7MLnly5/0O8CE7pK
	Iobjr8slKz1KVHpqB3WVppUoc8zXPtkVq9WVsQu8J2vBeeWf9ssWbz+aQukLBeQm7mS7u8bu6OT/z
	RIkEsmxNukd5f3bT53NIt9ZoOVixPm7RKLKci4VQ3uGbPmACE9EkfO6fF6Rbf3dj/+qmf96SYXNKJ
	7mWYSQhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vD25C-0000000CS9M-0nmH;
	Sun, 26 Oct 2025 14:50:58 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vD253-0000000CS3W-10Ko
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Oct 2025 14:50:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A2B5B6042F;
	Sun, 26 Oct 2025 14:50:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24872C4CEF1;
	Sun, 26 Oct 2025 14:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761490248;
	bh=dBHCT2N10+Es25smpKMfNxMlaeXmdbIXmLSM9/ZRbi4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=L77Rt45vKRIGc9Be/izx33RAxsO1uz+Fzz3VJU8ajQuGvkdrw0c9ayhEGuGGh29hy
	 RBDqxZp0DzgxndIg2CWThue0afaDH7Y4FT5hWKrkJrz+9pyIp8PSqePJeUpRoGRZSn
	 GcfBmb7VccqUqaGJVFOMYxmb4pJN6u8s0Ry6K2LjVEdIFbnKXNgKPinmEUelpOv5AC
	 tRqROrX1h8107yQbHdWvqYcMNxGNBH4oSlJ/BkG+pwlm1kP7popxHI0bfQou+AV8o+
	 UUWlxdv+cQ13Yuo6gtrRFnzuL3G8DSwVWOOgu9D32M0Z5lnXO9CCvzBcPfvav247C/
	 bmO5E5G0YYIhQ==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Sasha Levin <sashal@kernel.org>,
	alexandre.belloni@bootlin.com,
	cristian.birsan@microchip.com,
	varshini.rajendran@microchip.com,
	alexandre.f.demers@gmail.com,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 6.17-6.12] clk: at91: sam9x7: Add peripheral clock id for pmecc
Date: Sun, 26 Oct 2025 10:48:59 -0400
Message-ID: <20251026144958.26750-21-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251026144958.26750-1-sashal@kernel.org>
References: <20251026144958.26750-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.17.5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

From: Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>

[ Upstream commit 94a1274100e397a27361ae53ace37be6da42a079 ]

Add pmecc instance id in peripheral clock description.

Signed-off-by: Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>
Link: https://lore.kernel.org/r/20250909103817.49334-1-balamanikandan.gunasundar@microchip.com
[claudiu.beznea@tuxon.dev: use tabs instead of spaces]
Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Signed-off-by: Nicolas Ferre <nicolas.ferre@microchip.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

YES – the fix should go to stable.

- `drivers/clk/at91/sam9x7.c:411` now lists the PMC peripheral clock
  slot for the PMECC block (ID 48). This table drives the loop in
  `sam9x7_pmc_setup()` that registers every peripheral clock with the
  framework (`drivers/clk/at91/sam9x7.c:889-904`). Without the entry, no
  `clk_hw` is created for ID 48, so any DT request such as `clocks =
  <&pmc PMC_TYPE_PERIPHERAL 48>` fails at probe time with `-ENOENT`,
  leaving the PMECC clock gated.
- On Microchip/Atmel SoCs, peripheral clocks power up disabled. The
  PMECC driver programs and polls the engine via MMIO
  (`drivers/mtd/nand/raw/atmel/pmecc.c:843-870`); if the clock stays
  off, register writes and the ready poll (`readl_relaxed_poll_timeout`)
  never complete, which causes ECC operations to time out and the NAND
  subsystem to fail.
- The SAM9X7 DT already exposes the PMECC device
  (`arch/arm/boot/dts/microchip/sam9x7.dtsi:1132-1134`), so enabling
  NAND with ECC depends on the clock being reachable. The patch is a
  one-line data addition with no behavioural impact outside supplying
  the missing clock, making the backport low-risk and clearly bug-fixing
  for users relying on PMECC.

 drivers/clk/at91/sam9x7.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/at91/sam9x7.c b/drivers/clk/at91/sam9x7.c
index 7322220418b45..89868a0aeaba9 100644
--- a/drivers/clk/at91/sam9x7.c
+++ b/drivers/clk/at91/sam9x7.c
@@ -408,6 +408,7 @@ static const struct {
 	{ .n = "pioD_clk",	.id = 44, },
 	{ .n = "tcb1_clk",	.id = 45, },
 	{ .n = "dbgu_clk",	.id = 47, },
+	{ .n = "pmecc_clk",	.id = 48, },
 	/*
 	 * mpddr_clk feeds DDR controller and is enabled by bootloader thus we
 	 * need to keep it enabled in case there is no Linux consumer for it.
-- 
2.51.0



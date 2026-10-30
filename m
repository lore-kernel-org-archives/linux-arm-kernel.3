Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DB8F606A324
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 07:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IljioqbY;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xsOO99IC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=zyVM5qTzy2De10MnH1DSqnYzP+ppEdRoaIvfy2pZmrI=; b=IljioqbYL9OWO8IT1wixWx2Im8
	8n9A1d6/rNjY4pHox8bH4iv4XFuILEKCucwZTRO4fw91V9HzPd5sikr1OIoZX9/YnTuuOpMEj6wgz
	e8TbF/P3k7Yk9GrzUTj+XIOToOIhlWI6+3XH6NtMvuah3WxMXKzw/5xd7fYHAJtjPRhqn8nmToizJ
	7aEeFjzcaoopn0GnhXUIVNmsxQcGzDuIrbQxI7QSSs+ZMZE2L0F2x0WzVfXzhJbspNe+MrHmYMhLJ
	pKYyzn8ZzKMevNMGW1Prr0AVTSCyQS6Dcsun3PAi+nOp6WbQP30nCX7uJZ5olnSYiodnVM4ZBvICE
	mM9DQhcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMhAS-0000000B0Ur-0yVa;
	Fri, 30 Oct 2026 07:36:52 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMhAP-0000000B0UC-3V6k
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 07:36:51 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4a20a37703bso2252185e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 00:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793345807; x=1793950607; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zyVM5qTzy2De10MnH1DSqnYzP+ppEdRoaIvfy2pZmrI=;
        b=xsOO99ICnEEGfaqmt+EvDTaxn+HfcKu83C8HwuiDpg9SaS+JJmtVto7xCuujiGvDB0
         4iSPzaCNl17POuGtMJzxundZyHbbIcL+QRYqW9P7udxjxbKvrQpgiQ31qXrx+FyPlcnk
         4pmAqoWJhbu/kv4X1yEASeB2UZvcLFGSkhwdnTAuiyqTCjaGiNWpV9Xy8a5MHwALfEhK
         u+Oyt/splcDhRWH4+YhcDGtQTVEEQC3UndfZbDmFzVFYu4KUYrHXbuy/e2cDj44FHQEX
         B4OllRVE0ApRibmInskZIOdxlOUKQhdJKKRMrnQhKqaMD7kyP0vlwOoHTqfQ0XxsC341
         g9TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793345807; x=1793950607;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zyVM5qTzy2De10MnH1DSqnYzP+ppEdRoaIvfy2pZmrI=;
        b=Khq4rsqAZBTymY6LHLxnv5uzjrJMYIRPxXp3AJGQsYJDDUyIzOf51mqINcO9is9aUr
         rYXJ6zrkg+L6vaRhyzFlQT4DZ3u4upSBx1Lai5wQQeM9hwn7lkykp58rtseiwG1k0ZNF
         5nYUnwJrOrM9NHHtI0WT3SdEMjpcTTxXiGMTAEZI1KwXr0831js7aekDa6fgOQZv1UMO
         /aZ71M2yIxFrJMl/ToSA9j2hCA+pefugdVl0XguGE+N3LOkrBaXGYfIYsx8GS4tLlj2Y
         nSEgbfPSTe8eLGIEdIB7L73hfnW/+XYS7SEP0FJ4tFiD1SWjuFqLbHt/UEAA7Z3KL0By
         YPCQ==
X-Forwarded-Encrypted: i=1; AKwUvBw2tZQaqVIFyqqHH+uI6KRfg/HwEbth7zaYGx+7zVpPjmOvt0pJ6jJj+sqpgdRzFHxGNl+rtdT85gi2YpawyXBD@lists.infradead.org
X-Gm-Message-State: AFq9FYJNxXFnqtyZjC2Ko9N8EIRe8gRfAzT46E7L3r9ww+3GhOPtGFJ0
	SeRgbHimkB3wATZZT+9BtaqU1qMg49KVGAgNCNoIOwdlQ1VlCMJyEHnU
X-Gm-Gg: AYBFou1wMmaK9aEGpZf1JEeUf+t8+6GDLusIwYg/3it7sPJMP1/6kBymWCyBgn/NqHM
	eS0G1dd1kknlCcmjGSYg4DJaeHbrOW6UkDr4BgscfTEbabSqFTIsOnkNvWP8OBoSw9/lNiF8SNo
	H7oVXa7TmKXWRtwrIVjLEiWfprj60g9UO8neCXQf5Cas1hePbjnWfc4Qkq7tCJj8t2S16eZTvdG
	L/8ZabbrmdLNmAoJJ8l9RH8in9ADxTn6Jrl3uSp1c7ig7TGKSibwRXzpMwzTssfZ+S4f8bSNqN9
	4qApqsrrR198/vJ4p5w3fMOk7zTAh36qc2P5k68/HYoj+es4HU8CE2D33YDX08cdlb4zdrduGKR
	bLlI0yZv4yIfGm0deuUXVLJGbc2AS53KIRyYa8qFTGp3UQO9DCHynVAOXEvNzqBS57T5lr10eyF
	DHEqtvG06f5dx637RmyGWOduWbDVdAGgqL+S7HhuhN5s/MZn136GvKh/l0Q37mgBdzlCk42mXLR
	BCvU2ZwgPvG51+ZbN1JL48Vud2UzHFYzVaO4YHI+54TaL//vD+TzDCQiaMIvZpBLkp8CxfQY3pC
	g4I9Vi6E9kdqSxAU9+K2knOEiHmeTXIl5Lca3yqOsiNkKelrjoWD+bg/0Q==
X-Received: by 2002:a05:600c:4585:b0:4a7:8fe8:130c with SMTP id 5b1f17b1804b1-4ac1889d5a1mr28432205e9.28.1793345807114;
        Fri, 30 Oct 2026 00:36:47 -0700 (PDT)
Received: from thinkpad.hgw.local ([159.146.110.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b728f9sm1721764f8f.10.2026.10.30.00.36.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 00:36:46 -0700 (PDT)
From: =?UTF-8?q?Yal=C3=A7=C4=B1n=20Can?= <ylcncn@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Brian Masney <bmasney@redhat.com>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] clk: rockchip: rk3066: uart0/1 pclk comes from hclk_ahb2apb
Date: Fri, 30 Oct 2026 10:36:38 +0300
Message-ID: <20261030073638.164388-1-ylcncn@gmail.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_003649_950700_3E56A967 
X-CRM114-Status: GOOD (  14.53  )
X-Spam-Score: -0.1 (/)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On rk3066a, uart0 (0x10124000) and uart1 (0x10126000) sit behind the
AHB-to-APB bridge of the cpu bus, as on rk3188, but their pclk gates name
pclk_cpu as parent. Nothing then holds hclk_ahb2apb (CLKGATE_CON4 bit 9),
so it is switched off as unused at late init and both UARTs read back as
all zeros: 8250 autoconfig reports PORT_UNKNOWN for uart0 and a serdev
Bluetooth controller on it (brcm,bcm4330-bt) times out on every command.

The vendor 3.0 kernel uses the same parent, but models ahb2apb as a
divider without a gate, so it is never turned off there.

Make hclk_ahb2apb the parent of pclk_uart0/1, as the rk3188 table already
does.

Tested on an RK3066a board (MK808B, BCM4330 Bluetooth on uart0): before,
CLKGATE_CON4 reads 0x6200, uart0 registers read 0 and ttyS0 is
PORT_UNKNOWN; clearing bit 9 by hand makes it probe as a 16550A. With this
patch uart0 probes as a 16550A at boot, hci_bcm loads its firmware patch,
and LE and BR/EDR scans find other devices. uart1 is not wired on this
board and was not tested.

Fixes: 2c14736c75db ("clk: rockchip: add clock driver for rk3188 and rk3066 clocks")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yalçın Can <ylcncn@gmail.com>
---
 drivers/clk/rockchip/clk-rk3188.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/rockchip/clk-rk3188.c b/drivers/clk/rockchip/clk-rk3188.c
index 318c8ddc8..680c33a62 100644
--- a/drivers/clk/rockchip/clk-rk3188.c
+++ b/drivers/clk/rockchip/clk-rk3188.c
@@ -649,8 +649,9 @@ static struct rockchip_clk_branch rk3066a_clk_branches[] __initdata = {
 	GATE(PCLK_TIMER1, "pclk_timer1", "pclk_cpu", 0, RK2928_CLKGATE_CON(7), 8, GFLAGS),
 	GATE(PCLK_TIMER2, "pclk_timer2", "pclk_cpu", 0, RK2928_CLKGATE_CON(7), 9, GFLAGS),
 	GATE(PCLK_GPIO6, "pclk_gpio6", "pclk_cpu", 0, RK2928_CLKGATE_CON(8), 15, GFLAGS),
-	GATE(PCLK_UART0, "pclk_uart0", "pclk_cpu", 0, RK2928_CLKGATE_CON(8), 0, GFLAGS),
-	GATE(PCLK_UART1, "pclk_uart1", "pclk_cpu", 0, RK2928_CLKGATE_CON(8), 1, GFLAGS),
+	/* uart0/1 sit behind the AHB-to-APB bridge, as on rk3188 */
+	GATE(PCLK_UART0, "pclk_uart0", "hclk_ahb2apb", 0, RK2928_CLKGATE_CON(8), 0, GFLAGS),
+	GATE(PCLK_UART1, "pclk_uart1", "hclk_ahb2apb", 0, RK2928_CLKGATE_CON(8), 1, GFLAGS),
 
 	GATE(PCLK_GPIO4, "pclk_gpio4", "pclk_peri", 0, RK2928_CLKGATE_CON(8), 13, GFLAGS),
 	GATE(PCLK_TSADC, "pclk_tsadc", "pclk_peri", 0, RK2928_CLKGATE_CON(4), 13, GFLAGS),
-- 
2.47.3



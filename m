Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19AAE606A324
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Oct 2026 02:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=djzHBEw6;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z4uwJRqa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=dufq0gMTwMuobWdajbCSMPOQ8VLgRxtkcM3Ok9ZSSyg=; b=djzHBEw6wRVqjHzhl4QNLYKDtY
	l8Wkuxx06fI3p/I4zd1L5lPMF39rKSdmLlI+xg1sBp9qtkJ2bD/YfGP/G9EUoPyP5UkACI3zfwz+v
	p7ltCIGup8J/ylNTApkIsbBMOHdRkXWARqydAUHiVTvURZjfN0CwQiyR1FDUqEU7oIJ2GjtaUg3xo
	Jv4/ewIinKBkjWYPb8rGOA3Koy6OmPKYX957YrVEg9Dx9/aqRWopttuC7nEVVeWW6mwd6qGyAYWTr
	s8HPF7E/IcrOZA71pbfGwLw8DgQJX3MlFoK7I2N9mPKeTwslPfq722FDH8WlZzho8fQ5QYDhrJj7l
	KDDCrMuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMynx-0000000Cs18-3KF6;
	Sat, 31 Oct 2026 02:26:49 +0000
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMynv-0000000Cs0Z-0DCC
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Oct 2026 02:26:48 +0000
Received: by mail-ot1-x332.google.com with SMTP id 46e09a7af769-847ac7ccd85so978918a34.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 19:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793413605; x=1794018405; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dufq0gMTwMuobWdajbCSMPOQ8VLgRxtkcM3Ok9ZSSyg=;
        b=Z4uwJRqa3Ux8BpFp4tH/XrzsWKM7FdvMqs3BqFmbXHvVyG05+XEsxrNOOffFS/ECcn
         NdLIT4mbW6T1Wv4lyxuPJc1tInzmsgZF5Mtu/nqHBBPfHOHWHe3AdSuXHVdXMVIhu5vN
         Lj8CGf4fTpEZs8gd1JXnOSB25wDiWEhOpue4GOxJ/NA/ioRiassp+MsRFfUapD1EEMUj
         QGiw5fJAM0pkf7tOPWw4Zn6nc0OkP9b5xQ/sZjwFIFpnkB9tb1ysWwlItcZdHM/Rw46D
         jCV4IrQ8MVIat1QigVtx8FhV1DBo2JCyBlQvycYUJiz+BnZvbh/Wpq6RBLCW/3AbcJou
         lrdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793413605; x=1794018405;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dufq0gMTwMuobWdajbCSMPOQ8VLgRxtkcM3Ok9ZSSyg=;
        b=Epq4mVTmsf+2r/tqRo05Fntq9ThbqmHT/OXYNstcyP2XB1H2DMlO6cjBaKMqtBgD9W
         Qe/0VHU4Y3CBVv7BKDzKOhMyJcbcpee2UgdljulMkJspI4pgGZBz2ZZdunhA+bZT4Zaq
         vyUiLb6sIXNYHWEHkKosikrqyEMDXzLZMP3lAgLDzitl4E11yV7xtwjbSYa48vr5aiWy
         Nwz+b92fJAz8+31JUmZ7O6wY61z7WAkPgzXTTNXUNGwOlsFVRH0STUqzO+4ELOYDwhbB
         41APvCACTqzd6WPPvqreSJd8LSLjvHUS0xwNZ8AtJFZhe/x41xQsJUrGYfFfvMTjDe/R
         vf4w==
X-Forwarded-Encrypted: i=1; AKwUvBxpzoMxt0IrGjAlyWZmGKzp1KyliaQnwaBNPc/G9mH6GFDZLabaOeqTq2SrCbZdag3WqvOA1VSxL3Ch5nGcGRZ0@lists.infradead.org
X-Gm-Message-State: AFq9FYKFIIOXFYWEZ1nzMIMfQV74lKQjriFvJnszv5XngXlDzqjsPW/R
	D/1jze/+KsIhmkxMlLPDKp2jLPY9kbCzMKUav4XglALbeYJ4zgVKwPRU
X-Gm-Gg: AYBFou333Qzlgelzhy8kTdjyPb3T0wMa15pzlVZK9MiK3QTH5r6e7gOi6mXnzFMmoiw
	CIUH8DWqFFa8slAfYvzvu+fPfo6OYqAuHYoRP3NhjoxCTMGouLFF8DYJKhllpIlotXh6bSLTQUk
	SSSAq62fXZuA2a2PQRkrHygYAIrIEpM3N6X188qe/e2bA2iX9QZT4Oioo4ZHn4gp5uixbpJ4Mrc
	W6LwwaJ96sQPdPeOR0YJ6hyn5hTLqkV9bvmCUiJfH9OTHvn4vLmvjNjQBdnDhEcylZiLAaryPzC
	sLBRTCGyS7dwrwm4GOiagOmgvfIlDJKnaX6zL3KtcgMCBDeTrXqKmpbH1eXrquVoKYpMglY6AtM
	Xz4jB0Umn4nmKuQe6bzeSPkmnF7eCikCE+jJJmIA0FVsEu5mNtdp5XqMtEkLMwOx8s2QYj5/rxD
	RhOEtOk38RH5d7pJDfDiBBuruxJ+4EkANasdyVx7dLZ2DPRmA9bRyg+m2fImYjcF7A8qT7zBkzb
	uMmkRkoqSqXxGAxUr69Lm8V7NRKWiAXTUS9n6KFHPUwzeV1+alwX3/FVjOjjbRGPN0uxf2TGGzM
	i/M8S8F2OLXmzM5xDNGs9GGYc7t1hXcDkbnYxUIMbyJqodMpDZcPMGnt3/sMLaDizMu44Eiq7Xu
	O+gInIw==
X-Received: by 2002:a05:6830:7181:b0:81b:ac9a:5681 with SMTP id 46e09a7af769-85d3649ebddmr3195695a34.29.1793413605457;
        Fri, 30 Oct 2026 19:26:45 -0700 (PDT)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85d355201f7sm3304636a34.23.2026.10.30.19.26.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 19:26:45 -0700 (PDT)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andre Przywara <andre.przywara@arm.com>,
	Junhui Liu <junhui.liu@pigmoral.tech>
Subject: [PATCH] clk: sunxi-ng: a733: preserve system-controller firmware clocks
Date: Fri, 30 Oct 2026 22:26:43 -0400
Message-ID: <20261031020640-263f7b05-a7s-clock@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_192647_104995_0DBD2138 
X-CRM114-Status: GOOD (  11.71  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-17.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

System-controller firmware uses the R-domain timer and mailboxes without
Linux clock consumers. Disabling these clocks as unused can leave
firmware services unavailable. On a Radxa Cubie A7S with vendor boot
firmware, the public CCU v6 candidate reaches a Linux shell but stalls
at warm reboot.

The public A733 firmware selects the RISC-V platform, reserves R-domain
timer0 for delays and enables both main and R-domain mailbox clocks.
Retain r-timer0, bus-r-timer, bus-r-riscv, bus-msgbox0 and bus-r-msgbox
with CLK_IS_CRITICAL. This keeps their modeled parents enabled as well.
Do not change rates, muxes, reset bits or unrelated gate policy.

The controlled tests distinguish the RISC-V bus gate from its separate
special clock. They support this set for the tested A7S firmware,
without establishing that every flag is independently minimal or that
all firmware services are covered. The matching A7S configuration
completed repeated warm reboots without clk_ignore_unused or a
register-writing helper. Suspend is not qualified by these tests.

Public firmware evidence:
https://github.com/radxa/allwinner-arisc/tree/79086caef1f6d1fb1cf164afb018f6e873fd9910/ar100s

AI assistance: Codex:gpt-6-astra.

Assisted-by: LLM
Signed-off-by: Enzo Adriano <enzo.adriano.code@gmail.com>
---
This is a standalone clock change for the separate A733/Cubie A7S DT
v2. It applies to official base d89e1d186ec9271bf78e62771779e9fc03bf0fc3
plus Junhui Liu's four clock-helper patches and A733 CCU v6 (eight):
https://lore.kernel.org/r/20260906-sunxi-clk-no-p-v1-0-cbde21c9fe69@pigmoral.tech
https://lore.kernel.org/r/20261009-a733-clk-v6-0-ae8178fce7e8@pigmoral.tech

No Fixes tag is assigned to the unmerged CCU input. This does not
replace or resubmit Junhui's series. The existing public MBUS_STORE
critical flag is not part of this change.

The final A7S integration passed two RAM boots, clock-summary checks
and warm reboots with vendor U-Boot
2018.07-17-boot-aw2501-g4c7078cfdf7-dirty. All five retained clocks
reported enabled. The Image was built with W=1; the final DTB passed
W=2 CHECK_DTBS=y. Earlier tests of the same five-clock change also
passed four boots and warm reboots. These are system observations on
one board, not proof of each flag's independent minimality or suspend.
The DT test used a RAM-only BL31 reservation at 0x48000000/0x01000000.

Final tested Image SHA-256:
1ea68cdc5998b584f8a3e62c44a21e506a22a8144c5824d9a8485607a8f2bd09

 drivers/clk/sunxi-ng/ccu-sun60i-a733-r.c | 13 +++++++++----
 drivers/clk/sunxi-ng/ccu-sun60i-a733.c   |  3 ++-
 2 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun60i-a733-r.c b/drivers/clk/sunxi-ng/ccu-sun60i-a733-r.c
index b8f6e8c6e50735d702d4de8c6d320652358f251e..e9fca8af03cec39ac39d739d371f2d6e4f7e1044 100644
--- a/drivers/clk/sunxi-ng/ccu-sun60i-a733-r.c
+++ b/drivers/clk/sunxi-ng/ccu-sun60i-a733-r.c
@@ -57,11 +57,12 @@ static SUNXI_CCU_M_DATA_WITH_MUX(r_apb1_clk, "r-apb1", r_apb_parents, 0x010,
 				 24, 3,	/* mux */
 				 0);
 
+/* System-controller firmware uses R-domain timer0 for delays. */
 static SUNXI_CCU_P_DATA_WITH_MUX_GATE(r_cpu_timer0, "r-timer0", r_apb_parents, 0x100,
 				      1, 3,	/* P */
 				      4, 3,	/* mux */
 				      BIT(0),	/* gate */
-				      0);
+				      CLK_IS_CRITICAL);
 static SUNXI_CCU_P_DATA_WITH_MUX_GATE(r_cpu_timer1, "r-timer1", r_apb_parents, 0x104,
 				      1, 3,	/* P */
 				      4, 3,	/* mux */
@@ -78,7 +79,8 @@ static SUNXI_CCU_P_DATA_WITH_MUX_GATE(r_cpu_timer3, "r-timer3", r_apb_parents, 0
 				      BIT(0),	/* gate */
 				      0);
 
-static SUNXI_CCU_GATE_HW(bus_r_timer_clk, "bus-r-timer", &r_ahb_clk.common.hw, 0x11c, BIT(0), 0);
+static SUNXI_CCU_GATE_HW(bus_r_timer_clk, "bus-r-timer",
+			 &r_ahb_clk.common.hw, 0x11c, BIT(0), CLK_IS_CRITICAL);
 
 static const struct clk_parent_data r_pwm_parents[] = {
 	{ .fw_name = "hosc" },
@@ -108,7 +110,9 @@ static SUNXI_CCU_DUALDIV_MUX_GATE(r_spi_clk, "r-spi", r_spi_parents, 0x150,
 				  0);
 static SUNXI_CCU_GATE_HW(bus_r_spi_clk, "bus-r-spi", &r_ahb_clk.common.hw, 0x15c, BIT(0), 0);
 
-static SUNXI_CCU_GATE_HW(bus_r_msgbox_clk, "bus-r-msgbox", &r_ahb_clk.common.hw, 0x17c, BIT(0), 0);
+/* Firmware can use this mailbox without a Linux clock consumer. */
+static SUNXI_CCU_GATE_HW(bus_r_msgbox_clk, "bus-r-msgbox",
+			 &r_ahb_clk.common.hw, 0x17c, BIT(0), CLK_IS_CRITICAL);
 
 static SUNXI_CCU_GATE_HW(bus_r_uart0_clk, "bus-r-uart0", &r_apb1_clk.common.hw, 0x18c, BIT(0), 0);
 static SUNXI_CCU_GATE_HW(bus_r_uart1_clk, "bus-r-uart1", &r_apb1_clk.common.hw, 0x18c, BIT(1), 0);
@@ -146,8 +150,9 @@ static SUNXI_CCU_MUX_DATA_WITH_GATE(r_riscv_clk, "r-riscv", r_riscv_parents, 0x2
 				  24, 2,	/* mux */
 				  BIT(31),	/* gate */
 				  0);
+/* Firmware runs on the RISC-V core independently of Linux. */
 static SUNXI_CCU_GATE_HW(bus_r_riscv_clk, "bus-r-riscv", &r_apb0_clk.common.hw,
-			 0x21c, BIT(0), 0);
+			 0x21c, BIT(0), CLK_IS_CRITICAL);
 static SUNXI_CCU_GATE_HW(bus_r_riscv_cfg_clk, "bus-r-riscv-cfg", &r_apb0_clk.common.hw,
 			 0x21c, BIT(1), 0);
 
diff --git a/drivers/clk/sunxi-ng/ccu-sun60i-a733.c b/drivers/clk/sunxi-ng/ccu-sun60i-a733.c
index cc2b229e2e6a6072f95086ce21cba6545012c0bb..ca0fc95fade2a66bcb90011e654a603eb676fd0b 100644
--- a/drivers/clk/sunxi-ng/ccu-sun60i-a733.c
+++ b/drivers/clk/sunxi-ng/ccu-sun60i-a733.c
@@ -635,8 +635,9 @@ static SUNXI_CCU_GATE_HWS(bus_dma1_clk, "bus-dma1", ahb_hws,
 static SUNXI_CCU_GATE_HWS(bus_spinlock_clk, "bus-spinlock", ahb_hws,
 			  0x724, BIT(0), 0);
 
+/* Keep the mailbox available to system-controller firmware. */
 static SUNXI_CCU_GATE_HWS(bus_msgbox0_clk, "bus-msgbox0", ahb_hws,
-			  0x744, BIT(0), 0);
+			  0x744, BIT(0), CLK_IS_CRITICAL);
 
 static SUNXI_CCU_GATE_HWS(bus_pwm0_clk, "bus-pwm0", apb0_hws,
 			  0x784, BIT(0), 0);

base-commit: d89e1d186ec9271bf78e62771779e9fc03bf0fc3
prerequisite-patch-id: 0df2ae41836b86fd868dfa01ddfde57f888f761a
prerequisite-patch-id: 88f3a431e7c551a9fa732f062188f10fdd362eeb
prerequisite-patch-id: 3e88bc873c909059d1199f82cda4013765e7a5e5
prerequisite-patch-id: 0dbc27cd7417352319a0705a051dff35085e8922
prerequisite-patch-id: 0ed6b92774b5b794761c7ce34db653a5435dc833
prerequisite-patch-id: 27ed3814dbd0c7ad830532ff125625917c873b4b
prerequisite-patch-id: 74d03898c5ce14763f4e89fb73e021de59f0fb9f
prerequisite-patch-id: 9225cb094cf6cbb338b14ac63711d68bed12d24d
prerequisite-patch-id: 568dae1c91a0d7318d6eb14a18054343b84b603a
prerequisite-patch-id: ff3806332e741f0e2c8dac1c11f4c71449c16c8c
prerequisite-patch-id: 39461e0543aefb5c40184664625cbab19ac8408a
prerequisite-patch-id: 6fc03bfbd343042dd3b660938fcc09c5e7d48314
-- 
2.53.0



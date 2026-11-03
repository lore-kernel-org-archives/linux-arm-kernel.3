Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADA2B606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 22:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jrLmQlmb;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MNSwfBC7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=mOkByMgIh23Ng8hqFybijqEgXApYqjm77yLCSksIVRY=; b=jrLmQlmbDFrdRj
	LB+Qc51WbuxsoG0PP87m4bkrxMP5cahU+HGMIZPP9MGaO6+GjsF2NBEni6h7T2tV33lpu4clcN/Ay
	6O1DH9B1G7+dMbJjIHzDXoMIOk3+4Z/xTbxAMcO5eX++XGTBZoZ6XgL+l7/4p0vSOAY+ws5wjEyj7
	a6QN6SIY8iGTQfT23OyYhPhVkxT38Z/M+SvFtyCwj3ID3kuw42mdJ6twfI5cJAKikEaAHZkqh6gRe
	IqI8cFayFRdahFJitfiS227ZtcA1jiP8hml9L7QWkuXL5Shae2svCuGRv1Jll9R3VP76n1llayKkj
	D4pdf2Hz9xWSvQM457Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOMEx-00000003jd1-1g2C;
	Tue, 03 Nov 2026 21:40:24 +0000
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOMEq-00000003jW0-2EWt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 21:40:17 +0000
Received: by mail-ot1-x32f.google.com with SMTP id 46e09a7af769-85c1135c286so32558a34.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 13:40:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793742016; x=1794346816; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mOkByMgIh23Ng8hqFybijqEgXApYqjm77yLCSksIVRY=;
        b=MNSwfBC7drirTta29nq7V7+pqJgw8GJpThcFeb+bgCInSX2PiL4TCHrWmH4hcCF8uG
         8KRqViibnPH45Sm6xN8P0TqniwZVRR/XgmRKSOvyxEY2TDbeGiu4Hq0AeyFVhIVsRkko
         LGQ6Em/KXWOd5Fc665l9qqY93xLRsywlLX2hYYzH4O6xcANfLUGHy2oYqueL8xxo7c2J
         Y+lE02tINOiSxX8VRu1aO3YJLueNWvwpUUcv3W7DkO/YuLu5f5kv9vFeOP+PzPr3l8Wi
         8QyJMUBI3qmgAWSdqR1rbWtdda92yv6G8U0u6rOPZoMXbfB/LYsvmu4vYGwzssLZwOBc
         Vxdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793742016; x=1794346816;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mOkByMgIh23Ng8hqFybijqEgXApYqjm77yLCSksIVRY=;
        b=fYjsn48yl/Is7RJbZM0s0kcixtpXIW2/KLRhOGR1Dr9/Vh3Vb4eY7m3XChBTLBoFMq
         GWk5WNAmJ0VK8hgO4ZXXb/sn6KVJSzaB/oX4Ptcaz0SAYF5NPG+87H0OpEsqetIPM2ID
         +gQcHopWGGTDwj7T03A8m5YQLY/lcD7P0kKTGIp/7X+z0aQvzHgdrAdHRS9cn2gEGqDs
         lvX8uDqXXrUqwi9U2umlKUrcX/xw8KRmUT+CJxAVmFKcxejBpWWGciwi6G5NeEhxVf+V
         m74FSEoOFXbc++Izdv7s0+sl8JbeC6CEtC26qXwj43UpuvPqPW1Lg32XGpaAc0LDqzLx
         KOfQ==
X-Forwarded-Encrypted: i=1; AKwUvBwudI5cW345q6uSQ/gk7d3bHw6GnqjkJaxRcs/OzWJ8FC29ssHlRmf21piQyqam+gN/67/C0CJNAzfjykV2rL2L@lists.infradead.org
X-Gm-Message-State: APuU4Z+5rKd+MEV8bx12YiPVmAdBjrpXycb9paH+6wwkXs2Fu0hZiM3Z
	5jtRjn7onUT57IiBntIS66dO7hDtA9zpmmG+41QktzDfHfoAMp7rF5bU
X-Gm-Gg: AYBFou0V8qDAXneb0OtU7VwvC6FXrk8cs9f+nV5XxRw8PV7QZ8SUtKiCmenfK+4sf9a
	zQ0BQoszNQsLOIHJUk7rWZFo481kYhy7eyINclknXJ6dqHZBUQF6GirwaRTnt5ILnAO3+2HO0eG
	s9mpAAuEoCwH49T7A4Q4krfXHxYy++3TJ39w24VmZBUHldwCPzjdsXP/9YGsQb1+mGiSq5Dar2Y
	RU1urilqPy9jrdNpSjgvA4FGb54KElNyjojCBmo69C9mswqFMmqKx+kRqD8MEAm1BCIVJ1f0gm1
	r4X9iOkx12saEzfVdO1HYbveuGJ1w7neuAN9Y6tKawDkhVQ5n5DpjvM9Dn41JfPYrkNI5J9Nnpg
	fvd4ooBkmuu0kezMAzBeTL4A+dGG7/XEDs61WhcPlEZmpF1fYNaJuRGf0fotO2D0T+bk4FTgEsz
	dd1JnLBb4D0ULArVMZ7woHbqwzL53YWPuwa8e8B7equ5gfCg0lXE6nWcEzaIqDTZHnbMBsHWCFi
	czB/L0Eh+JVxBeTX0KJ2tLJ6Vk2epEIHroJpBcshvr5uliYtw/MG63wJvJm+7+3rvuCCAognrHY
	cY7NTXFamIB5IMOu73OCwFBPy06tvervuPB25Iqw5TMH3gr4krKpLlMwoQBCLFfqop9Sfck7OT2
	jGyH/bXCQu1tV3aYP60jhsW3FM46bZwKp+ZH1IVHzQfxHUlNqeh87VeuiNR3i1NKmFpGCXgqX6d
	5ecvnSoW1rrewaK1CTRjehIGl0NiJhOIPLCd1ggDt+MeDdmD3kDFno
X-Received: by 2002:a05:6808:151f:b0:53a:e153:e8e6 with SMTP id 5614622812f47-5640de7d903mr9983750b6e.59.1793742015715;
        Tue, 03 Nov 2026 13:40:15 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-567a9f9115csm27060b6e.11.2026.11.03.13.40.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 13:40:15 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 03 Nov 2026 14:40:03 -0700
Subject: [PATCH v7 10/12] serial: 8250_dw: discover Allwinner A523 FIFO
 depths through FCC
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-submit-h616-uart-fifo-v1-v7-10-c9e248d685c1@gmail.com>
References: <20261103-submit-h616-uart-fifo-v1-v7-0-c9e248d685c1@gmail.com>
In-Reply-To: <20261103-submit-h616-uart-fifo-v1-v7-0-c9e248d685c1@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_134016_593417_8F55439C 
X-CRM114-Status: GOOD (  16.69  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The A523 UART integration, also used by A527 and T527, has 64-byte FIFOs
on UART0 and 128-byte FIFOs on UART1 through UART7. Each controller reports
its TX/RX FIFO depth in bits 31:8 of the FIFO Clock Control register at
offset 0xf0. The field holds a byte count, not a logarithmic encoding.

Read this field in the sunxi setup callback when platform data does not
provide a fixed FIFO size. A fixed size takes precedence, so H616 retains
its 256-byte configuration without accessing FCC. The probe has already
enabled the clocks and deasserted reset before invoking the callback.
Leave the FIFO clock-control bits untouched.

Use the shared DesignWare trigger setup to validate the depth and build
the FIFO-relative threshold table. Invalid depths fail probe before
registration instead of producing zero or truncated thresholds. The 8250
core derives the transmit load from the discovered depth.

Select this setup for the A523 compatible. Like H616, this integration
has Allwinner-specific debug-divisor and RS485 registers overlapping the
generic DesignWare feature probes. Use the common sunxi PIO setup,
BUSY-safe integer divisor programming and software RS485 handling. Keep
the APB clock gate enabled during termios updates with SKIP_SET_RATE.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/tty/serial/8250/8250_dw.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
index 0e7367ba872e..cdd3a62dfa7e 100644
--- a/drivers/tty/serial/8250/8250_dw.c
+++ b/drivers/tty/serial/8250/8250_dw.c
@@ -44,6 +44,10 @@
 #define RZN1_UART_xDMACR_8_WORD_BURST	(2 << 1)
 #define RZN1_UART_xDMACR_BLK_SZ(x)	((x) << 3)
 
+/* Allwinner FIFO Clock Control register */
+#define SUNXI_UART_FCC			0xf0
+#define SUNXI_UART_FCC_FIFO_DEPTH		GENMASK(31, 8)
+
 /* Quirks */
 #define DW_UART_QUIRK_OCTEON		BIT(0)
 #define DW_UART_QUIRK_ARMADA_38X	BIT(1)
@@ -63,6 +67,7 @@
 struct dw8250_platform_data {
 	u8 usr_reg;
 	u32 cpr_value;
+	/* Fixed FIFO depth; zero selects discovery during setup */
 	unsigned int fifo_size;
 	unsigned int quirks;
 	int (*setup)(struct uart_port *p);
@@ -666,7 +671,13 @@ static int dw8250_sunxi_setup(struct uart_port *p)
 
 	p->type = PORT_16550A;
 	p->flags |= UPF_FIXED_TYPE;
-	p->fifosize = data->pdata->fifo_size;
+	if (data->pdata->fifo_size) {
+		p->fifosize = data->pdata->fifo_size;
+	} else {
+		u32 fcc = dw8250_readl_ext(p, SUNXI_UART_FCC);
+
+		p->fifosize = FIELD_GET(SUNXI_UART_FCC_FIFO_DEPTH, fcc);
+	}
 	up->capabilities = UART_CAP_FIFO | UART_CAP_NOTEMT | UART_CAP_AFE;
 
 	ret = dw8250_setup_rxtrig(p);
@@ -912,6 +923,12 @@ static const struct dw8250_platform_data dw8250_h616_data = {
 	.setup = dw8250_sunxi_setup,
 };
 
+static const struct dw8250_platform_data dw8250_a523_data = {
+	.usr_reg = DW_UART_USR,
+	.quirks = DW_UART_QUIRK_SKIP_SET_RATE,
+	.setup = dw8250_sunxi_setup,
+};
+
 static const struct dw8250_platform_data dw8250_octeon_3860_data = {
 	.usr_reg = OCTEON_UART_USR,
 	.quirks = DW_UART_QUIRK_OCTEON,
@@ -964,6 +981,7 @@ static const struct dw8250_platform_data dw8250_tda54 = {
 static const struct of_device_id dw8250_of_match[] = {
 	{ .compatible = "snps,dw-apb-uart", .data = &dw8250_dw_apb },
 	{ .compatible = "allwinner,sun50i-h616-uart", .data = &dw8250_h616_data },
+	{ .compatible = "allwinner,sun55i-a523-uart", .data = &dw8250_a523_data },
 	{ .compatible = "cavium,octeon-3860-uart", .data = &dw8250_octeon_3860_data },
 	{ .compatible = "marvell,armada-38x-uart", .data = &dw8250_armada_38x_data },
 	{ .compatible = "renesas,rzn1-uart", .data = &dw8250_renesas_rzn1_data },

-- 
2.53.0



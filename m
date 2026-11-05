Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3D26606A326
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 20:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aDwQnEAz;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=goiQQzG6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=RD1jkN1QvH2Z5B6Q5iIjFx4HZtCXt5GvWjpjCwZzO7s=; b=aDwQnEAz3kApmm
	2VOA57jX3vpbhB1WYt7O7FBCaszwHu5oC6YbE+2+8Canw6nQfeilTGWYMXOKs+NmGzzCZSVpuE4WC
	LXSJTUIf8ytYojGEXJXUaxHG+/bzThr0kqb+4EMCdWJjR574KPQFZIWnmYqfvCmWNAKeMHFKxdRpS
	JR5riv6Jm7S3/QuV9IzgPlRc6DbSKAE74Y015x6pn5CuV9vCT4Jma5ualwDvo8/TDzpWRbo7ziJAI
	7Kumerdj3a3Hp2nVcS9ZWEk2kcoyqDCHjra1qZNpkYOJE3h+p0Bn9wqJLvJM+rHbErf/sz894WSZm
	UyyRjMw7hUMpiyms6bhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP4Rx-0000000Acz5-3tGY;
	Thu, 05 Nov 2026 20:52:45 +0000
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP4Rl-0000000Acku-3RFM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 20:52:35 +0000
Received: by mail-ot1-x329.google.com with SMTP id 46e09a7af769-84a248254f4so12034a34.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 12:52:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793911952; x=1794516752; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RD1jkN1QvH2Z5B6Q5iIjFx4HZtCXt5GvWjpjCwZzO7s=;
        b=goiQQzG6wu+Wam7B5bqLEPdjbDU/RHU0RsNIlEA5nSEC+Ou0Z5WKMfcwyQfpvoY5kl
         veUADWdrUd1VJMEHlZTMOdtA/xirn13j+3WzOcyQS3q5wr5OHUTqwItO8XAjSPRIFP1d
         95/C3rqqHlvICMhO7fIOwAFpd6tgha95j+68bsND22Whc48Ze5w94iG/MYiqpQl537em
         +2imX4fcOEU7l4a5ArXcoBEUm0lhdbGPINoIYqIf4ASCGupYY8anLRCTtynkHY9INKue
         MYBrJIKTsPlSfF35fDjs5peBPN1+VOyETelZBef8YkOLhR7cAGLGP1zQADTdH85d0AGw
         JHgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793911952; x=1794516752;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RD1jkN1QvH2Z5B6Q5iIjFx4HZtCXt5GvWjpjCwZzO7s=;
        b=t+vZXj68s+5XWXwUrc3UcrZIm+vPbUFnrQR987CZnkWc6vVZ1u+2+BV5HOQqZzXO7B
         wgsTrmBcdWai9jjKuJ15Pp3bc+oefk3GGBxVck2Nm5hJ6GnoYhs2R21FMJl7i0OLxEe3
         epNY7IVKwK4ruI2l1idNVD6qcHI5loZPX9ogPXQS28r2bvzfppyQk8QnBTaYyfVKwJzZ
         5DQsQ5D3tLX9Z9Bx/lWDIcGcENTSP4SNWuGfldVorf2Xllgop0NpSDMvFPM2C+EulxPh
         RabMnBfWFaU5YlbKzjl8hHUogN9vRSCQ3UqrHgQ5eAN+9QurJpdMahHKYpTzndMjFdeI
         V01Q==
X-Forwarded-Encrypted: i=1; AKwUvBx/IY3awWPNDL4pBojn0ryil5jR05qbwjIoFBsixAGZXnQm0Jxu2OJuR9azWUlsMbvlg6oQYp7w2bunEMyLOvJZ@lists.infradead.org
X-Gm-Message-State: APuU4Z9+2QqqUIbM1ZAR1rNmI9Zqrc7MlfXPi9qB4DvfZNQp1gW3Fetw
	ymu1NpMudfAsFeCiiLxWEGAEdpnwb2eSyIgi3xbkF8FiLYAwCq3qca29
X-Gm-Gg: AYBFou3weGFOi03+/v70cvaktOuvxM0UWZ7NJ523r8ClK8c81A4vB5SuJfRczLnEBKk
	fZbs/+WE1a0I47v4iLUiQXm1MShrTk9al1rBVhxMkmwLcWDe1jqoO19lj8T1u4/+Bb1J1w3f4yo
	iGXZo/GrnlxoTKt4EILRB8/k3LWu02dsqS3R2v79vWXcB6MoTt/UGRqFPB759xbl30YPjhYYJrI
	ZC2jL8ks+EBJQHD8QRl5FFiLJFBvT6VC2mb+y1gOCNbyBJ7HVtOG/KJHfZnzOGU6E7H34pOjccV
	lDZI+q225cWDV3ZPvlUB2MB7Yu2YJsjFB38RTxEqey3qdyyUKzEYj47ypf5DH/60WdRIl1VjqeG
	W4h6R3/9mTybO/drnPRsYk8uOSrIz36WYk+AFao6/dNGOw+3fCqtzw24Nz1AlraNvZbzirjFHjg
	OVou2kZ5lfMZzImO9DihabhhvGiF9x91p7w5VFwC53EKcDvmM7HRcAR/rdYD+sKbgOa+lfmwni4
	f9kh6mO6trDJGUxtGL/Vs5buCq+8+NeHjI7wav60Sq9o+YosFBVyeZulZgw0RV/j2vgqXD7e3+H
	FmtggbYXQ2h4jPI5eV05HtJvbUNQCZ/l91n/miP+eHQTz6mylZqQi7PwJbwvdzPzAT6j0dJXXQE
	XNN4jyESYg9fGrta2VTEQcF1eKUUEkTbep5N52JKEEcLMhcxxs3vz/V8DERzrKk3Q0m48W6HxKg
	bWDR13IvSviA38K2//rq+aAP4pVAkDpytoNlEW+8wVJXme1WOb1w8=
X-Received: by 2002:a05:6830:43a2:b0:821:8e71:1bb5 with SMTP id 46e09a7af769-85f1cfe1eddmr529135a34.14.1793911952656;
        Thu, 05 Nov 2026 12:52:32 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1dbb298fsm292276a34.6.2026.11.05.12.52.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 12:52:31 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 05 Nov 2026 13:52:11 -0700
Subject: [PATCH v8 10/11] serial: 8250_dw: discover Allwinner A523 FIFO
 depths through FCC
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-submit-h616-uart-fifo-v1-v8-10-14024d2b184b@gmail.com>
References: <20261105-submit-h616-uart-fifo-v1-v8-0-14024d2b184b@gmail.com>
In-Reply-To: <20261105-submit-h616-uart-fifo-v1-v8-0-14024d2b184b@gmail.com>
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
X-CRM114-CacheID: sfid-20261105_125234_002327_87EE56C4 
X-CRM114-Status: GOOD (  17.58  )
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
 drivers/tty/serial/8250/8250_dw.c | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
index a55f60330a51..257baab5a3ed 100644
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
@@ -666,7 +671,15 @@ static int dw8250_sunxi_setup(struct uart_port *p)
 
 	p->type = PORT_16550A;
 	p->flags |= UPF_FIXED_TYPE;
-	p->fifosize = data->pdata->fifo_size;
+
+	/* Apply given FIFO size or try to autodetect it */
+	if (data->pdata->fifo_size) {
+		p->fifosize = data->pdata->fifo_size;
+	} else {
+		u32 fcc = dw8250_readl_ext(p, SUNXI_UART_FCC);
+
+		p->fifosize = FIELD_GET(SUNXI_UART_FCC_FIFO_DEPTH, fcc);
+	}
 
 	up->capabilities = UART_CAP_FIFO | UART_CAP_NOTEMT | UART_CAP_AFE;
 
@@ -913,6 +926,12 @@ static const struct dw8250_platform_data dw8250_h616_data = {
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
@@ -965,6 +984,7 @@ static const struct dw8250_platform_data dw8250_tda54 = {
 static const struct of_device_id dw8250_of_match[] = {
 	{ .compatible = "snps,dw-apb-uart", .data = &dw8250_dw_apb },
 	{ .compatible = "allwinner,sun50i-h616-uart", .data = &dw8250_h616_data },
+	{ .compatible = "allwinner,sun55i-a523-uart", .data = &dw8250_a523_data },
 	{ .compatible = "cavium,octeon-3860-uart", .data = &dw8250_octeon_3860_data },
 	{ .compatible = "marvell,armada-38x-uart", .data = &dw8250_armada_38x_data },
 	{ .compatible = "renesas,rzn1-uart", .data = &dw8250_renesas_rzn1_data },

-- 
2.53.0



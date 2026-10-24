Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9F99606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 Oct 2026 20:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YUtLTKx6;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=nYpoGsod
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=YTxJJJ8fbTcAU9VqNhqp+UqN8RZ1Zq5MlC0xiBzcrfM=; b=YUtLTKx6oyqqTX
	L08NSyRwZSpLlVYigkeiciJNUIC9RLbhAlHXFgKiT6r4WeyeHXugdn2pJ72OfnuXW5QS7ZmsNKkig
	ibdKfnOAy7EtJxVABKNJ5Id4O56QOJx7enADmEDv8A3qPJ30rkhqI9auvxsr1nEI51V1IaRo7Hd7d
	lROu/WKQCuoGTJMz7wh/dFpQwoWwV/8LMmMALj/DvI/QtowZ+5d6UAmDLdZw4dkWb2MsxaWvAWaiA
	k1jEEXvtgfFtIUFDKwXP3Q2QwnzvgeymJrQv9SIT6uo/+qLShVXQVRzIKbw/XBHmOiIr2ORZw6eJW
	SWjlJwq9mmiWes1868fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKiGK-00000000V4y-22og;
	Sat, 24 Oct 2026 20:22:44 +0000
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKiGC-00000000V25-1yNH
	for linux-arm-kernel@lists.infradead.org;
	Sat, 24 Oct 2026 20:22:37 +0000
Received: by mail-ot1-x331.google.com with SMTP id 46e09a7af769-81ae6aefdceso1603447a34.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 24 Oct 2026 13:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792873355; x=1793478155; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YTxJJJ8fbTcAU9VqNhqp+UqN8RZ1Zq5MlC0xiBzcrfM=;
        b=nYpoGsodiDPXgBWQC/NX8KQ1aO3OcxhnzPTQ9FTWUGoZ+UzxY3+nXLyId9FxHFoDtE
         JtmnPEUQArTIQ1EyEVccxCJAcJBTeGGbbw0ra4A1TPmlf12YLtbplKTTpKM7AvpKbZ5t
         KlQeNjNzx9lAglhlhgWFIgzSakaI8YZZlrYnkYONi31VoCScWE9MGGEA0I4p7ZckIrS1
         hgIhZx0tyTY7UkDW4scyoAgJOy19TvoGl/180djuprrWQYWSZ4M5PAVgQk17PFZOz0Ux
         saBraKfxOsfR/glU6wUi4Jm/mrZhveXTYgZsfvdSwsgT+fhq3O+l2yhXfJQcyfC77HJM
         l8Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792873355; x=1793478155;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YTxJJJ8fbTcAU9VqNhqp+UqN8RZ1Zq5MlC0xiBzcrfM=;
        b=M8uTcjOvHKIU7EH7z/6bfpOLIDPlX7tD7xJKMF8iZ/FghRDBxI9SRZ2N7CR8/FdvW3
         EB8B5//u7IvKWPUQC9+YerL1su2gruORr/1LvnPWV8RFYpv/XZLlDQfUeIMUWlvhlygs
         HTrpPKtkyFLl33eqh+F8yDAbAmir3n8wipsFgFa8LE6H8Fe2T5j8kTOE1c2iV7kHnYju
         E+EMsibubJuB/gxV2BEW/FKXrRRi/tpOW+f+zInQVCGz76mq71CKlxFQ+4D5uWpHN3YF
         LX9Q8VOYq9HgqG0+nh0SwXdubeIXwrOokH8ViDrbIekEn0RT1r4JRcLNa00PxlY3S5K0
         bHsw==
X-Forwarded-Encrypted: i=1; AKwUvBw1xEs+yhg3YpXOBwtsswJUnnm7ubCWcxsLXxuyiehipOzzAYhIluT/6VZy9BYofnQKKrVZ5xcCHPuUJmVl1+Qd@lists.infradead.org
X-Gm-Message-State: AFq9FYKgmyJa/7OihAvl0SwpWqKT/SIqYL+rZqObg7jgiQZJX7sUCwt/
	Q0YmEdayDXZXuzSC38di/RZuB99cmFaU/K/KCmDAcEZ4m8/6Q7//meZHT8e0swJV
X-Gm-Gg: AYBFou0//tO2rxvyCDufsw/VTW3zwfiRCC0vVDYKDmKhtsEbUR1Scv6fIKFBiUljmwO
	MmlN8TFsSKVOcWfh3nlE52svUdPPkNmkp/Zwtzn1MWYUQLYlmmxBc2mZsH3uJwuH81L9doZU1xY
	oG6s5B03xfl+4UzX3Q7sNstjQzre+R86WTrAdRFm0qjlO6ZtbaGHYUOTcshy+yP8Ztu5nmTE+ag
	Mt8V74TVas5seNq8zsr+1l/tA4gfnwbXj5bs7ClP4qoWfZF6gJrpRVFO8IEpfDwYjuslyux3Bq2
	cDoohyYpq1BB1qXa2vcsp/nzeqiFHLKnevfH7qrq83rx+rrwkASsr5eO41XRrOrhY6AtJgE0Hhy
	ZfsieeeIkqAco/OuskUjpTjycpb/cn0RLEXtBnwV53u6C98BwqwQg9I1rPKtKiaccriTHZeUiQQ
	LyJkQJ/dV3ZI7cWur1HPaf1Ma/2EdiEUoSLDODvKd1HzZXOrMTVMzXo5oylEEGmrpwGnnYQo+Rm
	5gRH86cMrzKN/F3Jn9PEF3OrclC7pOXFWw3I7RBntqaV73fyO42tHe+dXmuIUBZQyu3NHWRSQel
	Qn5qU6lpedKw7GI0Byflt9Gf2pvfF7H57axxXCUtNKL+10wQ5arg7cW/dpL8SH1Hmu2yWYzH0QN
	VC7xSeB9ZRb71v7sLfNLPljUaXs/UVGnxSlvjneNTqYLzeFVpnIgHujM/WqbeAUkmLDWhFpu4m8
	StsrTV/3VWf93etmD77l3ycvgB
X-Received: by 2002:a05:6808:1786:b0:4ec:d521:9124 with SMTP id 5614622812f47-55c002e11f9mr2173304b6e.30.1792873355240;
        Sat, 24 Oct 2026 13:22:35 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-55c0424775dsm1815063b6e.5.2026.10.24.13.22.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 13:22:34 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 24 Oct 2026 14:22:23 -0600
Subject: [PATCH v3 1/4] serial: 8250_dw: select port setup through platform
 data
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261024-submit-h616-uart-fifo-v1-v3-1-286fc1b8c3c1@gmail.com>
References: <20261024-submit-h616-uart-fifo-v1-v3-0-286fc1b8c3c1@gmail.com>
In-Reply-To: <20261024-submit-h616-uart-fifo-v1-v3-0-286fc1b8c3c1@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261024_132236_526199_32FA0BB5 
X-CRM114-Status: GOOD (  18.24  )
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

Select feature discovery and DMA attachment through a platform-data setup
callback. The generic callback probes the optional registers and attaches
DMA when a FIFO size is available. Integrations with a fixed configuration
can supply their own setup before the port is registered.

Replace skip_autocfg with the Octeon setup selection. On 64-bit builds,
Octeon continues to skip optional-register probing while retaining its DMA
setup; on 32-bit builds it retains the generic setup. Keep generic setup
for devices without matched platform data as well.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/tty/serial/8250/8250_dw.c | 48 +++++++++++++++++++++++++++++++--------
 1 file changed, 38 insertions(+), 10 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
index eca02e8bd6d1..9c171c5775a6 100644
--- a/drivers/tty/serial/8250/8250_dw.c
+++ b/drivers/tty/serial/8250/8250_dw.c
@@ -64,6 +64,7 @@ struct dw8250_platform_data {
 	u8 usr_reg;
 	u32 cpr_value;
 	unsigned int quirks;
+	void (*setup)(struct uart_port *p);
 };
 
 struct dw8250_data {
@@ -76,7 +77,6 @@ struct dw8250_data {
 	struct clk		*pclk;
 	struct reset_control	*rst;
 
-	unsigned int		skip_autocfg:1;
 	unsigned int		uart_16550_compatible:1;
 	unsigned int		in_idle:1;
 
@@ -595,7 +595,6 @@ static void dw8250_quirks(struct uart_port *p, struct dw8250_data *data)
 		p->serial_out = dw8250_serial_outq;
 		p->flags = UPF_SKIP_TEST | UPF_SHARE_IRQ | UPF_FIXED_TYPE;
 		p->type = PORT_OCTEON;
-		data->skip_autocfg = true;
 	}
 #endif
 
@@ -630,6 +629,25 @@ static void dw8250_shutdown(struct uart_port *port)
 	d->no_int_count = 0;
 }
 
+static void dw8250_setup_dma(struct uart_port *p)
+{
+	struct dw8250_data *data = to_dw8250_data(p->private_data);
+	struct uart_8250_port *up = up_to_u8250p(p);
+
+	/* If we have a valid fifosize, try hooking up DMA */
+	if (p->fifosize) {
+		data->data.dma.rxconf.src_maxburst = p->fifosize / 4;
+		data->data.dma.txconf.dst_maxburst = p->fifosize / 4;
+		up->dma = &data->data.dma;
+	}
+}
+
+static void dw8250_setup(struct uart_port *p)
+{
+	dw8250_setup_port(p);
+	dw8250_setup_dma(p);
+}
+
 static int dw8250_probe(struct platform_device *pdev)
 {
 	struct uart_8250_port uart = {}, *up = &uart;
@@ -765,14 +783,11 @@ static int dw8250_probe(struct platform_device *pdev)
 
 	dw8250_setup_dma_filter(p, data);
 
-	if (!data->skip_autocfg)
-		dw8250_setup_port(p);
-
-	/* If we have a valid fifosize, try hooking up DMA */
-	if (p->fifosize) {
-		data->data.dma.rxconf.src_maxburst = p->fifosize / 4;
-		data->data.dma.txconf.dst_maxburst = p->fifosize / 4;
-		up->dma = &data->data.dma;
+	if (data->pdata) {
+		if (data->pdata->setup)
+			data->pdata->setup(p);
+	} else {
+		dw8250_setup(p);
 	}
 
 	data->data.uport = serial8250_register_8250_port(up);
@@ -852,16 +867,23 @@ static _DEFINE_DEV_PM_OPS(dw8250_pm_ops, dw8250_suspend, dw8250_resume,
 
 static const struct dw8250_platform_data dw8250_dw_apb = {
 	.usr_reg = DW_UART_USR,
+	.setup = dw8250_setup,
 };
 
 static const struct dw8250_platform_data dw8250_octeon_3860_data = {
 	.usr_reg = OCTEON_UART_USR,
 	.quirks = DW_UART_QUIRK_OCTEON,
+#ifdef CONFIG_64BIT
+	.setup = dw8250_setup_dma,
+#else
+	.setup = dw8250_setup,
+#endif
 };
 
 static const struct dw8250_platform_data dw8250_armada_38x_data = {
 	.usr_reg = DW_UART_USR,
 	.quirks = DW_UART_QUIRK_ARMADA_38X,
+	.setup = dw8250_setup,
 };
 
 static const struct dw8250_platform_data dw8250_renesas_rzn1_data = {
@@ -876,16 +898,19 @@ static const struct dw8250_platform_data dw8250_renesas_rzn1_data = {
 		     DW_UART_CPR_DMA_EXTRA |
 		     DW_UART_CPR_FIFO_MODE_FROM_SIZE(16),
 	.quirks = DW_UART_QUIRK_CPR_VALUE | DW_UART_QUIRK_IS_DMA_FC,
+	.setup = dw8250_setup,
 };
 
 static const struct dw8250_platform_data dw8250_skip_set_rate_data = {
 	.usr_reg = DW_UART_USR,
 	.quirks = DW_UART_QUIRK_SKIP_SET_RATE,
+	.setup = dw8250_setup,
 };
 
 static const struct dw8250_platform_data dw8250_intc10ee = {
 	.usr_reg = DW_UART_USR,
 	.quirks = DW_UART_QUIRK_IER_KICK,
+	.setup = dw8250_setup,
 };
 
 static const struct dw8250_platform_data dw8250_ultrarisc_dp1000_data = {
@@ -895,11 +920,13 @@ static const struct dw8250_platform_data dw8250_ultrarisc_dp1000_data = {
 		     DW_UART_CPR_DMA_EXTRA |
 		     DW_UART_CPR_FIFO_MODE_FROM_SIZE(32),
 	.quirks = DW_UART_QUIRK_CPR_VALUE,
+	.setup = dw8250_setup,
 };
 
 static const struct dw8250_platform_data dw8250_tda54 = {
 	.usr_reg = DW_UART_USR,
 	.quirks = DW_UART_QUIRK_SKIP_EMPTY_FIFO_READ,
+	.setup = dw8250_setup,
 };
 
 static const struct of_device_id dw8250_of_match[] = {
@@ -918,6 +945,7 @@ MODULE_DEVICE_TABLE(of, dw8250_of_match);
 static const struct dw8250_platform_data dw8250_apmc0d08 = {
 	.usr_reg = DW_UART_USR,
 	.quirks = DW_UART_QUIRK_APMC0D08,
+	.setup = dw8250_setup,
 };
 
 static const struct acpi_device_id dw8250_acpi_match[] = {

-- 
2.53.0



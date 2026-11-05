Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A544606D820
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 20:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dqF23cCC;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gd3w+tn/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=E9UoBDBjwLLwDb4WmV28avfpsh+5/w/6UybGFvQ6fZk=; b=dqF23cCCQ9iG8C
	7kgMXNuaXzcxWNhvoTU08hIj5yoRrJ2EdrHK+5OPe/gSJiy7t7sK2cqSVi/xRl+rlZxAoOW0eRDwh
	tEEaT+RPsgW5ExXFC55wlRwt2KNQw4y4qOOYa0kkso8i5WsegxiSSXOzVbvmXI3u4/r8AvpPwQClv
	pMA4MHxFDWzjCh2zmZ74/6qe9pttooCaxXVs8smmK+041h9XSUw4bpzpo/hGgXyWlR3yyzt0u3UuE
	L8yyrwluroLxUN0ZzXxS4vT6+Daczr8n7nMTeYfxID83EBftjPHPcG8PCbX7rKZVkxbYe1zQfplMb
	9PkpjbX1gLBqoWGWEhlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP4Ra-0000000AceB-1652;
	Thu, 05 Nov 2026 20:52:22 +0000
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP4RX-0000000Acbc-21QD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 20:52:20 +0000
Received: by mail-ot1-x335.google.com with SMTP id 46e09a7af769-85a5455bd3cso2486a34.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 12:52:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793911938; x=1794516738; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E9UoBDBjwLLwDb4WmV28avfpsh+5/w/6UybGFvQ6fZk=;
        b=gd3w+tn/GH6brxKhJaq/ljYWAc7IfPeSsJdkzzjQJO+CZxVXBXN0n8T4ZHsgNpEf5M
         BO0PnjtUGXsAF8qR2TVHuaEP+I6uKD+de6mOL9RMHrjSb+eBeZZUBOMXmJr2Oms2vSXh
         a05EyDBoi9QzCvbnSnVh/3fzrU3kcRxBDilCgVk3ie8mSXkx1PjGTk8cewQuBN8UR9Yu
         tidBazDTqDte3qjzWxXaBUB3G8pwkRy3EbrmSUHQnN3dP9qJNXCmr60s+FAKlzS70xpt
         YebCZ2z9n38frr2D1zorSKG/ME3c7hY9v2LUPY8ShvvzPv+wK/kgGi1hTMrBCgucB+g4
         bP6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793911938; x=1794516738;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E9UoBDBjwLLwDb4WmV28avfpsh+5/w/6UybGFvQ6fZk=;
        b=W92bpNlj9BDaL/wnHWwAR31MEDvc+1Cu2RsWk0sLphaH6ynn31r0oXD0yMzk5zCjwS
         KSJ7dTRK4DiYoF+xTyBpgbR+HBvLo5TONj0FmsmmhFMh7+Fi3MaJKIrKzCWVwUks6u0d
         TqbjyRgw0K2YgHFDYYP7sd9suSNklD/WuqSDDL/Uf/41tuyRF0jf1zZH8uiuc9I/dudw
         p0aWLCNu5KSnkO8rfxcIUynCn52urRrDauL4o94W/Uef+KuePbTfodg7wNGz7up9JjE4
         4w59+8KU+UazX4Dhm2szwfSziJeboiOOxOGu0Oh1F2OpcgImUFRDtsMBdnYgT07dtPps
         DMJA==
X-Forwarded-Encrypted: i=1; AKwUvBwwjpk+DXTGtgKs/IDmAgNWwDHY/YTWIWaKh/bQshcRte/k/2Rlb/OhbHfyXAonh6ZmCOeMXNL4YSFTVcDJLf1y@lists.infradead.org
X-Gm-Message-State: APuU4Z/febX220ZR109Ts13qrNlr/J2rdsjzCi4JqM/hsWKTLwFpwsVy
	KZtq4uR9OK5aHdDuV800LaEvAxFOWvCFzxrpzQvUNAlDMtfWti56NsAs
X-Gm-Gg: AYBFou2xHfgnzWs2Fuida5U1SIAWq6kUed0giCdjivjCVhKW3Hj/O0aIKB582Nz3Bn7
	g8pjJwMYGhQSFuCFOpqe3L/Hmr/pZY6ZCcrvhzzlBGMCpvhu+pin1kKQWhJTr3NY343cwO4cFl3
	rxbGJomdQ3TFQH2cOc29xyBa+2dC1zWIFoqHyqoJv+T9ChyWlRT/K02wgb15dT8az+Dpnbl/01e
	fY6hvvkTrka1sNUSsX6+5HwcGFA7KMJxCm6xejitT5P/KXfEv/WLKiTc+yVUeejq2D0opOqa+b5
	NX/RSeC7Wp6Y1YYXA5wTU8sfNEhzat6UzGvfcPOjB5t/FZLF4AWwEJWT7hGzFpdw4ag4cqfwMtK
	awD8BlRfMIwD32G6E0KEbWMKOCJyxGh7LDIO+ffq+8h75N4xYAZYzXSNtWtfaoIhXLzYgANxEbi
	5gSGPcotH1hET265yOf6Ol9gCPHMhPVSMEtKSv9Z9JTFRkzKtqB/A0of4GCOzAwUEMwgqmPewIH
	fdr2vOdD8s7zav7wOz0c8w5wF6CpplTB+kB2QbfWz+78PE8CML7A8asHauBDkI2udluWKILJr+j
	McKw7dB66+8Vl0bspje80RgB+qx0PmSEfS42qn+hEhSP7JVXyNHHVcxa7fFu4dWrC2AeWZQbvkn
	Qqvxv+X3PRwyEHNm/zIv4eI4ClTPD1VSfAw5JiBLlwLcJO62pXMdtvD/N/pv7uEajrSWdUjwB91
	qoojia9SVPzZ3P0IlkIU+E+tRIVAYifeAb8KvEggIvcnNjtEbLWDWCH/I4pzGSMAsCrsLXJbtE
X-Received: by 2002:a05:6830:2317:b0:85d:6045:52c6 with SMTP id 46e09a7af769-85f1d086f53mr580936a34.24.1793911938304;
        Thu, 05 Nov 2026 12:52:18 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1dbb298fsm292276a34.6.2026.11.05.12.52.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 12:52:16 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 05 Nov 2026 13:52:04 -0700
Subject: [PATCH v8 03/11] serial: 8250: widen RX trigger byte counts to 16
 bits
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-submit-h616-uart-fifo-v1-v8-3-14024d2b184b@gmail.com>
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
X-CRM114-CacheID: sfid-20261105_125219_542407_1561B557 
X-CRM114-Status: GOOD (  15.18  )
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

DesignWare UARTs can have 2048-byte FIFOs, with receive thresholds as
large as 2046 bytes. The byte-sized threshold tables, setter argument and
sysfs parser cannot represent these values.

Use u16 for the threshold tables and byte counts throughout the 8250
conversion and sysfs paths, including the uart_port callback interface.
Keep the FCR encoding byte-sized and preserve the existing threshold
selection. The Moxa setter continues to validate against its 128-byte
FIFO before writing the byte-sized trigger register.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/tty/serial/8250/8250.h        |  2 +-
 drivers/tty/serial/8250/8250_mxpcie.c |  2 +-
 drivers/tty/serial/8250/8250_port.c   | 12 ++++++------
 include/linux/serial_core.h           |  2 +-
 4 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/tty/serial/8250/8250.h b/drivers/tty/serial/8250/8250.h
index 21ed9c41b751..939b7d4209f1 100644
--- a/drivers/tty/serial/8250/8250.h
+++ b/drivers/tty/serial/8250/8250.h
@@ -69,7 +69,7 @@ struct serial8250_config {
 	unsigned short	fifo_size;
 	unsigned short	tx_loadsz;
 	unsigned char	fcr;
-	unsigned char	rxtrig_bytes[UART_FCR_R_TRIG_MAX_STATE];
+	u16		rxtrig_bytes[UART_FCR_R_TRIG_MAX_STATE];
 	unsigned int	flags;
 };
 
diff --git a/drivers/tty/serial/8250/8250_mxpcie.c b/drivers/tty/serial/8250/8250_mxpcie.c
index 4935a5d1c1a3..4f0b881b4f83 100644
--- a/drivers/tty/serial/8250/8250_mxpcie.c
+++ b/drivers/tty/serial/8250/8250_mxpcie.c
@@ -257,7 +257,7 @@ static int mxpcie8250_get_rxtrig(struct uart_port *port)
 	return serial_port_in(port, MOXA_PUART_RTL);
 }
 
-static int mxpcie8250_set_rxtrig(struct uart_port *port, unsigned char bytes)
+static int mxpcie8250_set_rxtrig(struct uart_port *port, u16 bytes)
 {
 	struct mxpcie8250 *priv = dev_get_drvdata(port->dev);
 
diff --git a/drivers/tty/serial/8250/8250_port.c b/drivers/tty/serial/8250/8250_port.c
index 36b2b0a2c05c..452851815ffc 100644
--- a/drivers/tty/serial/8250/8250_port.c
+++ b/drivers/tty/serial/8250/8250_port.c
@@ -3008,14 +3008,14 @@ static int serial8250_request_port(struct uart_port *port)
 static int fcr_get_rxtrig_bytes(struct uart_8250_port *up)
 {
 	const struct serial8250_config *conf_type = &uart_config[up->port.type];
-	unsigned char bytes;
+	u16 bytes;
 
 	bytes = conf_type->rxtrig_bytes[UART_FCR_R_TRIG_BITS(up->fcr)];
 
 	return bytes ? bytes : -EOPNOTSUPP;
 }
 
-static int bytes_to_fcr_rxtrig(struct uart_8250_port *up, unsigned char bytes)
+static int bytes_to_fcr_rxtrig(struct uart_8250_port *up, u16 bytes)
 {
 	const struct serial8250_config *conf_type = &uart_config[up->port.type];
 	int i;
@@ -3073,7 +3073,7 @@ static ssize_t rx_trig_bytes_show(struct device *dev,
 	return sysfs_emit(buf, "%d\n", rxtrig_bytes);
 }
 
-static int do_set_rxtrig(struct tty_port *port, unsigned char bytes)
+static int do_set_rxtrig(struct tty_port *port, u16 bytes)
 {
 	struct uart_state *state = container_of(port, struct uart_state, port);
 	struct uart_port *uport = state->uart_port;
@@ -3094,7 +3094,7 @@ static int do_set_rxtrig(struct tty_port *port, unsigned char bytes)
 	return 0;
 }
 
-static int do_serial8250_set_rxtrig(struct tty_port *port, unsigned char bytes)
+static int do_serial8250_set_rxtrig(struct tty_port *port, u16 bytes)
 {
 	int ret;
 
@@ -3111,13 +3111,13 @@ static ssize_t rx_trig_bytes_store(struct device *dev,
 	struct tty_port *port = dev_get_drvdata(dev);
 	struct uart_state *state = container_of(port, struct uart_state, port);
 	struct uart_port *uport = state->uart_port;
-	unsigned char bytes;
+	u16 bytes;
 	int ret;
 
 	if (!count)
 		return -EINVAL;
 
-	ret = kstrtou8(buf, 10, &bytes);
+	ret = kstrtou16(buf, 10, &bytes);
 	if (ret < 0)
 		return ret;
 
diff --git a/include/linux/serial_core.h b/include/linux/serial_core.h
index 4eeb8253752a..97301ef66af0 100644
--- a/include/linux/serial_core.h
+++ b/include/linux/serial_core.h
@@ -461,7 +461,7 @@ struct uart_port {
 					       unsigned int quot,
 					       unsigned int quot_frac);
 	int			(*get_rxtrig)(struct uart_port *port);
-	int			(*set_rxtrig)(struct uart_port *port, unsigned char bytes);
+	int			(*set_rxtrig)(struct uart_port *port, u16 bytes);
 	int			(*startup)(struct uart_port *port);
 	void			(*shutdown)(struct uart_port *port);
 	void			(*throttle)(struct uart_port *port);

-- 
2.53.0



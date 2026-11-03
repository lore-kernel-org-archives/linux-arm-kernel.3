Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF770606A331
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 21:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3lfw0OfZ;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g5GBuvgA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=E9UoBDBjwLLwDb4WmV28avfpsh+5/w/6UybGFvQ6fZk=; b=3lfw0OfZWaT9iY
	6CjKyhpMi1IDmjRSk6u6nK9UojvEYSJVeYZl07tgGYpit4Hf1Xfy2vM/Dx1B8BxYlHdhdFGMnJA4l
	iLQB3mwqoQTVusw+9+ThlO3ejkJnAnD71/8qaK1ASWFFE1Q1Eq7rZJrZ92cdxFdcr1kMGiU4N237C
	6cI3Q3AVR/xcsSzbZ9yELRMGz3IK9fkmwgtllhqvOhf0gxn3QJqaputEfVW2tIOCVB9IB9z9iScgp
	MHUraXoyiWUjSYJI6WRyO5Vl695vSNKQdsDUig2uuQwNClLHmpOZc6pv66SVoPifGINyNbjtuuFPP
	hBC7WzjCzwFWkAC5Jbiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOMEl-00000003jQD-3agN;
	Tue, 03 Nov 2026 21:40:11 +0000
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOMEi-00000003jNo-0sjA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 21:40:09 +0000
Received: by mail-oi1-x234.google.com with SMTP id 5614622812f47-55e0090c580so22819b6e.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 13:40:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793742007; x=1794346807; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E9UoBDBjwLLwDb4WmV28avfpsh+5/w/6UybGFvQ6fZk=;
        b=g5GBuvgAoZgZZXrWKw6RuR8JNP5SRDTCmCGA4GB69lF1X0FfWC6S0tHoUzJhlhSnwq
         1NYBNJzfB2IaQbTRtkMOe6EXT8s1NzkzldhoSgi/6Tqm/r6Lyzpk9qmxXVlgOOpH9gxb
         7ShAQXxPHsiEOUj7DIiL7YZlxyguCtszJ4DqzJweHW9vkCH8Vqd1ZQS7iAp6dQ4f7CIi
         liRL1GMwmyKJHZHRPUmTJFryqOw/e+ypBxm1sB+0plTF5Z23M0R4GJvyvDm4fahpMF6h
         xU0zFv3YVgAsGiqw5Zm6nwGn8fg2/fSzKpnHq0NkrNuNsG1CO/YdD5Dch2x2TI5SpG17
         IKwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793742007; x=1794346807;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E9UoBDBjwLLwDb4WmV28avfpsh+5/w/6UybGFvQ6fZk=;
        b=RTqNSv7DOvRA4AU3sQsh//v/5D/rinOGxKwk+JsvUo9YUhFbObl4MRCruzFBctSdmC
         AJVMmOWlnexrzQbW4JjxMTMK9teE3EK2Bteq6fJPAQFbWn9XwoQngGdS0ETdjg1jeYy9
         bmXODAwOk+msDdyj5H98YNUEbe4p1NsWiKIRPhyhS+z1L0VTO/QgbQg4KmWcgpnIZ730
         Hsd2iXNpdyCCnUd3oz0zgTEp4LdV1U7X3ovddc4arwCVczdxvFXo9fejtF6dvPpqaGfh
         +YfGqfSsKJiHfhAAjpXlGdsWnBZ8bvD7YBrlyycMwkNqeNN7Tg7D9fllUSAP5BlMz5Oo
         WyFQ==
X-Forwarded-Encrypted: i=1; AKwUvBypx4Liu8areZTbxxMNn9u5yFvYxAwzUReT5omv9xLAXZXsQd3tX9zPtrkCf4P2z/cjVhvCe/yPXAWjaWKeTSzQ@lists.infradead.org
X-Gm-Message-State: APuU4Z8WsvtWec5bxC5RXBGaMKd+AbaG11vgi+/fLZg5EnCDMUeGGA21
	fJnQRLYcw2Ip/p0AL1vBEi8YRluBxmDV6j28iVGtdNZWxj+lK7xLaTF4
X-Gm-Gg: AYBFou3KgBU3CwKDiIBHo49Bts/0MrUcX0VCJOPJ6+8YgMaoAHUSyMhk7hUCRL1XpT5
	gbDSqRWOr3dCPb3zh1zXEuMKQzydhsgQIINNsbs+nApczODcWUs1v3GA01qS/Cjy9YeS6UNMeQb
	kYyy3Nn1DgQ0YWhdUAWDG+zHt95TXFeYQ9DtDcsTtissjwN8Bnq39uY0djTMKBcjXOfaEBvLoUP
	hkDnEio2X7bsf19qE9TKFNarbub6iKu80fFCmLhm6JNcC8X2/iBg0n5y03QVkakjPm2Ktac1bPP
	Cx8mRTLZAUCesJ4m+PDMbMXzO6LSzR1aSA8rFbCFv0HJ4Wvp2GRwLxoX1rVFIrA57zYt/Inwg+d
	S42Pk5tsZc7fYZxNubw6hMP+sZo/JOJ9+M7rXG185JRxD4zpVujsHw56Aa+gyBeRO8u8KSZfNDn
	aXiNedHNvt+lzYPjyTWxSsdxtcYdqzIucZ2uJobXUinrc2YEPN8CZVr4hJdG84bgMeJsng5qMTX
	OOa+2XQ9Zd7qxhW0WS8iY+HHEYyuDAuNHH8Lnf6F47SjUdbXaYVySsrnTVYV2nr6Q09gv2Gy1d5
	oOfUlrBI46CMbeY1Ix+NhonQGLz30xsT7yW+yo2QILBuyZaHp7zeNPgiXqARXpLo+3dBxOiqYQc
	pP3gK4wabD0UqjweZn/ccozGMQiI1XAsJx/EiV2vgCfKDwXyM+YutXNOL3jmKez55ljMKYsFhkc
	ER+VyNPQchyrZ2IvBVQQgf1q4keihfIy/IKK3kesG/y0Z9xLZXsjrJ
X-Received: by 2002:a05:6808:11c9:b0:4ec:d580:2440 with SMTP id 5614622812f47-5640de5a472mr9799943b6e.54.1793742007017;
        Tue, 03 Nov 2026 13:40:07 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-567a9f9115csm27060b6e.11.2026.11.03.13.40.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 13:40:06 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 03 Nov 2026 14:39:55 -0700
Subject: [PATCH v7 02/12] serial: 8250: widen RX trigger byte counts to 16
 bits
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-submit-h616-uart-fifo-v1-v7-2-c9e248d685c1@gmail.com>
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
X-CRM114-CacheID: sfid-20261103_134008_262348_EC9FE16E 
X-CRM114-Status: GOOD (  15.29  )
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



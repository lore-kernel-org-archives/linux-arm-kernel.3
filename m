Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FF7D606A329
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 22:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=llKpDrQa;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kY/8w9DW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=wQd2y5d3c9Xle1BZoXd9DRgnl2+Av/870a5uei8ZYeo=; b=llKpDrQaOfyxKV
	hFbsHO5jTPYm4qsApMIteYtsao+cQjtjfepmu1TEaMuVI0XKeH453pez1r56AwuJvJqwcw28zI9EU
	jZQMB8tsYdvMT27FIHQo0sH+mz4QnSlTPIpkk1kKixeiAfMh1/Rnk4KAryOImMAy09WGj1bnI6ek1
	nRTgKjExRiweP4zcCMCbSeIoxFLywYTuvUhjIdWf2r5qFCb/6JUQAcvKpqROFiRhRgJEMQUzIS4Up
	MhvvE12jdvA+EAHA6YA9m+NjVtWXk+145RQ7gnT6t/xD/9WeW+tr8Uuum/opFWDlX32GHjOQx4/Ve
	uY8vvPURdWD31vTGXCmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOMEm-00000003jQd-0cJV;
	Tue, 03 Nov 2026 21:40:12 +0000
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOMEj-00000003jOC-12hO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 21:40:10 +0000
Received: by mail-oi1-x229.google.com with SMTP id 5614622812f47-5058b105df7so30621b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 13:40:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793742008; x=1794346808; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wQd2y5d3c9Xle1BZoXd9DRgnl2+Av/870a5uei8ZYeo=;
        b=kY/8w9DW/Oan7NaKitXfZIrcYjz/Zrl1WsKL23ZrKGyCxegRZ2ezjBMb+ZkHB+1jY4
         2QPkV6uNEjrfOs2ESNFl0zeSW5rnFH+sqY93Llcnc55kM3R6cFFPJzVHeAiEdevZM3wf
         ot6xkkLrmDL9M8gNy5KBZ3jhKwkFwBZkphhKOLfMoeTm9UKa28QqhFkr9PWAczkDO4cC
         24LIBfhC6wA8E3MwkYAlcX2lo5vk+n0kVFffUsV+CTWPCCm4v+83dUsLgM9hVlERwC22
         qujM3I7a0BvefhsaK7rQ6kifWdWtJsNJwnb9fRWvgrNOpgMXVQxdU3bCDQXIZRDXVgEk
         P0mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793742008; x=1794346808;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wQd2y5d3c9Xle1BZoXd9DRgnl2+Av/870a5uei8ZYeo=;
        b=GLsDmKgSZFIaer+rVgzPqcSGWyAGFf1b7poMQcEZLKlvni7SyceaRGi+b1P6h1k9sX
         6Qbxr1JItPIPb6alG9svih0vsFYpgNG72PygdhQBXe6jrt/QKf6QJBssECSVDPt773cp
         zAKmq+5e49y0n5/2kviMxW0JNi/CAWAWaXzzZKSJzLgHq7qzEKezNnm3r5GCj05+n38k
         SRzQqwOnIse31egbE9NT8IYGguCQ81DEwYJ1ZuiLTTvUsYQaqA5UhusMccpJT3MFlMMd
         lMMRHxZLd9UqiSx+NyyB8/WmOHNKge5064T8cULtIEF5QKFFTdosEwh+al0sHVMMZDVb
         0usQ==
X-Forwarded-Encrypted: i=1; AKwUvBzlC+vc+hvClk+6Xhm/9oOehqtD55ulNCG2MTaLb/5as2NpS83jYpdUmrqJjSrdanVrE4tgVXqUXk9lOkJk8N9h@lists.infradead.org
X-Gm-Message-State: APuU4Z8fHO1X4vDa8Ms/2UYbZYbd9i5gWaqeZZGtN7BxxcU011fKflUw
	6VCdy/scdYQo0Rw0Q/yfCJuKrOiHcT1lvXc6qhNhvLQi1dzHvdjb2P7A
X-Gm-Gg: AYBFou179XXRsv/Vu5bCntQwjogfK78zr2lbqE3CrJgD19VYLeRHDAZG0CD5/xfvtx1
	zbKcLz6GPBe91sHhslvOiZJq0Dk8ugHGPzlcOi3TzumtYAhS4Nf9i85X8rwKsLpu+1dZBqbgsO8
	/PvINvDQAQqimsRka+v8XxYvD/h3VcxRsLy97sxe49+rNhBunKWSfaYKyNbgXlN8LqwPF2SYGxn
	Lb9h/w+x1lIjxvPlhM8ghw9U+phqXWTKrMpguN0/XJW+syU/oQnEiG1uInfNkhm0zhyKGxEFA9+
	xGGUyehNj+m8/aKZCMJt+eepGz6NmCVug5nq/RsORm+SBKIF8BSmKVm/EhdiJ2klVxA74n5CV2E
	Zs24vZuK7L18JlGhNoFM4iqgjb0d8gSrs0Bh/kx1NncyCo+T4+OBGCBTgUy/13WTUxowqeXYZCJ
	aDf0sfYTk3PzSP3Fk4oSuR/0fA8uAbx4EcDnoPQtVNxZCRtpnUPi+u3IaQ7d6E95CXEd+RZ6Xyt
	GabA7F+KHNXHx93RMv2O2ODv1RBuRBPUaN29SkrXqaTs7F17f6GnBn7dsa8HcJQzPjMxMho8QPz
	YG9+e3DWNXcgrxCUTg9BnexWX8KNHyqmMagd21jcl0qA+TBclLXFCjbxFFmGIrjEk4uhspzZ1b/
	cSoVcZwwEaU1uHlyUEUZ+rBGjC2KmvW08qXwzdEoyO/JKMXC6Sy/QmW9ooPVKJcBGU6xmTmTpB6
	p+YJQ3Gu9Cc2GXmtibaIsDsEPrelCXajQ9Vw9Jz40Eh9CVaPPF0qXk
X-Received: by 2002:a05:6808:4fce:b0:54c:7ce7:33ba with SMTP id 5614622812f47-5640dc9006emr9815263b6e.28.1793742008124;
        Tue, 03 Nov 2026 13:40:08 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-567a9f9115csm27060b6e.11.2026.11.03.13.40.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 13:40:07 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 03 Nov 2026 14:39:56 -0700
Subject: [PATCH v7 03/12] serial: 8250: share the RX trigger conversion
 helper
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261103-submit-h616-uart-fifo-v1-v7-3-c9e248d685c1@gmail.com>
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
X-CRM114-CacheID: sfid-20261103_134009_298207_2D1A26B5 
X-CRM114-Status: GOOD (  15.01  )
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

Drivers can supply receive-trigger thresholds through the RX trigger
callbacks without adding a legacy port type to uart_config[]. Extract the
threshold search into serial8250_bytes_to_fcr() so those drivers can use
the same conversion as the generic 8250 implementation.

Keep the implementation in 8250_port.c and share it within 8250_base.
Include the unsupported-table check and preserve the existing nearest-lower
selection and highest-encoding fallback.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/tty/serial/8250/8250.h      |  2 ++
 drivers/tty/serial/8250/8250_port.c | 14 ++++++++++----
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/tty/serial/8250/8250.h b/drivers/tty/serial/8250/8250.h
index 939b7d4209f1..8729619160ea 100644
--- a/drivers/tty/serial/8250/8250.h
+++ b/drivers/tty/serial/8250/8250.h
@@ -73,6 +73,8 @@ struct serial8250_config {
 	unsigned int	flags;
 };
 
+int serial8250_bytes_to_fcr(const u16 *rxtrig_bytes, u16 bytes);
+
 enum uart_port_type {
 	/* Internal 8250 only */
 	UART_PORT_AIROHA		= 124,
diff --git a/drivers/tty/serial/8250/8250_port.c b/drivers/tty/serial/8250/8250_port.c
index 452851815ffc..73bc9e7ab703 100644
--- a/drivers/tty/serial/8250/8250_port.c
+++ b/drivers/tty/serial/8250/8250_port.c
@@ -3015,16 +3015,15 @@ static int fcr_get_rxtrig_bytes(struct uart_8250_port *up)
 	return bytes ? bytes : -EOPNOTSUPP;
 }
 
-static int bytes_to_fcr_rxtrig(struct uart_8250_port *up, u16 bytes)
+int serial8250_bytes_to_fcr(const u16 *rxtrig_bytes, u16 bytes)
 {
-	const struct serial8250_config *conf_type = &uart_config[up->port.type];
 	int i;
 
-	if (!conf_type->rxtrig_bytes[UART_FCR_R_TRIG_BITS(UART_FCR_R_TRIG_00)])
+	if (!rxtrig_bytes[UART_FCR_R_TRIG_BITS(UART_FCR_R_TRIG_00)])
 		return -EOPNOTSUPP;
 
 	for (i = 1; i < UART_FCR_R_TRIG_MAX_STATE; i++) {
-		if (bytes < conf_type->rxtrig_bytes[i])
+		if (bytes < rxtrig_bytes[i])
 			/* Use the nearest lower value */
 			return (--i) << UART_FCR_R_TRIG_SHIFT;
 	}
@@ -3032,6 +3031,13 @@ static int bytes_to_fcr_rxtrig(struct uart_8250_port *up, u16 bytes)
 	return UART_FCR_R_TRIG_11;
 }
 
+static int bytes_to_fcr_rxtrig(struct uart_8250_port *up, u16 bytes)
+{
+	const struct serial8250_config *conf_type = &uart_config[up->port.type];
+
+	return serial8250_bytes_to_fcr(conf_type->rxtrig_bytes, bytes);
+}
+
 static int do_get_rxtrig(struct tty_port *port)
 {
 	struct uart_state *state = container_of(port, struct uart_state, port);

-- 
2.53.0



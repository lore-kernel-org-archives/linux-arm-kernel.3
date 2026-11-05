Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA3E6606A328
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 21:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JcE4/qyY;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WSvz35Kz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=wQd2y5d3c9Xle1BZoXd9DRgnl2+Av/870a5uei8ZYeo=; b=JcE4/qyY8B+SPP
	byooslVKw245cNSgC5JpviGSfQA5MU8ZvpDBIHM4veM3bO5yyWFTFAnxePrM5MclCwa8qa8iWlhKb
	1FuYzLOxaYTwa5USJzO7ce7pKsO81XElMqvsuJRet8DwLmm7pcPSCES9InGHIojYPik8YR8gaFAJf
	xbX4q3W4E0R6mnrPupGSpnnjQPIkHEXkGnxMtiklUL0/jOGfig5EvQHybvKC55NNmIUG2jR+wx6sr
	gZlE3IYit+36q/0HcfpeIJcR7K5ZmPu0r8ipgKO1Ukx6zO7tk5BHhxg9x2SLVgiDL3njMg4lcXaJK
	5cdUWolpUKe3/Kar/lBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP4Rk-0000000Acks-1cj7;
	Thu, 05 Nov 2026 20:52:32 +0000
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP4RZ-0000000Acd2-2D3N
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 20:52:23 +0000
Received: by mail-ot1-x336.google.com with SMTP id 46e09a7af769-843b6f8e2c7so4926a34.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 12:52:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793911940; x=1794516740; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wQd2y5d3c9Xle1BZoXd9DRgnl2+Av/870a5uei8ZYeo=;
        b=WSvz35KzBXAoIldmiIwmeZjCtk7zcuxxla1i5lr8SVy14ngFn0itQINvKMuzM1qqzm
         I/Sr5MFN58yibE0c9YaHJVqT51593gihZjpGHL6VZj0s44a2KPgHPV/iF0mHcqhQJcR6
         CfJSHWEBcZKoG+S7juHP6kdN2Svsst9qa77DpEEaB0xmybSFhmohe3CMx4gerYq5CXCL
         NbHVNjBD5hMRuw2j4CwDGspv03FO8kv0etxN2LfcNLqZ38/tp9g3Z528R9KrYYUjOckn
         ErHjIWq7Z94X27cF70UkNBkVu+DTMxV//DddKgkul9pAx3snFHfRZ2+KKfG/SZdFEviB
         +uMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793911940; x=1794516740;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wQd2y5d3c9Xle1BZoXd9DRgnl2+Av/870a5uei8ZYeo=;
        b=DlS+7fjeTdfAcmpB8kwOn1GlZBXNr3clAcUR8+hpufUVOHCIo4tmfFHP4KgYPFtYjS
         jn8/E2r1gZBynr9bFsnwJtbcS8duXpidenBERoYU8xdmf8SswV+TOIS6V8UY+DZrIiBO
         93bf1fTty0moZhrH8VOo1moaSLJbbJzmHWrKQf8wT9/jiyHtLDDdz4TqiT1rWg4etpqh
         KbAj5wo74ST/UsV6nZJwIisoyHB5R0UkuqJiM1pCPerG0cdWjgg0fLWpeQDMcANaF5Ao
         r2msgTuHlwH7sNiI9i3luqeaCl7t+x0PwkUiLE2tO6VjgbbZQiZ5scUx6tEQBRrxQmbA
         G72Q==
X-Forwarded-Encrypted: i=1; AKwUvBzkLPTs/QHUbxx/tZW87wMWT32wanb1DuaUfyypwvTZdnSlKxm+iDqaIRseuwmafKjt4AwaUynYt21jKQs49CGL@lists.infradead.org
X-Gm-Message-State: APuU4Z8ZtzyL8bY/Ele4CkAYkRC1rFtAO8PPvDfi2tqtBUoCcYWrcPLZ
	vD8C78uPOARgLfpeJMNLX2v75sxqlCaKYz/SwOAY3tWtinj6Qh0erj4u
X-Gm-Gg: AYBFou2SNMgqPo4tnM8+Ba9O4TTa8VEOEs2nNXG1/lOORfhPSZUpLMRimVWhkLxODGg
	VCQrf9TP1SfkRWDxFEC9WEuZDwsVnRVDxJJLmptbre9u/iuLJjYF58Psk5Z22cXeDSaEXhifdI/
	5FpqjTG21P7oFz2/t4qSVgrVqNE6UG7DFMFw1bF85vTy7ilmOfUvJGp1PQzEobd7o9eqNzqMHvm
	HomGyP2clD1JuNnTE+eH3y7PMKPCblZkoHe3tlnNQCgnfsZiGNjmnx1INOJbYLNm4/CjwEASZJx
	3uTCs0Q3OsWLV26hCt+K4v/TOp+n2NO9v8WTBg8WqEj/wZtc6oJvZZulPQquuSSty8PO/JmeFfe
	BWP4asqS6fepgOMcPffggRsMXVHwb/vE7/0Xktu55DkGPNJIT9JM2767N77A1ilcUvrQc2k/CxB
	UIpTZq7tJq8QA5th7kyf7n/CnrcBh5YBghkI6dGPv+PrGuuOcYnZfZcrPLcsPiLyULnphEewnkf
	MfaYeEQO4bJagn49g9Sr9mO4SRepWgFFwz0NRGrg/kGKIVVBnhpoP1HzwBQQkLJ57A19/QdCY62
	nbgslfGyn3ZHdU9M2J4nH7FliaYIFh3cxIw+6EGD/5EIC5ZhaGxhvUakMvJ/VhEU7WeI0ANtO7c
	GFIY58vjs3EQMfcxxE2Q7fIVDvl2ZDOFYg0N8EFnhekoSYRAyWrkURHYRiROfK8ohtjByIbT3Wa
	LD8jK2AsMt1jHaxg3gpBg5CNQh8aoLvBo6xjz4wG4BkENBHGwHCX0=
X-Received: by 2002:a05:6830:310e:b0:821:d65d:37c1 with SMTP id 46e09a7af769-85f1d102bf6mr708163a34.25.1793911940392;
        Thu, 05 Nov 2026 12:52:20 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1dbb298fsm292276a34.6.2026.11.05.12.52.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 12:52:19 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 05 Nov 2026 13:52:05 -0700
Subject: [PATCH v8 04/11] serial: 8250: share the RX trigger conversion
 helper
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261105-submit-h616-uart-fifo-v1-v8-4-14024d2b184b@gmail.com>
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
X-CRM114-CacheID: sfid-20261105_125221_574074_29AF8C86 
X-CRM114-Status: GOOD (  14.90  )
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



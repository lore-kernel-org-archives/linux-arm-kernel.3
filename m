Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FBAC606A330
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 20:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gAPjW4UB;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PpWd+/Bc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=9v6fhE64vJST/e4wIKc/qZZ4G1qcfWVja1/2g7y5JFA=; b=gAPjW4UBuqBQXS
	UvjjeawC6ukdVJGEJ3nDFkceFf4Px+OVDM76gQhpnIvhW4knvu8/511ehxtBdJ1iIJ73zjS+lFYIs
	URMljoOLpi8aUiIN8+3xl30RCTKfCFm72o/yDBHD8AHF79ThhWoGyK1JHQ63J6AZOuOQ86M2xrUqY
	fYGmZUAi5SVHpsZUoI1dCAGoQu2DcDO3QGt9AezW5/n4NHwKjMF+n4yn6KMTYkKKFMZfmFXsM2IVJ
	zKIJN/TQgwkwi0dzNagclpQLzK63hEwE19nQ0Beo0FTnumDJwm+XJzevihZ4DiJRuKsTNOFEXLzN5
	xvUjPZZTuw5BgJMTFgsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP4Rm-0000000AcnC-2WgJ;
	Thu, 05 Nov 2026 20:52:34 +0000
Received: from mail-oo1-xc33.google.com ([2607:f8b0:4864:20::c33])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP4Rb-0000000Acf4-2b4y
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 20:52:24 +0000
Received: by mail-oo1-xc33.google.com with SMTP id 006d021491bc7-6b1afdf5196so2530eaf.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 12:52:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793911942; x=1794516742; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9v6fhE64vJST/e4wIKc/qZZ4G1qcfWVja1/2g7y5JFA=;
        b=PpWd+/Bc5eOPMh97ZTGFL8C2OSIvpHHJR66wUVnnn8dgfrb8xLrXOKWo5KgRXdCdQc
         jeMjume2jlM8ZoM34XpzlTxI3EqGR3Z201yLBXK7G8g5W5tRGr0iwmS1fAao2OojQdth
         Zq69Rame6M4DSjucgK8i93r4tjsqb0f0GXdBtRqGoAcBfPvOqeTymlTsvczqcWR9MCPt
         YV+0Iae/sOaqXT7YHINrZ0hfSy15+Eyt5JmpPJNkavjQW3DXwrPTILn8ilUJ6kxLdfjf
         oRBHx79cyUYgXog46PMOd7RcrthcIw1Lq1qaOvaAYRLBU+rQ8QvbG4jEnsNfP4KZneKI
         38wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793911942; x=1794516742;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9v6fhE64vJST/e4wIKc/qZZ4G1qcfWVja1/2g7y5JFA=;
        b=GGd/ONKk3fd0S4Bb325Or2cH7EwnX2miOB0IX8obBO6cS04/YXNADdh9rPSmmXrCMm
         kkR4170iDxES91QtlbJoOo+RY8HOHE9VH0GoeaPnrQOU3W38cBaQP1GJ/kOQn65zttu3
         nER75CVyl4DYjFY8kaRx6pXqGMxI54d8m33JEvvlI/ZbMlmEImdyeClaQP9ULc7l6dgv
         TqxLE14AFTfz7y1YAI/ykvIxRTWFrjz9Y2hjV3yVKEd+8p7UOpciUJVoJwM/r8IDytam
         6NqsGJ8q6wmfhICQK3zEezAk3BQv6oy4iWEwtjHqH+MpeAaauexHr5zv2FbJHNKeTYJP
         4bvA==
X-Forwarded-Encrypted: i=1; AKwUvBz9oavD8KgthGvvgREs8YjQ94dWcbXyM6DGY8/dMb0NNiafl1BavIdSDyw1jhaiwr5vYNb9U13QmiOHwCXnWNJN@lists.infradead.org
X-Gm-Message-State: APuU4Z/zTKfLiz0A8eKAuSpZtOwlt2fuG0kGuo/EDUaXSqEzMkbIbJuG
	fcvkPY/Y/e0bUmLaJqYEU/dhNjjCEUcXfV57A8ubho/GUB8Lu/E5FNoK
X-Gm-Gg: AYBFou3oBf0rcDQcYUYL5NfaQGM1/puHsD3y7h2N3Wrwq919yW1N2JQcoCdsS3+bGdl
	cl0dxz411cm/xVTFu9gB1dHyyEGqLMm/nq7IJGlwmKj/7R2US+lJ2TQ7hwJ4biiJh9rdfnu0UTU
	gePjDWi40DwkYBV8Mpugd5PB+8XiirmSvVyY6yoJ4WPz9Ll+2phvLcsGGN5tEbj6Adb3eFMc5Os
	zAa91j/U9IiLqzmt6c3z0ofr/nG20tSYCpejjTCmSXpjFKD3yc8bKbp9ytdD5gvacpgg29gEiH7
	FJYrLpIKEUTClERb1aTophblhGKNwYEjwtMZoDfE3BwEol045ToDGhpfRhwlo30vBiZRlicM+F4
	yqXAtjp0cpy1TKbgcQOJnwgmAvAbtD/RakGC400yr5YDHJ3Uwo3+rNTLv8iKfEX7BwUsWHEIFsn
	wdPVEqtzaVm0aLERBvig5G7HOruOCXf2hisQZZsyKmezsf9P09Guq/h79Thkgs8QYnmMmlHn6V3
	IkiIdDf31QqXCLHgnWHVNbMpB7eM1hLClc2PUoDeVs/rN6SPR7zi5HPHMr4579u8VIYINoJi7dn
	7aiwuidsQmyzEOVutb9VB1+NzG5tLuK1/Vn/nYxsMO8jzjOiPL5uRIj/FZyYLrDywsEuu53xkY3
	pvIGbocxWu5xR8dRgOs5P0p5uP5DAvr936TARWE/XwF+SH+soNDYPrHgmPKOiw9h1Z/9FNean9t
	ku+DCgWDcTWa6vkLjX0A1qvJFYt043BOB8MnWHSinPT0TKc2HvLCo=
X-Received: by 2002:a05:6820:1354:b0:6f9:59ee:cf9a with SMTP id 006d021491bc7-716e73d88b9mr513073eaf.7.1793911942466;
        Thu, 05 Nov 2026 12:52:22 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1dbb298fsm292276a34.6.2026.11.05.12.52.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 12:52:21 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 05 Nov 2026 13:52:06 -0700
Subject: [PATCH v8 05/11] serial: 8250: expose RX trigger controls for
 custom callbacks
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-submit-h616-uart-fifo-v1-v8-5-14024d2b184b@gmail.com>
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
X-CRM114-CacheID: sfid-20261105_125223_676960_EA8F5F8F 
X-CRM114-Status: GOOD (  14.03  )
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

The rx_trig_bytes attribute dispatches to a port's get_rxtrig and
set_rxtrig callbacks when present, but the attribute group is registered
only when the port type has a static receive-trigger table.

Allow a port that supplies both callbacks to expose the attribute without
a static table. This lets integrations such as Octeon provide their
FIFO-relative thresholds through callbacks while retaining their existing
port type. Require both callbacks because the attribute is read/write;
ports with a static table continue to use the existing fallback handlers.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/tty/serial/8250/8250_port.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/8250/8250_port.c b/drivers/tty/serial/8250/8250_port.c
index 73bc9e7ab703..d87e2b852c3c 100644
--- a/drivers/tty/serial/8250/8250_port.c
+++ b/drivers/tty/serial/8250/8250_port.c
@@ -3152,7 +3152,8 @@ static void register_dev_spec_attr_grp(struct uart_8250_port *up)
 {
 	const struct serial8250_config *conf_type = &uart_config[up->port.type];
 
-	if (conf_type->rxtrig_bytes[0])
+	if (conf_type->rxtrig_bytes[0] ||
+	    (up->port.get_rxtrig && up->port.set_rxtrig))
 		up->port.attr_group = &serial8250_dev_attr_group;
 }
 

-- 
2.53.0



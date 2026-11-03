Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 743F76083626
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 16:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1byRwdyU;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=jf7MZFiV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=S9QmmCvTtJG0FWP5byFcRaRFelUpQGR0S1hSw8HKBvw=; b=1byRwdyUl5sc/G
	IRvIAqPciekHqRDGaPUiE1T1GEe3fvGvtiRWRmgAtrjz8XU1h86Tu1XijY4ZKwArwU81n0g8s5SXn
	KDFfQ2EvlgUeZXuNtx37a+3k2rNpneiAHYN9VS99LbKozhgiIKiaPqnlxjGHeNlFqKVo5oLDc8BKm
	i3/m/Y7C6YnC/E1dnrOZEcKw5lzCTy98HC/spuejP2Usvdrs8JINROTER1zDWtStqTelweHFM/iYP
	w9Nr8ePkDO19P9zPA1fZU7xKgKUWjItUveBO+1mc1dpu0dyks4s///N5tCvA71MGvgnThO9zoELKL
	+uXcdSVVMvXa8DPYi+Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOH6U-000000034Pe-1QGn;
	Tue, 03 Nov 2026 16:11:18 +0000
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOH6R-000000034NZ-146s
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 16:11:16 +0000
Received: by mail-oi1-x236.google.com with SMTP id 5614622812f47-56431524c22so970405b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 08:11:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793722274; x=1794327074; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=S9QmmCvTtJG0FWP5byFcRaRFelUpQGR0S1hSw8HKBvw=;
        b=jf7MZFiVrO+uogZGWerAhaMwVjboF784NyCtaoikLlKv9woPokJQFTmGTM+z8ytkt/
         xAd9YleEf5jW8J3TLOHrvaLOb49AfThCoxTVrO2InQh+gBQi1ZWy6BML049j3/27ubV0
         FM6WNoWYs34lbtPa2GZ5tuIEtQ+HKacd7ZJwc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793722274; x=1794327074;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S9QmmCvTtJG0FWP5byFcRaRFelUpQGR0S1hSw8HKBvw=;
        b=ro8DK9UdApR+3aF9tfEK7Dk8SnHWg+e0JThbPt1FPTCMvEqSpKfS8z84Di5G/L37sX
         G8KdprDdgRCM7zHawlp3yV/dIFv1SMy7VsQcYC/zEHDHPFJy8cYfjD6fuewvJaJiggio
         Cx0JqWbHr5PBXWWVw1YQ9+fh2byFOF/xPUfju5Lz7RCuRm+ZX9PrcXiInfUM8cxP8SXu
         US7N4ALCzqRyFb9zQOzMJnqHcThgPnZd7vr3N94dthlEC+IQ8RLXVbPYbHoIySGIC23h
         fxaPvfcopGQryp51WqN6iNsjEKEeJUfbNbaNEuSHGf4tkcnMtgTPfb7KAJs83DpNBdBp
         xh6w==
X-Forwarded-Encrypted: i=1; AKwUvBzm5j/qQ09UwOaj0Bipgz89YqRrkaYV0dtTJP5GhmUg434lTxUulX+pWOqQ/UqylhZJ+wcSy/buMd9VPyBbi+6W@lists.infradead.org
X-Gm-Message-State: APuU4Z9XQwh/C2pGGD2gTCHNK2vOf7ImDjwzyQQR/Bjcqm3/JD3dxecL
	yxbAh/cB1Owa7N2jAWnqWWIb7ciuhyav8pw47R0nDvOfsolAEr+NpXcz70ER5WyDiw==
X-Gm-Gg: AYBFou37e9g8U0rOfWCkEpNcMtJM+2J23nfZl6lLZICc6wz61LlZ8hKD1cm1XdEknGW
	3WzgrG9wNEpa5a0wHLIxJC8rJmBBeCq75Vvg4zZUc9CtjrISLqtlzUw2yDRmtocW2EnhneNBuRK
	JfQUF0WklS16ugzMw2QGqyQmOJ17qKN3IPpJRd35PxbtAmEXqT4A8E8ZDVdhszKpgVTB/+iTu0S
	Cb9pNTJuR5iB+XZTUHj/W6qKOwrZItWXuTNyRlaiXnjksVQHouDVWgGbe50UWS168rcU+ZEwF9e
	Zv1RRxQnk5+ibmOfsT3p3SrRcDxYCyqdbYXo9LVy+bjn8xKrU3WmS2TEaVAfyZbOTQn1ZSG28jR
	VrXKyNOGxSTbWxXkp1B52yDPWkEAff1lN6+ef+PPWWQi4VvM0dKZd1z1/yhTsUsdjh1Zy1wLZG4
	zqWPoSkPPm2/glcpI8nB0dned9xc0Ty3a6ZqIamRzaJQdFqHTo/OBP0I5DEIEH8agM46ZR4lPew
	hhV9Y5weQebLxXk7WuJ+LoqTgA1jT2pb+DbHrnyJK8Gm5aIcpRj4f+MNljYcAnfNJ7rMZiJgC7P
	MwvMfdQsObMqFGLGcjCyHnmXb8q1xow0p7NqNXV1c8PVjBcjt4o81FJ3fw0vHINdZiSP4zNtEdN
	b8Nzj69Ud2jq6l58=
X-Received: by 2002:a05:6808:17a9:b0:4f5:7723:4c9c with SMTP id 5614622812f47-5640dd9c160mr9485684b6e.30.1793722274540;
        Tue, 03 Nov 2026 08:11:14 -0800 (PST)
Received: from rrangel.c.googlers.com.com (194.246.27.34.bc.googleusercontent.com. [34.27.246.194])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5640fd95dc0sm11688383b6e.6.2026.11.03.08.11.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 08:11:13 -0800 (PST)
From: Raul E Rangel <rrangel@chromium.org>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Tony Lindgren <tony@atomide.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Richard Genoud <richard.genoud@bootlin.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	=?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"Maciej W. Rozycki" <macro@orcam.me.uk>,
	Timur Tabi <timur@kernel.org>,
	Peter Ujfalusi <peter.ujfalusi@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v9 3/8] serial: 8250_omap: serialize RX DMA completion and flushing
Date: Tue,  3 Nov 2026 09:10:59 -0700
Message-ID: <20261103161104.2449407-3-rrangel@chromium.org>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
In-Reply-To: <20261102-submit-serial-8250-dma-cancel-v1-v9-3-9159caade148@gmail.com>
References: <20261102-submit-serial-8250-dma-cancel-v1-v9-0-9159caade148@gmail.com> <20261102-submit-serial-8250-dma-cancel-v1-v9-3-9159caade148@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_081115_291430_9882E6D6 
X-CRM114-Status: UNSURE (   6.73  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Reviewed-by: Raul E Rangel <rrangel@chromium.org>


Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D75DD606D805
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 16:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=em7CXo+5;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=D0vtHXxq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=S9QmmCvTtJG0FWP5byFcRaRFelUpQGR0S1hSw8HKBvw=; b=em7CXo+5LWIe1R
	seeOXa4udKJYTqAiT2uPtImbICBZxfxc8CIH85NA1+cgYhBpyjDhVJ39frpEY2Q0In2lGRilc9F3I
	6T/rpNvj0ZPci99o5b/wUYCbE57s+Pyy0n9OIoTUK5WuafZQxJ6u37XQmURbotfZmEFgtDR+6vnQW
	ntaQ5rNJ7dagpOImegcbnt0WjCY8rNfmh382UCtJ1Y/n334wRlrdJAqsHd0MQ0KRLeW28326s/Fyr
	enHCTzA6k2EtQWMpWjH892IOUd9r6fuVLyk76cm4G9D921xJqbzTUCnMxoq0Qp3pMLI+0MkEKXK8m
	0FOJbW0yOfkC87oXHGQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOH6c-000000034VI-0tlI;
	Tue, 03 Nov 2026 16:11:26 +0000
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOH6V-000000034Px-04hP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 16:11:23 +0000
Received: by mail-ot1-x331.google.com with SMTP id 46e09a7af769-823e4047037so3194905a34.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 08:11:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793722278; x=1794327078; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=S9QmmCvTtJG0FWP5byFcRaRFelUpQGR0S1hSw8HKBvw=;
        b=D0vtHXxqmDNiUherzLiwUvzLLeDaP7o4+FEPoD2038B8NTj1g5ChIBD5aCH/WDYnih
         5no1B7d82RmZRLEZSqTK9vT94KLVNnYFtfZovtU0oNQPvYzz6Crtx/Jw5AzsRXLIKP2c
         V5nz1swESRvwc6Q8AA+szjc1DbqRkjbo4gYHQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793722278; x=1794327078;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S9QmmCvTtJG0FWP5byFcRaRFelUpQGR0S1hSw8HKBvw=;
        b=YXhdNh7h3VNMbOX1h6n5nrvXb9b1Qghs+J8/0nMpdYxBAKksu30yLlHtmiMVZ2izfE
         NqlcWIgLmOs5xCySeuVY2+Ecm0y9Tt0U+q2LGBqQbYiMOU39AYIcr6tYaVxjJKw8BJoF
         aGh8j3we/kSfPA2UAiUBbdN9vwFyI3Q/LgIWWcdSp6eB5AdBsFStg4ipjDDHMfE/Rt7C
         jHxLcuhv+nWp5ch6pmie+YO+p5H4WUYRC6RNEg0V+NpZOMi7iiS0p11jhO3qAkVA9HcJ
         o5IbgCsITBPSm1rRcX17xP0n1PGoaLQBIATaCaskdlPLtbzhupHrAZdTuc8L/+hcXZWM
         XRfQ==
X-Forwarded-Encrypted: i=1; AKwUvBwkgWGZaCOVbE2w2Is3dY/jHMA+zEo9Fq3rlplIuAK1hrGQbxgz3fkgcYGM+24CkkPiQFJSFqLw4iT4/SarqGEe@lists.infradead.org
X-Gm-Message-State: APuU4Z/R0X+96Jy1KB4ogz5LsVv+FypncOJZTvsBreBKvFseAuOOhTLe
	syEifQiubD18WG/h640P7E4l9MBJ38nIqrKvVsfkQC5Rvku0RnUupxVX6weL2h4csQ==
X-Gm-Gg: AYBFou172SOpnTqq2mDiK6HkRjDhL1m1tdoYV45rfgs+8I+sVIv4g4gpEIAP8Za38Lf
	BloKueRw7dKKDL9r49NZc6kmJuElHEoaAxjjTbowcgu8VtqeBwQk/PeAF0ZAxfleNGd27bU2+Uh
	WsaISDLKnQYPOYX1nz0XT4LgE0OLC/tfvhJb+IqkhzT3EqFioXwOUU+kUZSShHY+wVUWsG7kgZi
	AvDKDyNp8y3Qn0wwkudWLPkshWICmw5+V++rCR/ZmjWQA03SYnu0eE3xPRa4I1LzHY1tbBAljVe
	C1PCFYWJ/Oz4XSDckPD7QIs3V6f0GTM9TYZwWeePMbvM63J2AhfUBUSdlpxBhLDtYioOtslUquA
	D1MFbea0AI9WSoVlLsjKqD9D93l32zLXOF/oh2davzr2KSs2OHDo/mAXYixGByrGBee72sjf/0g
	PUJjgspy5XK2oOj4kTuK3W+dPrNEP7AK5tYQw4ju76B7u1t164ksBYK6l3fyiCjwDH0TTollM7H
	aQPUWm586D6Scv+DNl/SOw/BBd4GSCbCZI0F2dcVfQcYkh5lxOZYmCEqf9t7xfE4KvFU6NEA6HG
	LTTcLx+cgL7q4MoTzsOpwwNe1629DjOMh4umAejvH9BFk//gx7otPS6NdGbXNhsavgjideyMZah
	taTHVbBREFMjcbU4=
X-Received: by 2002:a05:6808:1793:b0:540:5827:6d8c with SMTP id 5614622812f47-5640e032a52mr8860527b6e.57.1793722278097;
        Tue, 03 Nov 2026 08:11:18 -0800 (PST)
Received: from rrangel.c.googlers.com.com (194.246.27.34.bc.googleusercontent.com. [34.27.246.194])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5640fd95dc0sm11688383b6e.6.2026.11.03.08.11.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 08:11:17 -0800 (PST)
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
Subject: Re: [PATCH v9 5/8] serial: core: allow drivers to reserve flushed transmit storage
Date: Tue,  3 Nov 2026 09:11:01 -0700
Message-ID: <20261103161104.2449407-5-rrangel@chromium.org>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
In-Reply-To: <20261102-submit-serial-8250-dma-cancel-v1-v9-5-9159caade148@gmail.com>
References: <20261102-submit-serial-8250-dma-cancel-v1-v9-0-9159caade148@gmail.com> <20261102-submit-serial-8250-dma-cancel-v1-v9-5-9159caade148@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_081119_804644_630FED6C 
X-CRM114-Status: UNSURE (   6.75  )
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


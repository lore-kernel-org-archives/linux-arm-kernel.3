Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C356606A325
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 08:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yQL5UGnu;
	dkim=pass (2048-bit key, unprotected) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=3PRgon8a;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=V1i+qmhh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=wd8M2mrvgKIMbQLm6ZpnJP2zgHswKwBxdG5VWq5IGPg=; b=yQL5UGnu+yyZpZKKCZ1zEQQfWa
	o4nVqHyNNjKQP4N+AzULXNONfEdUtLpVCc+usyaT4P/S9u8OnWlImRdLg9oOU5qC6weSDd5nLoQRY
	Z4hOK09/17vA5glxHa+dg5rdZxoPLceK9UqREN1B0NJzODMwTiYxlO6LdcXfpEvCwvldp+5hbeAFp
	14BKkR3j/WyI1fcAFbKzjPu6PQXQVqs1rlQsmHVnuLb0XeB3tQMaRSfj2Wf/JTXt71EOJfPJ83X5T
	Oute5kQ9KpxYs/X1daGvwMfsklNPFbXE0Zn1tGTX4+mQvzLHpBL74BdISq1xWLW3fTbDnaMqoxnyj
	kCua/ZRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMiHA-0000000B9e2-3jMI;
	Fri, 30 Oct 2026 08:47:52 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMiH8-0000000B9aK-2v1M
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 08:47:52 +0000
Date: Fri, 30 Oct 2026 09:47:25 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1793350051;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wd8M2mrvgKIMbQLm6ZpnJP2zgHswKwBxdG5VWq5IGPg=;
	b=3PRgon8aNCuEia+L337yySeBOYoXiX1nocIcfzo8bf7r6/lwSA2zavb6RRrScq+zUpBdUz
	NkwmrrtSvlAoLQaD6lPx+2OIdlbN0TXn1oJl7IxepLVS7ollWLR8hZhMTv0k9xpHNy91o8
	uawoZ4cn00pjckUE1tNcSgQkwRC2XxVT+Bm96/qipHvoIQpZLpUAFbQGWKbRhAnTGvHQgG
	qm2ITcP81yIDIjpE7P3BmpPHsYPXaH8cFwInBaoF3GgcLwzFu7oVzSK36oy6MvanHvSJ3j
	MqYkkctkeQ0s+o9Ygpnz6gU/P1HxhHw2hvAYHMe6ZeD6gctkq0OKghOTkuQSUg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1793350051;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wd8M2mrvgKIMbQLm6ZpnJP2zgHswKwBxdG5VWq5IGPg=;
	b=V1i+qmhh5y+QG8SyPnmsY9EuillzshlgGOtJ5BASYlrGFsSBdcaH2/eKQmF5mLkbI5/Mm7
	oHPG0462Ns3DaKCw==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Lee Jones <lee@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
	Thomas Richard <thomas.richard@bootlin.com>, Andy Shevchenko <andy@kernel.org>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Andreas Werner <andreas.werner@men.de>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Matti Vaittinen <mazziesaccount@gmail.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, mfd@lists.linux.dev, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, patches@opensource.cirrus.com
Subject: Re: [PATCH 1/2] mfd: Constify mfd_cell arrays
Message-ID: <20261030094515-afbbbd16-d834-4ef6-8910-e936476ea018@linutronix.de>
References: <20261030071137.100954-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261030071137.100954-3-krzysztof.kozlowski@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_014750_872429_57CEA51B 
X-CRM114-Status: UNSURE (   7.14  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.8 (--)
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 30, 2026 at 08:11:38AM +0100, Krzysztof Kozlowski wrote:
> mfd_add_devices() takes pointer to const, so 'struct mfd_cell' arrays
> can be constified whenever driver does not modify it in the probe.

Looks like a candidate for scripts/const_structs.checkpatch.

(...)

Thomas


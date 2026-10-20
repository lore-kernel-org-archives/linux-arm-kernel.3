Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31AAF606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 07:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Z3cxjxpw;
	dkim=pass (2048-bit key, unprotected) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=K477aKgm;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=CY4xOlG9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AbbG2Q6j4Hecrtu/PulD9TnwIM8oYREi3XENRG9e+T0=; b=Z3cxjxpwzTWZ+G+VDlSbT93l1v
	LqbFmbafC2SLiqavI9Kw/HoXHUg/GMOaGapWcDH/p0h8N5D3uy7mvSIBTuCmCO0AGpHZTN2BhdT+u
	t9tBtiSZObC5a65/Y6jkQGmW2gr71e99+R6ay8YChphSw0BLfVsqLsTSzbKO9eDw93qif+degAEFU
	fyy6WybUY3MStfdPTZKVOJa8xs1Ljg3vUWVSMkFMN8tuCmXN09GdKUlcj6RR3szox5stk6Q1jU6/f
	7/n2oMqhKLnF/mk89fsWG2GEvzIRv+szLtE0F16bBpKSyKtn9CyuWmEYzWKox83CQ4T6DVXZwz6C5
	j45YClHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ4Kz-000000093Q0-28SS;
	Tue, 20 Oct 2026 07:32:45 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ4Kw-000000093P8-25il;
	Tue, 20 Oct 2026 07:32:43 +0000
Date: Tue, 20 Oct 2026 09:32:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792481557;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AbbG2Q6j4Hecrtu/PulD9TnwIM8oYREi3XENRG9e+T0=;
	b=K477aKgmkz+L+RRd+uucEpbLJ0f0xKJRbJMfRt+6Ovxjrea0w0kLPKBE5pAcVCIEDbo1l5
	mT0KYpEsopt8ZkoUShMmn45KL4YIHT3PvAwNfUPHN73uzIG1rdp4RQlRpVNduOaSunwJ1I
	fFI6AZFYjFCqqDkshKZ1oSh6lyYxhQjWWrNKyyZv5s6IxcBDyREqjG6ss/H7Ouja4XWYig
	3nGe9jgw5DNxc0PaBrFMUPvEEG8JbQXAUsnIQXEW40UkFvqcvoS7nhV+9dO4VdiACU7tLX
	9FrRFppKhgnJvIikvN2imkbISyzdfwGDbZvSYQUBa0dC2Ff13nHAYlrzkWZ4hA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792481557;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AbbG2Q6j4Hecrtu/PulD9TnwIM8oYREi3XENRG9e+T0=;
	b=CY4xOlG9QFW8DCbV7CCf/a69uJonoMF1BH+tVAs9yDlMABxmZbFtFiTlS0+2B5nu9/U1+T
	INrARMRaDy1GEgBA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Ryan Brue <ryanbrue.dev@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>, Mark Brown <broonie@kernel.org>,
	Lee Jones <lee@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Sean Wang <sean.wang@kernel.org>, Linus Walleij <linusw@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Yingjoe Chen <yingjoe.chen@mediatek.com>,
	Chaotian Jing <chaotian.jing@mediatek.com>,
	Hongzhou Yang <hongzhou.yang@mediatek.com>,
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rt-devel@lists.linux.dev, mfd@lists.linux.dev
Subject: Re: [PATCH] pinctrl: mediatek: common-v1: Use a raw spinlock for the
 pinctrl regmap
Message-ID: <20261020073236.dDVmd3BW@linutronix.de>
References: <20260929-rbrue-suez-upstreaming-mtk-pinctrl-raw-regmap-v1-1-db92943f42cb@gmail.com>
 <20260930080609.dnK1-Uta@linutronix.de>
 <CAGXv+5FssQL3Go3VDFbLAT6HP12RS3U3OgxhYOeapzs64QTdUw@mail.gmail.com>
 <d3d3e7b3-eb8b-456d-9a2c-116334e86c14@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <d3d3e7b3-eb8b-456d-9a2c-116334e86c14@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_003242_704505_F40C519A 
X-CRM114-Status: GOOD (  20.82  )
X-Spam-Score: -4.4 (----)
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
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 2026-10-06 19:57:01 [-0500], Ryan Brue wrote:
> Hi Chen-Yu and Sebastian,
>=20
> Thanks for looking at this.
>=20
> On 9/30/26 3:17 AM, Chen-Yu Tsai wrote:
> > The syscon node is the provider of the regmap. You need to fix it there,
> > not duplicate it in the consumer.
>=20
> Unless I'm misunderstanding, no driver binds to that node, so its regmap
> comes from the generic syscon code, and changing it there would affect ev=
ery
> syscon. Lee, Arnd, Mark, would that be acceptable?
>=20
> These are the options I see. Please let me know if there's a better one:
>=20
> - Do what Sebastian suggested and make syscon use a raw spinlock, except
> when the node has a clock, since regmap-mmio calls clk_enable() under the
> lock. Off PREEMPT_RT, nothing changes. On RT the lock would no longer be
> preemptible for most syscons, including across bulk writes. Most syscon
> users that do bulk writes only write a few registers, but enabling the
> Amlogic G12A PCIe PLL writes a sequence with 40 us of udelay() under the
> lock.

bulk writes could be a concern. The 40us delay is within the lock
acquired? If so, could this be done without the lock? I assume this is
part of the init sequence so nothing should use the HW so the writes
should not be interrupted by other writes to the device.

> - Have the pinctrl ioremap() the node a second time alongside syscon's
> mapping and read the input register (DIN) with readl(). That read is the
> only access the EINT code makes in raw context. This would go around the
> syscon, and it requires that DIN never be written in a multi-step sequenc=
e,
> which is currently the case.

So it would be safe for now=E2=80=A6

> I'd like to know the best approach before sending out a v2.
>=20
> Best regards,
> Ryan Brue

Sebastian


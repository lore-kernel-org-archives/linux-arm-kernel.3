Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B35C1609B58D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 15:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HX/nIHlT;
	dkim=pass (2048-bit key, unprotected) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=UO6wl9m7;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=cjq+t5yW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=vmeP5yEnqnkyVoHBFqgCtuQIbq8hDW1r9WecfwOSwuQ=; b=HX/nIHlTmDPHBikew1k1XA3j78
	LPmc/RAAKsBUVCAQ4jdV30NFOy/eulG33Fp9+mXTUuSRQZgli1CNKYQ0K0tyglauf+eV5Q13+IGvi
	yyTNof7UugOxU4qx6mndiEnpq3WxEFolX6GKFnArEv6nLTT49Twa2epc8FcgK7QtXSy3vlKDXsHxF
	VzS1VkOdn6smkyHkdxkg0GqPdzkXE0LmtVd6YS3ObOJXlTza83/JVZ9OXCHMs5Eu3RzVhu5H/WDbj
	spI8UcU7j2MHeYQ2gE69LQ+b8orGu1t4Ni/4smiO72rOii8Mwd+m3qMp/9QktRVMxevEKSUXS4gnZ
	Fo8Rz/4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNtZX-0000000GxzJ-0Mth;
	Mon, 02 Nov 2026 15:03:43 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNtZU-0000000Gxvf-0d9y;
	Mon, 02 Nov 2026 15:03:41 +0000
Date: Mon, 2 Nov 2026 16:03:34 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1793631816;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vmeP5yEnqnkyVoHBFqgCtuQIbq8hDW1r9WecfwOSwuQ=;
	b=UO6wl9m7RBHrJieOiZZvN4brHRib9ZtQyiwmHyHaWuAYRG64DM5WGvmVptZLI4u3WKDJnF
	M71KpRdCjGEYRQ0ZNyuUrg2MBf6G/0h8AtNOtxhd609crQRWsn9ULFz1c0bdVFLsOo+Ghl
	MxtJ5voXI2MjoMbwE0/348BYH4kSOiCqUbcKQKAueZveDDZ/i81+/UswGenDgvc4Hrk7ho
	0OGIHcI9bOYmI2VW1SPwAumWkw28Y5/C1tLPFAGAX+/wylYCKe8tauPeEQB4FvI/4TGv85
	vD/54DUZTKSuMkHRKk5V75A01BIW35D4ajgKmrXW7lzY0S8uv9iWtC9sayWk8Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1793631816;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vmeP5yEnqnkyVoHBFqgCtuQIbq8hDW1r9WecfwOSwuQ=;
	b=cjq+t5yW0qbGlmcj6omOC7sdr5+cqnKu1szT+dy1lmE74Kt1pDmVGyuE1tjvvm6Sp7AedD
	0pwVWf/K/m4EnjCQ==
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
Message-ID: <20261102150334.9q83qkpM@linutronix.de>
References: <20260929-rbrue-suez-upstreaming-mtk-pinctrl-raw-regmap-v1-1-db92943f42cb@gmail.com>
 <20260930080609.dnK1-Uta@linutronix.de>
 <CAGXv+5FssQL3Go3VDFbLAT6HP12RS3U3OgxhYOeapzs64QTdUw@mail.gmail.com>
 <d3d3e7b3-eb8b-456d-9a2c-116334e86c14@gmail.com>
 <20261020073236.dDVmd3BW@linutronix.de>
 <7981f7c6-c949-42e6-ad53-15e6530588cb@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <7981f7c6-c949-42e6-ad53-15e6530588cb@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_070340_342008_6EB3D830 
X-CRM114-Status: GOOD (  23.87  )
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 2026-10-28 15:30:38 [-0500], Ryan Brue wrote:
> On 10/20/26 2:32 AM, Sebastian Andrzej Siewior wrote:
> > bulk writes could be a concern. The 40us delay is within the lock
> > acquired? If so, could this be done without the lock? I assume this is
> > part of the init sequence so nothing should use the HW so the writes
> > should not be interrupted by other writes to the device.
>=20
> Yes, it's under the lock. regmap_multi_reg_write() holds the regmap lock =
for
> the whole sequence, and since an MMIO syscon's regmap can't sleep, the
> delays are udelay()s. The PLL's enable runs that sequence (13 writes, 40 =
us
> of delays) whenever the PLL goes from off to on, retrying up to 10 times
> until it locks.

If this is only at boot-up then it is less of a problem. It would be
more of a problem if a driver, such as SPI, would use this to fill its
entire FIFO during a regular transfer. This would then spike up during
the transfer.

> In practice it's init-time, though. The G12A USB3/PCIe PHY takes the PLL
> with devm_clk_get_enabled() at probe and keeps it on, so it runs only onc=
e.
> Nothing else writes the PLL then, but the lock is the HHI syscon's, so on=
 RT
> the other clocks in that block would wait it out. Running it without the
> lock would mean changing how the meson PLL code writes its init sequence,
> which I wouldn't want to take on in a pinctrl fix (unless that were
> preferred).

Okay.

> > So it would be safe for now=E2=80=A6
> Yes, that's the trade-off with the second option, which relies on the DIN
> never being written in a multi-step sequence. Nothing enforces that thoug=
h.
>=20
> I'd like to send a v2 after -rc1, but I don't know the best option for the
> fix. Still waiting on Lee, Arnd, and Mark to pitch in if they have a
> preference, or any option I've missed.

This is (I think) the second time the syscon mapping becomes a problem.
I would be a bit worried if the same mapping/ regs could be accessed by
different drivers under different locks.
But yeah=E2=80=A6

> Best regards,
> Ryan Brue

Sebastian


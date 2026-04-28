Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBA32FF8868
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 10:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/7F95IP42lhaZN8n/P9GcBa34x0fUhXhtcSfAbbIb3s=; b=EKos2dWpEhtabU/U36faRPEaaS
	ySgMS0m6g7rMbKp6SwEK9tnjKxf1sW4gSMLpC76uc/2ZsAHwxkLLPekZ+nU4GLHDES+nCuqXUp0HE
	zIIDv4ChYgrGVGcmXD46w5cLHscJo51I8uUP+C6x2uqEGlaLGOXEoenAkN1YgAj4STcYuTwVirHlD
	VvPyjwaxqAp6Dg98nRamuMK349Byi7EZCyURRzFxbS6QJha/eahpo735vdXHKYcyKFQAykOWCF7Yg
	+fApfUHCFXopxwJ7hyjIN/tL69S/mWDT0FJ3GwrlNrL5nYkDz72tqCP+NOhibAyk+xjETZVQADVc6
	LjFYhaWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHfWM-000000019qO-3g0B;
	Tue, 28 Apr 2026 10:18:26 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHfWK-000000019pv-1tU0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 10:18:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 525DB43B7B;
	Tue, 28 Apr 2026 10:18:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB14FC2BCAF;
	Tue, 28 Apr 2026 10:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777371503;
	bh=/IixdDMiEf6l+3+Y/vERm1hC/tsP5pn8ut57x2lup+4=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=qVemluUYRSbRbB+jeTHcLHXfVd0fWVePHTR7D6EO1tbYHqRMbxroM8029raU8KGsg
	 ypnd63LwnL7BEHTr0KFMNBBDSvKmkEflTA9ksd1Cx8g00b6UDvliI6mlVZeeUtLF4g
	 N2OrJ+eqSpcovEpMPhItU/qR3Qovi4ASRSSVCt+dJjF+p2D3aXHlfIfMteRqJNQANW
	 WU4n2exmEJEOc5pEb+OAZ1XZ32f8bESrWvTxs2Iyr1gXul7qQ098SYy5ydU8f5GVJ4
	 d0IiiK1p8k1f05JhyTIfCtBXRGS+lQW5qOMORNbLgZFTNH41p+WMC0qe2ZJhmSYiiL
	 KBXWsWpglW6lg==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id BAC7DF40082;
	Tue, 28 Apr 2026 06:18:21 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-01.internal (MEProxy); Tue, 28 Apr 2026 06:18:21 -0400
X-ME-Sender: <xms:bYnwaXcJmsECddzwi7UwtfuDBg3_l8GEaJLjfVVJGgqAfuR9oNMMmg>
    <xme:bYnwaYDFWZp0KZNoAkk-CJM6FtmXLX0CdG0SSqmglVA3Tsc5pKHgIR5cG3unv15In
    YhqBFZgSmZWTLLPx96cSG3Z1a0mBWe35Bgu_zhn8NOzdGYMxjmciX8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdekudeftdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhguuceu
    ihgvshhhvghuvhgvlhdfuceorghruggssehkvghrnhgvlhdrohhrgheqnecuggftrfgrth
    htvghrnhepkeevteduteehkeekteeugfdvvdekudevffejvddtueehuedvueegudfhtdet
    hfdunecuffhomhgrihhnpehmvghtiiguohifugdrtghomhdpmhhitghrohgthhhiphdrtg
    homhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegr
    rhguodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdduieejtdehtddtjeelqd
    effedvudeigeduhedqrghruggspeepkhgvrhhnvghlrdhorhhgseifohhrkhhofhgrrhgu
    rdgtohhmpdhnsggprhgtphhtthhopeduvddpmhhouggvpehsmhhtphhouhhtpdhrtghpth
    htoheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomhdprhgt
    phhtthhopegurghvvghmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtohephhgvrh
    gsvghrthesghhonhguohhrrdgrphgrnhgrrdhorhhgrdgruhdprhgtphhtthhopehkrggs
    vghlsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhhsfieskhgvrhhnvghlrd
    horhhgpdhrtghpthhtohepthhhohhrshhtvghnrdgslhhumheslhhinhhugidruggvvhdp
    rhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrg
    guvggrugdrohhrghdprhgtphhtthhopehnihgtohhlrghsrdhfvghrrhgvsehmihgtrhho
    tghhihhprdgtohhmpdhrtghpthhtoheptghlrghuughiuhdrsggviihnvggrsehtuhigoh
    hnrdguvghv
X-ME-Proxy: <xmx:bYnwaUt31HIys7vPt9YU4LopGzBpnow_vORtPpBl32hzavV72d-Eiw>
    <xmx:bYnwaVIgjmgTPj7A1M09K_1WyhLnOMj9DqdC0Bm4Z0Yvqjfa267QsA>
    <xmx:bYnwaYa8nOTdbjaUgkJsRTCvKQKohu3p5EkpzZMSN_oUaFOIOPnv0g>
    <xmx:bYnwaYnwJFhxqjJ8Zy0G2oztVSCZXq9Vwh37Zuu475ECLPQAWlBtJg>
    <xmx:bYnwaWUIjGOUqoXxHFUT8s_8kAXaZaLHvFZ-BoMMcX7jY6CRwmWuZEQp>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 99D7A700065; Tue, 28 Apr 2026 06:18:21 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Tue, 28 Apr 2026 12:18:01 +0200
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Thorsten Blum" <thorsten.blum@linux.dev>,
 "Herbert Xu" <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>,
 "Nicolas Ferre" <nicolas.ferre@microchip.com>,
 "Alexandre Belloni" <alexandre.belloni@bootlin.com>,
 "Claudiu Beznea" <claudiu.beznea@tuxon.dev>,
 =?UTF-8?Q?Marek_Beh=C3=BAn?= <kabel@kernel.org>,
 "Linus Walleij" <linusw@kernel.org>
Cc: stable@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Message-Id: <e1157e91-9a08-43c7-834d-cc6f3799b16a@app.fastmail.com>
In-Reply-To: <20260428101430.514838-3-thorsten.blum@linux.dev>
References: <20260428101430.514838-3-thorsten.blum@linux.dev>
Subject: Re: [PATCH v2] crypto: atmel-sha204a - drop hwrng quality reduction for
 ATSHA204A
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_031824_555038_818F0073 
X-CRM114-Status: GOOD (  11.12  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org


On Tue, 28 Apr 2026, at 12:14, Thorsten Blum wrote:
> Commit 8006aff15516 ("crypto: atmel-sha204a - Set hwrng quality to
> lowest possible") reduced the hwrng quality to 1 based on a review by
> Bill Cox [1]. However, despite its title, the review only tested the
> ATSHA204, not the ATSHA204A.
>
> In the same thread, Atmel engineer Landon Cox wrote "this behavior has
> been eliminated entirely"[2] in the ATSHA204A and "this problem does not
> affect the ATECC108 or the ATECC108A (or the ATSHA204A)"[3].
>
> According to the official ATSHA204A datasheet [4], the device contains a
> high-quality hardware RNG that combines its output with an internal seed
> value stored in EEPROM or SRAM to generate random numbers. The device
> also implements all security functions using SHA-256, and the driver
> uses the chip's Random command in seed-update mode.
>
> Keep 'quality = 1' for ATSHA204, but drop the explicit hwrng quality
> reduction for ATSHA204A and fall back to the hwrng core default.
>
> [1] 
> https://www.metzdowd.com/pipermail/cryptography/2014-December/023858.html
> [2] 
> https://www.metzdowd.com/pipermail/cryptography/2014-December/023852.html
> [3] 
> https://www.metzdowd.com/pipermail/cryptography/2014-December/023886.html
> [4] 
> https://ww1.microchip.com/downloads/en/DeviceDoc/ATSHA204A-Data-Sheet-40002025A.pdf
>
> Fixes: 8006aff15516 ("crypto: atmel-sha204a - Set hwrng quality to 
> lowest possible")
> Cc: stable@vger.kernel.org
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>

Reviewed-by: Ard Biesheuvel <ardb@kernel.org>


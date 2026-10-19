Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA76B606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 20:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Nh1mr3nR;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Pa3/iQqA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bhtdHmlzv0DKoEw+Zc7TOwdDACTcoyGMeQ8adip2B7w=; b=Nh1mr3nR2dIQUHvQrzZnr+JzKQ
	hFSoeT4CefiTacL/lCh4PRPk376eapO+2iLJZwJc5NQOUWVyI+Kp4iYERY9l++1IRqwafwJf2IkoP
	TFTkjutY4awPYdSQOmgNg3BQhLOowX0WhUwFZWm+EaEdVq1tOZlBQ7Bg7RG5VEYxkZHTso3AwWyzd
	rjz4Rq4D6nNxwjDrOVsq5f3XsTDIpVpDgKdeAsU6uoCtWIswlchAwGbH+jzlIeHuJZ12KakNxJvfj
	w1GvZazB0bbt4fpUT8whgFF3pkpAsRRZMSyvFhGaT7GR5Gt8mybl4/qi3LklNBWg7y4iMCMwujyGs
	JUOyegCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xItj7-00000008ICx-3qN1;
	Mon, 19 Oct 2026 20:12:57 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xItj4-00000008IBu-3gLF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 20:12:56 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id EB2E7C5CD5C;
	Mon, 19 Oct 2026 20:13:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B800F60582;
	Mon, 19 Oct 2026 20:12:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A795910328C52;
	Mon, 19 Oct 2026 22:12:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792440766; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=bhtdHmlzv0DKoEw+Zc7TOwdDACTcoyGMeQ8adip2B7w=;
	b=Pa3/iQqA6vAUfEWx2TIhJVrvDVY1bNti3mgE+dD437CyxrCLMqTJ1ErML4wYetDTmcOhYK
	PGq7h9FpP9dgS6Ncnd/AkqwJYFSPAxzZpb4yCCAjWY741cXlg2eGwlHYPABmg57+gc+sf9
	MbVZ5UeAITIRMWz1Eh3/oQAh6vsciD1LpJEyq2XrUfqG5VY2iX+lZm5FyMaQrAOn06ueNZ
	gi26YmOton3sKCyOeJXz0LOqt71W7hYVDciazQm48/qe7tvcsRlzC/6olMpGP/ez9o+f2V
	tcsQpXF00uQ0CStVQxb/29i3zXwo+y347qLAYTuhPpZg18W8E8lWlZjzlv/mqw==
Date: Mon, 19 Oct 2026 22:12:44 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Pablo Mazzini <pmazzini@gmail.com>
Cc: Andre Przywara <andre.przywara@arm.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
	linux-sunxi@lists.linux.dev, linux-watchdog@vger.kernel.org
Subject: Re: (subset) [PATCH v4 00/11] ARM: sunxi: add Allwinner B288 and the
 PocketBook Verse
Message-ID: <179244056617.104236.5769731153552958433.b4-ty@b4>
References: <20261012100816.331033-1-pmazzini@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261012100816.331033-1-pmazzini@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_131255_463698_E2B17AED 
X-CRM114-Status: UNSURE (   9.34  )
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
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, 12 Oct 2026 11:08:05 +0100, Pablo Mazzini wrote:
> The Allwinner B288 (sun8iw10p1) is a dual Cortex-A7 SoC used in e-book
> readers. This series adds the CCU and pin controller drivers, the RTC,
> I2C, NMI and watchdog compatibles, the SoC .dtsi, and one board: the
> PocketBook Verse (PB629), a 6" reader.
> 
> The B288 is closest to the A64: most of its PLLs are bit-identical.
> The clock and pin descriptions come from Allwinner's BSP, cross-checked
> against ccu-sun50i-a64.c. Tested on a PB629, boots to userspace.
> 
> [...]

Applied, thanks!

[05/11] dt-bindings: rtc: sun6i-a31: add Allwinner B288
        https://git.kernel.org/abelloni/c/51f30cb855f0
[06/11] rtc: sun6i: add Allwinner B288 compatible
        https://git.kernel.org/abelloni/c/3784706c87c2

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


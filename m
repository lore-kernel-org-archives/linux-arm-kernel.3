Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1B3FE77179
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 15:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pYg0W62vPotUervN4pJIA0UJY7Wvng19vnN2Rmxa4dA=; b=Tubzef0NOvi1JJjjkXXti53XST
	REUOBmtwO84gSywD/ge5fHQZSFeWQUgVbjSf8qa51T0RBGVP+jCXOlhzQPXeaTi6sLFNK8OZ/4ys7
	pkEp4PltkxeBks3LT4jHgw/0HS1tCoAmuU0RrrvdSRTYw0vZVuo7C1GN/sHtrYcuOHIha1xSIPVyy
	/3lpxI07POCyiELSjmiSQo2pOV12019bU5n1RxoknzzhI9P/DNd8Sw/DRXPBN5lz6+IP4rdgQaO7U
	mAqEtfArNXzYK/GS1nBDuRBAaNyK0cK7q4uTNeEpoeaifEI1MgTb1jYAWmGkboX6jswmb0draya2C
	+HdiVt3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJaH8-00000001z2u-2BnK;
	Fri, 06 Dec 2024 15:29:50 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJaG6-00000001yy6-28DQ;
	Fri, 06 Dec 2024 15:28:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E277AA403F2;
	Fri,  6 Dec 2024 15:26:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1952C4CEDE;
	Fri,  6 Dec 2024 15:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733498925;
	bh=75VoOWoRJIKu6T8F6k92wIh/D91+NMx6NbfhF3/ourI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=LUmrYELUfO1OT9T4glnELW2f/9s2IjjaLgsD+dEv2yWustyBnzzjT9UTwUBrsVplB
	 yptbdtXbHmThJHdqGYYQFYWtxyBkrAlD+icDzvMu1d3S/b1LlOgrPIeu2PXQBI4A9W
	 kJ45I2OWzm/uzhm8y30Yc+hPoyDSi1vy08bvQ1Jwm1qpzEduJVyXYyxlkr3gP0JHOR
	 74eoDuMyAiJSFtb5cO8Mv8/DS4/7IZOLDSB67cui57yuV4G9ZLKaztdB00PrY5jKI1
	 bHw4U8kJ4YfNoxCexzErJu9sBfs3hrI+tk//9h7fODwQqDQwsdfCaXcF4kzwhadEgB
	 C526D4ovWRTCA==
From: Pratyush Yadav <pratyush@kernel.org>
To: Marcus Folkesson <marcus.folkesson@gmail.com>
Subject: Re: [PATCH v4] mtd: spi-nor: atmel: add at25sf321 entry
In-Reply-To: <20241116-spi-nor-v4-1-3de8ac6fd0be@gmail.com> (Marcus
	Folkesson's message of "Sat, 16 Nov 2024 11:55:55 +0100")
References: <20241116-spi-nor-v4-1-3de8ac6fd0be@gmail.com>
Date: Fri, 06 Dec 2024 15:28:42 +0000
Message-ID: <mafs0bjxo4yqd.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_072846_605918_A5AE337D 
X-CRM114-Status: UNSURE (   7.32  )
X-CRM114-Notice: Please train this message.
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Michael Walle <mwalle@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Tudor Ambarus <tudor.ambarus@linaro.org>, linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>, Pratyush Yadav <pratyush@kernel.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Sat, Nov 16 2024, Marcus Folkesson wrote:

> Add entry for the at25sf321 32Mbit SPI flash.
>
> This flash is populated on a custom board and was tested at
> 10MHz frequency using the "ti,da830-spi" SPI controller.
>
> Link: https://www.renesas.com/en/document/dst/at25sf321-datasheet?r=1608801
> Reviewed-by: Michael Walle <mwalle@kernel.org>
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>

Applied to spi-nor/next. Thanks!

-- 
Regards,
Pratyush Yadav


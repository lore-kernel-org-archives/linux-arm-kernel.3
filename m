Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2F1FC369CB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 03:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CvPjl01CQoNJfYkNbSOrcz1LqiZzSxsyrCfhIJ29m9k=; b=Kfi8/FUZTvHmIArDsSxwC0M+Gw
	L/utg8Ww00zKywXW1/pLl4If/loKe/v2rclfC65bThSjAE5IQL+ZlINK0ElJyJYH6j1ozUQ2klPQX
	poIh3ZMX3YDRe+kAkmtNK7Lh8mroIa441N+fU/42iK4qmXYWPMzJ/pAOm45CI8AFG1pahoGwIjwuf
	7xghBLs+J4ouucV4eErsZlZE1Inpj5RsucvaEspoi+yZCMpBEQHUTJOM657LdybFHsx0YbG6y7j5F
	kuVxkRZZaDSxZ/auOeI2LQXVonWeKSz87o4SpAHAJW6vudupYhtN3v5Iy8VyAo+R/c927tSUNTkSA
	DAtXUUyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7R1m-000000098em-0Gb1;
	Wed, 23 Apr 2025 03:44:02 +0000
Received: from abb.hmeau.com ([144.6.53.87])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Qzp-000000098Vk-0v6c
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 03:42:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=CvPjl01CQoNJfYkNbSOrcz1LqiZzSxsyrCfhIJ29m9k=; b=R8vgEWJdqlme13UJVkaPIZHDE4
	amrQcxE8lxDjdKupqdnGcahR2iVayU6Ag7+ewrmI7fraqxmVk96AjfEfwGyQYLdSuFBEexcTbMA7A
	L79WeTcHIlKiAiCdFnol93lrAyDKQSIA2uBem9coPynZuro+xpaB7LkjZcVukeXjAVR1gaRiOFRW1
	6CJdYh+CSZRnZSJxYHLtEDuRcH5Dv+ZkuJFupJH51dG7Ha6Sx5oU6U3T1o0RUrAaz3OfIDD43mk0W
	iBegjOWKsYTtaGhJzw+PSPGbF5VvbToidzopdYO97FpWgZUm9Gk7LJ5GndirWEUdevq7rI0jhp5w0
	xlJ7hYKg==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1u7QzX-000Gji-1a;
	Wed, 23 Apr 2025 11:41:44 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Wed, 23 Apr 2025 11:41:43 +0800
Date: Wed, 23 Apr 2025 11:41:43 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
Cc: linux-crypto@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Ard Biesheuvel <ardb@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] crypto: atmel-sha204a - Set hwrng quality to lowest
 possible
Message-ID: <aAhhd91a94ZypyWN@gondor.apana.org.au>
References: <20250422095718.17360-1-kabel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250422095718.17360-1-kabel@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_204201_257453_9379172D 
X-CRM114-Status: GOOD (  10.33  )
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

On Tue, Apr 22, 2025 at 11:57:18AM +0200, Marek Behún wrote:
> According to the review by Bill Cox [1], the Atmel SHA204A random number
> generator produces random numbers with very low entropy.
> 
> Set the lowest possible entropy for this chip just to be safe.
> 
> [1] https://www.metzdowd.com/pipermail/cryptography/2014-December/023858.html
> 
> Fixes: da001fb651b00e1d ("crypto: atmel-i2c - add support for SHA204A random number generator")
> Signed-off-by: Marek Behún <kabel@kernel.org>
> ---
>  drivers/crypto/atmel-sha204a.c | 6 ++++++
>  1 file changed, 6 insertions(+)

Patch appiled.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt


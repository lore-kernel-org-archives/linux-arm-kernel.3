Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53E4FC43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jul 2026 08:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/NBII0BMp4fa4Zg7Dwve5MwdwbOFNBeaugYhi2j46os=; b=No2tJXy0GmXl+8iWa1eUjj4bLD
	2gqG3ehMdAklSuJGUvo30m9S57bYtO+DYUiRf3CiBzajL+roIJDAqaNyt+oW0LyF2xJTIDn2o4K0A
	N3s5RARjD4Scafw3Curnrm34RF6dNu3mbDLq34ghLw9NNgwSHA141ljcSKK8BqetHat0nHXW+Zsrq
	VWA+0wvkut++cG8QI9YIgV4UGVbgvnk0nis/Ekwprtn1HPqQXVBsb2xV3s86tENXeDc5vM7vpvFPK
	1l/uKFGm+gVVD5EHVgdIndHnMcB3NBoEkp5evGOKNM+egIyvz3o9d+IgiYA3RRyVCtbYclKZ+k7iw
	T/gIh0lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgICy-0000000983P-1Nrh;
	Sun, 05 Jul 2026 08:28:12 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgICv-00000009834-3WgP
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Jul 2026 08:28:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=/NBII0BMp4fa4Zg7Dwve5MwdwbOFNBeaugYhi2j46os=; 
	b=pFXxJCeC94YKMvrKpNVRWm3lhw5VmWiwAhEyP9FTVAuk8m01+iQTxCrfHHGr//b3/0htR69GYV1
	ne6cm8yEELa/nVjC00rqnMHORaPMsllWofq2IhcN8USvPY2jhW4B5NAiK7jljqXg4N+hbVPqlwT5I
	/BaPuOgxLIoglDAbUYgje4fB1lnovYJ2qIoYzQaEFxWwqMFaZnIZ/gWEdrhUiab+q0ynjtZZKiREN
	E2OawUNb4msMJML7kT7+699+ZMb0XH0i8lYYaQFu/HzTeocTuFgezvxjOTsiGkYJK7R/UkCYrVqc9
	BdKGrNhA5VTBIUVLJ5RzCa220YThxiee1E1g==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.98.2 #2 (Debian))
	id 1wgICh-0000000Akuo-0WG4;
	Sun, 05 Jul 2026 16:27:56 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sun, 05 Jul 2026 16:27:55 +0800
Date: Sun, 5 Jul 2026 16:27:55 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: "David S. Miller" <davem@davemloft.net>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] crypto: atmel-i2c - improve comment in
 atmel_i2c_init_ecdh_cmd
Message-ID: <akoViy68bvKvD7jM@gondor.apana.org.au>
References: <20260609100552.233494-3-thorsten.blum@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260609100552.233494-3-thorsten.blum@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_012809_878572_4AFB2B6D 
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

On Tue, Jun 09, 2026 at 12:05:53PM +0200, Thorsten Blum wrote:
> Clarify that a P-256 public key is encoded as two 32-byte coordinates.
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
> No changes in patch 1/2.
> ---
>  drivers/crypto/atmel-i2c.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)

All applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18130C44514
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 08:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5exeP60+Paw9Puba3bnlZkuXgjOPwLwVNGkFQKE2G7A=; b=vWY1e5RvC7cDs8H/AFty3d9PMw
	K+tJsb1fGyZqb2K1NxsZlZRXB0eXrKsXcQbXE2ZsVagZRXS0DolxJZsPEl48c/mPGRatQAjVGuRDv
	SqOcyF53u2zDGyZduy2zrHJjb249Cu6vRE1IU+dX8Tgsbg9VoU4yw3yHEl+UxJbRUX1ca4mjpzwEG
	Y1ftGuaG6Imy91grI4NUwNhXZYYc34i9Hk+O7EKplswTsgoWpOW0n41XjO2ReeJKqg+VOX0phBZSh
	cSl/egG5PzUNfWcaNNpN29K0sU9G1l/ZbxOhapP/epuq6rZeRHc7vMieLK75O0IqKRvjDAgTx0bZA
	KaE0yTMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkdiz-00000001avl-05vf;
	Fri, 17 Jul 2026 08:15:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkdiy-00000001avJ-0dXY
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 17 Jul 2026 08:15:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=5exeP60+Paw9Puba3bnlZkuXgjOPwLwVNGkFQKE2G7A=; b=Xu8725yIatWFzzXCZ6aQnp6ppj
	i7Msy+viVpo+3dIEmTA7VQg5nKmVrXm8lquA1QDEmueHqNYimNloXWWwtS0jBgsyjLB0+kKXCFSMH
	UX/bxM/9E5BUmhiQ1jjVSJfE7SldPFkVvklFNmljEJGSkFv0tuBo+3bLWK49y+bEb3/r6RBJ4VvpC
	eBbKFNZy6Fjl8/KlGZaoJP5/59vWHrFy1Ca+nwKVu5P2Vps07EIzUXNUzVbLNwkaXZ5zZLYI9Ui13
	tnTIvfsRpU8vDHTJryJgRTQL4TKbfYXF+wk02sJOwWg4Xi8Uy95yRxMoO2+ymt2BmLCUaUAxCDiN7
	+xlgQJHw==;
Received: from abb.hmeau.com ([180.181.231.80])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wkdiu-0000000Eed9-3GIH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 08:15:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=5exeP60+Paw9Puba3bnlZkuXgjOPwLwVNGkFQKE2G7A=; 
	b=PUelPz5OBzYDGCi3Y9PtBBjImtb+wZ0qH7dCic2vnIfeI0MSn04MRFmd9kBiVvQvIrHZJXhlB2/
	r86lqXtKDQNdNQbpAgEvY+mfZXSjYFTWW8S5clKHbGLL49eE//srgSxSgznDEXnwe8CVECFiSGIJ2
	Z0hFTeEXXyTkj5X6rPUtB8aZh9kje2viINGqTUmAbuoNmJvPROkRh5uZyt+rgS6V0AeqxfzVSraBb
	f4pOf7W3qRr3SSFNo2XtMXEFCi5xHYQG97sSNF/z98FDPnIUeDVFqiJ2nKrzsqzC4dBPeAvzwDKzy
	BtoSl2HU8zfIuOzt/1IlEHVxvt01Sa5XdCeQ==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.98.2 #2 (Debian))
	id 1wkdim-0000000EO83-3u2O;
	Fri, 17 Jul 2026 16:15:01 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 17 Jul 2026 18:15:00 +1000
Date: Fri, 17 Jul 2026 18:15:00 +1000
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: "David S. Miller" <davem@davemloft.net>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] crypto: atmel-sha204a - clear RNG data from memory
Message-ID: <alnkhHBvJe88caUS@gondor.apana.org.au>
References: <20260708150359.545852-2-thorsten.blum@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260708150359.545852-2-thorsten.blum@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_091509_143666_83AEA9E1 
X-CRM114-Status: GOOD (  11.34  )
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

On Wed, Jul 08, 2026 at 05:04:00PM +0200, Thorsten Blum wrote:
> In atmel_sha204a_rng_read(), use memzero_explicit() to clear the local
> stack variable cmd before it goes out of scope, since cmd.data may still
> hold the last 32 random bytes.
> 
> Since atmel_sha204a_rng_done() caches work_data in hwrng::priv, and its
> response data is later used as RNG entropy, use kfree_sensitive() to
> clear the cached data on transaction failure and device removal.
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
>  drivers/crypto/atmel-sha204a.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt


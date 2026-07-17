Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C762AC44507
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 08:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=06AYYIYfgRAXIqAMErr4O0bh0kIsqo27jJLndxJScq0=; b=g6zFcp9XqtB5dvly/Vzmyj56k8
	JhecQ7IxuWSk3GzIb3TtNIsYwdcXfQv4hgImJaK1gZTv4J6nuADWq2vfWOx68oDmWg0KiwNv6KcHR
	os4PQEYyKWF7+/W8uiXsNVn+bMXtDYhDluMrXVZjpmaCNLb7hiakv1i/XhQqovrUDK/1QkOWHGO+s
	yM/xRqZaRDQrp/x9CL8t3ywvpjL365XEGlyg3JqM0DiHTh/ZS4hyLnbgdQkQJC2pwGHKiQrvuKaLh
	tS/SMq/giFRvCUQxJe3uqdVXjubQPkAAsZ97hL58dimygE+Es0zKVfv9SM3xEJHkmAlnHYHqDGi3i
	INeMT68A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkdkU-00000001bRO-0XY7;
	Fri, 17 Jul 2026 08:16:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkdkS-00000001bR2-34wr
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 17 Jul 2026 08:16:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=06AYYIYfgRAXIqAMErr4O0bh0kIsqo27jJLndxJScq0=; b=SG8v/GOMbbkRK1n4umrI+qmGot
	HuJBxPsmLo5WH5408t9zlBJNq/bdBf15BSvMHVPvRSaenp83VztWp9s5mVqlJdr0XI+fcqvPCwhFr
	DJkMQ/e7VXlZS5+B12xIih/CmGuUVVWln3PI86F3eWdwDNZcshUQSoke2Klo2QdyLT8stcNBCao8L
	FtM/sycD8CycUeAKSMcs1hycOU0dANec8Ae+V2HSq44UfMYb/aEg7MrFCz66G8Be5qhTLY48Y6G9M
	ax7x2UX/WJNUc2tEXjFbo4PG5J7G92C3qcZXCTFTEY0TUO1SwpLP7PfG9dxRaAgWssLlZOYD7IyFS
	rTq7PkYA==;
Received: from abb.hmeau.com ([180.181.231.80])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wkdkP-0000000Eels-043M
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 08:16:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=06AYYIYfgRAXIqAMErr4O0bh0kIsqo27jJLndxJScq0=; 
	b=qwv1uubYnn5HVAX5NmCa3w77qfOE0pk8utDvVjgVwU/vYqhOZ24NNiwPuzvybUDBiLupar9Sxk0
	6kxZR4hE4cWl24N9QTmnBSkpwP+7SuP/e60jyOPM0Oh/zuHQNKUJGIEv2fyxcIM8R8rIogm3Yf6OM
	B2d+QKT9qEJKiszdMjH4Bo7ZhTPRwqQmwdHKCF799nX2OLtVSFbuGoxy0Uhnh9iEg1/k3zAZz4NmH
	LI9e7DJWE+bS9T1rGrso4+pOIJ+NsjQetSwlt8QiX+UFeSvNzUqAAQVV6Z4qXoEq+TB+ifx8hdsQS
	Ozk5UhO9t8mdzM0YN3Bv09P3xPDTluTEtPKg==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.98.2 #2 (Debian))
	id 1wkdkH-0000000EOAj-0Rzq;
	Fri, 17 Jul 2026 16:16:34 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 17 Jul 2026 18:16:33 +1000
Date: Fri, 17 Jul 2026 18:16:33 +1000
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Corentin Labbe <clabbe@baylibre.com>,
	Hans Ulli Kroll <ulli.kroll@googlemail.com>,
	Linus Walleij <linusw@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] crypto: sl3516 - drop invalid sg_dma_len checks before
 DMA mapping
Message-ID: <alnk4X5dsPBoDfTH@gondor.apana.org.au>
References: <20260710074216.734849-2-thorsten.blum@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260710074216.734849-2-thorsten.blum@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_091641_296372_D89646B6 
X-CRM114-Status: GOOD (  11.65  )
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

On Fri, Jul 10, 2026 at 09:42:17AM +0200, Thorsten Blum wrote:
> sg_dma_len() is only valid after mapping the scatterlist with
> dma_map_sg(). However, sl3516_ce_need_fallback() checks it before the
> source and destination scatterlists are mapped. Thus, a stale DMA length
> that is not a multiple of 16 could incorrectly force a software fallback
> when CONFIG_NEED_SG_DMA_LENGTH=y.
> 
> Remove the invalid checks; the existing scatterlist length checks are
> sufficient.
> 
> Fixes: 46c5338db7bd ("crypto: sl3516 - Add sl3516 crypto engine")
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
>  drivers/crypto/gemini/sl3516-ce-cipher.c | 8 --------
>  1 file changed, 8 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt


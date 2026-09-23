Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ACE8C98307
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 08:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hO932NQ06DTc2e0n4ctH4CB2tn4URweJkiaBxz0DG9o=; b=yQVbQoS7riiqwwFdl5m2rbZAXe
	MdJu/VLXTK8QH1nsq0suyVgmLKlWMFPT+GQ0Lgc1Qeqy7j90I0xi87pRV5fjKYJh4Rs1Z3rP5nZiI
	eiFkdi70LEXeWs6Udxsf3ht6jucgpORirwNldOczMEUy0WzwAX44JMoQF4wP5q+pXMw6r8LkAvKMD
	EpoZpbXXGqoZ0X1Vn56uIM0nlb4hmYU3NYwgykqb9birNVr6MZJl9ok+5RyieUCtYzcjWtt/Exyiv
	TFUX/OiBM9OnVT7apooZYLrEn8XSoZYMfNsyjs01RQyfXCXa8Hc0Yv7a32vnNO63FmsrpAebIu2GD
	k87YV2qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Igd-00000007bDb-22KF;
	Wed, 23 Sep 2026 08:50:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Igc-00000007bCj-2pgH
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 23 Sep 2026 08:50:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=hO932NQ06DTc2e0n4ctH4CB2tn4URweJkiaBxz0DG9o=; b=FtA3DGQYmv+vZHl+JZpPuDjYU/
	W/AGZzOEqlafaZMtZkoVlnMbl/C7DOFHt3WcqaaMDNJa18FumvCtc5WmiYuv81/HStlgt9uZ4u5u9
	TR7S5yYytp3HTdtGWhfe3Tw+F+/G+f64jiXGtm84rYweU/Ui/7dDEhsYV5R8oyeN8pA//i5kPXK0C
	uH7F/ag7usocY9ZNSZsQqun7eIktfP0KDlBzjeVxucX8QkqaxYv4rlpIgc4nJM3aqg3PKjAGIaJYZ
	hsNCowCQmO6abqjhSqEzIT/gStvnU05XJ3bWP1Hk685Rj9dXdXqDCFlloO3SwJMz83ZvP36xGVS4Q
	ZaN6bb4A==;
Received: from abb.hmeau.com ([180.181.231.80])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x9IgP-0000000EXog-1iYH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 08:50:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=hO932NQ06DTc2e0n4ctH4CB2tn4URweJkiaBxz0DG9o=; 
	b=B8xjEb5ZxqFwFYLXqG4WKKhTMbn37PNPBxx2xdzCjcbxD86UZxAYzUMsSwk5g9M+yh6rWeg7Q3i
	nvGnIK1ekypQ0/tMzhF7LN9z+unR/ApeVQJULI02OGk3ERGMx+jDHby4J4KIDKwQFPVT+iJhLRRSH
	Ww2rlMz+cJpF6fZsEYHQDMoW3x1OwIzRXHJfv11V6gBVXTc5UswDAVOWN63CWSA9Dy+bbHXXuAa1Q
	elJTdsehOd1fHEC2VO/sPXwgGdSE8bmWTEqP/miZ8n/UmyF5Gh3hKwCf+h64+N0PkKM1IwbmM4TeX
	ljVH//TwjpjszVPq+exHYAzaS78Q+P+9hU7Q==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.98.2 #2 (Debian))
	id 1x9Ig9-0000000GyDF-3T4x;
	Wed, 23 Sep 2026 16:50:14 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Wed, 23 Sep 2026 18:50:13 +1000
Date: Wed, 23 Sep 2026 18:50:13 +1000
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Thorsten Blum <blum@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] crypto: atmel-tdes - consolidate transfer setup
Message-ID: <arOSxQ05VZzmP0qx@gondor.apana.org.au>
References: <20260916171659.129009-3-blum@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260916171659.129009-3-blum@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_095034_547144_C1F6884A 
X-CRM114-Status: GOOD (  11.89  )
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

On Wed, Sep 16, 2026 at 07:17:01PM +0200, Thorsten Blum wrote:
> atmel_tdes_crypt_pdc() and atmel_tdes_crypt_dma() store the transfer
> length in dd->dma_size and synchronize the bounce buffers before a slow
> transfer.
> 
> Move the shared code to atmel_tdes_crypt_start() and use dd->dma_size in
> atmel_tdes_crypt_pdc() and atmel_tdes_crypt_dma() instead of passing the
> length separately.
> 
> Signed-off-by: Thorsten Blum <blum@kernel.org>
> ---
>  drivers/crypto/atmel-tdes.c | 40 ++++++++++++-------------------------
>  1 file changed, 13 insertions(+), 27 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt


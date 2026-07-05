Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94479C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jul 2026 08:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t8Thjx+J/avbZvs0RPyGjgsts0CA4hDykNPO3CuFqU4=; b=4rsAd8ARr6LJ5y/jMyuuovLuAO
	9l2dwqhHF3ExrcgdHkoHt0dJZgtXRTT6CqHdNyvMDl1x1KgivlVreziVPcYPvI5nMF2QQurCqI258
	L8eQvYZyp8M3X0wrPUy+pQ/NPYza07AZIvWfa7hbjkazwbUkVeMMKSAUAoGLZ5euCtXgXDXB7LpWT
	KZ+ZNRnx8bSZIU1zNbpXA1WyOBHM3Vx9t9JELeHZZ+bkzsIhs6+GiOdLP3/HFbDmGE9Yh6q/MvFZG
	lY2eDsaGWcUreXmAGcZZFLHOnTZPjUjdFtf/qVCU5zjiwPLB5pd3fWprvauX2pHjtgg2jNfOPAT3X
	YmaXbAzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgIE1-000000098CA-2VS6;
	Sun, 05 Jul 2026 08:29:17 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgIDy-000000098B4-38VK
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Jul 2026 08:29:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=t8Thjx+J/avbZvs0RPyGjgsts0CA4hDykNPO3CuFqU4=; 
	b=jODBXUDNhMBHZ1sPurm69z089Jl5jMQO+5SpQcwoD73mIipzRI+QmfLFINL81UiEa/+hq2ymBcg
	VBPFj77qIwhHt86wgIiQnVIXhsildjSpCTSm/U2++dm3LCKg48dP+jNCasN43Mntvjnj4nKblZGAj
	1YLf9jeZ9XlvW63/SnkvPyX9H/aQFpBRZ1QBPYDER4DAXqukzsJ/+Npk4lMQHVXqUDLTjFq0ZtwlH
	dblGgl7iwsG2C51MUfMlzZYUXJSxGinQjp7l3RJxyHi+M6iFAXIEaEC3PzDLP0fIMOi2rUcY6Twfd
	gssj22KWS8MqsQ/Vaw0AWCy9qK4JCyy8ohog==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.98.2 #2 (Debian))
	id 1wgIDr-0000000Akwd-3Nz0;
	Sun, 05 Jul 2026 16:29:08 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sun, 05 Jul 2026 16:29:07 +0800
Date: Sun, 5 Jul 2026 16:29:07 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: "David S. Miller" <davem@davemloft.net>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] crypto: atmel-ecc - drop unused curve id from
 atmel_ecdh_ctx
Message-ID: <akoV0wUfeiEKH7nY@gondor.apana.org.au>
References: <20260611105159.460794-3-thorsten.blum@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260611105159.460794-3-thorsten.blum@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_012914_786318_65DC27A3 
X-CRM114-Status: UNSURE (   9.48  )
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Thu, Jun 11, 2026 at 12:52:01PM +0200, Thorsten Blum wrote:
> ->curve_id is only set once, but never used - remove it.
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
>  drivers/crypto/atmel-ecc.c | 3 ---
>  1 file changed, 3 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt


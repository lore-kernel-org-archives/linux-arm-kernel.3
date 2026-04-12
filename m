Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69A1CF3ED6D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Apr 2026 05:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IUn/0oYiuWFPh0x53XCMORztV8/rGkx/S77yMEPOoss=; b=ulUEww/SdjDRBSqEBHjBz8vcYW
	elZ3ZZxPDE8MaArknxjJ2NpWpEHWwO2a7pslyu2d4I+XS1O5ZXRYixbpY34sdDjzdAfZxksJlQ9YQ
	0o9bI6oDxCMrOHzMwDk27nu4na6glhS9bdWuR9860WavPGl8VTdKHJR+nC841UwmqE9KkRUBHxn4p
	iUPaFUtXRqYlxMfAeQO77yHV2AtQH3crtUen+cNTMLz/kzoAuukT7yhD1e1tbYDp9ppPl9rIvUQai
	QMqmkyK5llneCKovkdv2++hYa2RrdFc1zWxfZSXJlnV/dLT1GW5MM1KDEpOs5XMjvJk84eZcMZetH
	fA1040jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBnjY-0000000E4cI-1mpz;
	Sun, 12 Apr 2026 05:51:48 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBnjV-0000000E4bK-3Ckg
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Apr 2026 05:51:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=IUn/0oYiuWFPh0x53XCMORztV8/rGkx/S77yMEPOoss=; 
	b=mymNJDa3GY+BtcS1hLT2Sa5wR5mtaCZyHN99BNfLDnGHY4m8a85CB4DwK2VSA1HGe5n+3Nuv5GY
	/J/2RLzn1mfJ9m+0jPN86Ulw93dSsI59QvV9aQOSfFsX6fOZ9isZTTgDQgRnwpMjhujOkIzp5/mED
	JDVt0AZ3GkI1k+GLxj0y/HDtqgUjevitqGey4QDCK5IvI5OAAzyZRSsVkMaFDaKlwrcPCVH0695of
	ByaW8XJUqPJB5u/NDvhj/nqoHUU9W1/Ttjf1oT9Z6jTgm9ENUmPUqY6mGg1cz/bVSKL5GknVF9gtD
	B8fgh2rcyuR3WfKrgby3x3OeLZjHsnwZc8Ig==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1wBnJT-005T6v-17;
	Sun, 12 Apr 2026 13:51:11 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sun, 12 Apr 2026 13:51:10 +0800
Date: Sun, 12 Apr 2026 13:51:10 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: "David S. Miller" <davem@davemloft.net>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] crypto: atmel-ecc - add support for atecc608b
Message-ID: <adsyzmm3WSZ1ao4a@gondor.apana.org.au>
References: <20260330100800.389042-3-thorsten.blum@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260330100800.389042-3-thorsten.blum@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260411_225145_810301_B164F144 
X-CRM114-Status: GOOD (  11.47  )
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

On Mon, Mar 30, 2026 at 12:08:00PM +0200, Thorsten Blum wrote:
> Tested on hardware with an ATECC608B at 0x60. The device binds
> successfully, passes the driver's sanity check, and registers the
> ecdh-nist-p256 KPP algorithm.
> 
> The hardware ECDH path was also exercised using a minimal KPP test
> module, covering private key generation, public key derivation, and
> shared secret computation.
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
>  drivers/crypto/atmel-ecc.c | 3 +++
>  1 file changed, 3 insertions(+)

Is there supposed to be a 2/2 or should I apply this patch on its
own?

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt


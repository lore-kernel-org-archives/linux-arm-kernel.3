Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 050EDD3E788
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 03:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ab0FOhkIM5QumDMBprCrgDZnmVYT79yg0jygQ9fAPvw=; b=X/BiT6ysSEhBo39+w8MeHJB3DI
	UskhFFaUk7PuPhVNfGF07HEJR7uMS2YD0ficc89lB/2hSEIW5vsPsE6gAHF1QlpwqD3C0lNXncUmA
	zggr422NPbihf9ItrodIo96aT6YFM6yA+3pQAAkAuh8mtik5T/RCKmczoxdHQL2nX4hMFZd1Xopyx
	fGybUxitEi1RmESrY6uPqh1YPm2yMx7RJraccw+H07z0/1ydsW1NLM1aTrr+BI10+2HwUT70BU6wT
	wV8F1a8ApJWV3J9+pcWPg2bfgJZcZw+epzHd9WZmgTZUOu9PARF48AuxgCMp9bszMXbzx2I1ccLtB
	igbh8sYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTWxF-0000000G8xU-2h9i;
	Thu, 11 Dec 2025 03:02:57 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTWxC-0000000G8wn-2TZX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Dec 2025 03:02:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=Ab0FOhkIM5QumDMBprCrgDZnmVYT79yg0jygQ9fAPvw=; 
	b=li6jKn1ougyD6RBhgVydfDTP71NTHurxiVBzQ2cVzkK/9ZDI7XQmxzFEMtIjOjvxQ92eEq7GQyt
	4JSj110hWObEsSJ0lQsvHRPyGHJ2uJeQdV40rUCi2o0zvmdGaGyUYKkXmVvaOvbgy3a/LL8veO0Wd
	rYJ+teHHXgkZVBUSxrBv02fUANHvyYMnXQ+O6XT8V+jraU4DukTSyyAbxWWMaTtkI5xhFpgMxE7Zo
	CAZtWDO3JS8vJqF/YkZQH16p26oT238O98YQ8ItUgDHZW62xESbpYYT6RjOeZlNeGYymhopyMpl8n
	ePTLve4Pj6JVEi/12Z1lW2tXPbDPDjCaT/Cw==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1vTWx5-009PDa-27;
	Thu, 11 Dec 2025 11:02:48 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Thu, 11 Dec 2025 11:02:47 +0800
Date: Thu, 11 Dec 2025 11:02:47 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	linux-arm-kernel@lists.infradead.org, x86@kernel.org
Subject: Re: [PATCH 10/12] crypto: nhpoly1305 - Remove crypto_shash support
Message-ID: <aTo0V7fD6PqrArFN@gondor.apana.org.au>
References: <20251211011846.8179-1-ebiggers@kernel.org>
 <20251211011846.8179-11-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251211011846.8179-11-ebiggers@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251210_190254_640971_DF48BD85 
X-CRM114-Status: UNSURE (   8.78  )
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

On Wed, Dec 10, 2025 at 05:18:42PM -0800, Eric Biggers wrote:
> Remove nhpoly1305 support from crypto_shash.  It no longer has any user
> now that crypto/adiantum.c no longer uses it.
> 
> Signed-off-by: Eric Biggers <ebiggers@kernel.org>
> ---
>  crypto/Kconfig              |   6 -
>  crypto/Makefile             |   1 -
>  crypto/nhpoly1305.c         | 255 ------------------------------------
>  include/crypto/nhpoly1305.h |  74 -----------
>  4 files changed, 336 deletions(-)
>  delete mode 100644 crypto/nhpoly1305.c
>  delete mode 100644 include/crypto/nhpoly1305.h

Acked-by: Herbert Xu <herbert@gondor.apana.org.au>

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt


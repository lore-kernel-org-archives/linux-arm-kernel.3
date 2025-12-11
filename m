Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8791CD3E788
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 03:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QVqdbRRFrX15Ivg63+Vus29+rCqCe9lqqydPLM8MyDw=; b=M61cyml/uZ1ophwo0357G54RvP
	2vPGgcSi4zj3Wnt3Gjp92b0B7hLQgJLZdJUMI59XVEe1UseJvSDuUlFLWoXdcAEwVU54pWmTkCifN
	ylRjPDmcz3iOl2aIb7zv6mpKAO8ea47GCusYZFJoLGkkcwDwFfRiInv4uaYfy1bb44SRuv497MOAz
	A6ifoczOB3AqIafaZb/CMmbkqSAb/i3QG1UhDZiTntB5dFQj83G7s0z+En5fRFwQnv7cZsrpnxmVd
	BREDZF6sBhm19TmZMMNx5o61u+hWBXPlOweSWVKyehQfkI22JBjw8vn9Oixh+NoKaMdr0RKyAFWmZ
	w/eCh4zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTWxg-0000000G92a-0ArR;
	Thu, 11 Dec 2025 03:03:24 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTWxc-0000000G91F-0aWE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Dec 2025 03:03:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=QVqdbRRFrX15Ivg63+Vus29+rCqCe9lqqydPLM8MyDw=; 
	b=oUiza1v2HuFRwnYQd6dblRTj+0pMVKYX8oZdK8LBKuhJxeiuKW2kq1OW6fpyUUOIU19BdPLg+up
	I4gLKuU5WOF6wYnbknTdZw10V2tdceWcAhlhxVmyvVtdhEXgrJqVj0PJvRcJS9RNqtK7RbVUKf1cl
	nWv5ZTsnl9RpclVD8xOosv8JFk1+fqRFux8cXdjxWeEZpAEVMhFoMkO3LZV37ef68YkgEePy93tVb
	WNoXklHWm8cSeKi1rOX6EXxjBn1pbqCiF87mAxITVn3dnj8/EE1NeWEwt0W9Zu6DcT5SCp8xKonF/
	AKeFKuf6SKMe7qOXZYdF5uLPWSZS7kS2mvog==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1vTWxV-009PEV-0N;
	Thu, 11 Dec 2025 11:03:14 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Thu, 11 Dec 2025 11:03:13 +0800
Date: Thu, 11 Dec 2025 11:03:13 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	linux-arm-kernel@lists.infradead.org, x86@kernel.org
Subject: Re: [PATCH 11/12] crypto: testmgr - Remove nhpoly1305 tests
Message-ID: <aTo0cfjLr5qi2nmY@gondor.apana.org.au>
References: <20251211011846.8179-1-ebiggers@kernel.org>
 <20251211011846.8179-12-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251211011846.8179-12-ebiggers@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251210_190320_178959_C91F4892 
X-CRM114-Status: UNSURE (   8.35  )
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

On Wed, Dec 10, 2025 at 05:18:43PM -0800, Eric Biggers wrote:
> These are no longer used, since nhpoly1305 support has been removed from
> the crypto_shash API.
> 
> Signed-off-by: Eric Biggers <ebiggers@kernel.org>
> ---
>  crypto/testmgr.c |    6 -
>  crypto/testmgr.h | 1372 ----------------------------------------------
>  2 files changed, 1378 deletions(-)

Acked-by: Herbert Xu <herbert@gondor.apana.org.au>
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt


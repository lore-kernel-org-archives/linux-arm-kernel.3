Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2C46C44514
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 08:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9z91ILlxQtYqvnBQwnktbnN3/Hw+eSYMXdhvRXnuXjA=; b=S8yQndofrTPZsO62bPe9y0/SdG
	5Dya6OYCMsHQWchJj5orQ23pvglfnjScSWpasma+fw5S1gVUhp5GLah/EHQy5fNP5Ej5rWVgsT9PP
	kfunhcyBAChWAOr2smFEHBpNz43ivRTm0Td6hx3FbHrSGkHVwzwTH2QaYkTnH3D43rTL3zfdRtPf3
	VETNgyAY44FXY1v3yDYaGUBagV5m+X692yNEuXonjbHBthI1Nzn3hM0saZw6Rkb4cec2nKnIEP7is
	MInFh4BoQoI2neUB523k9chGXH8eSFnx3dvXpKb8FlWy9iw75vA0CPJ0vzN4A1tiNxXhjBC44v8j8
	N85gxlgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkdiK-00000001alw-1E3y;
	Fri, 17 Jul 2026 08:14:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkdiI-00000001alf-33Y2
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 17 Jul 2026 08:14:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=9z91ILlxQtYqvnBQwnktbnN3/Hw+eSYMXdhvRXnuXjA=; b=o54Q2DztDWYRqKwcTKRBQw9dOb
	NWj3a/v38ghYUUfGVCeHSyVb2iyT/nDIiNJUdbI47An1vrX28BrnTUqUcPaMVLHJoIKqMZW0K7ouu
	VetVMxV1iY8kReEjxPO5veZc/bU9Aw4702R3YGNXMiX/AC96GpJeHdUEaqXuDLVhQXOQrwh/yYbxx
	Z4uFmXDzUkmY1dKrlq8P27ESFJDVjGyC4VeueMCMepXTNtQE1yAnSTa+DI/HIffxWRpZX6JRJmLQU
	GDMo3lBDi1euD/yNPV7G99/N1unbc7vSll2RJP6zUwjOXYgckyt9zdhAc76YvD9d9mU3A80oIyJbi
	71AOvJ9g==;
Received: from abb.hmeau.com ([180.181.231.80])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wkdiE-0000000EeaK-1SRg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 08:14:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=9z91ILlxQtYqvnBQwnktbnN3/Hw+eSYMXdhvRXnuXjA=; 
	b=Jo5JwX5ttm1a0aFE3FRT6/R0B+5PjG/lrzmg6hihJWuEVMo7fGAGK15Gf65LKg+C+4Eh/LtS655
	tIfI7qhJztpt/2bRt2Qc7hTLYbsmVIFWNP3ufhsU5QDN8gF6XVBx2hg8+l3l8PDtkcFmTtd+0Xu44
	MCHNAgwZSuwnRMOqEG5UjPkLAiMfEhw1aka87gXmuMRpc3WLqNte4qjIq6CVFrStBMy0FtdDU5KMl
	p4kT0BMN7XI4NVBx/APLqsiqa5vGet6QryBPjj1S6i3ftuWcq8j2MkFoABzYj8MeeKVtRd37F7BUK
	wgo1n0qMeD1IhybUCHvelRVwcwrFKF/f9FeQ==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.98.2 #2 (Debian))
	id 1wkdhq-0000000EO72-1uu9;
	Fri, 17 Jul 2026 16:14:03 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 17 Jul 2026 18:14:02 +1000
Date: Fri, 17 Jul 2026 18:14:02 +1000
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: "David S. Miller" <davem@davemloft.net>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] crypto: atmel-tdes - simplify fast path in
 crypt_start
Message-ID: <alnkSoU0swZzyh-i@gondor.apana.org.au>
References: <20260706150404.382209-5-thorsten.blum@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260706150404.382209-5-thorsten.blum@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_091426_858752_13D0C2F8 
X-CRM114-Status: UNSURE (   9.39  )
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

On Mon, Jul 06, 2026 at 05:04:05PM +0200, Thorsten Blum wrote:
> Fold all fast path conditions into a single boolean expression and drop
> any redundant checks.
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
>  drivers/crypto/atmel-tdes.c | 24 +++++++++---------------
>  1 file changed, 9 insertions(+), 15 deletions(-)

All applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt


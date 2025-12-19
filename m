Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 963DAD7495A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 06:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TJ8zMu9MePUhbsmPHVewV9sJA/Fh9rLxzkUQzu+BsnE=; b=eOhpSjzwJUm7AbMW98BZlOGrCg
	ZtNfrrnIBGhoCp8GwvNjrg9iTZp9bkM+FdN+CGN6GzHsV+NquPU3SU/WKz5deKx0QGRhGgCK1HMcX
	4Uv+x3IiZ6maRrnFvVITk918YUUH540ZP/s6hcCryh8m5FbY6IBN20PvRVDEbHSZJrG/rBziqR7Xk
	d+D7rjCG7hhgjviqHgRkUnoTVjBFxymZ/Zja/t9STwgJdXaM4ykLp07j12fy3zXypTKJcMVfGggX6
	/8j0/68UxdYN945CSqj4ZJru+MtSwfFWKzYcgVuRcYgUyFUPxtsmg/Jyu7UAFI3eiy8MwTraE5pMQ
	jUj0MM6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWURi-00000009j60-0LOu;
	Fri, 19 Dec 2025 06:58:38 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWURf-00000009j5Q-2onJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 06:58:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=TJ8zMu9MePUhbsmPHVewV9sJA/Fh9rLxzkUQzu+BsnE=; 
	b=rl23U4sbj2/NRxoytdaKGCwDstEKEMjuL1UdjQhR/+eb4jvI2wDhz+FO3RsmjaHINJRDA0a5phj
	MnDWAOD16b9TURwIkORrx5hZbHDfzdf/fHx8s/eCbiwFq4XRxV87rnJzhdjZMhvNscINTKd+UC/qR
	6nSxV6pkh2McNlHnDnq7z4X22PwiNrnINuo/k9vwx+1S4MnAb3pBPpZsNzTYzNc004GwioF7NfvHN
	krguSL5XGq7ku7hnYQ4/W4w92lXHb9fQxIFGYmMFEnrugsG34WHBDFZfOygiEn3c7iBc1mSGMVe1q
	Twqp83K/8HwDPVfYkuSB1rOuG9CFVZtcsBTg==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1vWURV-00BEZp-29;
	Fri, 19 Dec 2025 14:58:26 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 19 Dec 2025 14:58:25 +0800
Date: Fri, 19 Dec 2025 14:58:25 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Corentin Labbe <clabbe.montjoie@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH][next] crypto: sun8i-ss - Avoid
 -Wflex-array-member-not-at-end warning
Message-ID: <aUT3keNXVOUw2lOg@gondor.apana.org.au>
References: <aSQhQh1xyp-zauPM@kspp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aSQhQh1xyp-zauPM@kspp>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_225835_708924_EB7D57B7 
X-CRM114-Status: GOOD (  13.11  )
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

On Mon, Nov 24, 2025 at 06:11:30PM +0900, Gustavo A. R. Silva wrote:
> -Wflex-array-member-not-at-end was introduced in GCC-14, and we are
> getting ready to enable it, globally.
> 
> Move the conflicting declaration to the end of the corresponding
> structure. Notice that `struct ahash_request` is a flexible structure,
> this is a structure that contains a flexible-array member.
> 
> With these changes fix the following warning:
> 
> drivers/crypto/allwinner/sun8i-ss/sun8i-ss.h:251:30: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
> 
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> ---
>  drivers/crypto/allwinner/sun8i-ss/sun8i-ss.h | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt


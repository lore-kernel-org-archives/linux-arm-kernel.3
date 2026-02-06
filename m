Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6152AEE2084
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Feb 2026 11:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4c3wICExOaH2Qt5JnJegplIbDc0MsM1CljlE6J+r8PY=; b=4anLHN+ObNVwRzGNmbDglgs1S2
	VKAOHn15D8uMMjYq7pfLxFct0m5L+Gvsd0zShT+hmck4jM8fLJH0XrUDioKNIGAbfowzmHtt2qp7Y
	TOS1sWI92TKn0bCT7zMs6Vcjf9VcDVUJuyOFDxd0jn/0NnK9SeF6dzv8KJjGD4oH8L8jx4yAf53hw
	LzY+QYVDZIsGTzc2JQVm1wyXP2mDuOtAJRe7asQxBcqU225e1FvJCOpx4oBNlIuQuV9TabP4KoK4h
	O5C9MrWzoOrySf6PAfxOsGXIvzQy2M/8qxxJIg+bZnNe6VIqdaIyk1sMQMjUGrfVNB7LQVJ27fPFb
	3qzfiWGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voJaU-0000000BD0k-2NG5;
	Fri, 06 Feb 2026 11:01:22 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voJaS-0000000BD0B-0cnE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Feb 2026 11:01:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=4c3wICExOaH2Qt5JnJegplIbDc0MsM1CljlE6J+r8PY=; 
	b=jqVDy2tTt/L2dqEpGRX9IreiRGhX8cW99zGcfbR5MLM8r84MeVt+a8y1PH5jl3NkkPaxwazerf6
	4ogZZlZ4Fa61HmMLkDpRgPpq48ZbLHFfQQfONYNzNfxICt+rwwmf09LM8XMd0+hgR0C+/di5BG72F
	bYelFn8WdY8LWdjitgDI33lx0PyYt3YyK8NAWw0QTDsIVqImZLGEVPXzORbLVYqn6kcbviefPLX4f
	69d9LhzojpqOLGH2CiIricwZcuB8A97P4XFU+8Mq+8j6VugHcb5BxnVsktdmmls0pchWItujFRBzf
	27G0Y0okM/C1pF9HyOSViQbY2nQPj9mEEmUg==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1voJaB-004zWi-2U;
	Fri, 06 Feb 2026 19:01:04 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 06 Feb 2026 19:01:03 +0800
Date: Fri, 6 Feb 2026 19:01:03 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Aleksander Jan Bajkowski <olek2@wp.pl>
Cc: davem@davemloft.net, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, linux-crypto@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] crypto: testmgr - Add test vectors for
 authenc(hmac(sha384),cbc(aes))
Message-ID: <aYXJ75641iRjG4MP@gondor.apana.org.au>
References: <20260131173902.3487-1-olek2@wp.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260131173902.3487-1-olek2@wp.pl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_030120_397592_41A0F2DF 
X-CRM114-Status: UNSURE (   9.74  )
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

On Sat, Jan 31, 2026 at 06:38:47PM +0100, Aleksander Jan Bajkowski wrote:
> Test vectors were generated starting from existing CBC(AES) test vectors
> (RFC3602, NIST SP800-38A) and adding HMAC(SHA384) computed with Python
> script. Then, the results were double-checked on Mediatek MT7981 (safexcel)
> and NXP P2020 (talitos). Both platforms pass self-tests.
> 
> Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
> ---
> v2:
>  - typo in commit name
> ---
>  crypto/testmgr.c |   7 ++
>  crypto/testmgr.h | 311 +++++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 318 insertions(+)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt


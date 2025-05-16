Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44077C3ABDD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 09:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fwVQkxbTeFhOSdLDVbu6fCe4TGHgEGD8K1leZrx35bY=; b=cvKs61FGDGzOAWspE2n+oPY0x4
	Jkxaudt9m7AdwNIUEfnK52mJKIqDXx/x5Ds9UNA7gV8DFnDd5KwBULdQkhM15W/5sFDdXNtTPlKoL
	rcvMOyqaBCKAe4qjUcN0ki5yT6FUv/QHBkb7f2wlcIuI1rV95Pk1KzCSkWhgQDbdM6odH+bDP3/Un
	L9LAK37f952giGbTlPM0gTGLEN0PRAc/UsWm8HW1VpHZXDq42vivv4rFSw/LGSyuly6UTHSoSgPEv
	Hbxqdp1YNrRdxOWrcYqk/0xPZHb9vt6dW9o+ERbvrFFzqYIa/h/AFciz3o5Z5MIZL6nmDNeLezr+Y
	4l4lVuOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFrMk-00000002zaF-0eeU;
	Fri, 16 May 2025 09:28:30 +0000
Received: from abb.hmeau.com ([144.6.53.87])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFrKi-00000002zMP-21cY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 May 2025 09:26:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=fwVQkxbTeFhOSdLDVbu6fCe4TGHgEGD8K1leZrx35bY=; b=WnRVOUnYblDd0ZN1892po1YmE/
	enlU1zzOZj8wTZZDcseuXhiDdrL9bLTDZlGAY0/kQxtfXFOLwdxbtFTYiVzeyO0VFJMyENzS2Q0t+
	8QhEzX/s6xTy+uOsy1kuNEYG5jrgI7RdMwROSlf+Cv534oh0dv3IG8evRvWrH2QACBqB6CWniOfY1
	sP+j5oRgjfVN9SSEpRzhDtt4a9YHaVoKQWOuBmvOu5/Mqs4bXvdmVE6R02I/ZEAALsh4wqvoBJd7X
	YvwD5hmCJFvxmTI3nlpIJBZKyn/WcqCrG2xypZaTyOEhXccvFtLxUhknncert0xn9UjHH5wQrRGT7
	8lp65zPg==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1uFrKZ-006Y58-0b;
	Fri, 16 May 2025 17:26:16 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 16 May 2025 17:26:15 +0800
Date: Fri, 16 May 2025 17:26:15 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>, Eric Biggers <ebiggers@google.com>,
	linux-arm-kernel@lists.infradead.org,
	Fabio Estevam <festevam@denx.de>
Subject: Re: [PATCH] arm64: defconfig: Ensure CRYPTO_CHACHA20_NEON is selected
Message-ID: <aCcEtx0PWIphtW0i@gondor.apana.org.au>
References: <20250515151548.431853-1-festevam@gmail.com>
 <ece2df8d-acaa-4554-8c82-24ed45f3a8a4@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ece2df8d-acaa-4554-8c82-24ed45f3a8a4@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_022624_517030_254B93E1 
X-CRM114-Status: UNSURE (   9.63  )
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

On Thu, May 15, 2025 at 05:24:09PM +0200, Arnd Bergmann wrote:
>
> in case Herbert wants to pick this up as a fix for the crypto tree,
> or I can apply this through arm-soc if you send a copy to soc@lists.linux.dev.

Going through arm-soc should be fine.  I don't see any changes
in my tree that should create a non-trivial conflict with this.

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt


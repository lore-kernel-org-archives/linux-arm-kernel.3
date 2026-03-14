Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37F6B107BCEF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Mar 2026 04:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eoJtzYYgY9ROmVqLSa14oImeMikAFUZjBqozvLekkp4=; b=lWDE309bYAVC7Frvk8U3/trYQ/
	VJEN09UTfqlo2XIQRh0J4U4bhPFrpztEChXDfzfue8hsTsvy4RXag6g/k1pVHwBp5AjqS6VnNZ6uQ
	64GdONI8FrXW0Xo1cLU37o893OjYqnWX2qM1P+lSx8+qRtGXhLpx/HZRRLcC1L4/c77dXjRdXK77n
	T45ebBSjeZR0DeLGA/U1pZYD6Ae8iV2PpJJzNXckBhl1nH08NwUTcx03FsVFXIPNGoeWvuoCauhh9
	StXG3KgVItK34x/Rizw3OSaXX9+vlkxo4gJbSycbNWxoASlu6/ah5YjWsLasfS9B4mgZ1JERA95Xr
	plYBGlvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1Gut-00000001UbJ-2on1;
	Sat, 14 Mar 2026 04:47:59 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1Guq-00000001UaY-3WGW
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Mar 2026 04:47:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=eoJtzYYgY9ROmVqLSa14oImeMikAFUZjBqozvLekkp4=; 
	b=sgGlgfu80E9Jj7lsC4CJQDWV6R+z7gOOFt15wVRHjbzGaPlWhhOJhflKvyPIFnondLh9UNaR7np
	E33oUujwnMIohz/fPKoozRCkUq/XcNGyEtacrTL/+f0GC2QFh1xw3rUgogEzzp4ytCJ5sMjzwGips
	0cJif27HDNgPcts+JxUfUNCvYGiUI9+GgDOYwo2MxZXyDnJzdkqSlM6Z1gV3DF4694lGrdESNnfTi
	kRkfabbiq5azJEY1qYRF9FElPAmcZtnz+v3O/4da7rLAf2wy9fewTu59Mo032BvJ3DRa289dExIgt
	BRO8QT+nRFuJInRKtMav/8KDR80An4M7RazQ==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1w1GuY-00EKsT-1L;
	Sat, 14 Mar 2026 12:47:39 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sat, 14 Mar 2026 13:47:38 +0900
Date: Sat, 14 Mar 2026 13:47:38 +0900
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Aleksander Jan Bajkowski <olek2@wp.pl>
Cc: davem@davemloft.net, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, linux-crypto@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] crypto: testmgr - Add test vectors for
 authenc(hmac(md5),cbc(aes))
Message-ID: <abToanZh-mkEjmJ-@gondor.apana.org.au>
References: <20260303184916.69132-1-olek2@wp.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260303184916.69132-1-olek2@wp.pl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_214756_910227_98ECAAB2 
X-CRM114-Status: UNSURE (   9.85  )
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

On Tue, Mar 03, 2026 at 07:48:44PM +0100, Aleksander Jan Bajkowski wrote:
> Test vectors were generated starting from existing CBC(AES) test vectors
> (RFC3602, NIST SP800-38A) and adding HMAC(MD5) computed with Python
> script. Then, the results were double-checked on Mediatek MT7981 (safexcel)
> and NXP P2020 (talitos). Both platforms pass self-tests.
> 
> Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
> ---
> v4:
> - rename aes-generic -> aes-lib
> v3:
> - correct sha384 -> md5 in description
> v2:
> - rebase and resolve conflicts
> ---
>  crypto/testmgr.c |   7 ++
>  crypto/testmgr.h | 255 +++++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 262 insertions(+)

The previous patch has already been applied.  Please redo this
as an incremental patch.

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt


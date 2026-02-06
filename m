Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C014AEE2084
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Feb 2026 11:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kO1AGNsvdxqYmQaD/xccSvvXSgaUptV5c7qiHvmiuEY=; b=vZudy8otMfnGNgHXXe6lUbWigD
	AxcPwD0OwbX0/VDt6k8YtY7bJYftz5/8giH6j3GrGrfMk+ljrrGe5FqJV/MkwAahWUz5s1Af+2vk5
	15rQUSrsHg/UURDksC3y1DPWLPYamOi0MQv3YCMdqsHZdOKqq0uTf42vEK8yt8UmfvBkYuhEZyeX1
	z6qvVp4vBpSAtBS1fS4PBxkC5RcyjLj6V2dZphcopzOzxoBDKhCYHu1HUgXC6oP9MS4qK2nB82ENG
	ZHMHlg5cJ6RTA7f97AR1+zgR3ac43UDzxwQ0tDPax+m1nDZz4iy4osJi/jyhWd0LBwZpgMAGfrREY
	oFc2EF3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voJat-0000000BD3R-3jOd;
	Fri, 06 Feb 2026 11:01:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voJat-0000000BD3J-0phA
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 06 Feb 2026 11:01:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=kO1AGNsvdxqYmQaD/xccSvvXSgaUptV5c7qiHvmiuEY=; b=UFMCHTzJC27B0YMZymX5GAQZPI
	/n5Ir6/1KY3/j9gb8KeGhXBMUr9QqolTAV1FfjwZMFOL5xKk0mhAQ9iyAb/lfgblBJY6PhFDAixUm
	Vi5OSKSAoB2sZST1fSfFpcHzgCDUMaan+ScAxdJhGIQ3gQiFh5KniOi+L54bZdH/6FZJ79yyH0mDZ
	fCzkHSxJBx6kRDCNSVDjgLxUpX4eu4brjoLNCpY9+L0i8q36q4tBOrxa/wV0JGXqoAHzP96KN0J2h
	xvZCscTBvVqNqxDch97unTRxcsWMivqvDPPxvcWXQ6qoeawsvPAxpOtMLHsJoJG9ZJdnnu9RloHAv
	AT/no+uQ==;
Received: from abb.hmeau.com ([180.181.231.80])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voJam-00000003gH9-0h16
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Feb 2026 11:01:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=kO1AGNsvdxqYmQaD/xccSvvXSgaUptV5c7qiHvmiuEY=; 
	b=WCgCZ16hLztt7nzPGrL/KLwtDb2Fjq7cAgXGmSctobAE9SwTH+makLE4Zqh1Lvk550DZSe4bY3M
	8VVi0BBRs/TeGqhlGfqdEAUSypCinDMmYeEYJBhM/l2AVsV8BPgOPZIVmPOIziJK/ychsmiXcjsyy
	hcsK+T9SfWE2OxNbitSAwnW7rJ/t1PEZ2ZCDt6Z4+hfjuTbxn0ok+yApAmUFp5lO9hqb6COYS12AQ
	eCpjufUYFahOwxWHImUWOBODo0sSKCwRaSeFp83CQN6L1/He9fu3AmVJ5u8nKzBwcOc/vP+nFqTAK
	k3OHBBjl4tNEak9rhYGcyxQFAxEZ+SQ9oksQ==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1voJaJ-004zWo-1i;
	Fri, 06 Feb 2026 19:01:12 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 06 Feb 2026 19:01:11 +0800
Date: Fri, 6 Feb 2026 19:01:11 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Aleksander Jan Bajkowski <olek2@wp.pl>
Cc: davem@davemloft.net, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, linux-crypto@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] crypto: testmgr - Add test vectors for
 authenc(hmac(sha224),cbc(aes))
Message-ID: <aYXJ9-TZm6gq7ALj@gondor.apana.org.au>
References: <20260131174353.4053-1-olek2@wp.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260131174353.4053-1-olek2@wp.pl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_110141_943399_19D686C1 
X-CRM114-Status: UNSURE (   9.50  )
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

On Sat, Jan 31, 2026 at 06:43:03PM +0100, Aleksander Jan Bajkowski wrote:
> Test vectors were generated starting from existing CBC(AES) test vectors
> (RFC3602, NIST SP800-38A) and adding HMAC(SHA224) computed with Python
> script. Then, the results were double-checked on Mediatek MT7981 (safexcel)
> and NXP P2020 (talitos). Both platforms pass self-tests.
> 
> Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
> ---
> v2:
>  - typo in commit name
> ---
>  crypto/testmgr.c |   7 ++
>  crypto/testmgr.h | 285 +++++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 292 insertions(+)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt


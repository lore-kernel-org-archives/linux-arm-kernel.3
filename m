Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C177AEE208C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Feb 2026 11:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7Qs+AwZ9zxauz8Rcv+n7jI5jaPGvqs7lG0yDaBw8ddk=; b=zlXTs34WSgIOoQnV2GIBLRI6G7
	9k46pH9mtjMEN4jH60b0oUhmcqpxGDRuSeHGJVxJZRQXcoWMfKAr92XjFFFLOsaQjRmrLuoEoad4h
	8467oIFk3mVpzgmq3eRDdMm96XTFdEAp1p1CHcvFLgKvkfy3fQ2tLrGFZzqtC1a+z66J8kXKPyibb
	6JTIkCA2+vvQ+rHK5h9A9v01lBe9XhH73Iej8TF46Bs/PbKgOCLz2rlKzvPOdYRZMglPBGo5iVUjw
	eNnuCpEV9s7roFsmF3sQAn1/yrfV0EBAnETAvlWFF5tICuo5agFJjw8u/J2eneMwVOWtwlPnPG4MF
	CJhSYMqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voJb6-0000000BD5Z-0k97;
	Fri, 06 Feb 2026 11:02:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voJb4-0000000BD5E-41Wu
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 06 Feb 2026 11:01:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=7Qs+AwZ9zxauz8Rcv+n7jI5jaPGvqs7lG0yDaBw8ddk=; b=RipQAzWg3ViTN6AfeBia988XUx
	Ju+U4P8/Z96OWS7kGiEDzRd7l4r0GCJGDdAdgfBCTBTOrj9RT8gs4SKvTMUVONBbSxQpjc4pnWpXl
	GAN+JmHePxgKYK30zIMUbwgs9UmTyC4dQV/k3LkM/yYW4L7tHm7//7MCR5spdfJTUCxz1ZQbGXkA2
	sOW7p6XmQgVPUk+AZrswXidtIzc7rRnio+4y5o4UE7QNT99DS4hcNb2Iyje8Q96BTaZl2l23hYA39
	NBwPYlvP4teWz5WOo7huUGt2MlWC8NA+zSkUSPKzzfXloZXWyrwcX98Et9LS/MIYSF0pN8/x/dQJh
	8IIkriFA==;
Received: from abb.hmeau.com ([180.181.231.80])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voJb1-00000003gKY-1dMW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Feb 2026 11:01:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=7Qs+AwZ9zxauz8Rcv+n7jI5jaPGvqs7lG0yDaBw8ddk=; 
	b=cWlRz0UCbnwM1bppUsryC4j36u0/bqmCRGqKnRnEqfvzf0i0Zju35fq+4qbuI+u/coF9vHOtkML
	BFNtm5dtLWsUXGT6b6A/GmRsYABeRrf6jhJESDYSxqHHkfhoYBkG7+Q3BG1XPOALAy/eK0qYsIOco
	yP7a3ePZ2RIysxBswlE4Ok6CTKG0GN3z1nP9CYd5hhFjteYM6h257wsGNa/apDdueV964MqYfuEme
	SUpn986MWz/g6Ns/y8uFln/tppytdWHc5BmtShBLWggyZpHROKvl3LjPXPYlUXBA4JqTnDLbKP3YE
	Fp5e2YpnckVNYtj6TNndNEAhAjsQl/TKORpw==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1voJao-004zXC-2r;
	Fri, 06 Feb 2026 19:01:43 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 06 Feb 2026 19:01:42 +0800
Date: Fri, 6 Feb 2026 19:01:42 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Aleksander Jan Bajkowski <olek2@wp.pl>
Cc: davem@davemloft.net, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, linux-crypto@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] crypto: testmgr - Add test vectors for
 authenc(hmac(md5),cbc(des3_ede))
Message-ID: <aYXKFtmVJCCZpUVw@gondor.apana.org.au>
References: <20260201112834.3378-1-olek2@wp.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260201112834.3378-1-olek2@wp.pl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_110155_747401_8406611F 
X-CRM114-Status: GOOD (  10.42  )
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

On Sun, Feb 01, 2026 at 12:27:08PM +0100, Aleksander Jan Bajkowski wrote:
> Test vector was generated using a software implementation and then double
> checked using a hardware implementation on NXP P2020 (talitos). The
> encryption part is identical to authenc(hmac(sha1),cbc(des3_ede)),
> only HMAC is different.
> 
> Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
> ---
>  crypto/testmgr.c |  7 ++++++
>  crypto/testmgr.h | 59 ++++++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 66 insertions(+)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt


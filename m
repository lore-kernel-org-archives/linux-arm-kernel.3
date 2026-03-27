Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3098510ED640
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 10:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AzWhhK4eypW2x0fSnkzpK6RerezFsNCiDwe+T8oeXdU=; b=3qaYWLFtTxzVy267ENkc9/0cfa
	IbABvP86Q0CQI/4/qFsyR8nnH5no+qVfpUSisezFQL2rYfzrFxMQAxdmg4l3n5c1D3SbN2V3CF6vE
	/WTWB1MZF//fI3SKqDjv4vXjuWnPdvtKtaNH/au6vHWuijXKE5/EfMeR6BhldAa7SRLKhdz+n/Dy1
	xN0P0aeel6HuqpJOWf9nXs4GLk0KdDN+ict/4bq1vDq6ICmyUolvd4ArMZs07n/FpL9n0bBk7PJia
	WXkl5JkPbadwoBazrXvYdeTIPnfpyXkZAxRuOtc5mFdTal6nSxqsQsxlc+HjqI0Teq3k15/RG0HPO
	j03+vlKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w647M-0000000786n-2FVp;
	Fri, 27 Mar 2026 10:08:40 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w647K-00000007867-1rVn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 10:08:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=AzWhhK4eypW2x0fSnkzpK6RerezFsNCiDwe+T8oeXdU=; 
	b=H/afi3co8SjSAQvj7/xp1Gw0//RvM0gbu7N+aeSZfyH7Zc0wcsg79e0eSM33lHu2PQyn+SZfpeZ
	uzYPVVKCx2B9ZbsQ2juVUZpR2XUtkE4AMmIq6FCduRKwS+8ZjTb9PI9QXDVoWS0dLqWc8CPpL/MwN
	O1wSv9U9L5stxIFFn/JprphFPxgWpGi7Up2oOvdvJgC5KZy90/nt9sxyD25u3TnrXdAXm8eke2up8
	JZsfMzmiHUMbzGikFyJu4CJ2sRuQgsFUmsG8LVNWly3lqNt2q13twYd+AdfdyA4KEXFWEw0ez5qwT
	dF3YpvTydz0/zlEQHxpj0a1TnQVtVn8l0JKQ==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1w63hQ-001bnv-1f;
	Fri, 27 Mar 2026 18:08:12 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 27 Mar 2026 19:08:11 +0900
Date: Fri, 27 Mar 2026 19:08:11 +0900
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Aleksander Jan Bajkowski <olek2@wp.pl>
Cc: davem@davemloft.net, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, linux-crypto@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] crypto: testmgr - Add test vectors for
 authenc(hmac(md5),rfc3686(ctr(aes)))
Message-ID: <acZXC_Sj_54PLIQs@gondor.apana.org.au>
References: <20260319171128.10566-1-olek2@wp.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260319171128.10566-1-olek2@wp.pl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_030838_480789_5A70E667 
X-CRM114-Status: UNSURE (   9.05  )
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

On Thu, Mar 19, 2026 at 06:11:21PM +0100, Aleksander Jan Bajkowski wrote:
> Test vectors were generated starting from existing RFC3686(CTR(AES)) test
> vectors and adding HMAC(MD5) computed with software implementation.
> Then, the results were double-checked on Mediatek MT7986 (safexcel).
> Platform pass self-tests.
> 
> Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
> ---
>  crypto/testmgr.c |   7 ++
>  crypto/testmgr.h | 207 +++++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 214 insertions(+)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt


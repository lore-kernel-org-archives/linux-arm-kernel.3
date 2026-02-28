Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7314DFEE4D3
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Feb 2026 08:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=abaIb10iDB6NF7tAQUd32QGleOqS2dd0O5vuEuVPE0w=; b=iTgEWqm49MKyKVQ4EAIwDsXG++
	SDduCw6YISCeDdjZKj2daiJqypCAis2fIDgGaX8yGzctGa27qH9cxyyyTEGQmi+q86f8XwRsvr7cB
	RZjmI7tdww+kKtV4jXT/zRcIdnxOuz7vhrBNF43z/9jcm6mUrqyyDpJ4CipNIwF2PO4l4+46KfZyH
	Hto8cuGNNIjdViWdCJwwLr+3BDy9ohaYIFIF//NhhEvnMNm5yAmq413fVt2uZFvh+yYtqfrFD8I09
	3wZ8HE17li4bUjoBFMW1I2ARJSuWjU5LaOc7gdKh6tYTVnW0tIbxx49/i4/Sj46M+h6XyHhbJl9/Z
	lX/yh/Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwFvK-00000009f60-1ypc;
	Sat, 28 Feb 2026 08:43:42 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwFvI-00000009f5d-3A6j
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Feb 2026 08:43:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=abaIb10iDB6NF7tAQUd32QGleOqS2dd0O5vuEuVPE0w=; 
	b=c9HFGsthx6EFu8NYjq+6D+Z0OdybzWWpQZXudRKUen3uq86jbPdg1/7PLhSGaSLsjRGBSdaDW4d
	2bZ+tNodpEqpRy2Yund1REAoHDaE6KoRu3ER+WvbhkvcKEJ3+lhelzrOyee1CMvfTPd3TlsE/lqP4
	C4Acv926SUtUI3/9FwPXfnNs8+njK8XYTuhZhMovv8xbs3qW0NUGRhXrCG9eHD0RdnkLOSRpCE/Zw
	pAmJi13TVtBECQ6nB54+HI7N9TktoYTRmBJYjXsd9DmNthitmi+KEKxuikBLoB99FX7YU+trOfwnS
	gBVJWd5lwM/KB0kPysYR9wxMhXuJLAhtJIww==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1vwFv3-00ADmk-0n;
	Sat, 28 Feb 2026 16:43:26 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sat, 28 Feb 2026 17:43:25 +0900
Date: Sat, 28 Feb 2026 17:43:25 +0900
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Aleksander Jan Bajkowski <olek2@wp.pl>
Cc: davem@davemloft.net, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, linux-crypto@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] crypto: testmgr - Add test vectors for
 authenc(hmac(md5),cbc(des))
Message-ID: <aaKqrWujFR27Ss3d@gondor.apana.org.au>
References: <20260207145113.375192-1-olek2@wp.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260207145113.375192-1-olek2@wp.pl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260228_004340_790237_F36DC2E0 
X-CRM114-Status: UNSURE (   9.58  )
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

On Sat, Feb 07, 2026 at 03:51:03PM +0100, Aleksander Jan Bajkowski wrote:
> Test vector was generated using a software implementation and then double
> checked on Mediatek MT7981 (safexcel) and NXP P2020 (talitos). Both
> platforms pass self-tests.
> 
> Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
> ---
>  crypto/testmgr.c |  7 ++++++
>  crypto/testmgr.h | 57 ++++++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 64 insertions(+)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt


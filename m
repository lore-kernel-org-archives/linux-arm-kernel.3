Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87DA9EE6B6F
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Feb 2026 01:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZP0q/N4Mv9/YFhWpAEXqYZ/5tMDPuAMQxDVCxLLtahA=; b=zrRvYhDsdKwK7yvTZc3QzIjuv6
	1QDDD/ftPpGjMIaPt1XBtJIcx6sXWGxR0fKOQco8ilVBMR6RHeCSDQpKgOqod8HE0uGxPRAx41K2i
	RY8mOQf5pCEoOWrvmb9F/AmSgupK0lcegQloMpnSf/Gk42eHaItu6nGLHidhIs5Y/b+khNwvv/FTF
	GAfcxMmMI0Veo7btk53dVRcSEgreDTbGuY/cJqQnQ2I1bnvsWebnoRpz/ZPHACxtCKZ+MtNQTYPJq
	/s1XZU1/cJiwNypLtL8a7Seh8XWinr/6e9SA6biwzAsKzx+wsVP0QW0b0fU3ZK3uSREejj7yyJccn
	E2JOhhbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voXCe-0000000C1Pp-03s8;
	Sat, 07 Feb 2026 01:33:40 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voXCa-0000000C1P6-3NNt
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Feb 2026 01:33:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=ZP0q/N4Mv9/YFhWpAEXqYZ/5tMDPuAMQxDVCxLLtahA=; 
	b=p7lxJoZ8nABuzGCYhDzD+n1dsvvbK1j2iCbx0SqWB2b0vbHpJSXopIgM1OGu0oCjJ3d8vTykhIp
	ecg1yN6ilbWsjkmaTkn9TuW51rR3R4inFr0kMp6c9kR9LWFW6TZyx7Qf3vxSYkLAmlF5t54BPo6Gc
	BG4g9Qyk2bSiGK72c5TbHfljUbOswSrYdyXCX6ZG5sjtjfd41AycIi/KY/nAcfPtYmZmGez3/dKHA
	oYsNQ8B6vc5BFkt0mpTjjNPkJ9pMFC8re5A/WVw2aP/abhy08iOQbDyCro3kjvT6np4GIYWY8VhRL
	P//eABMNc1MQv+ElULnIYCkvxGlAc1HJI/xQ==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1voXCF-005AtF-2W;
	Sat, 07 Feb 2026 09:33:16 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sat, 07 Feb 2026 09:33:15 +0800
Date: Sat, 7 Feb 2026 09:33:15 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Aleksander Jan Bajkowski <olek2@wp.pl>
Cc: davem@davemloft.net, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, linux-crypto@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] crypto: testmgr - Add test vectors for
 authenc(hmac(md5),cbc(des3_ede))
Message-ID: <aYaWWy2KSYz787a-@gondor.apana.org.au>
References: <20260201112834.3378-1-olek2@wp.pl>
 <aYXKFtmVJCCZpUVw@gondor.apana.org.au>
 <3622af67-b083-488a-998a-29b8657be73a@wp.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3622af67-b083-488a-998a-29b8657be73a@wp.pl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_173336_847070_465709C2 
X-CRM114-Status: UNSURE (   8.97  )
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

On Fri, Feb 06, 2026 at 08:40:18PM +0100, Aleksander Jan Bajkowski wrote:
>
> While resolving the conflict, the entry was added in the wrong place. As a
> result, the test manager complains about sorting:
> [    0.050891] testmgr: alg_test_descs entries in wrong order:
> 'authenc(hmac(md5),ecb(cipher_null))' before
> 'authenc(hmac(md5),cbc(des3_ede))'

Thanks for the heads up.  I've just pushed out a fix, can you
please double-check?

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt


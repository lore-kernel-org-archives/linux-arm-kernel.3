Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 818E2CA5FBA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 10:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q42sMmac7vKYGCVFrMdhSVkWOijsRMSMvzwOYZNiU4g=; b=TwLOEpHZu0Jxq+hvEI21yNM9rH
	iZ6o5hhJlpsNTrgknLM8qOHof5AhdQAnqML1k+1fJ9zBWy/2VCl+pyeVYs/JnqCuL9AK63PL+w1FC
	l70C9/dlX3RZv4RWcVSaJs7wZnPht8cW5znJaRbUzs3h1vmZbVYAN7aF+MWDKztgjL+8PCo7QLyXH
	+pVfhk2AgyUXRAJaP/wjBpqNmWRNwnk+vdcuS1Xcn1hMmksDgNURidHLJqFrFXxZWgTii73luau+v
	DaYVwhMFXmPxaMTI5SnTLcy824X1KvAf/CJqropM1f8RV2LbVeEZXhDsL7KXjkrzrI/aUx+ZOO/hO
	E7XIsFOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBri8-00000005mB6-0x0L;
	Wed, 30 Sep 2026 10:38:52 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBri7-00000005mAw-1Mmc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 10:38:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0DA2B40E19;
	Wed, 30 Sep 2026 10:38:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B1551F000FF;
	Wed, 30 Sep 2026 10:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790764730;
	bh=Q42sMmac7vKYGCVFrMdhSVkWOijsRMSMvzwOYZNiU4g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Iyj8/IOthcCiozVPuAmYxSU+qxe9W3l7Rnu2ibWzZySm0kt6WYVvXmGGRZJn/mxSk
	 2Uj3+6OOvaA/FpyxtiBudhFjCbFkOuL5/2/7nVCaBFei/pJ553tE6EQ7tNX+xnr05f
	 uwrzIkdTn4tvZHbrmM4k6bS1nJuvfNygSm7j5IMNdRYH2j8UMwj+Z6eOdaFTbJCgiy
	 7fYP6qGK9og+2MXyk8PSjx2rvyergNkpOZ86+dPZ8FuCRfI+eXw9ns4JOw4a+fcrKN
	 LyUtKtJR6ZFs/bOHMR9DuWiK77xEQKrLNahF87S4noE0xE7jFTJyHdlOjhVJs5H73O
	 x1INh5aIyGlxg==
Date: Wed, 30 Sep 2026 12:38:47 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sue Wang <suwangquanta@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	joel@jms.id.au, andrew@codeconstruct.com.au, ryan_chen@aspeedtech.com, 
	billy_tsai@aspeedtech.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, patrick@stwcx.xyz, 
	Steward.Shih@quantatw.com, Martin.Peng@quantatw.com, Fred.Zhang@quantatw.com, 
	p.k.lee@quantatw.com
Subject: Re: [PATCH v14 1/2] dt-bindings: arm: aspeed: add Meta Ventura board
Message-ID: <20260930-curious-narwhal-of-calibration-62442d@quoll>
References: <20260929075106.74731-1-suwangquanta@gmail.com>
 <20260929075106.74731-2-suwangquanta@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260929075106.74731-2-suwangquanta@gmail.com>
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

On Tue, Sep 29, 2026 at 03:51:05PM +0800, Sue Wang wrote:
> Document the new compatibles used on Meta Ventura.
> 
> Signed-off-by: Sue Wang <suwangquanta@gmail.com>

Please respect our time. Actually other contributors time as well.

<form letter>
This is a friendly reminder during the review process.

It looks like you received a tag and forgot to add it.

If you do not know the process, here is a short explanation:
Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions of patchset, under or above your Signed-off-by tag, unless
patch changed significantly (e.g. new properties added to the DT
bindings). Tag is "received", when provided in a message replied to you
on the mailing list. Tools like b4 can help here. However, there's no
need to repost patches *only* to add the tags. The upstream maintainer
will do that for tags received on the version they apply.

Please read:
https://elixir.bootlin.com/linux/v6.12-rc3/source/Documentation/process/submitting-patches.rst#L577

If a tag was not added on purpose, please state in the patch changelog
or cover letter why and what changed.
</form letter>

Best regards,
Krzysztof



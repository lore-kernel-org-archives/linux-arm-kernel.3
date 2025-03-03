Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ACB4C282D2
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 16:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=seEoy9RCdjq5gQ6u5K7vAkwJraDrjevBUwdT9habU9w=; b=XJ2gFxShSAIiHx3qkjK3iJR4OX
	lspktEDIq6T6Bp98Z46B99we7zFZNUlPnsskYLKGgCHdUhh1+uPCgoMvR43q6e79wWC9LA8ag42z0
	5O+R6VOAmtC5/hg+Ijw2U/YHKUlA0lQ7fJ+wLhkMOAxrnkpRyfGMycvIKBm9iJYt/piWn4hXkP2D/
	jmpLbM4XG7x8oDddHNNc35h6LaIk8OhoLnhiOZxK+kh129iK8wSUBBLJtA9WyVgUDYyw9fF76+Pbk
	SNB6wzpXpNpU1FBhLAJ6dGVtaCwkY5uKQSfImXQdAcbOfYx1aXwwspeOgN7Nc9Hd6/H0VVFk9kUch
	KOs+Pl4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp8PW-00000001SRE-0WtS;
	Mon, 03 Mar 2025 16:12:54 +0000
Received: from out-170.mta0.migadu.com ([2001:41d0:1004:224b::aa])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp7x0-00000001MoO-498P
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 15:43:29 +0000
Date: Mon, 3 Mar 2025 10:43:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
	s=key1; t=1741016601;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=seEoy9RCdjq5gQ6u5K7vAkwJraDrjevBUwdT9habU9w=;
	b=C9b4AFVy0sa2gaLc+VViC/urt5RncL82pVN2bUddo2Pm6GmNm4k4zSL16v11jS8d/6fOC7
	g55aOKjHpoR8yR0NKmwOybhsR48aj94GXLU7qzRoiwMK2sRNdHhvG5AxAsOB9yX0vCrgvo
	e6M4l0C4OSF4zy1I47k/DZExaosFGhcgJs43l5o0fPCsxL7yhdL5uTb/6jLYAwgvbJXJew
	Mok98SgC+aDRdCTh39oIFM7AvwQAw18oXitpelTLxByxDJ87KXkDjzb9MuC45ZFOTFuPF8
	NwBh2rSERnx4gzBOMcaQVwU4BCpP4mAwgED3X/seOjMbPaQOMSje6997bOz3KQ==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: Neal Gompa <neal@gompa.dev>
Cc: asahi@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>
Subject: Re: [PATCH] MAINTAINERS: Add myself (Neal Gompa) as a reviewer for
 ARM Apple support
Message-ID: <Z8XOFTclPeZwBKld@blossom>
References: <20250303154012.1417088-1-neal@gompa.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250303154012.1417088-1-neal@gompa.dev>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_074327_621699_459156B0 
X-CRM114-Status: GOOD (  15.53  )
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

Acked-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>

Le Mon , Mar 03, 2025 at 10:40:10AM -0500, Neal Gompa a écrit :
> As a member of the Asahi Linux project, I (Neal) have been involved in
> reviewing the patches downstream as part of enabling the Fedora Asahi Remix
> distribution for years and have recently been reviewing patches for upstream
> submission as well.
> 
> This formalizes my role as a reviewer for ARM Apple system support patches.
> 
> Signed-off-by: Neal Gompa <neal@gompa.dev>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 8e0736dc2ee0..052e6e997817 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2212,6 +2212,7 @@ ARM/APPLE MACHINE SUPPORT
>  M:	Sven Peter <sven@svenpeter.dev>
>  M:	Janne Grunau <j@jannau.net>
>  R:	Alyssa Rosenzweig <alyssa@rosenzweig.io>
> +R:	Neal Gompa <neal@gompa.dev>
>  L:	asahi@lists.linux.dev
>  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>  S:	Maintained
> -- 
> 2.48.1
> 


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDD13C88E4D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 19:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/psdj2YLMEmdCz9D5VhRewqtuEdv9ATvtmsLuk3XzfI=; b=ITe9j0b81GE3TvkWrAzQQNo+w7
	LZlO4w0ZeCZxXLcecWa+fg3b8Q03SfGc1x77cRuoTcwJq10+GzbdYzTqyXRPh7VTYCjb+bpW3TJJ0
	ahJpRsvMWoaH/ysc4gKzQ2VLcReU5KYximRvTh1wF/q1p7jeDqxbgKXg5tMrJGtv4kTCX+/gL5tZn
	/Uv2mrTp9XR7WF7brPIS+2EBL79VzqfWaI5tadKds91H+a2AOJwM58KOxjazN2eorvLnAwg6edEU3
	GhUdxeKEUQWYnRQoFiQzCJ1nrYeFyxTguUwQvPz0fg273tX7gA+movh8ao2m1cNvp9EOkdkck94ui
	pYdv7JEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x576E-0000000HazM-2ZsB;
	Fri, 11 Sep 2026 19:39:50 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x576D-0000000Hayb-0wIF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 19:39:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CC930404B7;
	Fri, 11 Sep 2026 19:39:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC5421F00898;
	Fri, 11 Sep 2026 19:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789155588;
	bh=/psdj2YLMEmdCz9D5VhRewqtuEdv9ATvtmsLuk3XzfI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=k9Ez1FpUvK4PGlaqmgOmqVif2tzopAFjAYcoB7pajNhBwdstU1Z9owHylMahYXQ+z
	 ZG4M7ztSdXAV4hpI45PEQT9QcM7xv30jkZZMPlo8qHc4FPvHQAccBgxTCP+gghiad8
	 QRYIu68YXGTuTGjFw3qWcwnjx3nl2fhu2/iyG9QKpu2Qh+i/8cl/PV6XONNLmh7w5w
	 bFy967zuR8OD/rNEkMItJr6j1VzgLe3Of41NLWGfuxqPwQU+EDrtsieVRjhJ9B/tJ9
	 go/TwmbvgH1b7ccxdgtT5YJNAVD3jUcizYQOS23kB2NxTJc3Pc9V5bru/0JjbEqAuq
	 eFINiLj0XXD6Q==
Date: Fri, 11 Sep 2026 12:39:44 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
To: Karl Mehltretter <kmehltretter@gmail.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, linux-arm-kernel@lists.infradead.org, 
    Tejas Mutalikdesai <tejasmutalikdesai@gmail.com>
Subject: Re: [PATCH] arm/xen: Point the comment at the YAML binding
In-Reply-To: <20260907012430.21823-1-kmehltretter@gmail.com>
Message-ID: <c71518ca-53e6-4ae2-d176-a1508a7e7156@kernel.org>
References: <20260907012430.21823-1-kmehltretter@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Mon, 7 Sep 2026, Karl Mehltretter wrote:
> The binding was converted by commit 4dbfe5467485 ("dt-bindings: arm:
> xen: Convert to DT schema"), so Documentation/devicetree/bindings/arm/
> xen.txt no longer exists.
> 
> Point the comment at the YAML schema.
> 
> Fixes: 4dbfe5467485 ("dt-bindings: arm: xen: Convert to DT schema")
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

> ---
>  arch/arm/xen/enlighten.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/xen/enlighten.c b/arch/arm/xen/enlighten.c
> index 25a0ce3b4584..0b7b7e3417e3 100644
> --- a/arch/arm/xen/enlighten.c
> +++ b/arch/arm/xen/enlighten.c
> @@ -251,7 +251,7 @@ static int __init fdt_find_hyper_node(unsigned long node, const char *uname,
>  }
>  
>  /*
> - * see Documentation/devicetree/bindings/arm/xen.txt for the
> + * see Documentation/devicetree/bindings/arm/xen.yaml for the
>   * documentation of the Xen Device Tree format.
>   */
>  void __init xen_early_init(void)
> -- 
> 2.53.0
> 


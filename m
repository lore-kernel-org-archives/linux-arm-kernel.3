Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22913C982DA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 09:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ln1d4qHa7vdCKllJbzJ0Cgy2Evr00KW99XLnmyu9AZQ=; b=JhI2e83QkRyGlqXVEIsa1a0+yS
	GT2Pm9GWTmEXZ7smjZhH+cooLxGiHj2yyHDKRXPipzOzexqAIosuGqTe4c76mp5y0RCBj7bukonBk
	awif1IfDyynHC8UdPFtBd+hHiM78Xkt2+MKIdP6epXw/Foz1Mq2Hz6+aJwIqL9cOEwNrUQVW/yGYe
	hZWRG5/rcOZyr9olxmZo9ibqQrhToyw/X9lg6YKQ5nfMn6E9oxnCZ7+dNPdGWr5hn/yoPNJtAdf4c
	f/lYtZij7oliyDqRLlKFatETbho4nL9N8nQFNDb+ck2Ft6WCOfQMV3iW/8LI6CtVR7ShSQGQ58613
	8HG0HFPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7VMs-0000000E1Nh-3bKc;
	Fri, 18 Sep 2026 09:58:54 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7VMr-0000000E1NJ-3KjH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 09:58:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E914460A59;
	Fri, 18 Sep 2026 09:58:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB91C1F000FF;
	Fri, 18 Sep 2026 09:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789725532;
	bh=Ln1d4qHa7vdCKllJbzJ0Cgy2Evr00KW99XLnmyu9AZQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lzQGaa2wc7pzdKv4ZpCrAfV29vqmfnYgdzyKRSmxaEI3AfqMIfSFutWS+AZPvkSF2
	 GdevVH2V8K7hWaHcSqJB0R8WJs5Xz5mW5ttf0/Id00JR1Y+uo2I6kHaw8Y2J7I2y1i
	 iapc6g9TCJqF+xSdzEicL/Hw13gqjY7TtT7pd5JqiM4rOIW7P0qrlFGm5eiLghqT4b
	 Ov3UNovPiZ9GJgafv3w0tWTH+TU0jwaLigTapVYn4gGe4Yv23+pqZQFo6ci5xQgJvQ
	 MUTb1pXh7zwXzsXY9YgTTr/+tqPq8nZBjFh5YelJfm4W9gKq8N5yRl1AF1ZdM5rzgP
	 rG2Hz2OWtvtxA==
Date: Fri, 18 Sep 2026 11:58:48 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Selvarasu Ganesan <selvarasu.g@samsung.com>
Cc: peter.griffin@linaro.org, alim.akhtar@samsung.com, 
	gregkh@linuxfoundation.org, robh@kernel.org, conor+dt@kernel.org, Thinh.Nguyen@synopsys.com, 
	mani@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, jh0801.jung@samsung.com, h10.kim@samsung.com, 
	dh10.jung@samsung.com, akash.m5@samsung.com, hongpooh.kim@samsung.com, 
	eomji.oh@samsung.com, shijie.cai@samsung.com, muhammed.ali@samsung.com, 
	thiagu.r@samsung.com
Subject: Re: [PATCH v2 1/3] MAINTAINERS: add Samsung USB DT binding to
 ARM/SAMSUNG entry
Message-ID: <20260918-eminent-wooden-shark-97b8be@quoll>
References: <20260916122229.2604003-1-selvarasu.g@samsung.com>
 <CGME20260916122351epcas5p37666f1232d3b2bcc1d02a96ab0df4142@epcas5p3.samsung.com>
 <20260916122229.2604003-2-selvarasu.g@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260916122229.2604003-2-selvarasu.g@samsung.com>
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

On Wed, Sep 16, 2026 at 05:52:27PM +0530, Selvarasu Ganesan wrote:
> Add the Samsung USB devicetree binding file path under the existing
> ARM/Samsung SoC maintainership.
> 
> Signed-off-by: Selvarasu Ganesan <selvarasu.g@samsung.com>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index a53620839407..87a1ab24a375 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3576,6 +3576,7 @@ F:	Documentation/devicetree/bindings/arm/samsung/
>  F:	Documentation/devicetree/bindings/hwinfo/samsung,*
>  F:	Documentation/devicetree/bindings/power/pd-samsung.yaml
>  F:	Documentation/devicetree/bindings/soc/samsung/
> +F:	Documentation/devicetree/bindings/usb/samsung,*

I think this is not really needed. First of all, files will be covered
by N: pattern further in the entry. Second, patches for these should go
via USB, but listing here the directory could create impression that
Samsung SoC is responsible.

This one entry is harmless, but if adding this, then next time we got 15
more updates for each of Documentation/devicetree/bindings/*/samsung*
files. Is it worth?

Interested people can add themselves to the bindings maintainers entry,
that's always welcomed.

Best regards,
Krzysztof



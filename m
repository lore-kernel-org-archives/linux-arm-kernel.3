Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E3B5E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Dec 2024 13:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3ROgzWOM65CkVwsnNt6P0yaKK4f6cWyOanozWOQV8jI=; b=w5BuE9qtgYsuY6XQzpQEd6tzWI
	6aOkEEEFAL60qgYzfgV38AJ3zi5ItGae5uaVaPWkBe7S3H+gMu9EnTbMTch7I070ZwYRUSR+43jnv
	abXB+sP2ALVpETd96bb08PRPFUaB/AsxKYNO4coR+7WsnrTbAaN4L6SL41xxiKl/P1oJeldu5KUT7
	EQtcUVEEvsWn+EmgW8j+Be/04iqbm7PIoryyOaZ1VqP4E3RINVVxM78YWZGL54cDA34aXRSIg4Oxi
	L73ssp8t7zPOLKfgqiqcbZdTBI4rLxqRzpza8SYIo8q4ZyWHh3sagu75z7tyLryIuVjK0+roYVYlk
	auyQXgcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQRfr-0000000DstA-2Vxi;
	Wed, 25 Dec 2024 13:43:43 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQRef-0000000Dsnu-1oxJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Dec 2024 13:42:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 35EC1A404BD;
	Wed, 25 Dec 2024 13:40:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A38EDC4CECD;
	Wed, 25 Dec 2024 13:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735134147;
	bh=diPVJuFOZfEC5hwbZSqtnC+aaFP7mq4bIfPNYvQszhw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dnTkYuyUYYACrHtQwuv895ZdWmH7+YdKq7CkWdEJy7sJGbOtCjPuEm+RDsVPKGkZ5
	 wqkhP04mL0bLu88IPMgzF2eB2CHcIDFpju3+VPJQdtE3o42Goc0xKkKA+r+d0ra43K
	 Y9yOTFVn4bypjYadalImiqrmS0HLfNHIC8u3eM8qY4Rf6HQPwl1Qj9F3lkLsUkj0i5
	 VVC/AOWm013uAgS5k5LwDQ/wFjX+U7CytSFAWssILjvLD9wkoWZQ6a0KK9LUSJzhDk
	 hH0U3rSn/MYzHsg1QoiVFiC3/6Gendkr9pn4vwsSgk/t3UJx4uUVJUsyqG8KQHP4Gw
	 YX8u2HAVwxItg==
Date: Wed, 25 Dec 2024 15:42:15 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Russell King <linux@armlinux.org.uk>,
	David Hildenbrand <david@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH] arm/pgtable: Remove duplicate included header file
Message-ID: <Z2wLt6V1zwtGnJYk@kernel.org>
References: <20241225123037.444716-2-thorsten.blum@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241225123037.444716-2-thorsten.blum@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241225_054229_538817_47A13402 
X-CRM114-Status: GOOD (  16.88  )
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

On Wed, Dec 25, 2024 at 01:30:35PM +0100, Thorsten Blum wrote:
> The header file asm-generic/pgtable-nopud.h is included whether
> CONFIG_MMU is defined or not.
> 
> Include it only once before the #ifndef/#else/#endif preprocessor
> directives and remove the following make includecheck warning:
> 
>   asm-generic/pgtable-nopud.h is included more than once
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>

Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

> ---
>  arch/arm/include/asm/pgtable.h | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm/include/asm/pgtable.h b/arch/arm/include/asm/pgtable.h
> index be91e376df79..6b986ef6042f 100644
> --- a/arch/arm/include/asm/pgtable.h
> +++ b/arch/arm/include/asm/pgtable.h
> @@ -19,14 +19,13 @@ extern struct page *empty_zero_page;
>  #define ZERO_PAGE(vaddr)	(empty_zero_page)
>  #endif
>  
> -#ifndef CONFIG_MMU
> -
>  #include <asm-generic/pgtable-nopud.h>
> +
> +#ifndef CONFIG_MMU
>  #include <asm/pgtable-nommu.h>
>  
>  #else
>  
> -#include <asm-generic/pgtable-nopud.h>
>  #include <asm/page.h>
>  #include <asm/pgtable-hwdef.h>
>  
> -- 
> 2.47.1
> 

-- 
Sincerely yours,
Mike.


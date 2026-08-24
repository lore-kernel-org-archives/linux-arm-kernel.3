Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3763C5DF9C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 17:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Cc:To:From:Subject:
	References:In-Reply-To:Message-Id:MIME-Version:Content-Type:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sb19YqNCvHDPnmH6ryJdd+X4+F9dTKDQQXONQh6LBq8=; b=qrwyo+1XwGbMxJfxi4UEXDZHiK
	mqe2kpCD/Pq6lPxw4FQPM/hXQlnaWuAJCgLqVu5w9XnZaMvYqiHcq43VtGfJl7s9bijR2C0e448qv
	zMt1oopv0KA0trVIDk8aFlhM+pzfu2f5+wg5R5OR+1a0fUir1etmjGHVWWQafqlgV1QnDbCRjKgQu
	i36L+BNkzDfbjltCBY2yUHVLWya18nyVbsv4xYFIxPlepz7yHycPcwogH1O9L4hrPCOR+b8XU+GBN
	J/ovFRqyGUfN0gLg4xgU8Xx2JHyShMFOYwQFMaiLmtmWnxtjU7pnWUcWAeayZ+CQ3us+ydLaTLn7U
	Y9SHY0bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyY4E-0000000H6OI-1jBq;
	Mon, 24 Aug 2026 17:02:38 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyY49-0000000H6LF-0otr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 17:02:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DB1DA44057;
	Mon, 24 Aug 2026 17:02:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 478681F00A3D;
	Mon, 24 Aug 2026 17:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787590952;
	bh=sb19YqNCvHDPnmH6ryJdd+X4+F9dTKDQQXONQh6LBq8=;
	h=In-Reply-To:References:Subject:From:To:Cc:Date;
	b=hjp281esMOQl/VRkVAZ229TpQYamujcYyyzJ2Qu0HNzTx4zzP4v6yYeDeJQIYHb3o
	 CNoiWqbewm2buRJB71JwX79xm4JQhoBMFedpJ4YfhQyJuLD3pOlSC0kzWtPUuiQp6H
	 i7rfx7Yw9thOVTWCiW3Cde9jpp/q05EW7JJv22v5HC5IC8S0GVzeg5IxNDj6gNTx+I
	 fbYl2Azo0+kqG2PqVIfMrx7JRPNk1nms/URo8pZHfAHXVIoTXRTUdsP0t+RCTWeGJd
	 WhQXOcZafmYkrCnUsHcJPkSB0uFxfofpUMmJyveqh5liQR4vwcifSjGvbQRuz2EwqX
	 WI4dLXAYt2LKQ==
Content-Type: multipart/mixed; boundary="===============4419128066865244280=="
MIME-Version: 1.0
Message-Id: <4c2bee332eb4173076cebaff6988f2d2ee283d7c6fe43993e957335cdc319a6f@mail.kernel.org>
In-Reply-To: <20260824160523.3907021-2-usama.anjum@arm.com>
References: <20260824160523.3907021-2-usama.anjum@arm.com>
Subject: Re: [PATCH 1/7] arm64: uaccess: Add batched kernel nofault accessors
From: bot+bpf-ci@kernel.org
To: usama.anjum@arm.com,catalin.marinas@arm.com,will@kernel.org,mark.rutland@arm.com,ast@kernel.org,daniel@iogearbox.net,andrii@kernel.org,eddyz87@gmail.com,memxor@gmail.com,martin.lau@linux.dev,song@kernel.org,yonghong.song@linux.dev,jolsa@kernel.org,emil@etsalapatis.com,ihor.solodrai@linux.dev,akpm@linux-foundation.org,david@kernel.org,ljs@kernel.org,liam@infradead.org,vbabka@kernel.org,rppt@kernel.org,surenb@google.com,mhocko@suse.com,linux-arm-kernel@lists.infradead.org,linux-kernel@vger.kernel.org,bpf@vger.kernel.org,linux-mm@kvack.org
Cc: usama.anjum@arm.com,ast@kernel.org,andrii@kernel.org,daniel@iogearbox.net,martin.lau@kernel.org,eddyz87@gmail.com,yonghong.song@linux.dev,clm@meta.com,ihor.solodrai@linux.dev
Date: Mon, 24 Aug 2026 17:02:32 +0000 (UTC)
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

--===============4419128066865244280==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

> diff --git a/arch/arm64/include/asm/uaccess.h b/arch/arm64/include/asm/uaccess.h
> index 9f5bd9c69c24..1a14eb2a51dc 100644
> --- a/arch/arm64/include/asm/uaccess.h
> +++ b/arch/arm64/include/asm/uaccess.h
> @@ -270,28 +270,43 @@ do {									\
>  #define get_user	__get_user
>
>  /*
> - * We must not call into the scheduler between __mte_enable_tco_async() and
> - * __mte_disable_tco_async(). As `dst` and `src` may contain blocking
> - * functions, we must evaluate these outside of the critical section.
> + * Nofault load without TCO management for use inside a
> + * __begin/__end_kernel_nofault_bare() region.
>   */
> -#define __get_kernel_nofault(dst, src, type, err_label)			\
> +#define __get_kernel_nofault_bare(dst, src, type, err_label)		\
>  do {									\
>  	__typeof__(dst) __gkn_dst = (dst);				\
>  	__typeof__(src) __gkn_src = (src);				\
>  	do { 								\
>  		__label__ __gkn_label;					\
> -									\
> -		__mte_enable_tco_async();				\
>  		__raw_get_mem("ldr", *((type *)(__gkn_dst)),		\
>  		      (__force type *)(__gkn_src), __gkn_label, K);	\
> -		__mte_disable_tco_async();				\
>  		break;							\
>  	__gkn_label:							\
> -		__mte_disable_tco_async();				\
>  		goto err_label;						\
>  	} while (0);							\
>  } while (0)
>
>  /*
> + * We must not call into the scheduler between __mte_enable_tco_async() and
> + * __mte_disable_tco_async(). As dst and src may contain blocking functions,
> + * evaluate them before overriding TCO.
> + */
> +#define __get_kernel_nofault(dst, src, type, err_label)			\
> +do {									\
> +	__label__ __gkn_tco_err;					\
> +	__typeof__(dst) __gkn_tco_dst = (dst);				\
> +	__typeof__(src) __gkn_tco_src = (src);				\
> +	__mte_enable_tco_async();					\
> +	__get_kernel_nofault_bare(__gkn_tco_dst, __gkn_tco_src, type,	\
> +				     __gkn_tco_err);			\
> +	__mte_disable_tco_async();					\
> +	break;								\
> +__gkn_tco_err:								\
> +	__mte_disable_tco_async();					\
> +	goto err_label;							\
> +} while (0)

This isn't a bug, but the get and put variants now carry the same rule
in two different wordings - would it read better to keep the two
comments identical, or to have the put side just point at the get side?

The comment above __get_kernel_nofault says "As dst and src may contain
blocking functions, evaluate them before overriding TCO," while the
comment above __put_kernel_nofault keeps the original "As `dst` and
`src` may contain blocking functions, we must evaluate these outside of
the critical section" - including the backticks that the get variant
dropped.

Also, should the wrapped argument line up under the open paren here
(four tabs plus two spaces rather than five)?

> +	__get_kernel_nofault_bare(__gkn_tco_dst, __gkn_tco_src, type,	\
> +				     __gkn_tco_err);			\

The continuation line sits at column 37, while the open parenthesis of
__get_kernel_nofault_bare( sits at column 34. The same three-column
offset appears in __put_kernel_nofault at line 412.

[ ... ]

> @@ -366,28 +381,48 @@ do {									\
>
>  #define put_user	__put_user
>
> -/*
> - * We must not call into the scheduler between __mte_enable_tco_async() and
> - * __mte_disable_tco_async(). As `dst` and `src` may contain blocking
> - * functions, we must evaluate these outside of the critical section.
> - */
> -#define __put_kernel_nofault(dst, src, type, err_label)			\
> +/* Nofault store without TCO management; see __get_kernel_nofault_bare. */
> +#define __put_kernel_nofault_bare(dst, src, type, err_label)		\
>  do {									\
>  	__typeof__(dst) __pkn_dst = (dst);				\
>  	__typeof__(src) __pkn_src = (src);				\
>  									\
>  	do {								\
>  		__label__ __pkn_err;					\
> -		__mte_enable_tco_async();				\
>  		__raw_put_mem("str", *((type *)(__pkn_src)),		\
>  			      (__force type *)(__pkn_dst), __pkn_err, K);	\
> -		__mte_disable_tco_async();				\
>  		break;							\
>  	__pkn_err:							\
> -		__mte_disable_tco_async();				\
>  		goto err_label;						\
>  	} while (0);							\
> -} while(0)
> +} while (0)
> +
> +/*
> + * We must not call into the scheduler between __mte_enable_tco_async() and
> + * __mte_disable_tco_async(). As `dst` and `src` may contain blocking
> + * functions, we must evaluate these outside of the critical section.
> + */

[ ... ]


---
AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md

CI run summary: https://github.com/kernel-patches/bpf/actions/runs/32751368606
--===============4419128066865244280==--


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A0ADC3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 12:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c1U4rZGx6XERUK703NiiO7qOrMXmSyQcFqlgMieceks=; b=ZXld8m6xv8NeExcMe3DXfvx//V
	CSROgc2RkGG3fdkP9E0PIUB9tYmvOsA9SdaaGwaD4BgdX84npRRh1cipJ1EMtpunGyxrjU1tsUk+Z
	jSrF+Y2+KmX+T4Vsi7ibeyNur5cFjZAop6+fGkYv9g+9xgTrPYSQgvAxhOeUUf32XvgEZb6lOaX+x
	cWJT9GRB0vRQ3qn18/2/41eewHhWTqYN60CPWRofzqqwsPjz8ZhOh2/0afGu0HVUIlolzbrz9pHRn
	dd6yeqg6IB8RlhVFou9gCnt6S6VI37+EgbSsBCztFGVoJnWPGmLdbUB7hYzsVXXnW6dS1uQQSU9Wq
	O+3NftbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD0p4-00000000hHR-0vIS;
	Thu, 08 May 2025 12:57:58 +0000
Received: from mout-p-103.mailbox.org ([2001:67c:2050:0:465::103])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD0n6-00000000h1A-23fV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 12:55:57 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4ZtXDl0rVQz9tH2;
	Thu,  8 May 2025 14:55:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pankajraghav.com;
	s=MBO0001; t=1746708951;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=c1U4rZGx6XERUK703NiiO7qOrMXmSyQcFqlgMieceks=;
	b=bjRVISLBtHX5DfYSngZXkcLernXd84uYnUhhfzmlqWxXU9ogXS+VA1nVBWV9C1OFAPhqrl
	DQwRHux+nTpoGHBRb/gwfeWNh70+kMhrQWYrv79phGNmIEqQXGFC49a2bgJPAHmLhdkwxt
	ZFp+s7KYFMcqqnWUY3eI9hBea5SP0YjYFVmEo5lpFa4k3vI9fvdUMGMfwOoBrm+8Sqls4s
	Qcc8j5qQPJHtt1XCPgM7RJ3+7TRvmqeAX2koZA923N0GkgcrDXU5tBajcjK6B2FKUpknB2
	fqW9+yH4BbWCpv7P1pegCvQqVTLRoXqbMzB7aHwj2DPWWBsYwRCLPJGemPmoVw==
Date: Thu, 8 May 2025 14:55:43 +0200
From: "Pankaj Raghav (Samsung)" <kernel@pankajraghav.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, David Hildenbrand <david@redhat.com>, 
	Dave Chinner <david@fromorbit.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Kalesh Singh <kaleshsingh@google.com>, Zi Yan <ziy@nvidia.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-mm@kvack.org
Subject: Re: [RFC PATCH v4 1/5] mm/readahead: Honour new_order in
 page_cache_ra_order()
Message-ID: <nepi5e74wtghvr6a6n26rdgqaa7tzitylyoamfnzoqu6s5gq4h@zqtve2irigd6>
References: <20250430145920.3748738-1-ryan.roberts@arm.com>
 <20250430145920.3748738-2-ryan.roberts@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250430145920.3748738-2-ryan.roberts@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_055556_681024_5E343466 
X-CRM114-Status: GOOD (  18.53  )
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

Hey Ryan,

On Wed, Apr 30, 2025 at 03:59:14PM +0100, Ryan Roberts wrote:
> FOLIO  0x0001a000  0x0001b000       4096       26       27      1      0
> FOLIO  0x0001b000  0x0001c000       4096       27       28      1      0
> FOLIO  0x0001c000  0x0001d000       4096       28       29      1      0
> FOLIO  0x0001d000  0x0001e000       4096       29       30      1      0
> FOLIO  0x0001e000  0x0001f000       4096       30       31      1      0
> FOLIO  0x0001f000  0x00020000       4096       31       32      1      0
> FOLIO  0x00020000  0x00024000      16384       32       36      4      2
> FOLIO  0x00024000  0x00028000      16384       36       40      4      2
> FOLIO  0x00028000  0x0002c000      16384       40       44      4      2
> FOLIO  0x0002c000  0x00030000      16384       44       48      4      2
> ...
> 
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
> ---
>  mm/readahead.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/mm/readahead.c b/mm/readahead.c
> index 6a4e96b69702..8bb316f5a842 100644
> --- a/mm/readahead.c
> +++ b/mm/readahead.c
> @@ -479,9 +479,6 @@ void page_cache_ra_order(struct readahead_control *ractl,
>  

So we always had a fallback to do_page_cache_ra() if the size of the
readahead is less than 4 pages (16k). I think this was there because we
were adding `2` to the new_order:

unsigned int min_ra_size = max(4, mapping_min_folio_nrpages(mapping));

/*
 * Fallback when size < min_nrpages as each folio should be
 * at least min_nrpages anyway.
 */
if (!mapping_large_folio_support(mapping) || ra->size < min_ra_size)
	goto fallback;

>  	limit = min(limit, index + ra->size - 1);
>  
> -	if (new_order < mapping_max_folio_order(mapping))
> -		new_order += 2;

Now that you have moved this, we could make the lhs of the max to be 2
(8k) instead of 4(16k).

- unsigned int min_ra_size = max(4, mapping_min_folio_nrpages(mapping));
+ unsigned int min_ra_size = max(2, mapping_min_folio_nrpages(mapping));

I think if we do that, we might ramp up to 8k sooner rather than jumping
from 4k to 16k directly?

> -
>  	new_order = min(mapping_max_folio_order(mapping), new_order);
>  	new_order = min_t(unsigned int, new_order, ilog2(ra->size));
>  	new_order = max(new_order, min_order);
> @@ -683,6 +680,7 @@ void page_cache_async_ra(struct readahead_control *ractl,
>  	ra->size = get_next_ra_size(ra, max_pages);
>  	ra->async_size = ra->size;
>  readit:
> +	order += 2;
>  	ractl->_index = ra->start;
>  	page_cache_ra_order(ractl, ra, order);
>  }
> -- 
> 2.43.0
> 

--
Pankaj


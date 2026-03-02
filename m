Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53308EA4E04
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 14:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e20/6fJlkkbGGqkegNkCGUvQxLP+2v3lqmRZXq2gU0M=; b=qpt69qNAgwnQYqhjNkRnfCEN0J
	duMtDZSk84uDVVEzJOhQOx5HYIb3KhN37z0B+6n1XJ4AN7+UkZWa1DUWJ2sPyQep5fCYF+Wc/HBbF
	AW1GBMapr7AlQ2MKBou1S32pFwNH5mo9s4KQWuqap96kfJaJvS09p8Atn7IuW0uOeMKjpEMS3aSGr
	JnjEldvU2+SN+lBZYvFFsaL/e/Srt5nkr+yoDJipEr+34bqtHmrirhKUde+Dxo0Z5DhcfXUpw0K0J
	ZTRlq0rdGLePvSMITE6PEnn/t6paxUbSwHS+J3R7VlkHIme+0C+ig8M9buef5j9jJK5CZWMCqLI+z
	iMZxzZig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx4cE-0000000DGab-20yO;
	Mon, 02 Mar 2026 14:51:22 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx4cC-0000000DGaF-1q1O
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 14:51:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 939C71477;
	Mon,  2 Mar 2026 06:51:12 -0800 (PST)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A9FF23F694;
	Mon,  2 Mar 2026 06:51:17 -0800 (PST)
Date: Mon, 2 Mar 2026 14:51:14 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Josh Law <hlcj1234567@gmail.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Josh Law <objecting@objecting.org>
Subject: Re: [PATCH 4/4] arm64: kernel: Fix style in io.c macro
Message-ID: <aaWj4uIIiv_kwsFo@J2N7QTR9R3>
References: <20260301003407.2493781-1-objecting@objecting.org>
 <20260301003407.2493781-4-objecting@objecting.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260301003407.2493781-4-objecting@objecting.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_065120_564986_ABFEF6EE 
X-CRM114-Status: GOOD (  14.87  )
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

On Sun, Mar 01, 2026 at 12:34:07AM +0000, Josh Law wrote:
> Signed-off-by: Josh Law <objecting@objecting.org>
> ---
>  arch/arm64/kernel/io.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/kernel/io.c b/arch/arm64/kernel/io.c
> index fe86ada23c7d..ce27fa5d2e37 100644
> --- a/arch/arm64/kernel/io.c
> +++ b/arch/arm64/kernel/io.c
> @@ -17,10 +17,10 @@
>  #define memcpy_toio_aligned(to, from, count, bits)                        \
>  	({                                                                \
>  		volatile u##bits __iomem *_to = to;                       \
> -		const u##bits *_from = from;                              \
> +		const u##bits * _from = from;                             \
>  		size_t _count = count;                                    \
> -		const u##bits *_end_from = _from + ALIGN_DOWN(_count, 8); \
> -                                                                          \
> +		const u##bits * _end_from = _from + ALIGN_DOWN(_count, 8);\
> +\

There is no style violation here. There's no need to add a space between
'*' and the variable name.

Mark.

>  		for (; _from < _end_from; _from += 8, _to += 8)           \
>  			__const_memcpy_toio_aligned##bits(_to, _from, 8); \
>  		if ((_count % 8) >= 4) {                                  \
> -- 
> 2.43.0
> 
> 


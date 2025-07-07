Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46AF6C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 17:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=plhscmn8unqBogHCLfe3zzhmsxB9tOjf382Kqk10WmM=; b=Ods/6rD1IJqQxQ9x1Zo52llKpO
	KUuqiOsnvWAbCKOxYFv56A2ZsJ1epR7CUdLY6npDJmKOu0rHKPU699gK+uvXbURrimwFMrEBKeQtf
	jOiLJbsXJroc24k3OCMoLbCIEWYjizLjHOk169ojsRJ0Uk4vX6tkvhMAz+Uh2ixoQvfEcCLsBEi/k
	SJP7KiT5M7ubcwuKIAmk9P6JfqeruXeJnGJYDnxLF6IriYL/xxpQTGRcMWvRQ5xUS272V7n9+unXP
	aVdZsbw4FYfo8I/HjAinRXFeCJPlTJyrT9b9TBoN7aYTpBz1m/6naQK/ldJ8aJyaFITM6ScnwVGDX
	XKjx3INw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYpKh-00000003802-0vbD;
	Mon, 07 Jul 2025 17:08:47 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYoXL-00000003099-11jJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 16:17:48 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-237e6963f63so21416665ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Jul 2025 09:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751905066; x=1752509866; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=plhscmn8unqBogHCLfe3zzhmsxB9tOjf382Kqk10WmM=;
        b=mxh93qigXMgxzVkrTxaPmLolgBYJTw1ExqDn+gCZf0p8HiRZBxCBmLrlSI7lrBoRC3
         ORf62EetYmztOVfRfuIvontqtAxnVhcMsBlPUsSpwxyT9lulZ2BwnGNNVHMc903aSr1C
         8wOm7v90U+qhoUpyPRwIdYDwxIYkCSQ6yZN1/iEq2N/4KbzmNfhSWSEmG2+w9NV2jw+f
         VHiSLAg+K2MgZJ8uJC7h3LWcw6K7Q0K8YFlZECm93Aa6jspU1nnwxOeebs4ghbXTikJp
         RTb2qvTo5HxggeLgUFMHPz3Hy5ktdhMxh2ACTwz0lyrrAYH4PPKyNmORQyxvJ1fKiz/S
         bLWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751905066; x=1752509866;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=plhscmn8unqBogHCLfe3zzhmsxB9tOjf382Kqk10WmM=;
        b=X9X7IXZPyEA7FmPmPH0wRELfOuJJEg8XFiu6VlGShdGsJXySFGtOTmaIN7YIfhl/Gr
         TESaV70ikFpdxpckYApvujRKrNAPSkhskbB7B+UNdWsz2+u5Fk2T3NunG/pv8+Tclljt
         2/iLiJBJD7tL1wHfyhRLp0IWn+wlUy6y68E1S96Jjq1vvOrJ60zAmu9jFHF/mRDD7aCt
         HHfk/opQTy6DoA7/7FFohbzMtpDomy8riLIdIZqDTuiM99GJPwXzFM096lSdp9tiGoLw
         O3h5cbBIUunFGw7EUFSjG4sczY3N9iImYysMAeL58UdhapomerCeK2OZWpc5ssDkRq27
         WERA==
X-Forwarded-Encrypted: i=1; AJvYcCVN5uVOYWARC+BMywypM7MWDcKz5quP+txwyjMnsP0Fck4nY5WlXb5xeElXjZtuTisMFyNvzYbw2PcEJFIHw7PH@lists.infradead.org
X-Gm-Message-State: AOJu0YygOaxjuPpoD6sQ7Trny7oGNDLKZnbytZIh0knUTM6nWc8U3fhU
	H+dLZSZYmZg5gA7+XtUJUV4i79FPAVjwqTpTNUF7ITLZlzkusXNHV10v
X-Gm-Gg: ASbGncvjWTkv+OBsXig6p3UuxksAXdy+jZVfAtFhLOs1lhASbppdw+21fqOJzJp2QpE
	XLAvelNszKM5gruBZDPon54GioAGwB/7IzPcFK3Zq+2c0JcpbNw4NLCGDvorL4a1yxqeUvAdOjd
	GCLymIYHlL0BDBlxPs9+I0xLGjbYg1U/0HDce7VeEzw4jQ1OsbnAZ/Djiu7ZfDbeiL4Qflza2hc
	P05u1lVahAbgirTVWCpXUmt7cmJyGVNwAWs/u0NVFys1MtXg0i5P5BRU7iClff8E3PTmkOZ8lxf
	0MWVASi0SHEQafxSoFL1u9W6nBcfC2PlrJGbb5rW0AhDMoxfdIFezCyLj1tHnQ==
X-Google-Smtp-Source: AGHT+IF1moARBkgm2lhQ9mBywi0r3o93XpJWFbU3tfKbOXZ3T+6OukiapWmLixUD8Kkr0uNvuebhpQ==
X-Received: by 2002:a17:903:b07:b0:234:948b:91c7 with SMTP id d9443c01a7336-23c875d2f93mr217129395ad.51.1751905065725;
        Mon, 07 Jul 2025 09:17:45 -0700 (PDT)
Received: from localhost ([216.228.127.130])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b38ee450a61sm9260195a12.8.2025.07.07.09.17.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 09:17:45 -0700 (PDT)
Date: Mon, 7 Jul 2025 12:17:42 -0400
From: Yury Norov <yury.norov@gmail.com>
To: mailhol.vincent@wanadoo.fr
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	Andi Shyti <andi.shyti@linux.intel.com>,
	David Laight <David.Laight@aculab.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 0/3] bits: Split asm and non-asm GENMASK*() and unify
 definitions
Message-ID: <aGvzHdDACM1Cw97f@yury>
References: <20250609-consolidate-genmask-v2-0-b8cce8107e49@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609-consolidate-genmask-v2-0-b8cce8107e49@wanadoo.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_091747_283435_E6740BDA 
X-CRM114-Status: GOOD (  27.29  )
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

On Mon, Jun 09, 2025 at 11:45:44AM +0900, Vincent Mailhol via B4 Relay wrote:
> This is a subset of below series:
> 
>   bits: Fixed-type GENMASK_U*() and BIT_U*()
>   Link: https://lore.kernel.org/r/20250308-fixed-type-genmasks-v6-0-f59315e73c29@wanadoo.fr
> 
> Yury suggested to split the above series in two steps:
> 
>   #1 Introduce the new fixed type GENMASK_U*() (already merged upstream)
>   #2 Consolidate the existing GENMASK*()
> 
> This new series is the resulting step #2 following the split.
> 
> And thus, this series consolidate all the non-asm GENMASK*() so that
> they now all depend on GENMASK_TYPE() which was introduced in step #1.
> 
> To do so, I had to split the definition of the asm and non-asm
> GENMASK(). I think this is controversial. So I initially implemented a
> first draft in which both the asm and non-asm version would rely on
> the same helper macro, i.e. adding this:
> 
>   #define __GENMASK_TYPE(t, w, h, l)		\
>   	(((t)~_ULL(0) << (l)) &			\
>   	 ((t)~_ULL(0) >> (w - 1 - (h))))
> 
> to uapi/bits.h. And then, the different GENMASK()s would look like
> this:
> 
>   #define __GENMASK(h, l) __GENMASK_TYPE(unsigned long, __BITS_PER_LONG, h, l)
> 
> and so on.
> 
> I implemented it, and the final result looked quite ugly. Not only do
> we need to manually provide the width each time, the biggest concern
> is that adding this to the uapi is asking for trouble. Who knows how
> people are going to use this? And once it is in the uapi, there is
> virtually no way back.
> 
> Adding to this, that macro can not even be generalised to u128
> integers, whereas after the split, it can.
> 
> And so, after implementing both, the asm seems way cleaner than the
> non-asm split and is, I think, the best compromise.
> 
> Aside from the split, the asm's GENMASK() and GENMASK_ULL() are left
> untouched. While there are some strong incentives to also simplify
> these as pointed by David Laight in this thread:
> 
>   https://lore.kernel.org/all/20250309102312.4ff08576@pumpkin/
> 
> this series deliberately limit its scope to the non-asm variants.
> 
> Here are the bloat-o-meter stats:
> 
>   $ ./scripts/bloat-o-meter vmlinux_before.o vmlinux_after.o
>   add/remove: 0/0 grow/shrink: 4/2 up/down: 5/-9 (-4)
>   Function                                     old     new   delta
>   intel_psr_invalidate                         352     354      +2
>   mst_stream_compute_config                   1589    1590      +1
>   intel_psr_flush                              707     708      +1
>   intel_dp_compute_link_config                1338    1339      +1
>   intel_drrs_activate                          398     395      -3
>   cfg80211_inform_bss_data                    5137    5131      -6
>   Total: Before=23333846, After=23333842, chg -0.00%
> 
> (done with GCC 12.4.1 on an x86_64 defconfig)

So, I'm still concerned about that split for C and asm implementations.
But seemingly nobody else does, and after all it's a nice consolidation.

I've moved this in bitmap-for-next for testing. Thank you Vincent for
your work.

Thanks,
Yury


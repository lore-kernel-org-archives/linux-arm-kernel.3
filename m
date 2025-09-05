Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E170CA1013
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Sep 2025 00:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vyvqbUDXebspKl35FIPJk0lFngkuMldmVpFc1O8R/zI=; b=2p9NWESXCga25Zk64TkEKeSNrl
	TUVmCJc3U3U/aQXbsVe1XK2+81DPU0+ETOxcyQ1QWT/yA5MfVJvYG5h9qsWYjiwVk1I6NFZiCyBYl
	MZQWSEAqUWoK1YzRz+wbVx82QY2w6mygqf7q0KU31AxCQYkqIMcko+SPwq94YP2Carv3x166SyD2Q
	BVLRrWzQABw11sPQ9gdVazCAOtEYuRRU5TnEj+xWePWbn8HQChPQapFd1yS6G585LFybs/1yhYyG2
	UkZDGr4wsHte3ahNidXC3NtDa2DFJMmfYkDwy/ECY7YbNnTuq25NnQOm6TCgv18rS/VxwpWZBTMSQ
	kg9M3Ybw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uugW2-00000005ScJ-1DLM;
	Sat, 06 Sep 2025 00:10:50 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uualk-00000003ekG-32cz;
	Fri, 05 Sep 2025 18:02:41 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-323266d6f57so2678675a91.0;
        Fri, 05 Sep 2025 11:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757095360; x=1757700160; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vyvqbUDXebspKl35FIPJk0lFngkuMldmVpFc1O8R/zI=;
        b=aJc8wYqKZky8sh2BqEZIYjVsD4nJuhlVS8A2O1Np7ijCFXPxffjq04OmUUlRjb8Ljo
         ZlWGO2Kp4desQHKgIuSRwZDcpXbe9NftrQWR7A3rtM+W7S1LuynLWM4Pcu8NNv4IMM+U
         O5aqqcozgtUe9NXOoiHxyj/8qsNxkQUpDCIzKz/zC+rPcWBUHGMrPAb9Oe/m8J9qR8hl
         /wkaODb75tMQfIKQdmbwa5jn/akvwVHY8o7z12BWPVxvqoQFz42oBkWdjuiKjt3Abtk5
         eNVJmsQojUiDmV3U/HtleB8DG5dciPinfvmdWx0AkDZBHYtMR0HSiXtIsrWEqFYtRJqB
         XvNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757095360; x=1757700160;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vyvqbUDXebspKl35FIPJk0lFngkuMldmVpFc1O8R/zI=;
        b=tOH7zFI9Im53naHX5kGevss/Uq2uxKuY+Z1Vjyp3AXGunud6/onlEJ0cPlOmB8Ymot
         +fVNKrocQm3+onMuwadgi5shqYcQVCnym/XjwVcrOhV4RYNLSfbaGnJAPNSJxHVVwquH
         jMQOwrXwZ/sFhz37Aw8KTGUsE5JP+94G4GABYpFP2Ne1BFa6FIESwpuvnhz3g3XQC5LU
         kwE+fTA/vJGigd7nU8YKlAHZ5Ee4orZzUJJhV21cduC5+usyxLdEyO4k83aBHPv2OOrg
         Gc1xpLQ/Kgeko7lr1CFOtzrL822Vg5LtslwniUVS0xHKXyfpSXhf70niPvuWvi35HwpA
         xqDA==
X-Forwarded-Encrypted: i=1; AJvYcCVa3YTLE4TbZciDUwXvNhsf1AqlYhNOz6NtUZaWXPfr2e3tZuJ2XLDR1GGl5eL+kDEr8SI6S9DRoxYQlnLwBGQE@lists.infradead.org, AJvYcCWpqi3Smlv3P5cs+wrIogB6CvyEq1k/QtHJ4khMocRQetL0ifNRzxIZ2O6kqp/AhyxQOI27YdeNkB5bvAs=@lists.infradead.org
X-Gm-Message-State: AOJu0YzY4REcuSc9Y7P/Py8mcMo2w+QZBUETu2cus4DPITQ5wUbYSBtn
	BxQsNuvGKXJx096tjJFCI13DpnYWmxHUbM9bwFD5HyZli4qj8Xxd5XhN
X-Gm-Gg: ASbGnctaA/DSxcWt2wK7gh0Q99eMvjUVqYfYRj8ZrcjFM7Mcq26WG8TEJwW+BPR6P08
	e2tOUiHMdWW0Jm4H1b4kFg+/yZWe0s1HfDTbaIN2+4uTg18+FJzqpk+EAKTMLlHgUWCR91BdOSk
	GzdjbH8jrAShc5Knzeb+jcc/I+3sH/3Wxpu2HXvUfj3stopV4ehENWgwuWWlsnTcIYEKlnhxZ2o
	demKkm0VM1kDJQr59TE2uFRrwEouqtUYTJsL/am5Mo2cQ60okSEGYIsYJrwidum7ThFNO+7iSDJ
	acm1feQryPqNxdRAsJf3tWRNa+1UyytPchmkUbFNfWv9fPk49vKnesQRJ0jXpPGVXP+Z1TSbOns
	GjmyYk5BJZxSUC2SynfRx898P1Xq68ZQdDM2Yr7rp9FZlW6NRTgxNLzTazxGeOI1ESbBMUb79mK
	w=
X-Google-Smtp-Source: AGHT+IH4BIuCOkufR5zpdXWK9alIlYMnPti5eXH+01WmcFERf5EmF47R3LvTkLS7gssMCY0/Uh9xug==
X-Received: by 2002:a17:90a:d64e:b0:32b:5c13:868d with SMTP id 98e67ed59e1d1-32b5c138af9mr13139268a91.1.1757095358574;
        Fri, 05 Sep 2025 11:02:38 -0700 (PDT)
Received: from fedora (c-67-164-59-41.hsd1.ca.comcast.net. [67.164.59.41])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32b95d31976sm5409595a91.22.2025.09.05.11.02.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 11:02:37 -0700 (PDT)
Date: Fri, 5 Sep 2025 11:02:35 -0700
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: Mike Rapoport <rppt@kernel.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-block@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-efi@vger.kernel.org, virtualization@lists.linux.dev,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH v3 3/7] x86: Stop calling page_address() in free_pages()
Message-ID: <aLslu1yKPNgoz1OU@fedora>
References: <20250903185921.1785167-1-vishal.moola@gmail.com>
 <20250903185921.1785167-4-vishal.moola@gmail.com>
 <aLl9KneqOYTujcCh@kernel.org>
 <aLl98MQs-FlHo6bW@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aLl98MQs-FlHo6bW@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_110240_764888_CD64A4BF 
X-CRM114-Status: GOOD (  21.05  )
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

On Thu, Sep 04, 2025 at 02:54:24PM +0300, Mike Rapoport wrote:
> On Thu, Sep 04, 2025 at 02:51:14PM +0300, Mike Rapoport wrote:
> > On Wed, Sep 03, 2025 at 11:59:17AM -0700, Vishal Moola (Oracle) wrote:
> > > free_pages() should be used when we only have a virtual address. We
> > > should call __free_pages() directly on our page instead.
> > > 
> > > Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
> > > Acked-by: Dave Hansen <dave.hansen@linux.intel.com>
> > > ---
> > >  arch/x86/mm/init_64.c          | 2 +-
> > >  arch/x86/platform/efi/memmap.c | 2 +-
> > >  2 files changed, 2 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/arch/x86/mm/init_64.c b/arch/x86/mm/init_64.c
> > > index b9426fce5f3e..0e4270e20fad 100644
> > > --- a/arch/x86/mm/init_64.c
> > > +++ b/arch/x86/mm/init_64.c
> > > @@ -1031,7 +1031,7 @@ static void __meminit free_pagetable(struct page *page, int order)
> > >  		free_reserved_pages(page, nr_pages);
> > >  #endif
> > >  	} else {
> > > -		free_pages((unsigned long)page_address(page), order);
> > > +		__free_pages(page, order);
> > >  	}
> > >  }
> > >  
> > > diff --git a/arch/x86/platform/efi/memmap.c b/arch/x86/platform/efi/memmap.c
> > > index 061b8ecc71a1..023697c88910 100644
> > > --- a/arch/x86/platform/efi/memmap.c
> > > +++ b/arch/x86/platform/efi/memmap.c
> > > @@ -42,7 +42,7 @@ void __init __efi_memmap_free(u64 phys, unsigned long size, unsigned long flags)
> > >  		struct page *p = pfn_to_page(PHYS_PFN(phys));
> > >  		unsigned int order = get_order(size);
> > >  
> > > -		free_pages((unsigned long) page_address(p), order);
> > 
> > Could be just free_pages((unsigned long)phys_to_virt(phys), order), then
> > the page is not needed at all.
> 
> Or even __free_pages(phys_to_page(phys), order);

Right. It actually looks like we could inline this whole block if we
really wanted to...

__free_pages(phys_to_page(phys), get_order(size));

Should I send a fixup (or v4) with this change?


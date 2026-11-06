Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EB59606A326
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 14:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JoGXzp19;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=JXUq5Onw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=mEgL0gkNdxC67fiPUJ6BbKjfka4sqNTfVjccvIe0kTw=; b=JoGXzp19y9PuxxajEC/Yij1w25
	wAkks0smMkPKMLOR8lWVBPhhxXTe2k3uXwQ5ZYOOWANo56p7ZhrI+MSTDnuYBSlQKf4VPF6usDLas
	0ctbvqtIeUndiO+xtHZBayzxq/paxp+4pmCnvL68ZihXKEYhfCVOqMBeVJTaoG4qdjw/SsV9VfYPF
	zMSR84tpmfXf7UkEzxt6Lo2DZMtUzHuiBebzqXZTR9bu5JP4Ft6FWsa3L7z3y5//rGds3f9tRAczQ
	fgHDED7mQb71RxLaGZ1bWyOcjCVcVOUqvp9q3g/IJtprvAElHbhNAFpCXO88xXMwHryYRIarnJL1G
	OzzaJ7dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPKX3-0000000CaV9-0u2a;
	Fri, 06 Nov 2026 14:03:05 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPKWx-0000000CaOc-2UxR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 14:03:03 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4b76c15ae36so4815e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Nov 2026 06:02:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793973776; x=1794578576; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mEgL0gkNdxC67fiPUJ6BbKjfka4sqNTfVjccvIe0kTw=;
        b=JXUq5OnwtiYyaR8eMwz36W0GFM9LQzXgG3Q/XO6wDkRE610XlxuYiu3ceKVhKxk56t
         4+WZCVsy2Iqc1TWUhJtO4jjOIOiAPQKOYs6NIMPogs3QKac9MgpXOSOs3X4KJT1giQqA
         Vt3u1UvwkkaoTpQCAlB/orG3qmtom16bC7bIwQ7uUhmuGUcCnnIsH72Uwd/zGFn+xzad
         xyPqLOX9Dwkr/yhJtSqND3L4l3SltDRGvUz3A2JxeLFLUeqlt8LoJeIBfLwKx/7z6PrZ
         ZObD330q/gM9skaKD5dBoXRpjnVV2x24ir5+avYCICCeIudL9Ywrj1vzZrlJ7jvFwR1i
         gtnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793973776; x=1794578576;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mEgL0gkNdxC67fiPUJ6BbKjfka4sqNTfVjccvIe0kTw=;
        b=vcqGqEaOtcJ8i0MTmKH+KfAXUxJ6SWV/MYZ/FG5Y+ZNkSALStKixb+QySteXYQcMYs
         QnPT8wRamlzm1fKaBywcYE+QuducW/NcBKfi3hMUqTgGyE84jj/bPB4FviZXAxPvBUoC
         g9eTgACSCKoXLQs6he7x7b0I6u4ghbDZS8vPP0ReODO2Y+lJcSA2clf2FX1dS5/92mXV
         lseLn+UWUoWDMTHnMmpgRw9XJ1sY4sP4HfJqS3h/C9nbvmHyRuFrcVyNfXEivu+D4Yza
         J9TmgYaaz6EMt5VRbL1ptCDSazqDyHwzVcHL1SmKYTQMxtMsf57bTKXQa6tjQMgW4Onf
         5n3A==
X-Forwarded-Encrypted: i=1; AKwUvBzQn2fXuUOLlwWdwI9GxpE2XZlYIIR5aqglnHwwIKtZ4iPkXsQ/hEyASiKUY7HeP4jpNRXUZVas6OFgzbN8QcC2@lists.infradead.org
X-Gm-Message-State: APuU4Z8DpJXqOn30iXL9JWq7vPkj7cWRfwBPbsjbjlcrn+WajnyKIvWh
	UOGWjSoybBzcEBkULCTGS56MsKvPeUoe6wtU57xQK7fOFPRDQIUGA3VjTmwDP3rAoA==
X-Gm-Gg: AYBFou0IZQ08VLtu4C6+ybcdUISQZNVAULR5B1698I3Br001jA9i1/lYUF0SvO0+FAe
	ZPBj12pqcjuU2AoAIOfGnZaMNrWQ139qK8wXddbTWlLSzav0+tSTn/em9/rVJUE9Lm9BsaaE0+R
	Tn/B/f+7cZLXbiXa2lp31wLCTgLymluk9+NP6AKeeTpJZ6eD8Dk83QJ6wGkodBxwk6PLKX7Ow5L
	h3bXFwuQHmYR0+S7PTQpQ+no1LA+WkxzuZMhwtVJwT7TagboAh/UDUu8Q2xWWKCcAAOInieMkPX
	fWCym4He5D4+bQ7SK+4knoWHgMi7sxZZl76fanknDD6apIU+FSZ6+AHXtXdsKy8wU8xOtXfnofE
	Mw34ISk/qXvJ4x/5mxA6arM+V6NHKGKYzfeao/HMuREzfJ4Km99uXNwEN8Ezttw6uj5khNF1roP
	vqRByPFK9VPs4TFljquOf3nCbMe/fch7VZ72qqe4PqphZ/Eu65JuSlY5bvFnbtlnz1VwBTkaVId
	+OacbP+fKfIwoZ1hzgg/Pu93Q4yh2OLxZv0CzfaPFrzNlXEP4yO2L1b1hlj2rncUaBtjOkOlfIN
	wGj/xWrS8e43IcQ5hpMVPYlE0MXa+ars3q2pDkJdDKCwCYY=
X-Received: by 2002:a05:600c:8a17:10b0:4aa:7270:60f with SMTP id 5b1f17b1804b1-4b743f9f46fmr464815e9.1.1793973775119;
        Fri, 06 Nov 2026 06:02:55 -0800 (PST)
Received: from google.com ([35.189.193.160])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d3d609b1sm3724515f8f.8.2026.11.06.06.02.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 06:02:54 -0800 (PST)
Date: Fri, 6 Nov 2026 14:02:40 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: xuheng@cs.columbia.edu, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Quentin Perret <qperret@google.com>, Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2 1/3] KVM: arm64: Compute hyp early-allocation and pool
 sizes in 64 bits
Message-ID: <au3eALuLVKZ1WXhp@google.com>
References: <20261105-hyp-pool-and-map-v2-0-44a6ca90190b@cs.columbia.edu>
 <20261105-hyp-pool-and-map-v2-1-44a6ca90190b@cs.columbia.edu>
 <CA+EHjTxXpA6sCrSmwRJBA=YKGfNP4zs-THhheRHTaq2BfYY-Lw@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+EHjTxXpA6sCrSmwRJBA=YKGfNP4zs-THhheRHTaq2BfYY-Lw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_060259_688902_599ED3FD 
X-CRM114-Status: GOOD (  24.64  )
X-Spam-Score: -17.6 (-----------------)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 06, 2026 at 11:31:57AM +0000, Fuad Tabba wrote:
> Hi Xuheng,
> 
> On Thu, 05 Nov 2026 22:59:48 +0000, Xuheng Li <xuheng@cs.columbia.edu> wrote:
> > hyp_early_alloc_contig() and hyp_pool_init() both take a page count as
> > an unsigned int and compute the size in bytes as nr_pages << PAGE_SHIFT
> > in 32 bits.  For 4 GiB or more (nr_pages >= 2^20 with 4 KiB pages) the
> > shift overflows.
> 
> Mostafa (Cc'd) posted a fix for the same truncation in July [1],
> widening the parameters to unsigned long instead. Would you be OK
> picking up his patch for v3, keeping him as the author and your
> description and tags?
> 

I was preparing v3 anyway, I can post it today.

Thanks,
Mostafa

> > Two of the regions that pKVM carves out at boot are sized from the
> > amount of memory: hyp_s1_pgtable_pages() for the hyp page tables (hpool)
> > and host_s2_pgtable_pages() for the host stage-2 pool both provision
> > page-granular tables for all of memory, about one page per 2 MiB of
> > RAM, so they reach 4 GiB on a machine with about 2 TiB of RAM.  Arm
> > systems of that size exist, for example AWS Graviton4 x8g.metal-48xl
> > instances (3 TiB) and Ampere Altra Max servers (up to 4 TiB per
> > socket).
> 
> Could you also list the hyp vmemmap here? It's sized the same way and
> overflows at 2 TiB too.
> 
> > On such a machine, divide_memory_pool() gets a truncated hyp page-table
> > region from hyp_early_alloc_contig(), so the host stage-2 region and the
> > FF-A proxy pages that follow it start inside the range that hpool will
> > own.  hyp_pool_init() then attaches all nr_pages pages of each pool to
> > its free lists, so hpool and host_s2_pool share pages and the same page
> > can be handed out twice, for example as a hyp stage-1 table and as a
> > host stage-2 table.  hyp_pool_init() also derives range_end and
> > max_order from the truncated size, so most of each pool is treated as
> > external order-0 pages; on a host whose IPA size makes the host stage-2
> > PGD a multi-page allocation (for example a 42-bit PARange), that
> > allocation fails and host_s2_zalloc_pages_exact() uses the NULL result.
> 
> Could you describe here what actually happens? I think pKVM init fails
> before any page is handed out twice. Just below 2 TiB, hyp_pool_init()
> for host_s2_pool hits the BUG_ON() in hyp_set_page_refcounted() on
> hpool's page-table pages, and from 2 TiB up hyp_back_vmemmap() zeroes
> the new hyp page tables while they're being built.
> 
> Cheers,
> /fuad
> 
> [1] https://lore.kernel.org/all/20260715150125.2798116-1-smostafa@google.com/


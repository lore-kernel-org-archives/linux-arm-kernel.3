Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0796C55ABF
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 07:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NXENzFGewvbVKEIJwXHYAIoiYNIgGa+Cz5Fo0Nhu2JQ=; b=FZVBbaN+08Xkan2dCWh4TyL5e0
	MtcPpTRxfvXq6qNv3AdymfXm0TLmKSOSxefwRnF7PIbONygQs84ppYOHOC4dW2FUDhxxgIc8qzSMl
	WfErLXG24o82/nG/4f5l5VuRGlD91hQJXGn7MJtuNv7tZiPzTiw0F+3F01ft1rdcFeHR8vhnwImTx
	pVQv2Nk2EMT4AFFKPAjPik+3vEunUf2lbYSDqS7AewYfXYrnpKadpVjyZE3Ppl8wsLqv5fyXBMBG4
	zBiBaCNaZNgPbzR6vPN0u/iXtq+WIyqGQhLvOnqZUWu/9w+XqIY/bEc/K/pVNBtk1S2kvMvyLoBUA
	/MUOiftA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrsLd-000000057fB-03XO;
	Thu, 06 Aug 2026 07:17:01 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrsLb-000000057f0-3zVa;
	Thu, 06 Aug 2026 07:17:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 515A360A64;
	Thu,  6 Aug 2026 07:16:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36CEE1F000E9;
	Thu,  6 Aug 2026 07:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786000619;
	bh=NXENzFGewvbVKEIJwXHYAIoiYNIgGa+Cz5Fo0Nhu2JQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=P2eClChD/AaOKwmAmAyPQS1DUnipFlxmEzB/eMjNEPjEZ5aqwC0SmjO6Gyf/gc9Mf
	 Y8TZpzplAPvWlbF9BNnJxxPUlusi9jGsZkeCvUZIhmRdYmNFXoQarDX1ytS+V60mGE
	 vMzHPk+Q4aZKzwILGzfSNWjeY/XsFH+sOUJJPSMii1RG1HdF8/za5vnD1S/ynoDBKM
	 nnZMlXWiW2gRlqlxwvxMwBlaEaoQegPOoN+OtOvVaF+G3COJg+PqcpJ0htnn+2mAM5
	 H/nKGQ08QO9jgCFDwzl6sJmNYiICc/IQW2zsN/jzKgslc5XdoBHmPvJB3FTZMZl6Fn
	 EHwjv/NOpoFlg==
Date: Thu, 6 Aug 2026 10:16:48 +0300
From: Mike Rapoport <rppt@kernel.org>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Danilo Krummrich <dakr@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Michal Hocko <mhocko@suse.com>, Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Vlastimil Babka <vbabka@kernel.org>, Will Deacon <will@kernel.org>,
	driver-core@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH] drivers/base, mm: move arch_numa.c to mm/
Message-ID: <anQ04CpxDjqktbbB@kernel.org>
References: <20260806-arch-numa-v1-1-968ec128121e@kernel.org>
 <anQyFuRVekkN8Z5a@lucifer>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <anQyFuRVekkN8Z5a@lucifer>
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

On Thu, Aug 06, 2026 at 08:06:12AM +0100, Lorenzo Stoakes (ARM) wrote:
> On Thu, Aug 06, 2026 at 09:58:38AM +0300, Mike Rapoport (Microsoft) wrote:
> > arch_numa.c implements boot time discovery and initialization of NUMA
> > topology on architectures that select GENERIC_ARCH_NUMA (currently arm64
> > and riscv).
> >
> > Since this is step in the initialization of the memory management
> > subsystem, it's logical to have arch_numa.c in mm/ alongside numa.c,
> > numa_memblks.c and numa_emulation.c.
> >
> > Move arch_numa.c to mm/ and add its F: entry to "MEMBLOCK AND MEMORY
> > MANAGEMENT INITIALIZATION" in MAINTAINERS.
> >
> > Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> 
> Everything is proceeding as I have foreseen... soon we shall have control
> of all of the kernel! ;)

I'm also eyeing drivers/base/memory.c, but that one is more involved :)
 
> Acked-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
 
Thanks!

-- 
Sincerely yours,
Mike.


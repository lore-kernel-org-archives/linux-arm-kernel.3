Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CB00C982D2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 08:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ajXDT72SASPlUAIpfN0KU7YI2VHhEl8UztFZ5ElJ3Lc=; b=ghh5TdWI/MA6ZE5WffuOW6KWE9
	g9YQ5+cXNvO7+RVJ4K5Tv/ASLYmA+s6tNTGQOzWb16oDDSRZMR/FmT2jn5fku6QuuDyxdcue1sF7c
	ODplxmlz35lX2kPOXqCE1a576CeUEJYsj4olqLDZ8VANPlnefc8n55OM1Fy4tDvobe5jwBU3uUiqD
	iTsyuP44CMjJVchzkuxyiVbdP4ozE40/dFwqmzrlld6Jv3WZahIyeP6nlKWFr+5pe6BYY/qToZ9Jg
	KYKmwB4Eh3A8q7xwL5q5wXuM1GAo4F+6L49xw40bmOv9THkfhTLNA6nOva5pohSgdEWBYhFjFp2hE
	lj0ftzdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7TfU-0000000DlaV-2itl;
	Fri, 18 Sep 2026 08:10:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7TfT-0000000Dla0-1nyL
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 18 Sep 2026 08:09:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ajXDT72SASPlUAIpfN0KU7YI2VHhEl8UztFZ5ElJ3Lc=; b=M+JtUB+14RBMVOT6EBfOv8yYhG
	pQFok2afWbOZ9sEKJ4+QzgbJnuGQHbhitXlTOYMYxU5mF0p/yIaGxiYODtlWqa71Z+WbRmd44nE9Z
	40958XWl2gjOSoU9orSIkSrLvzxn2lq8SedGKAW23yzeBvUhrZ+1M9c51D2eJiTsF4IhmuUnmmoLS
	9gKY69KCuHregHVV2OYUcxd88Up6bir3mGXl0wOC7mXzt3INvWtYv2RY5CDzH3FSWVgzAOxf1vjOJ
	KDEBUQTAXnWuMomzWjotPSN8Xuo4qTOvd0Mv87mhyFtzYywz62Tj+ScBUxPTju2kzksL/8jMOT/KU
	kDO381ww==;
Received: from out-88.mta0.migadu.com ([2001:41d0:1004:224b::58] helo=mta0.migadu.com)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x7TfQ-00000009lZ1-127T
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 08:09:58 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=nOrA6LUUXVDyAS34aH1r5AVGEJg8nxE5D7IKoW8+wIQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789718994; v=1; x=1790323794;
 b=ADFQDA+8TsnOkukS5fm8rZm9Oyd+Iw4z2srzzl8WrTbKLBBVgPWXUyKgqFQPgR/K+hDwYhDb
 B7cGxqBI2yqG31O7adiQ76NoqZ5urKgGQZj3OxckVHflyNIep9ss948jyETzhw6XZeHIrjthTbY
 RT0ebUOZjFCZglV1SThXrPuE=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by mta11.migadu.com with ESMTPS id db6dbc05fe83f0e0;
	Fri, 18 Sep 2026 08:09:53 +0000
X-Mizu-Trace-ID: db6dbc05fe83f0e0
X-Migadu-Flow: FLOW_OUT
Date: Fri, 18 Sep 2026 16:09:37 +0800
From: Baoquan He <baoquan.he@linux.dev>
To: Wandun Chen <chenwandun1@gmail.com>
Cc: catalin.marinas@arm.com, will@kernel.org, chenhuacai@kernel.org,
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	tglx@kernel.org, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com, x86@kernel.org, robh@kernel.org,
	saravanak@kernel.org, akpm@linux-foundation.org, rppt@kernel.org,
	pasha.tatashin@soleen.com, pratyush@kernel.org,
	m.szyprowski@samsung.com, mark.rutland@arm.com, kernel@xen0n.name,
	alex@ghiti.fr, hpa@zytor.com, ruirui.yang@linux.dev,
	robin.murphy@arm.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	kexec@lists.infradead.org, linux-mm@kvack.org,
	iommu@lists.linux.dev
Subject: Re: [PATCH v6 10/10] crash_core: skip MEMBLOCK_NODUMP regions when
 building vmcore ELF header
Message-ID: <aqzxwd6TXxbempxx@fedora>
References: <20260902073116.802752-1-chenwandun1@gmail.com>
 <20260902073116.802752-11-chenwandun1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260902073116.802752-11-chenwandun1@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_090956_364211_662F934D 
X-CRM114-Status: GOOD (  13.45  )
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

On 09/02/26 at 03:31pm, Wandun Chen wrote:
> From: Wandun Chen <chenwandun@lixiang.com>
> 
> Reserve regions (for GPU, DSP, ...) carry no data useful for crash
> analysis. Exclude MEMBLOCK_NODUMP regions from the vmcore ELF header to
> reduce vmcore size and capture time. crash_should_skip_region() now also
> returns true for MEMBLOCK_NODUMP.
> 
> Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
> Tested-by: Meijing Zhao <zhaomeijing@lixiang.com>
> ---
>  kernel/crash_core.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Acked-by: Baoquan He <baoquan.he@linux.dev>

> 
> diff --git a/kernel/crash_core.c b/kernel/crash_core.c
> index bd64cf585795..b0e618e13588 100644
> --- a/kernel/crash_core.c
> +++ b/kernel/crash_core.c
> @@ -270,10 +270,10 @@ int crash_prepare_elf64_headers(struct crash_mem *mem, int need_kernel_map,
>  	return 0;
>  }
>  
> -/* Exclude NOMAP regions from the vmcore. */
> +/* Exclude NOMAP and NODUMP regions from the vmcore. */
>  static bool crash_should_skip_region(struct memblock_region *reg)
>  {
> -	return memblock_is_nomap(reg);
> +	return memblock_is_nomap(reg) || memblock_is_nodump(reg);
>  }
>  
>  static struct crash_mem *alloc_cmem(unsigned int nr_ranges)
> -- 
> 2.43.0
> 


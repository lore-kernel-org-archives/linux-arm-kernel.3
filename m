Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30C41C44500
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 10:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WjZeD6b4nbdVUDFjV+MNLvvnzANax8CpheXBkOJIi68=; b=GXCPsKoTjpspbM6JIHDbsAQKwk
	qyFKCqNoRu8X/+Y+TlsabFhHHFceoHPcIWs7JdNY++ealVruSMXR4lUCxh/RVQhDgOe/7EGor0bnl
	22g/EmdmvK+XrgrEKQtYodFeJNdfEBwcZCJEuh4LqN148dDFjbpky6cIPJMCXAQb25PrZvzauJ1iA
	hQXrzAdmociqT9KdPeQ18JHLoDQ6vikzeyu8HZUUNvNA/ytthUgsBQH0oWYpHnFYllz90xlmDZ+4C
	KCG4DCod/Va9qmPQfs1QJ8vbSLQZ1QUo4leqmgPGzNhQMOQlv2DbYZBT9+nKllUWfH/KqX2fL9YnH
	WrmBKz7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1virY9-00000006nbx-04St;
	Thu, 22 Jan 2026 10:04:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1virY7-00000006nbk-1PTT
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 22 Jan 2026 10:04:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=WjZeD6b4nbdVUDFjV+MNLvvnzANax8CpheXBkOJIi68=; b=imx+5WJ6WPzFgfopc2sGqwar9p
	9OEuUWvGaBpWGqymo9I9Cup5RY7ey/xecqRFWwzBtYDNAiqj26G6nSPEJW0l9PR6EN6Lb0gu2X1Lp
	4sRwCJ9gvzcWwX8L2rZBdrDeq3qsJye+4zBKZNzcn4cAacCv8OwkkO4NCqPCgYN4cDUKKmIY+itp8
	9WBKe3f1YSUxj+JeXe9VCeei9WOZUUp5h40isRgkAR2GYYHAjEKbgGdo2lByl2T+smdACy+Yj5CDx
	SrucqPsYEDE6KWNcpTAeVG9R0PWoxZwBSNsC7y5RtnYLxbEBnri31WzpJUc5aM7NxpVOt3IM6AWrm
	PbwIgwwA==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1virY3-000000006cD-3Siy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 10:04:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5CD27416AA;
	Thu, 22 Jan 2026 10:04:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AFD1C116C6;
	Thu, 22 Jan 2026 10:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769076226;
	bh=yL/NrddG1CawfKhoy4ZH1/4SsxmbBqbip9rUrRWJ+qM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BpS+5mmuQZCe173jMQU+eRlim0YQxsGfPb0rhy4QSByTDjeNk8vcjdoLnBsMQNvay
	 14sD4Tx+hYBzYuiyNWBJN+FO/l/8r5YhCtGPPaEHbFbNv/qJIlE1d3HZGTdnPdhmg5
	 j2I3/qxwfyTlw5rqZ5Zg2Ypq5sspCPJkG9zibheIhO0NyR4janbnDOFA89yShhAnmI
	 7kj42mLTLdODw95p3T+NQnWiX46ZgsffM1lsx39s3oj7TGKSGNlHg5SujnnMZUFKJe
	 mxtWDvaFp8RXaYicrJb/h09nkogt17BpUo6tISRX0nO2e9QjaZ7VlIVfXqE9SoNJQI
	 opFU4u9VTB2vg==
Date: Thu, 22 Jan 2026 12:03:35 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Eugen Hristev <eugen.hristev@linaro.org>
Cc: david@redhat.com, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	tglx@linutronix.de, andersson@kernel.org, pmladek@suse.com,
	rdunlap@infradead.org, corbet@lwn.net, mhocko@suse.com,
	tudor.ambarus@linaro.org, mukesh.ojha@oss.qualcomm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-hardening@vger.kernel.org, jonechou@google.com,
	rostedt@goodmis.org, linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	linux-arch@vger.kernel.org, tony.luck@intel.com, kees@kernel.org
Subject: Re: [PATCH 18/26] mm/memblock: Add MEMBLOCK_INSPECT flag
Message-ID: <aXH190NDVl7JAl7A@kernel.org>
References: <20251119154427.1033475-1-eugen.hristev@linaro.org>
 <20251119154427.1033475-19-eugen.hristev@linaro.org>
 <aVImIneFgOngYdSn@kernel.org>
 <4b8953ac-567b-4d68-9c25-72a69afdf1b3@linaro.org>
 <aVlsqdgXSBLIE9Xi@kernel.org>
 <ae85df64-b6b7-43d7-ba50-9c0525481299@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ae85df64-b6b7-43d7-ba50-9c0525481299@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_100420_764557_EC637A74 
X-CRM114-Status: GOOD (  31.42  )
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

On Tue, Jan 20, 2026 at 05:13:43PM +0200, Eugen Hristev wrote:
> 
> 
> On 1/3/26 21:23, Mike Rapoport wrote:
> > On Sat, Jan 03, 2026 at 08:36:40AM +0200, Eugen Hristev wrote:
> >>
> >>
> >> On 12/29/25 08:56, Mike Rapoport wrote:
> >>> Hi Eugen,
> >>>
> >>> On Wed, Nov 19, 2025 at 05:44:19PM +0200, Eugen Hristev wrote:
> >>>> This memblock flag indicates that a specific block is registered
> >>>> into an inspection table.
> >>>> The block can be marked for inspection using memblock_mark_inspect()
> >>>> and cleared with memblock_clear_inspect()
> >>>
> >>> Can you explain why memblock should treat memory registered for inspection
> >>> differently?
> >>
> >> It should not, at a first glance.
> >>
> >> The purpose of the flag is to let memblock be aware of it.
> >> The flag is there to have a "memblock way" of registering the memory,
> >> which inside memblock , it can translate to a meminspect way of
> >> registering the memory. It's just an extra layer on top of meminspect.
> >> With this, it would be avoided to call meminspect all over the places it
> >> would be required, but rather use the memblock API.
> > 
> > memblock APIs are not available after boot on many architectures, most
> > notable being x86.
> > 
> > But regardless, I can't say I understand why using memblock APIs for
> > meminspect is better than using meminspect directly.
> > I'd imagine that using meminspect register APIs would actually make it more
> > consistent and it would be easier to identify what memory is registered
> > with meminspect.
> > 
> > In the end, memblock_alloc*() returns dynamically allocated memory, just
> > like kmalloc(), the difference is that memblock is active very early at
> > boot and disappears after core MM initialization.
> 
> Hi Mike,
> 
> Thanks for sharing your opinion.
> 
> David, what do you think, does it make sense to have this flag or we can
> ditch it and use meminspect directly ?
> 
> Also, for some memory blocks, they do not disappear ever, e.g. the
> printk log buffer, it's allocated early and never freed, so it's
> required to have some memblocks marked for inspection.

The allocated memory does not disappear, the memblock metadata does.

> Eugen

-- 
Sincerely yours,
Mike.


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68E56C677C4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 09:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sTjd5Qy+00SjdWLvbfKmxlu0FvSa2USAHx82BZfDawk=; b=Tpi1ROYutctfd152YrkSMLr6+q
	I2/bj90HP3kYlR6cNVGsc9NJZ09u4StLFGCT7TQMqUOWbpT1S3UCS2a1iUbgF7y6do1gmKFo/BNB5
	IZvkWPSMNs2iumXRV6yM6j33SB/g2adTcmJC+aBEmyC26LfyW0R94VKkFJu71DoVXIIUJIaLevkVW
	dSqobeBEkEFBJH+OAjRZ9DpFCBquYT/Xcpi01Ub9IwpbXjY0Cp8D/Ws434kSDppYS9sEnSumUqYIo
	PGRA9Dd9F0rkfKzDZAirFv0YE9VV23YQYE3lQT3RLCdT8kGttP3ELwcPyr858ED0zlhfp4k1ckmB3
	LDwgfcBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPI4W-00000009WzT-3OGM;
	Wed, 11 Jun 2025 09:48:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPHqA-00000009UA9-09GC
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 11 Jun 2025 09:33:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=sTjd5Qy+00SjdWLvbfKmxlu0FvSa2USAHx82BZfDawk=; b=j0JVUDRwo1ndMYf2ZpLh03t2PE
	5ZT9nS6sLI1f4OBWCgzG0/M4Y+aAVPDf6vmeMg1Wq7idSDM5Vaq5wxZbYYMAPMxH+1HIsblfxyosT
	OsYyZUCyglu/Wdbie9fQzuSPRv6opt9+SxBcE3yjC8f9XdZKCkjhtoSO6RBCVyCIL5eqlKm7k6UMK
	erQIoEE6nd7Ujk+a7NtjRr9fXPMtf28JP7rslxFGt0vXbzO3Vi4jTeKLRWslVe26ZjMIdNs8GhKNY
	Sfi/q1HUEtUaWbhfDqHBQbUY0bQoJG4Hn6ptfRU0eVYr67sHkHazRMdAxRDQdPWe6O81FsvM+XPo5
	sh/3DXCQ==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPHq7-00000002EYZ-3WNp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 09:33:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B50164A5F5;
	Wed, 11 Jun 2025 09:33:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A122CC4CEF1;
	Wed, 11 Jun 2025 09:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749634423;
	bh=dCxYhXgXkoUEmgozhBC3G0zLWKAepHqQDL8jsvt0uPw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MjP8eK0u553Rmcc4iup0emJYRA+W3FmA9kUZBpIAUv8hyBKhUMASw9CiNn4j5CvZw
	 C4/Yc3KKIBvZnQ5+PugChPTPH6fDy4EeboidarhmIQuEZMUNXtrtimx4pZsKpTf7J/
	 LJKJpC4jcAk84Xw4CFH0QRaNnH4tAhxxzIUxfjcDE1EyOnINKpnRh0qpoh4oKpXu+/
	 wIjNFZ6lvdko5oJ4ULeZ/oDsmVvb7Xq7CvSrOIyuYusFpKeyyenPO5FnOlOIE1iXh0
	 xclN8LqtjskAP/7DfVBKFXzZioC2AdfdlPd9hU7mR0fusgKWyOJ+ycB2ZROesYA+RK
	 hfF3cOsNEqzWQ==
Date: Wed, 11 Jun 2025 10:33:38 +0100
From: Will Deacon <will@kernel.org>
To: Dev Jain <dev.jain@arm.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>, catalin.marinas@arm.com,
	anshuman.khandual@arm.com, quic_zhenhuah@quicinc.com,
	kevin.brodsky@arm.com, yangyicong@hisilicon.com, joey.gouly@arm.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	david@redhat.com
Subject: Re: [PATCH] arm64: Enable vmalloc-huge with ptdump
Message-ID: <20250611093337.GB10885@willie-the-truck>
References: <20250530082021.18182-1-dev.jain@arm.com>
 <d2b63b97-232e-4d2e-816b-71fd5b0ffcfa@arm.com>
 <832e84a9-4303-4e21-a88b-94395898fa3e@arm.com>
 <4202a03d-dacd-429c-91e6-81a5d05726a4@arm.com>
 <20250530123527.GA30463@willie-the-truck>
 <b223245d-c43c-4d3e-86d4-9fbfd90cfacf@arm.com>
 <20250530133625.GA30622@willie-the-truck>
 <6cd41ae9-303d-4eda-8d64-f7dba19eb106@arm.com>
 <33dd9ce3-f6ab-4054-9245-7338f06afbfd@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <33dd9ce3-f6ab-4054-9245-7338f06afbfd@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_103348_257785_5218CFA6 
X-CRM114-Status: GOOD (  26.55  )
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

On Thu, Jun 05, 2025 at 01:46:01PM +0530, Dev Jain wrote:
> On 05/06/25 10:18 am, Dev Jain wrote:
> > On 30/05/25 7:06 pm, Will Deacon wrote:
> > > On Fri, May 30, 2025 at 02:11:36PM +0100, Ryan Roberts wrote:
> > > > On 30/05/2025 13:35, Will Deacon wrote:
> > > > > I really don't think we should be adding unconditional
> > > > > locking overhead
> > > > > to core mm routines purely to facilitate a rarely used debug option.
> > > > > 
> > > > > Instead, can we either adopt something like the RCU-like walk used by
> > > > > fast GUP or stick the locking behind a static key that's only enabled
> > > > > when a ptdump walk is in progress (a bit like how
> > > > > hugetlb_vmemmap_optimize_folio() manipulates
> > > > > hugetlb_optimize_vmemmap_key)?
> > > > My sense is that the static key will be less effort and can be
> > > > contained fully
> > > > in arm64. I think we would need to enable the key around the call to
> > > > ptdump_walk_pgd() in both ptdump_walk() and ptdump_check_wx().
> > > > Then where Dev is
> > > > currently taking the read lock, that would be contingent on the
> > > > key being
> > > > enabled and the unlock would be contingent on having taken the lock.
> > > > 
> > > > Does that sound like an acceptable approach?
> > > Yup, and I think you'll probably need something like a synchronize_rcu()
> > > when flipping the key to deal with any pre-existing page-table freers.
> > 
> > IIUC, you mean to say that we need to ensure any existing readers having
> > a reference to the isolated table in pmd_free_pte_page and friend, have
> > exited.
> > But the problem is that we take an mmap_write_lock() around
> > ptdump_walk_pgd() so
> > this is a sleepable code path.
> 
> The mmap_write_lock around ptdump_walk_pgd() is definitely restrictive. I
> think that
> 
> was put because ptdump is rarely used, I think we could have done
> RCU-freeing of pagetables to
> 
> synchronize between ptdump and vmalloc pagetable lazy freeing/ hotunplug
> pagetable freeing.

The other idea was to use a static key like the HVO code does, which
shouldn't place any RCU requirements on the debug walk.

Will


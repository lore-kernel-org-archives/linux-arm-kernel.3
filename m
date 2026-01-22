Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 609E8C44500
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 09:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hyn3QjrTtRTLodNMi1k9CKwpfN90X4xBtJ4HlPnOTY8=; b=4LWyMZkXvHcsa8/x7+mk9hp+h0
	+GjWfIbJ0q6Sr6Pq+4Yr/MWBUY6fBOaBl59Pl2cVwNNGdlBf036Y+xoHLxJUiy9x+j72+OEow0fIj
	0gd626qAAymYBLF0Vdmgnwq6NWxC0DfUwGm9nGfDZFvlRXolLVh/NeW5NzbeQEHwAQm1dqIqeIfyM
	O69xZ+8nj0HzPoS8Z97JxLkqTKxamZWPL1HKXLuQ84hISlYfBHLqRU3TAPxTL+GOSFBBEEriqWk5t
	guMM+woznI3pR9sY11qniE5JYVH4IP9SzGzSW+tBJ7/dWFjIfugIbEqbT1Gk14sEaLj1Xyi5DNi7p
	u2fv0dvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1virQo-00000006n2i-2o1C;
	Thu, 22 Jan 2026 09:56:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1virQm-00000006n2P-1zMu
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 22 Jan 2026 09:56:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Hyn3QjrTtRTLodNMi1k9CKwpfN90X4xBtJ4HlPnOTY8=; b=nNzmR6HSurp74Qy8sSCmE09rUS
	kqI0MN8NI2pL13d1xqy2Hj8qCAVcbzxQvYW76CTnunjYey2Pvym1zyysNjNtljFzJNRjgyXPZU3jd
	d6Jpw5iIz1kpVH6NYW3XPdQAS4vh1TGfwFptGsEqLzjre5mEDu54lzmXaaHIn/1CBjuoE3C4YQrM/
	zG1Qy6w99VvYKpaEAXD6hOtHXOpGQxcy03NJAFOn7TOI8exonhTXWIGDuIlLCVNBxrRaKQSBc4ql8
	f3cjWNaPg9/JM7rSJWlZQMJtScCCesaH5StCE1EsWtwJa+fyAdo9479pdEZtAByRkWZHdZMFYWkwF
	ucunjdIg==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1virQh-000000005nA-3lX8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 09:56:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 045A743603;
	Thu, 22 Jan 2026 09:56:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C295C116C6;
	Thu, 22 Jan 2026 09:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769075799;
	bh=dcxoVFz6LVoWrvVHVZ3y55Q4k5TKYzriByuTAgV3hWY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hyxzfZGLcbvHXsYMNZmY0TclxVsCDges/uNr7rTIWjU7dEvvZWpe3y8gLjHiYPb4P
	 gQ8LoHdGdjymvWkmBREjtD/TG+AEf+cNOi5i4o70izpt1KJpjylatpowbVYkbk7pcP
	 CYG9UP7rOsgwnKAYwORRJM/imqq2YlfQqXjjGRf+llG3fqyyNKe9qA6NTgQgEwPWK+
	 4+DoR3K0+SIxnm4RP+gCIp20fsGJqFTdW3y9d/2ZeCn3W21XRuLsQe7Cps94/KFLsY
	 n7FdKC9l8vf+Jalgv6nJj7/fkB0Dp2sCnCpXPIvgQZsI0TX7LhQzCf/hGB0UgxDjcv
	 PJXfg+UrhfKbw==
Date: Thu, 22 Jan 2026 09:56:29 +0000
From: Will Deacon <will@kernel.org>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
	Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Chen Ridong <chenridong@huawei.com>,
	Danilo Krummrich <dakr@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Gabriele Monaco <gmonaco@redhat.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ingo Molnar <mingo@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
	Jens Axboe <axboe@kernel.dk>, Johannes Weiner <hannes@cmpxchg.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>, Muchun Song <muchun.song@linux.dev>,
	Paolo Abeni <pabeni@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>, Phil Auld <pauld@redhat.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Simon Horman <horms@kernel.org>, Tejun Heo <tj@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vlastimil Babka <vbabka@suse.cz>, Waiman Long <longman@redhat.com>,
	cgroups@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-block@vger.kernel.org, linux-mm@kvack.org,
	linux-pci@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH 29/33] sched/arm64: Move fallback task cpumask to
 HK_TYPE_DOMAIN
Message-ID: <aXH0TZU7UNowTmwc@willie-the-truck>
References: <20260101221359.22298-1-frederic@kernel.org>
 <20260101221359.22298-30-frederic@kernel.org>
 <aW-cAlJCtI5Qtify@willie-the-truck>
 <aXEHf5nbZMI8LT4b@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aXEHf5nbZMI8LT4b@localhost.localdomain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_095644_462858_93708736 
X-CRM114-Status: GOOD (  29.35  )
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

On Wed, Jan 21, 2026 at 06:06:07PM +0100, Frederic Weisbecker wrote:
> Le Tue, Jan 20, 2026 at 03:15:14PM +0000, Will Deacon a écrit :
> > Hi Frederic,
> > 
> > On Thu, Jan 01, 2026 at 11:13:54PM +0100, Frederic Weisbecker wrote:
> > > When none of the allowed CPUs of a task are online, it gets migrated
> > > to the fallback cpumask which is all the non nohz_full CPUs.
> > > 
> > > However just like nohz_full CPUs, domain isolated CPUs don't want to be
> > > disturbed by tasks that have lost their CPU affinities.
> > > 
> > > And since nohz_full rely on domain isolation to work correctly, the
> > > housekeeping mask of domain isolated CPUs should always be a superset of
> > > the housekeeping mask of nohz_full CPUs (there can be CPUs that are
> > > domain isolated but not nohz_full, OTOH there shouldn't be nohz_full
> > > CPUs that are not domain isolated):
> > > 
> > > 	HK_TYPE_DOMAIN | HK_TYPE_KERNEL_NOISE == HK_TYPE_DOMAIN
> > > 
> > > Therefore use HK_TYPE_DOMAIN as the appropriate fallback target for
> > > tasks and since this cpumask can be modified at runtime, make sure
> > > that 32 bits support CPUs on ARM64 mismatched systems are not isolated
> > > by cpusets.
> > > 
> > > Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
> > > Reviewed-by: Waiman Long <longman@redhat.com>
> > > ---
> > >  arch/arm64/kernel/cpufeature.c | 18 +++++++++++++++---
> > >  include/linux/cpu.h            |  4 ++++
> > >  kernel/cgroup/cpuset.c         | 17 ++++++++++++++---
> > >  3 files changed, 33 insertions(+), 6 deletions(-)
> > 
> > tbh, I'd also be fine just saying that isolation isn't reliable on these
> > systems and then you don't need to add the extra arch hook.
> 
> Hmm, I think I heard about nohz_full usage on arm64 but I'm not sure.
> And I usually expect isolcpus or cpuset isolated partitions to be even
> more broadly used, it's lighter isolation with less constraints.
> 
> Anyway you're probably right that we could remove isolation support here
> but I don't want to break any existing user.

fwiw, I think it's only some Android markets using the mismatched 32-bit
support and we're definitely not using nohz_full there.

Will


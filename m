Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2341DCF45C8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 21:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JLGJg2qyT7uRUopMP01XCgNTPDLf6aEtTh0/CiVfI5g=; b=p0pyCyRgyW1TpbsaxHATadr2wg
	O4oqlk8BtiEcW7B47ym5KcmM59RS9mGNYGsT3DcMSy8UkQIB1WkaIJrZJyk5Yi/goQYXnb/e7puIe
	psFZe9AxxB8rVkwlprBA7+PNlfJ6t3++zQ7jmtR3oYAZFDRkZZn1Ir//DaK2d+7kogTLpviX4Z/yc
	3JqUkvzHAIZXPUU/j47KHv5i45zNqGZakj1couV0xvp1yFkPpg+HGyzVdD/3KFke00fo7HTdEaLM7
	URRWVY47VUZl4pZ8DYSvP6PANbOetpagZNCKh1u6s6sMR428sIT7rpuf+3AG4mTdpUZnQ3IVDjWjC
	5AJWYilw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfPZ8-00000006DZD-0p1T;
	Mon, 12 Jan 2026 21:35:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfPZ6-00000006DZ4-313R
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 12 Jan 2026 21:35:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=JLGJg2qyT7uRUopMP01XCgNTPDLf6aEtTh0/CiVfI5g=; b=oX/tZ5FJUHdNQUbcOxkVaABshF
	qG5RfL9DN2YKl8bi3/jAbdaauy4DDHgzPN2S2vfsmewXAPIGce60jxQQ3kZXH303O4Ly7TDMtReG0
	r0+UKCajdDLTlTM0+aBC9T6IK79QpJFIEAV2vA5A/AH583cuNo15xCDWWWA8e/EiPdduNbCRS93y2
	rwQeUYaEBLKZbY/CKP+iYHus5ZF9BPDND5ajSnWWxfjQqFHL7AjJttdB3ke1dwlMn9GE/fVF3iI/T
	/6QrvYnMA5cBv+eH8fsP9cv/6ZXwyhQaBPP+7rd+zv/yXbbSbT251BS7dHH6idj7VO3jD0/jL3I2P
	RtXupXqw==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfPYt-00000001eYA-17tb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 21:35:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9D92B42CEC;
	Mon, 12 Jan 2026 21:34:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F249CC116D0;
	Mon, 12 Jan 2026 21:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768253688;
	bh=9r8xMa9X/yGGRMfGiUGCl1DnzpxKkGTZr05lhBx3Fuc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qptVqZGT+1fDu0cNQxrhf3GZG86xaiN60eR79t5T8VE8+jboA88I9+H4wWs36cDgn
	 WxvxvvzXqOxIPCEr6sQ67QhSGivnZxlPVbnisNAp2Fq2Lx2FOw8jD/GAGl/bjvO6wA
	 6XazLKC2q1ORoXy/dIBsw2qKYEbznnqE5D7prXft0h17ygA48CYGKQ5VUzU03M8PJR
	 nPRoNbTwzdiYvZ09K3eWroErKiVKPpP757Mf3asaHLOHCtf7eTT+iKFzXr7v4NDbwG
	 gCnGFBI+WlVAAippbwzuqtJRjlwHegTnT0EXMx3JG1F2iTuEovYgG0LImYZN60Cu5s
	 GiJXQ+NiC2dlw==
Date: Mon, 12 Jan 2026 22:34:45 +0100
From: Frederic Weisbecker <frederic@kernel.org>
To: Waiman Long <llong@redhat.com>
Cc: Simon Horman <horms@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
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
	Shakeel Butt <shakeel.butt@linux.dev>, Tejun Heo <tj@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vlastimil Babka <vbabka@suse.cz>, Will Deacon <will@kernel.org>,
	cgroups@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-block@vger.kernel.org, linux-mm@kvack.org,
	linux-pci@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH 13/33] sched/isolation: Convert housekeeping cpumasks to
 rcu pointers
Message-ID: <aWVo9em4C3f1TfOQ@pavilion.home>
References: <20260101221359.22298-1-frederic@kernel.org>
 <20260101221359.22298-14-frederic@kernel.org>
 <20260107115653.GA196631@kernel.org>
 <18ee9089-8a08-44ed-8761-7c9db765cd4e@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <18ee9089-8a08-44ed-8761-7c9db765cd4e@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_213458_527352_7D84F42A 
X-CRM114-Status: GOOD (  29.53  )
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

Le Sun, Jan 11, 2026 at 09:45:36PM -0500, Waiman Long a écrit :
> On 1/7/26 6:56 AM, Simon Horman wrote:
> > On Thu, Jan 01, 2026 at 11:13:38PM +0100, Frederic Weisbecker wrote:
> > > HK_TYPE_DOMAIN's cpumask will soon be made modifiable by cpuset.
> > > A synchronization mechanism is then needed to synchronize the updates
> > > with the housekeeping cpumask readers.
> > > 
> > > Turn the housekeeping cpumasks into RCU pointers. Once a housekeeping
> > > cpumask will be modified, the update side will wait for an RCU grace
> > > period and propagate the change to interested subsystem when deemed
> > > necessary.
> > > 
> > > Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
> > > ---
> > >   kernel/sched/isolation.c | 58 +++++++++++++++++++++++++---------------
> > >   kernel/sched/sched.h     |  1 +
> > >   2 files changed, 37 insertions(+), 22 deletions(-)
> > > 
> > > diff --git a/kernel/sched/isolation.c b/kernel/sched/isolation.c
> > > index 11a623fa6320..83be49ec2b06 100644
> > > --- a/kernel/sched/isolation.c
> > > +++ b/kernel/sched/isolation.c
> > > @@ -21,7 +21,7 @@ DEFINE_STATIC_KEY_FALSE(housekeeping_overridden);
> > >   EXPORT_SYMBOL_GPL(housekeeping_overridden);
> > >   struct housekeeping {
> > > -	cpumask_var_t cpumasks[HK_TYPE_MAX];
> > > +	struct cpumask __rcu *cpumasks[HK_TYPE_MAX];
> > >   	unsigned long flags;
> > >   };
> > > @@ -33,17 +33,28 @@ bool housekeeping_enabled(enum hk_type type)
> > >   }
> > >   EXPORT_SYMBOL_GPL(housekeeping_enabled);
> > > +const struct cpumask *housekeeping_cpumask(enum hk_type type)
> > > +{
> > > +	if (static_branch_unlikely(&housekeeping_overridden)) {
> > > +		if (housekeeping.flags & BIT(type)) {
> > > +			return rcu_dereference_check(housekeeping.cpumasks[type], 1);
> > > +		}
> > > +	}
> > > +	return cpu_possible_mask;
> > > +}
> > > +EXPORT_SYMBOL_GPL(housekeeping_cpumask);
> > > +
> > Hi Frederic,
> > 
> > I think this patch should also update the access to housekeeping.cpumasks
> > in housekeeping_setup(), on line 200, to use housekeeping_cpumask().
> > 
> > As is, sparse flags __rcu a annotation miss match there.
> > 
> >    kernel/sched/isolation.c:200:80: warning: incorrect type in argument 3 (different address spaces)
> >    kernel/sched/isolation.c:200:80:    expected struct cpumask const *srcp3
> >    kernel/sched/isolation.c:200:80:    got struct cpumask [noderef] __rcu *
> > 
> > ...
> > 
> The direct housekeeping.cpumasks[type] reference is in the newly merged
> check after Federic's initial patch series.
> 
>                 iter_flags = housekeeping.flags & (HK_FLAG_KERNEL_NOISE |
> HK_FLAG_DOMAIN);
>                 type = find_first_bit(&iter_flags, HK_TYPE_MAX);
>                 /*
>                  * Pass the check if none of these flags were previously set
> or
>                  * are not in the current selection.
>                  */
>                 iter_flags = flags & (HK_FLAG_KERNEL_NOISE |
> HK_FLAG_DOMAIN);
>                 first_cpu = (type == HK_TYPE_MAX || !iter_flags) ? 0 :
> cpumask_first_and_and(cpu_present_mask,
>                                     housekeeping_staging,
> housekeeping.cpumasks[type]);
> 
> Maybe that is why it is missed.

Good catch guys! Fixing this.

Thanks.

-- 
Frederic Weisbecker
SUSE Labs


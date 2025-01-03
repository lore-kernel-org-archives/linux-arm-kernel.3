Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E5E5E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 15:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WedLBp6/AcoWN6QD67+gZHy89Fk8T1ZpqHMRD90+734=; b=LEvKjUh+s3wrakcuC8e86RAJwA
	r0iD+bNjbQ/Qxx7HSbVwg5VIslaoucvNEFCxHyAPMfDjJC/5iI1e9C1cCNBH+jSJ2Z8vh8cW8tvqW
	uWtsGr9LdvA4drKiW3EjpmtxFGv6NgVUjK4UJvUuwogY/GslZqPxp0+sQ4MfIn2EyVKIHU7m9Wgjn
	znuJnvyqF32bORaDeyaN6oL54gjuuSbdtG/z/2Qtz4lnmTpIfmSDntVGASBUSJt5coA2du8aZZRYL
	tmTcLwkWEauoCXQC90UEKKo73i+KHGSfjK41EF40gT6bitAFxGmKw4toWg75VxXZqoh8RhUxpeSFB
	dA8csUHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTjha-0000000DIrJ-0UXo;
	Fri, 03 Jan 2025 15:35:06 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTjeL-0000000DHxb-0r5E
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jan 2025 15:31:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EBAA51480;
	Fri,  3 Jan 2025 07:32:11 -0800 (PST)
Received: from e133380.arm.com (e133380.arm.com [10.1.197.41])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 72DA63F6A8;
	Fri,  3 Jan 2025 07:31:42 -0800 (PST)
Date: Fri, 3 Jan 2025 15:31:39 +0000
From: Dave Martin <Dave.Martin@arm.com>
To: Zeng Heng <zengheng4@huawei.com>
Cc: james.morse@arm.com, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, jonathan.cameron@huawei.com,
	xiexiuqi@huawei.com,
	"Wangshaobo (bobo)" <bobo.shaobowang@huawei.com>
Subject: Re: [RFC PATCH mpam mpam/snapshot/v6.12-rc1 v3 2/5] arm_mpam: Read
 monitor value with new closid/rmid pair
Message-ID: <Z3gC25189W5UYENX@e133380.arm.com>
References: <20241207092136.2488426-1-zengheng4@huawei.com>
 <20241207092136.2488426-3-zengheng4@huawei.com>
 <Z1sMxKM9o6lAiZGr@e133380.arm.com>
 <8fa84731-1ae6-e40f-3594-3241b1ee8bb4@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8fa84731-1ae6-e40f-3594-3241b1ee8bb4@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_073145_329476_15199467 
X-CRM114-Status: GOOD (  25.43  )
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

On Fri, Jan 03, 2025 at 02:55:17PM +0800, Zeng Heng wrote:
> 
> 
> On 2024/12/13 0:18, Dave Martin wrote:
> > Hi,
> > 
> > On Sat, Dec 07, 2024 at 05:21:33PM +0800, Zeng Heng wrote:

[...]

> > > Based on the example provided, the conversion relationship between
> > > closid/rmid and (req)PARTID/PMG is:
> > > 
> > >      (req)PARTID = (rmid.req_idx * n) + closid,
> > >      PMG = rmid.pmg.
> > 
> > It seemed more natural to me for the PARTIDs assigned to a particular
> > CLOSID to be consecutively numbered (see [1]), though it works either
> > way.
> > 
> > Otherwise, the approach makes sense.
> > 
> 
> 
> After attempting to change the mapping method in practice, I found that
> there are some following advantages of the current method which keeps
> intPARTIDs are mapped to the first n IDs:

Thanks for having a go.

> 1. Because closid is exactly equal to intPARTID, and the conversion
> relationship between closid and intPARTID remains unchanged under the
> current method (still only call the resctrl_get_config_index() for
> conversion), maintaining the original semantics during the MPAM
> configuration updating;

You are right about this, but I think this is just moving complexity
around rather than eliminating it?

I've tried various approaches, and there there always seems to be one
ugly step somewhere; either something in mpam_devices.c that feels like
it should be in mpam_resctrl.c, or something in mpam_resctrl.c that
feels like it should be in mpam_devices.c.

> 2. Since there is no need to create a new transformation (like
> closid2intpartid()) between closid and intPARTID, this can reduce the
> work of function adaptations, such as in resctrl_arch_update_one(),
> resctrl_arch_get_config(), and so on, which doesn't need any extra
> adaptions and keeps things as simple as possible.
> 
> Looking forward to your comments.
> 
> 
> Greeting for new year,
> Zeng Heng
> 

Happy New Year to you too!

What you say is true, but I think the runtime cost of the conversions
is going to be trivial compared with the cost of the actual MSC
programming.

For context: I'm hoping to factor the code so that the conversion is as
cleanly separated out as possible, so that it would be straightforward
to move to an arbitrary mapping in the future if it is possible to
agree changes in the core resctrl interface so that the PARTID/PMG
allocations can be dynamic.  If we do that, the conversion would
probably become a simple table lookup.

This factoring seems more important than which precise mapping we
choose right now.

But in the interests of improving PARTID Narrowing support sooner,
I think that going straight to dynamic allocation is not the best
approach -- so my idea is to prepare for that on the MPAM driver side,
but not prioritise developing a dynamic approach until after the
resctrlfs refactoring and the MPAM driver are merged upstream.

Does that make sense?

Cheers
---Dave


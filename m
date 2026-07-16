Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27C5FC44511
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 16:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f0GzdtlCUYTXnzjiQW280fKKm7vsjhmIBbW5lFiCYW8=; b=sRT9CrFQZumvmSdz9yhfC8Oi8I
	AECTKHkaYHss0q7cH8ZVBWMy8QYbF1dr+0I1ySLwqo2gI4RJt/3EVjk+xtnXVBX+DA4aguW7oGywh
	0nws0eaIpTc2shUwBkIdX1lop1XofikTXU6tPTHw4LD5/l0g3JyEAqGlNWTeXvxp9RCc8OQMzEzgX
	3xdV0GtnqrsBpS0YdXCLfOVGVyuDBW7HB9FDPMkX52T3Hp4cMTmuVsY1/dScQXzYjIUvfZOrg9gg4
	RM7vb5v52VvdmXymxQ357H0gfE+GD1i8mh3zkasNGhDzh82rQctNx14CLrnPNaHPa3hwm0K7PXqyl
	E2vH2Jvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkOuF-000000009Ym-2Ffp;
	Thu, 16 Jul 2026 16:25:51 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkOuD-000000009Xi-1ez9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 16:25:50 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0C9EC1476;
	Thu, 16 Jul 2026 09:25:44 -0700 (PDT)
Received: from thinkpad-e142931.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 82C643F7B4;
	Thu, 16 Jul 2026 09:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784219148; bh=Ol8RXOW90RspxBYRMmqnn0Jm2Hs0leRmgMXzEwXKFD8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=raNF62Kx5WvhyNd24QVTbfe3UNmBnNDsaz2hDB854T686iwGoDmD1Q76W9cl87vQf
	 2WkwOr2MkN3IA/qi+kAK120l+veNSgVsXwL5OC9IUAL9eIktErZkN+rZEthLO6sfU7
	 Db8SDOyDxLNHQPxFWUjqW8dUqhYwXjx8ExXTB+bo=
Date: Thu, 16 Jul 2026 17:25:35 +0100
From: Wei-Lin Chang <weilin.chang@arm.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Fuad Tabba <tabba@google.com>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Itaru Kitayama <itaru.kitayama@fujitsu.com>, 
	Sebastian Ene <sebastianene@google.com>
Subject: Re: [PATCH v4 3/6] KVM: arm64: nv: Add nested revmap broken
 tracepoint
Message-ID: <clbxsg4rvtgsg3eqnuolj6q5ckmo6ltigujfzawko2r662ebbw@fnx3ommt457j>
References: <20260714115926.2044757-1-weilin.chang@arm.com>
 <20260714115926.2044757-4-weilin.chang@arm.com>
 <alh98Zz42OdWo-jp@kernel.org>
 <867bmvnwhq.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <867bmvnwhq.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_092549_476069_562D35B5 
X-CRM114-Status: GOOD (  19.70  )
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

On Thu, Jul 16, 2026 at 09:56:33AM +0100, Marc Zyngier wrote:
> On Thu, 16 Jul 2026 07:45:05 +0100,
> Oliver Upton <oupton@kernel.org> wrote:
> > 
> > Hi Wei-Lin,
> > 
> > On Tue, Jul 14, 2026 at 12:59:22PM +0100, Wei-Lin Chang wrote:
> > > Add a tracepoint to track when a nested reverse map becomes broken. This
> > > makes it easier to detect NV performance degradation caused by full
> > > shadow stage-2 unmaps.
> > > 
> > > Signed-off-by: Wei-Lin Chang <weilin.chang@arm.com>
> > 
> > I'm not too excited about making a tracepoint out of this, especially
> > since a 'broken' reverse map is more of a KVM implementation detail
> > (that could change) than anything else.
> > 
> > BPF is quite popular at this point, do you think it's reasonable to
> > instead expect the curious KVM developer to attach a kprobe and inspect
> > the state of the nested MMU?
> 
> I was the one asking for a way to report this stuff. I'd be completely
> fine with BPF as long as we give the recipe for this so that people
> can readily look at this.

Cool, I'll drop the tracepoint in the next iteration.

> 
> Even better, find a way not to have a broken rmap the first place ;-).

One possible way is to not do the shadow stage-2 map if maple tree store
fails, please see the response for patch 2 for details!

Thanks,
Wei-Lin Chang

> 
> Thanks,
> 
> 	M.
> 
> -- 
> Without deviation from the norm, progress is not possible.


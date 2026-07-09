Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BCBDC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 11:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bLBxr4qB0B5uaLaBI3ftR/jF5bf4mmTu+nO46yMCAro=; b=4G6VyV549hlIV4Z4Nf1kMLg3mj
	3A8GhqZwnJtqjyJTZZPOK8T/nOZXNqtFmg59990Gv6p7AIAG1BBf/9+Rl9pv/I9UOiV0teEcpPhPP
	qOy2SEWRb1Y+jvmIZlaviOtC0w3atIX5M5LWv6UO+5L/yVXYJ1vULoLy7qRgleDqDRQHOzlPPazVI
	7Vi16MLBNBphzKzpXyf7La+2hBA5YJHXjJczEh9ioBl9v31XxA544AZrrEP1nPStDV0Dvnx5bB+b7
	fkyu35op600SBfr2H0TKGr9umEjOaEnPshC/FYzHk/ulTcFOVwdzvkjmadrHDlwJW/IUrGm7BdiYA
	iadO82wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whmot-000000029BK-3uul;
	Thu, 09 Jul 2026 11:21:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whmos-000000029AH-3yWs
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 09 Jul 2026 11:21:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=bLBxr4qB0B5uaLaBI3ftR/jF5bf4mmTu+nO46yMCAro=; b=HOS1GVgkR7YkTz3gAPgWzWJKlY
	6xvHH/rZ1IlASTap/AdgT+B/eqYtKouRoduCPXd0X++Cf48IREAJ1/GOMVPNhSW7T4EESyn2M65CO
	wBPr9/kYg8S8W2cLx6Vo4yliBvb5Ter7vNi6kTcsZJKc13j/KWcU4UxLklcMX4OCMcmmHC6dgNmpG
	rR1987gR/D856nOLkq1KdkWkk1xKAwZcRL5uaMkB5tcrSnLE6114fv40gE19I/tlst3mNRVBPV4A2
	bf1KVzRSUCvgCAwhd399cHUVZTWBhRGkY3m6MPRB6sSEbDzicn5rsqxKzGnyMhCjy4Jhkeb7Y/rPu
	JKtAXw0Q==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1whmom-000000097wb-3DjW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 11:21:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 886223570;
	Thu,  9 Jul 2026 04:21:17 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 905A13FE53;
	Thu,  9 Jul 2026 04:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783596081; bh=x0zF6RctJI2oj7xqS+CM8W2IeGPyRQGsTPlFyL7qVzQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pAFjneuXOC/mavJU+ZBHx7MCX1JeT+brvnQARglyOslkF0b1wfoUruD1+BnxskyVQ
	 18dvl+2MhIxfu/l3yG33GjyTV7RNrF1LAV/t7RlafgV+TYmDrrmGzeMTGHpjZ3qRij
	 6IRASP294x/i0/g1b0co+eA7BLkRyeCX3mbpoZZ4=
Date: Thu, 9 Jul 2026 12:21:13 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Sean Christopherson <seanjc@google.com>
Cc: Alexandru Elisei <alexandru.elisei@arm.com>, pbonzini@redhat.com,
	kvm@vger.kernel.org, david.hildenbrand@arm.com, maz@kernel.org,
	oupton@kernel.org, joey.gouly@arm.com, seiden@linux.ibm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	fuad.tabba@linux.dev
Subject: Re: [RFC PATCH 0/3] KVM: Dirty page logging for guest_memfd-only
 memslots
Message-ID: <ak-EKSslAz1uqEtv@J2N7QTR9R3>
References: <20260702142912.6395-1-alexandru.elisei@arm.com>
 <akxOrMnlNga-vtQv@google.com>
 <ak0wSQ1133O7B96D@raptor>
 <ak0ziUcCXUlDdcla@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ak0ziUcCXUlDdcla@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_122125_192634_8460D764 
X-CRM114-Status: GOOD (  30.42  )
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

Hi Sean,

Ignoring dirty page logging for the moment, I think you've raised a much
bigger concern.

I've dumped a bit more context below, with a couple of high-level
questions. The important thing for Alexandru and I is whether core folk
are willing to consider some mechanism to ensure that guest PAs are
pinned writeable and never fault (even transiently).

On Tue, Jul 07, 2026 at 10:12:41AM -0700, Sean Christopherson wrote:
> On Tue, Jul 07, 2026, Alexandru Elisei wrote:
> > On Mon, Jul 06, 2026 at 05:56:12PM -0700, Sean Christopherson wrote:
> > > On Thu, Jul 02, 2026, Alexandru Elisei wrote:

> > > Please (publicly) document *why*  you want to add dirty-logging support.  It's
> > > all but impossible to review new uAPI without knowing the use case.

> > As to why I'm working on it now, it's because of an arm64 feature that
> > requires that memory remains mapped at stage 2, called Statistical
> > Profiling Extension (SPE), similar to Intel's PEBS or AMD's IBS. Exposing
> > the feature to a guest requires that memory remains mapped at stage 2
> > outside of userspace explicitely unmapping it, and guest_memfd, with the
> > patch to ignore the MMU notifiers [1], has this property.  I wanted to
> > expand the functionality of guest_memfd to support migration of virtual
> > machines when that arm64 feature is exposed to guests.
> 
> I'm all for adding dirty logging support for guest_memfd, but for SPE I don't
> think relying on guest_memfd always being mapped is a good idea.  guest_memfd
> is "pinned" purely because adding support for page migration is (very) low
> priority for SNP, TDX, and pKVM.  guest_memfd page migration might play nice
> with SPE?  Probably depends on whether KVM is forced to do break-before-make?

The key thing for SPE is that any pages that the SPE HW is using must
have a valid writeable end-to-end (VA to real PA) mapping at all times
while the guest is running (and while the host drains buffers). If that
requirement is violated, even transiently, then data is lost and the
guest will see an unexpected fault reported by SPE.

If there's any reason we might (transiently) unmap a leaf entry (or
entire sub-tree) from the stage-2 tables, or might (transiently) remove
write permission, then we can't guarantee SPE will work correctly from
the guest's PoV.

Obviously we can't guarantee that for regular memslots backed by
userspace memory, hence we were hoping we could rely on guest_memfd.

Am I right to understand that we expect (in future) to do things with
guest_memfd that could violate that? If so (and if we're not happy to
have some options to say "always keep this pinned end-to-end no matter
what"), then I think that means that in practice we cannot virtualize
SPE correctly, and Alexandru and I need to go back to our architects.

> And at some point guest_memfd may support userspace-driven swap, but I
> suppose we can cross that bridge when we come to it.

Unfortunately, I think we need to figure out now whether it would be
acceptable to suppress that (or making it mutually exclusive with SPE),
if only to decide whether or not we continue trying to virtualize SPE.

We don't need to figure out all the details; just whether or not that
broad approach would be acceptable, or whether we have to give up on SPE
virtualization.

> From a uABI perspective, forcing userspace to use guest_memfd to get access to
> something like SPE isn't ideal.  While I have aspirations of using guest_memfd
> much more broadly, I don't know that banking on guest_memfd replacing "everything"
> is a winning strategy.

I agree this isn't ideal, and we're certainly not expecting that this is
suitable for all users. We're just trying to get as much functionality
as we practically can with today's SPE hardware.

Thanks,
Mark.


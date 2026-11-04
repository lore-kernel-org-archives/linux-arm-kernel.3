Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 918C2606A328
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 10:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OESe67wn;
	dkim=pass (2048-bit key, unprotected) header.d=fujitsu.com header.i=@fujitsu.com header.a=rsa-sha256 header.s=fj2 header.b=MEcWqgxW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=iK1SoSRXvGm+gcMYygRdAKL4r2UZoigCfjdZJjBIYFo=; b=OESe67wnrdomQGmPgZRbbsBIYf
	NblE/TY1HC8hatR/dF20EYzjqoLl845M3sczqZYMs1uDO1xMhRK/oDMO5hz8bscTopDAO2cSfZn1G
	zxmUTS2PfMf1ng7fb10h4HentI1//yBUIfb+aBZBthhlxsQY2I3rtPkW132TAPexG+QC7wnLLcx0i
	V5BJK4NV9lrnYjFUYdHLfnmi7B7n3laHP0bgMnMW9+uEpftsvaw4YOg/bTMfaHIxyqu9M/pExtjv1
	14Q57NIiBs+6aFs5Lu3phZRGGXYRNJ7XNLoxegxrO9j+QTJyoonqvwvI66jeYparkj3Cr0swExKNf
	nKQivDXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOXwr-00000004xou-2hCS;
	Wed, 04 Nov 2026 10:10:29 +0000
Received: from esa2.hc1455-7.c3s2.iphmx.com ([207.54.90.48])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOXwo-00000004xns-2hXz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 10:10:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1793787034; x=1825323034;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=id2vzE+xcY7nItlqYwJdzJh7OgqLKeLjWS+ogyye2uQ=;
  b=MEcWqgxWR57MudP+xbEKJZlnnYIM+1ITdscHptS2S3nJEB1m+Ql+q3l5
   PZkJn2iCBXVsGa+49gFHMKqKkqsPZr8IhKY8ySwGHO0vc/dsQsLNKxr+M
   Tdh60Jaz8xEC0zu31qCS9vDeDSI9qWFLbWCwMZTrjhLIcmiRR3uxECyln
   BcwpOPpwThUcryltH0UEsDripRHq0CBn65iT9wDjx1wi16Y3VrJbyhwfj
   9xP8mKGKGZqQWFXKGB6pi58XcOQAD4ue5LrVVhuFfQdoYjXdF5kIuhr88
   2DVApeBgmRsxITL77Jur1HgcZOrW2Qkq/uszRiz8QQ97e3VFvk7f5og26
   w==;
X-CSE-ConnectionGUID: MuYYkxJgSOKdMp8kkkwvVA==
X-CSE-MsgGUID: PO5jlIvlQ1aj/7LUTbU0hA==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="260575455"
X-IronPort-AV: E=Sophos;i="6.27,195,1786978800"; 
   d="scan'208";a="260575455"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 19:10:30 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id F0EAE1000347
	for <linux-arm-kernel@lists.infradead.org>; Wed,  4 Nov 2026 10:10:22 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (unknown [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id A781C1801EBF
	for <linux-arm-kernel@lists.infradead.org>; Wed,  4 Nov 2026 10:10:22 +0000 (UTC)
Received: from FCCLS0092175.localdomain (unknown [10.9.61.160])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with SMTP id A75AB140010E;
	Wed,  4 Nov 2026 10:10:18 +0000 (UTC)
Date: Wed, 4 Nov 2026 19:10:17 +0900
From: Kohei Enju <enju.kohei@fujitsu.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, 
	kvmarm@lists.linux.dev, cgroups@vger.kernel.org, linux-coco@lists.linux.dev, 
	Marc Zyngier <maz@kernel.org>, Fuad Tabba <tabba@google.com>, Oliver Upton <oupton@kernel.org>, 
	Joey Gouly <joey.gouly@arm.com>
Subject: Re: [RFC PATCH v1 1/2] KVM: arm64: CCA: Add support for configuring
 the Realm MEC policy
Message-ID: <ausD4yiI7gSRFsqe@FCCLS0092175.localdomain>
References: <20260724094120.166536-1-enju.kohei@fujitsu.com>
 <20260724094120.166536-2-enju.kohei@fujitsu.com>
 <46d78aa2-cacb-4efd-ae62-3026f5fe9b3f@arm.com>
 <amwrnJ1KhllC-gVu@FCCLS0092175.localdomain>
 <auio781Uu9Zzyq3i@FCCLS0092175.localdomain>
 <46c28259-086e-4948-8c00-183f9e62114a@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <46c28259-086e-4948-8c00-183f9e62114a@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_021027_008903_05D8C9D9 
X-CRM114-Status: GOOD (  41.75  )
X-Spam-Score: -4.4 (----)
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/02 15:57, Suzuki K Poulose wrote:
> Hi Kohei,
> 
> On 02/11/2026 15:19, Kohei Enju wrote:
> > Hi Suzuki,
> > 
> > I sent the message below off-list a few weeks ago, but I'm following up
> > on-list in case it didn't reach you.
> > 
> > Since then, I've started reworking the series based on the
> > kvm_device_attr approach you suggested, and I'm currently testing it
> > against v23 of the CCA host support.
> > 
> > I'd still appreciate any feedback on the ABI direction, as well as
> > whether you see any concerns with posting the RFC series while the host
> > support is not yet upstream.
> > 
> > Thanks,
> > Kohei
> > 
> > On Fri, Oct 9, 2026 at 03:15:23PM +0900, Kohei Enju wrote:
> > > On 07/31 14:09, Kohei Enju wrote:
> > > > On 07/29 12:47, Suzuki K Poulose wrote:
> > > > > Hello
> > > > > 
> > > > > Thanks for sending the patch. Please find my comments inline below.
> > > > > 
> > > > > 
> > > > > On 24/07/2026 10:40, Kohei Enju wrote:
> > > > > > Introduce the KVM_ARM_RMI_CONFIG ioctl to allow userspace to configure
> > > > > > Realm VM parameters before the Realm is created.
> > > > > 
> > > > > This approach is something we tried in the past. Another option is to
> > > > > add these as kvm_device_attr for the KVM VM, under a new group, e.g.,
> > > > > KVM_ARM_VM_RMI_CTRL and add the following attributes :
> > > > > 
> > > > > KVM_ARM_VM_RMI_CTRL_RPV 		-> Realm Personalization Value
> > > > > KVM_ARM_VM_RMI_CTRL_MEASUREMENT_ALGO	-> Measuerment algo
> > > > > KVM_ARM_VM_RMI_CTRL_MEC_PRIVATE		-> Private MEC Policy. By default to shared
> > > > > ?
> > > > 
> > > > Hi Suzuki, thanks for suggesting another option. That looks good to me,
> > > > and I'd be happy with either approach.
> > > > Anyway I'd like to wait for feedback from the maintainers and other
> > > > reviewers.
> > > 
> > > Hi Suzuki,
> > > 
> > > I'm thinking of respinning the MEC policy series as RFC v2, as you
> > > mentioned in the Core Collective WG last month.
> > > 
> > > For the ABI, I'm planning to switch to the kvm_device_attr-based
> > > approach you suggested instead of introducing a new VM ioctl. Before I
> > > start reworking the series, do you have any concerns with that
> > > direction?
> 
> ...
> 
> 
> > > 
> > > One other point is that the series still depends on the CCA host
> > > support, which is not upstream yet. As a result, tools such as Sashiko
> > > would likely be unable to identify the correct base tree and may not be
> > > able to provide useful automated review feedback.
> > > 
> > > Personally, I think this is acceptable since the series is still RFC and
> > > the primary goal is to get feedback on the ABI and overall design rather
> > > than seeking integration at this stage. However, I am aware that posting
> > > patches on top of non-upstream trees can sometimes be problematic from a
> > > review perspective.
> > > 
> > > Do you have any concerns about posting an RFC series in this situation,
> > > or would you prefer that I wait until the host support lands upstream?
> 
> It would be useful to have the RFC on the list to get an idea on shaping
> the UABI. It may also be useful for people to verify the end-to-end
> stack, including the remote attestation flow. (the branch we have is
> ancient)

Thanks. I'll post RFC v2 soon, based on the following branch:
  https://gitlab.arm.com/linux-arm/linux-cca
  branch: cca-host-mm/v1/integration

> 
> But nothing else, i.e, code correctness or functional reviews
> etc (that rules out meaningful Sashiko reviews etc).

Thanks for the clarification.

Thanks,
Kohei


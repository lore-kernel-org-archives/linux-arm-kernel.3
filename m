Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D668607024B
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 15:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=42u95WzI;
	dkim=pass (2048-bit key, unprotected) header.d=fujitsu.com header.i=@fujitsu.com header.a=rsa-sha256 header.s=fj2 header.b=NzJrb9Pn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=2FPG+mPGP9zQdnlsD8pKX0+RJuv7/N+gUwaGNgwitNw=; b=42u95WzI7hHDdlWTk75/ZNmP2G
	UYfpI7wh/Tjz+ilWWD2WY8aTS6lb4QSwB8eubXy8pWzUhbHvpl476fCgC0AZrJ9/L6elE0qfiN+gA
	P0FTa/w3b8oyeuO0r3uJzkOkiAJUAxjo/exlUq7jqRnbf6QKv7Xc8B+HZxcyWD7BiFRgjpRjM1UgG
	ox1LKwnasORvtiRTq9h5bqk8DD1ZZE6vo9VFQRVbsd7a4LSRVXgEQLGwkYakJ5Ugg3b1Ug1iubjq9
	PRw9pLwRDNCbWb7ETvCTGL/C9pqGtqlM4cXCjpg5/af5DO6RN36AQX530T4zkprovx5UZR0DRb6Vd
	Nzv1c3vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNtoX-0000000H2tn-2tuH;
	Mon, 02 Nov 2026 15:19:13 +0000
Received: from esa6.hc1455-7.c3s2.iphmx.com ([68.232.139.139])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNtoU-0000000H2rt-1uCQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 15:19:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1793632750; x=1825168750;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DpaWUXaYUIkqMHEJy5W5Z5azKKbWy2hPbsPwZB7jiHI=;
  b=NzJrb9PnFkeFRqL+RAUl+GHqCaHWdCazM9mj4C/lyfNb68BuG1XAEgVK
   y2ePv/D7xKgyDCd8RMotNAT0bbxtoiiCfgdYtsZsoZoB0T3O6G6OYCo7T
   k79h3bAzIC3meKbGoJM8ToS4tyQK7cfj8DWrC/x0VNZPf5hIvL+e1JF61
   8er0fqbdHXJC84OrW5Du1TkkeOKEYlQg5aobc0rtg+hOyuK4EkAgqH9He
   aWR1QnK4VO5Wi0IGBEoeQZXHBSgcbkPWFrcAEhIUbHIV/74DSCqDm9+qT
   5RqfGoOmIhe+UqbbUC2LTIFruhQ1wP6LUZIaES36UInwpq36WqwKDBzK8
   Q==;
X-CSE-ConnectionGUID: 5VWI+S1jRPazy7dgFy03dg==
X-CSE-MsgGUID: 33+3vcEeSVif8yj4D5GG7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="264363228"
X-IronPort-AV: E=Sophos;i="6.27,191,1786978800"; 
   d="scan'208";a="264363228"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 00:19:06 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 3A7671C1C700
	for <linux-arm-kernel@lists.infradead.org>; Mon,  2 Nov 2026 15:19:06 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (unknown [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id E2871C01188
	for <linux-arm-kernel@lists.infradead.org>; Mon,  2 Nov 2026 15:19:05 +0000 (UTC)
Received: from FCCLS0092175.localdomain (unknown [10.8.180.215])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with SMTP id F0E73827901;
	Mon,  2 Nov 2026 15:19:02 +0000 (UTC)
Date: Tue, 3 Nov 2026 00:19:01 +0900
From: Kohei Enju <enju.kohei@fujitsu.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, 
	kvmarm@lists.linux.dev, cgroups@vger.kernel.org, linux-coco@lists.linux.dev
Subject: Re: [RFC PATCH v1 1/2] KVM: arm64: CCA: Add support for configuring
 the Realm MEC policy
Message-ID: <auio781Uu9Zzyq3i@FCCLS0092175.localdomain>
References: <20260724094120.166536-1-enju.kohei@fujitsu.com>
 <20260724094120.166536-2-enju.kohei@fujitsu.com>
 <46d78aa2-cacb-4efd-ae62-3026f5fe9b3f@arm.com>
 <amwrnJ1KhllC-gVu@FCCLS0092175.localdomain>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <amwrnJ1KhllC-gVu@FCCLS0092175.localdomain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_071910_772399_AC102F56 
X-CRM114-Status: GOOD (  33.37  )
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

Hi Suzuki,

I sent the message below off-list a few weeks ago, but I'm following up
on-list in case it didn't reach you.

Since then, I've started reworking the series based on the
kvm_device_attr approach you suggested, and I'm currently testing it
against v23 of the CCA host support.

I'd still appreciate any feedback on the ABI direction, as well as
whether you see any concerns with posting the RFC series while the host
support is not yet upstream.

Thanks,
Kohei

On Fri, Oct 9, 2026 at 03:15:23PM +0900, Kohei Enju wrote:
> On 07/31 14:09, Kohei Enju wrote:
> > On 07/29 12:47, Suzuki K Poulose wrote:
> > > Hello
> > > 
> > > Thanks for sending the patch. Please find my comments inline below.
> > > 
> > > 
> > > On 24/07/2026 10:40, Kohei Enju wrote:
> > > > Introduce the KVM_ARM_RMI_CONFIG ioctl to allow userspace to configure
> > > > Realm VM parameters before the Realm is created.
> > > 
> > > This approach is something we tried in the past. Another option is to
> > > add these as kvm_device_attr for the KVM VM, under a new group, e.g.,
> > > KVM_ARM_VM_RMI_CTRL and add the following attributes :
> > > 
> > > KVM_ARM_VM_RMI_CTRL_RPV 		-> Realm Personalization Value
> > > KVM_ARM_VM_RMI_CTRL_MEASUREMENT_ALGO	-> Measuerment algo
> > > KVM_ARM_VM_RMI_CTRL_MEC_PRIVATE		-> Private MEC Policy. By default to shared
> > > ?
> > 
> > Hi Suzuki, thanks for suggesting another option. That looks good to me,
> > and I'd be happy with either approach.
> > Anyway I'd like to wait for feedback from the maintainers and other
> > reviewers.
> 
> Hi Suzuki,
> 
> I'm thinking of respinning the MEC policy series as RFC v2, as you
> mentioned in the Core Collective WG last month.
> 
> For the ABI, I'm planning to switch to the kvm_device_attr-based
> approach you suggested instead of introducing a new VM ioctl. Before I
> start reworking the series, do you have any concerns with that
> direction?
> 
> One other point is that the series still depends on the CCA host
> support, which is not upstream yet. As a result, tools such as Sashiko
> would likely be unable to identify the correct base tree and may not be
> able to provide useful automated review feedback.
> 
> Personally, I think this is acceptable since the series is still RFC and
> the primary goal is to get feedback on the ABI and overall design rather
> than seeking integration at this stage. However, I am aware that posting
> patches on top of non-upstream trees can sometimes be problematic from a
> review perspective.
> 
> Do you have any concerns about posting an RFC series in this situation,
> or would you prefer that I wait until the host support lands upstream?
> 
> Thanks,
> Kohei


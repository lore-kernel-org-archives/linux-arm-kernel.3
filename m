Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C6BDC3600C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 10:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CfUhE07gyCvh0S499hviyB1Dj8eXCUbJ1Fg25uvES2A=; b=BVOdnhY3xdiNOLkFRVFte4ntCO
	PLh/R4xyMhqGZFaESmmxNo8WCWAJsLglxGB6fUQOiX1Pmpq3UnKeo03Vm8/JRF9uG0+lgVuulji9q
	2sy8+fQGG7xObWNJW/1M0tmHNdvw2y2XEnynrDvuKaQt+p0ZF+K2InJLO+T6jHE5nxq3mdaV0lMkn
	IDOXJZANABLcvy0ICNnJoeIMu5dJ8TxDmjlgXdkBi0sXXNpIE/akhC6OrL6Ea096AGgm373Jlab/h
	gnRevrYnvjsRGrncttMsrWIogKZvxU8ty/TVdqMfD1iLXgFVdRjF8v1m8vU5hrfMvvSLX5PHKXgMd
	NdjZXahg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0HPv-00000008Tja-1Sz6;
	Thu, 03 Apr 2025 10:03:23 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0GRm-00000008KK5-1KqO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Apr 2025 09:01:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2AA17106F;
	Thu,  3 Apr 2025 02:01:16 -0700 (PDT)
Received: from bogus (unknown [10.57.41.33])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5F51E3F63F;
	Thu,  3 Apr 2025 02:01:11 -0700 (PDT)
Date: Thu, 3 Apr 2025 10:01:08 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Oliver Upton <oliver.upton@linux.dev>
Cc: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
	Sudeep Holla <sudeep.holla@arm.com>, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, maz@kernel.org,
	mark.rutland@arm.com, lpieralisi@kernel.org,
	catalin.marinas@arm.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] smccc/kvm_guest: Remove the accidental semicolon
Message-ID: <20250403-steadfast-bold-puffin-f0d2ed@sudeepholla>
References: <20250402134401.146156-1-shameerali.kolothum.thodi@huawei.com>
 <20250402-independent-hyrax-of-honor-4515fb@sudeepholla>
 <Z-1pPLI8HRjg-bSx@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z-1pPLI8HRjg-bSx@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_020114_521559_4BCE0035 
X-CRM114-Status: GOOD (  15.02  )
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

On Wed, Apr 02, 2025 at 09:43:40AM -0700, Oliver Upton wrote:
> Hi Sudeep,
> 
> On Wed, Apr 02, 2025 at 02:58:06PM +0100, Sudeep Holla wrote:
> > On Wed, Apr 02, 2025 at 02:44:01PM +0100, Shameer Kolothum wrote:
> > > Fixes cocci reported warning:Unneeded semicolon
> > > 
> > 
> > There was similar patch on the list [1] few days ago.
> > 
> > > Fixes: 86edf6bdcf05 ("smccc/kvm_guest: Enable errata based on implementation CPUs")
> > 
> > ^^^ Is this really necessary as they get backported as well ?
> 
> The blamed commit was introduced this release cycle so no concern about
> backports.
> 

Ah OK, sorry didn't look at the details.

> > Since, KVM maintainers are in cc-ed, let me know if you guys want to pick
> > this ? Else I can send it as part of my firmware (ffa/scmi) fixes.
> 
> I can grab the fix here in a moment, I've already got one queued up [*]
> for the KVM guest driver anyway.
> 

Thanks!

-- 
Regards,
Sudeep


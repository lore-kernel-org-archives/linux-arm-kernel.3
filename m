Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 437B8C677C4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 15:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v0MpR2l8kIQqNSELwDKYips/2yrzNAkQHCnA8Rlm2rA=; b=Dr/bGSjzLNnodt7dNyyklbBQSW
	UXpYPp8hxHufm0TAuBBtodnwsXMFY/tLl/GiOp8d2akxe9ezDXriocEtSoiOQ7y9PeaZGggCshrpc
	EZ3tzQ5dkSfRkRBRTZ8NsQSjjwPNwobhlBRQF3wZYPvzJ2X13JNEhq/RT+1AKPSq8hS6AC52JDUOm
	RqUwmtVJ3jAz6s5BkfLbonDYFO2qCcv8jDzK0lnqb6Px1kdQI72hL8TSvJc05It7NpBtSg2LGFPnN
	LOiDt4rgzppyLJlSfS58KPj05WfwoRoVMT21kiMPjFBIAWl18EBqjzb7WPImctz62pzmvql6SLSd4
	ojWzrw9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPNr6-0000000AWg7-470j;
	Wed, 11 Jun 2025 15:59:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPKwX-00000009srM-21gQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 12:52:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EA7B415A1;
	Wed, 11 Jun 2025 05:52:16 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1F2503F59E;
	Wed, 11 Jun 2025 05:52:34 -0700 (PDT)
Date: Wed, 11 Jun 2025 13:52:32 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Roman Kisel <romank@linux.microsoft.com>
Cc: anirudh@anirudhrb.com, linux-arm-kernel@lists.infradead.org,
	Sudeep Holla <sudeep.holla@arm.com>, linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org, lpieralisi@kernel.org,
	mark.rutland@arm.com
Subject: Re: [PATCH] firmware: smccc: support both conduits for getting hyp
 UUID
Message-ID: <20250611-wandering-juicy-magpie-ed7f46@sudeepholla>
References: <20250605-kickass-cerulean-honeybee-aa0cba@sudeepholla>
 <20250610160656.11984-1-romank@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250610160656.11984-1-romank@linux.microsoft.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_055237_563612_94D19ABA 
X-CRM114-Status: GOOD (  27.38  )
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

On Tue, Jun 10, 2025 at 09:06:48AM -0700, Roman Kisel wrote:
> > (sorry for the delay, found the patch in the spam 🙁)
> 
> "b4" shows the the mail server used for the patch submission
> doesn't pass the DKIM check, so finding the patch in the spam seems
> expected :) Thanks for your help!
> 

Thought so looking at the header but I just have very basic knowledge
there, so couldn't comment.

> >
> > On Wed, May 21, 2025 at 09:40:48AM +0000, Anirudh Rayabharam wrote:
> >> From: Anirudh Rayabharam (Microsoft) <anirudh@anirudhrb.com>
> >>
> >> When Linux is running as the root partition under Microsoft Hypervisor
> >> (MSHV) a.k.a Hyper-V, smc is used as the conduit for smc calls.
> >>
> >> Extend arm_smccc_hypervisor_has_uuid() to support this usecase. Use
> >> arm_smccc_1_1_invoke to retrieve and use the appropriate conduit instead
> >> of supporting only hvc.
> >>
> >> Boot tested on MSHV guest, MSHV root & KVM guest.
> >>
> >
> > Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>
> >
> > Are they any dependent patches or series using this ? Do you plan to
> > route it via KVM tree if there are any dependency. Or else I can push
> > it through (arm-)soc tree. Let me know.
> 
> Anirudh had been OOF for some time and would be for another
> week iiuc so I thought I'd reply.
> 
> The patch this depends on is 13423063c7cb
> ("arm64: kvm, smccc: Introduce and use API for getting hypervisor UUID"),
> and this patch has already been pulled into the Linus'es tree.
> 

Had a quick look at the commit to refresh my memory and as you mentioned
it is new feature. I was checking to see if this is a fix.

> As for routing, (arm-)soc should be good it appears as the change
> is contained within the firmware drivers path. Although I'd trust more to your,
> Arnd's or Wei's opinion than mine!
> 

I will queue this once I start collecting patches for v6.17 in 1/2 weeks'
time, so expect silence until then 😄.

-- 
Regards,
Sudeep


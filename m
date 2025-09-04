Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B010FCA101C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 19:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t+/Oo4CXJuDlDTMfiu6Xf1PiW3YU3ZTst/te5Oyyak0=; b=LxWj4sYEFoQAlZ0pN+ZjmsK/eA
	bvAV/cbzNqeP9D6oTxuMgEYKgo3b3xIASyA5MKSXAYpFKFpllRi84RBaHn4Ygb3llq0k9SQ6IJgGz
	s9YuYJKZxycxTV+H7iTE2gBsTrFMKepWhVecexPR4tKaD9WZXmrkNpHtbvxaC8m44Os/XSgcjUauc
	3z6wKCZWimPUmKizz/bygdYFZCVZqTwHy7iyVsVzw36jC9rBPDfH26bExDpwjCEToIm7F6hMJeNxP
	DuRXr34XA/zwisHOFIwO9XYsFIJiGPwq2b3BsK2fvcZTW2dOcFkqplwzoeg6k8p7wqzYBvdD8TsI9
	1ST0EW5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuFzU-0000000E1Hn-1V9R;
	Thu, 04 Sep 2025 19:51:28 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuAyC-0000000CDsP-2LKx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 14:29:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ABDF81596;
	Thu,  4 Sep 2025 07:29:38 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B5E763F63F;
	Thu,  4 Sep 2025 07:29:45 -0700 (PDT)
Date: Thu, 4 Sep 2025 15:29:42 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Paul Benoit <paul@os.amperecomputing.com>
Cc: Andre Przywara <andre.przywara@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] firmware: smccc: Fix Arm SMCCC SOC_ID name call
Message-ID: <20250904-powerful-futuristic-tench-bcebd4@sudeepholla>
References: <20250902172053.304911-1-andre.przywara@arm.com>
 <20250903-great-savvy-bloodhound-38c1ca@sudeepholla>
 <20250903-loutish-orangutan-of-experience-3dcfda@sudeepholla>
 <cc8000c0-e457-4bfc-94de-aeeddacab23b@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cc8000c0-e457-4bfc-94de-aeeddacab23b@os.amperecomputing.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_072948_688682_00E3D9CD 
X-CRM114-Status: GOOD (  41.48  )
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

On Wed, Sep 03, 2025 at 05:38:44PM -0400, Paul Benoit wrote:
> On 9/3/2025 10:49 AM, Sudeep Holla wrote:
> > On Wed, Sep 03, 2025 at 03:23:58PM +0100, Sudeep Holla wrote:
> > > On Tue, Sep 02, 2025 at 06:20:53PM +0100, Andre Przywara wrote:
> > > > Commit 5f9c23abc477 ("firmware: smccc: Support optional Arm SMCCC SOC_ID
> > > > name") introduced the SOC_ID name string call, which reports a human
> > > > readable string describing the SoC, as returned by firmware.
> > > > The SMCCC spec v1.6 describes this feature as AArch64 only, since we rely
> > > > on 8 characters to be transmitted per register. Consequently the SMCCC
> > > > call must use the AArch64 calling convention, which requires bit 30 of
> > > > the FID to be set. The spec is a bit confusing here, since it mentions
> > > > that in the parameter description ("2: SoC name (optionally implemented for
> > > > SMC64 calls, ..."), but still prints the FID explicitly as 0x80000002.
> > > > But as this FID is using the SMC32 calling convention (correct for the
> > > > other two calls), it will not match what mainline TF-A is expecting, so
> > > > any call would return NOT_SUPPORTED.
> > > > 
> > > 
> > > Good catch and I must admit I completely missed it inspite of discussing
> > > 32b vs 64b FID around the same time this was introduced.
> > > 
> > > > Add a 64-bit version of the ARCH_SOC_ID FID macro, and use that for the
> > > > SoC name version of the call.
> > > > 
> > > > Fixes: 5f9c23abc477 ("firmware: smccc: Support optional Arm SMCCC SOC_ID name")
> > > > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > > > ---
> > > > Hi,
> > > > 
> > > > as somewhat expected, this now fails on an Ampere machine, which
> > > > reported a string in /sys/devices/soc0/machine before, but is now missing
> > > > this file.
> > > > Any idea what's the best way to handle this? Let the code try the 32-bit
> > > > FID, when the 64-bit one fails? Or handle this as some kind of erratum?
> > > > 
> > > 
> > > Not sure about it yet. Erratum seems good option so that we can avoid
> > > others getting it wrong too as they might just run the kernel and be happy
> > > if the machine sysfs shows up as we decided to do fallback to 32b FID.
> > > 
> > > I will start a discussion to get the spec updated and pushed out and see
> > > how that goes.
> > > 
> > > The change itself looks good and happy to get it merged once we know
> > > what is the best approach(erratum vs fallback).
> > > 
> > 
> > Looking at the SMCCC spec(DEN0028 v1.6 G Edition) ->
> > Section 7.4.6 Implementation responsibilities
> > 
> > If implemented, the firmware:
> > ...
> > • must not implement SoC_ID_type == 2 for SMC32.
> > • can optionally implement SoC_ID_type == 2 for SMC64 (Function ID 0xC000_0002),
> > ...
> > 
> > So Ampere is not spec conformant here and hence I prefer to handle it as
> > erratum. Hopefully we can use SOC_ID version and revision to keep the scope
> > of erratum confined to smallest set of platforms.
> > 
> > Paul,
> > 
> > Thoughts ?
> > 
> 
> Am I correctly understanding that, if the SMC64 SOC_ID Name call fails,
> rather than an unconditional fallback to the SMC32 call, the SMC32
> fallback would only be occurring under the proposed erratum?
>

Correct, if we have unconditional fallback to the SMC32 call, then there
is a chance that this issue gets carried into newer Ampere systems as f/w
gets copied as well as other vendors will also not notice the issue if
they make similar mistake as the kernel silent makes a SMC32 call.

We do need details of  the SoC revision and version for which we need to
apply this workaround/erratum.

> I brought this issue up at a weekly team meeting today, and I'll also be
> communicating with the Ampere Computing firmware team regarding this
> issue.

Thanks!

-- 
Regards,
Sudeep


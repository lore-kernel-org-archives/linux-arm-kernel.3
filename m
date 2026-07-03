Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFE92C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 04:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4TgXgjdmTSRIB1vQl7JiTjJkLihMd13HlneFILSqAXc=; b=Aj7jfR8ctI3qoseGwS7N3wY8JR
	6VrC7SSQZH3nEWsVuet+bbatHfNPcDEV3rQyE1YU8vJmKdrAKXq1B6DraO2aWloqEnxFRQW2F9LS5
	N5yKnRKi/M4Iuo6B3+Ss6iBCjaGPyRv9OQCvhTvVqKK3gR9NCuzOYx9vAmQCggvVapYBwp/8KsNGO
	GGc0x8HhuuGhSdLXLG5+S1jUfA2BnhDJg9533Rm1d401gWzICJ/RQYwzfHZDtoNLqKialu1bwfdM6
	+n3tfSQSOu0IZSUqJYq+eG+MueNJ2q5W0fqO5t43iEY9qhRy4fAyLhIw3PEZaNqViObkCyZMfoQKi
	7XVOlzQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfVJW-000000060UK-1KpH;
	Fri, 03 Jul 2026 04:15:42 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfVJR-000000060Ts-2jVs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 04:15:41 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 73EC31D34;
	Thu,  2 Jul 2026 21:15:30 -0700 (PDT)
Received: from localhost (a079125.arm.com [10.164.21.37])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1C4FD3F905;
	Thu,  2 Jul 2026 21:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783052134; bh=Cv1M8RLns4cnjAKC5PLIZHRwEpWpgR5Rv0tWEf0CiNk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Jtd+3L8SFs4vs7dUAtjNF1Dm5tEThzzxXGWKjZSU/6mjF/rKbvHnzVWXnWAyp5Pxz
	 s/iTtQMbjTFqKKsNJ0of0fMHf2QdpTnwHEezneA66m7qoFpWe/q6ThF+GP0tuGeFcb
	 84kXgNLOAEQ8oQ3XwZimJNVbksQRhdXDFosvXwUc=
Date: Fri, 3 Jul 2026 09:45:31 +0530
From: Linu Cherian <linu.cherian@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/5] Add BBML3 cpu feature
Message-ID: <akc3Y44XLqY3ZaEX@a079125.arm.com>
References: <20260701094131.677636-1-linu.cherian@arm.com>
 <830a4d39-c829-4e79-a0ec-5a3633b58aa6@arm.com>
 <akcpqX8gpduwqtOg@a079125.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <akcpqX8gpduwqtOg@a079125.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_211540_114166_D46A331C 
X-CRM114-Status: GOOD (  18.27  )
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

Hi Suzuki,

On Fri, Jul 03, 2026 at 08:47:01AM +0530, Linu Cherian wrote:
> Hi Suzuki,
> 
> On Wed, Jul 01, 2026 at 11:11:35AM +0100, Suzuki K Poulose wrote:
> > On 01/07/2026 10:41, Linu Cherian wrote:
> > > Patches 1 and 2 introduces BBML3 cpu feature
> > > Patches 3, 4 and 5 adds more cpus to the BBML3 support list,
> > > 	which dont advertise themselves through the standard
> > > 	MMFR2_ID registers.
> > > 
> > > Linu Cherian (5):
> > >    arm64: cpufeature: Add BBML3
> > >    arm64: cpufeature: Detect BBML3 based on MMFR2 ID
> > 
> > 
> > >    arm64: cputype: Add Cortex-A520AE definitions
> > >    arm64: cputype: Add C1-Nano definitions
> > >    arm64: cpufeature: Extend bbml3 support list
> > 
> > If you could move the last 3 patches to the top, would be easier
> > for people to back port the "enable" BBLM3 for those CPUs, without
> > the renaming conflicts.
> > 
> 
> IMHO, if we change the order, "arm64: cpufeature: Extend bbml3 support list"
> title need to be tweaked and might not go well with this BBML3 support series.
> Also, backporting issue wouldnt be a problem if the whole series is
> backported and not just 3 patches in isolation ?
> 

After looking further on this, i definitely agree that moving those patches up has an
advantage, w.r.t avoiding dependency on other patches.

Thanks,
Linu Cherian.


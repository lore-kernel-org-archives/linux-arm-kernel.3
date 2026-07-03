Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07926C43602
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 03:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NJCYJ5lPzZyw2ZWDsMaM8ivbRJQBwho/DhuM9uW3bb8=; b=MyRDbokIauYPgOtFpGJUvXYGx3
	b1Vnr0cSBmMEqvMzVv0PsOC4NmQl/oMkUsphtPxc9XgO5ocmVojVil5GeInWcjX60Cn+vFlxd2/XC
	4vnAEbQLdtS1CFfgbSkzk86RZTAWZlqlg3QH437XD+vEId5kD2/ttR2AhstPj4NpmKvmOT9DXujmi
	rLjelOPa6Np6UpE4+aKyPQiDsdsLYPSd1NUZ6t1wljl9sXXgdLf9GjvEh1jSKkHdmlTYjgvaT20y7
	DkWbmzmgGrHonQf0Z4oOnKOVr0rOnJl6BTP75Yj0nM4rwI6W34yokD4k27OOuUFCrhtvZPUTrOtPN
	y0lgpIDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfUOm-00000005vSs-3VsT;
	Fri, 03 Jul 2026 03:17:04 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfUOj-00000005vST-497Y
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 03:17:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7C5FC22D7;
	Thu,  2 Jul 2026 20:16:56 -0700 (PDT)
Received: from localhost (a079125.arm.com [10.164.21.37])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 20D143F673;
	Thu,  2 Jul 2026 20:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783048620; bh=Cg0aznQsnZEY39WOStedS01xS6wPMzQEVG0a6FA2YN8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qs0GDApYTLfVXvDzfSjAZVuskgeq+06Bta5NrHcAmg/20svs/bKpzORxAnoExVzcx
	 v6mPdzTeWIxdE69X5fSxmXIxi0b7je3tdR0WVwQURlIRkJGECWC8IUaC6T80nFesCp
	 L0lY5UQnrERxjQ289uDYqq3zN9AXmy/k2g9xKhdM=
Date: Fri, 3 Jul 2026 08:46:57 +0530
From: Linu Cherian <linu.cherian@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/5] Add BBML3 cpu feature
Message-ID: <akcpqX8gpduwqtOg@a079125.arm.com>
References: <20260701094131.677636-1-linu.cherian@arm.com>
 <830a4d39-c829-4e79-a0ec-5a3633b58aa6@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <830a4d39-c829-4e79-a0ec-5a3633b58aa6@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_201702_069357_FE2846E5 
X-CRM114-Status: GOOD (  14.80  )
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

On Wed, Jul 01, 2026 at 11:11:35AM +0100, Suzuki K Poulose wrote:
> On 01/07/2026 10:41, Linu Cherian wrote:
> > Patches 1 and 2 introduces BBML3 cpu feature
> > Patches 3, 4 and 5 adds more cpus to the BBML3 support list,
> > 	which dont advertise themselves through the standard
> > 	MMFR2_ID registers.
> > 
> > Linu Cherian (5):
> >    arm64: cpufeature: Add BBML3
> >    arm64: cpufeature: Detect BBML3 based on MMFR2 ID
> 
> 
> >    arm64: cputype: Add Cortex-A520AE definitions
> >    arm64: cputype: Add C1-Nano definitions
> >    arm64: cpufeature: Extend bbml3 support list
> 
> If you could move the last 3 patches to the top, would be easier
> for people to back port the "enable" BBLM3 for those CPUs, without
> the renaming conflicts.
> 

IMHO, if we change the order, "arm64: cpufeature: Extend bbml3 support list"
title need to be tweaked and might not go well with this BBML3 support series.
Also, backporting issue wouldnt be a problem if the whole series is
backported and not just 3 patches in isolation ?

Thanks,
Linu Cherian.


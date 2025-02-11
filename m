Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6AB5C0219B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 12:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bma30CzM2l/eeWrlsK4cONI9WrVB+OM3+s1T6YgNxvA=; b=t5OF4e/2XUQvlK4g+6J4bWW8B3
	oqX5xti7xx7oAMaqE/3pf/a9T4jMKggaxzmjd7Af2jmJjjCapjmm0ajNAf0LJBNz/AKEXak4SPCM4
	ekcwvJZpwCPzc7aNgj2HGeoegu+lVEb4KIG5YZA6LVPLkxiyFgIblPSwGTKz3x2Uk5LsHEel0JGd4
	VdfRj70NUNW6AdfOw7jwKqw32tGjFTdOcLkVA+IjgeCk0ZfkKXGGk8+IA0HK8m8pGMOaFoSYFkN+7
	V5mE/0yw5nRz4YBMhEvt0FO9ifmDCd3HKa1MYfF3OI1DWXdMM31mzvfw87yKcvDDx28b6/dwbqWe/
	2NiPrMKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thpZf-00000003oHQ-3QrU;
	Tue, 11 Feb 2025 12:41:11 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thoaK-00000003a59-1v01
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 11:37:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7E3C11424;
	Tue, 11 Feb 2025 03:38:09 -0800 (PST)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 23B183F5A1;
	Tue, 11 Feb 2025 03:37:47 -0800 (PST)
Date: Tue, 11 Feb 2025 11:37:44 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: Add missing registrations of SF8MMx hwcaps
Message-ID: <Z6s2iMP1LbdsYX12@J2N7QTR9R3>
References: <20250210-arm64-fix-2024-dpisa-v1-1-d77f43c7b253@kernel.org>
 <Z6pHPKXXnQ1whg57@J2N7QTR9R3>
 <dae7f7b2-f066-4adc-974b-54649ba69306@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dae7f7b2-f066-4adc-974b-54649ba69306@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_033748_539086_02DDE993 
X-CRM114-Status: GOOD (  10.61  )
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

On Mon, Feb 10, 2025 at 07:14:58PM +0000, Mark Brown wrote:
> On Mon, Feb 10, 2025 at 06:41:09PM +0000, Mark Rutland wrote:
> > On Mon, Feb 10, 2025 at 05:49:33PM +0000, Mark Brown wrote:
> > > Commit 819935464cb2 ("arm64/hwcap: Describe 2024 dpISA extensions to
> > > userspace") added definitions for HWCAP_F8MM8 and HWCAP_F8MM4 but did
> > > not include the crucial registration in arm64_elf_hwcaps.  Add it.
> 
> > Looking again, it looks like KERNEL_HWCAP_FPRCVT also isn't wired up?
> 
> Indeed.  I'll add that separately.

Given that KERNEL_HWCAP_FPRCVT was also added by commit 819935464cb2,
I assume you mean you'll send a v2 of this patch doing that.

Mark.


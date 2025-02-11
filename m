Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29BBBC0219D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 13:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rL3ECjq3cG2FpOQu69/5XD9GpMwWPw2hM76IoXsM71o=; b=f9O3dPLiI4IlP00FleSPbB/O5u
	UBHzbkVcGbYLiPhXtcxONR6vDnDoryUYZVeddZdHMbl71qyy5sXgyba2uGC70YXu4+xjTyin+FVet
	mW3h+PwaNMr6Simj93VvoGT3hIjtH7bOMgnSTdET9FlEBb3lgM6qnbrRlvztSRfcXQ8JYs8PUAo8N
	rkQNtVpwP3uGN3mjEJYOKxsx4bE7SBxs6NbMCdqItcA7Tpp10DOfWjydPVgu6Gp93PfBOg4I0hhoO
	tRpdueGDZ77pvUflW+c3AOGYujNqLkYL5dIyeg2oWcFAlMsCmwGmu0ybBses2Wglnplnx9sVdfI9A
	vh6yuXpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thqMC-00000003xPh-42Wh;
	Tue, 11 Feb 2025 13:31:20 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thq7I-00000003uyI-2HBn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 13:15:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5505A1424;
	Tue, 11 Feb 2025 05:16:17 -0800 (PST)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C92973F5A1;
	Tue, 11 Feb 2025 05:15:54 -0800 (PST)
Date: Tue, 11 Feb 2025 13:15:52 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: Add missing registrations of SF8MMx hwcaps
Message-ID: <Z6tNiIMIhN5fPSJM@J2N7QTR9R3>
References: <20250210-arm64-fix-2024-dpisa-v1-1-d77f43c7b253@kernel.org>
 <Z6pHPKXXnQ1whg57@J2N7QTR9R3>
 <dae7f7b2-f066-4adc-974b-54649ba69306@sirena.org.uk>
 <Z6s2iMP1LbdsYX12@J2N7QTR9R3>
 <bec2a37a-1797-41d2-a44a-a34a54a96f89@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bec2a37a-1797-41d2-a44a-a34a54a96f89@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_051556_629749_8A33ACAC 
X-CRM114-Status: GOOD (  16.34  )
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

On Tue, Feb 11, 2025 at 12:58:10PM +0000, Mark Brown wrote:
> On Tue, Feb 11, 2025 at 11:37:44AM +0000, Mark Rutland wrote:
> > On Mon, Feb 10, 2025 at 07:14:58PM +0000, Mark Brown wrote:
> > > On Mon, Feb 10, 2025 at 06:41:09PM +0000, Mark Rutland wrote:
> 
> > > > Looking again, it looks like KERNEL_HWCAP_FPRCVT also isn't wired up?
> 
> > > Indeed.  I'll add that separately.
> 
> > Given that KERNEL_HWCAP_FPRCVT was also added by commit 819935464cb2,
> > I assume you mean you'll send a v2 of this patch doing that.
> 
> Well, I was actually intending to send a separate patch given that
> otherwise it ends up looking like two different changelogs in the same
> patch and the diffs shouldn't overlap.

It would be simpler for others if you sent a single patch that handled
the three hwcaps that we failed to wire up in commit 819935464cb2. That
way they only have one thing to track.

I don't understand what you mean by "two different changelogs"; surely the
commit message is a trivial variation of the one for this v1 patch:

| arm64: Add missing hwcap registrations
|
| Commit 819935464cb2 ("arm64/hwcap: Describe 2024 dpISA extensions to
| userspace") added definitions for HWCAP_F8MM8, HWCAP_F8MM4, and
| HWCAP_FPRCVT, but did not include the crucial registration in
| arm64_elf_hwcaps. Add them.

... and the diff from v1 is "Handle HWCAP_FPRCVT".

Mark.


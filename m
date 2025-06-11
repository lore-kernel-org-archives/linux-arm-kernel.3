Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 696C5C71131
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 14:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BZzI3utmzVJbS5As40vr+AKJm9So0EC4VaQR06iNvDM=; b=S5T8zstY65FZAZHT8ysmxNnIXv
	l+diWzSDiCwz3dMmOBL+tno9SMhz0xJVYJJN53yr1gJndMc6Rb03EJybN+NVI6yUH+du0F7nAwn/z
	Ngb5fL9il+n/PoLIyXWqesn71Ty9qyAqqyQeMOWvFl4CzTXEwLjTMc0bpbhLWFDjHn8m23B1TAV8C
	7xBVqupWy6HslDdgxkmiDOrtygx2camdka7us048OJ2bKzIlr5eKnPR9oUPkxQyjzQOdyWju+WB9R
	a+A2XojKHROVJ25vWZYPZjO3yDN0iTFyWYi2utu0bg3O/AFjWOV+4MjHnDjxAmQEoxSr0BAsKG+M+
	md9oEiAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPMmf-0000000ACUO-2eO4;
	Wed, 11 Jun 2025 14:50:33 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPIEi-00000009Yno-2Sgx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 09:59:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7E2651596;
	Wed, 11 Jun 2025 02:58:52 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 999603F673;
	Wed, 11 Jun 2025 02:59:09 -0700 (PDT)
Date: Wed, 11 Jun 2025 10:59:06 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Subject: Re: [PATCH V3 2/2] KVM: selftests: Change MDSCR_EL1 register holding
 variables as uint64_t
Message-ID: <aElTaqOqzAi17H2b@J2N7QTR9R3>
References: <20250610053128.4118784-1-anshuman.khandual@arm.com>
 <20250610053128.4118784-3-anshuman.khandual@arm.com>
 <864iwnedjk.wl-maz@kernel.org>
 <9b378582-44eb-4fbb-a03a-40eb317daebd@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9b378582-44eb-4fbb-a03a-40eb317daebd@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_025912_669299_C0DEFB88 
X-CRM114-Status: GOOD (  22.40  )
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
Cc: kvm@vger.kernel.org, Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, Joey Gouly <joey.gouly@arm.com>, linux-kselftest@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, kvmarm@lists.linux.dev, Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Wed, Jun 11, 2025 at 09:15:10AM +0530, Anshuman Khandual wrote:
> 
> 
> On 10/06/25 10:31 PM, Marc Zyngier wrote:
> > On Tue, 10 Jun 2025 06:31:28 +0100,
> > Anshuman Khandual <anshuman.khandual@arm.com> wrote:
> >>
> >> Change MDSCR_EL1 register holding local variables as uint64_t that reflects
> >> its true register width as well.
> >>
> >> Cc: Marc Zyngier <maz@kernel.org>
> >> Cc: Oliver Upton <oliver.upton@linux.dev>
> >> Cc: Joey Gouly <joey.gouly@arm.com>
> >> Cc: kvm@vger.kernel.org
> >> Cc: kvmarm@lists.linux.dev
> >> Cc: linux-kernel@vger.kernel.org
> >> Cc: linux-kselftest@vger.kernel.org
> >> Cc: linux-arm-kernel@lists.infradead.org
> >> Reviewed-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> >> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> >> ---
> >>  tools/testing/selftests/kvm/arm64/debug-exceptions.c | 4 ++--
> >>  1 file changed, 2 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/tools/testing/selftests/kvm/arm64/debug-exceptions.c b/tools/testing/selftests/kvm/arm64/debug-exceptions.c
> >> index c7fb55c9135b..e34963956fbc 100644
> >> --- a/tools/testing/selftests/kvm/arm64/debug-exceptions.c
> >> +++ b/tools/testing/selftests/kvm/arm64/debug-exceptions.c
> >> @@ -140,7 +140,7 @@ static void enable_os_lock(void)
> >>  
> >>  static void enable_monitor_debug_exceptions(void)
> >>  {
> >> -	uint32_t mdscr;
> >> +	uint64_t mdscr;
> >>  
> >>  	asm volatile("msr daifclr, #8");
> >>  
> >> @@ -223,7 +223,7 @@ void install_hw_bp_ctx(uint8_t addr_bp, uint8_t ctx_bp, uint64_t addr,
> >>  
> >>  static void install_ss(void)
> >>  {
> >> -	uint32_t mdscr;
> >> +	uint64_t mdscr;
> >>  
> >>  	asm volatile("msr daifclr, #8");
> >>  
> > 
> > Why change this in the place that matters *the least*?
> > 
> > arch/arm64/kernel/debug-monitors.c is full of 32bit manipulation of
> > this register, and that's only one example of it. So if you are going
> > to change this, please do it fully, not as a random change in a random
> > file.
> 
> The first patch in this series changes mdscr system register to 64 bit
> in the mentioned file (i.e arch/arm64/kernel/debug-monitors.c). 

You did not Cc Marc on oatch 1 or the cover letter. KVM folk are only
Cc'd on patch 2.

Marc, for context the series is:

  https://lore.kernel.org/linux-arm-kernel/20250610053128.4118784-1-anshuman.khandual@arm.com/

... and I've asked Anshuman to better describe the rationale.

Mark.


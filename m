Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82073C624D6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 14:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kRZwS841GcA5VzuOYLgzKhcr7/acQnTRJCI0lS681iY=; b=xChH0FH/54l2ziN9TzK7OrtOGz
	SR0Ia2vQzFt3phdvzFIFhou9HK7YmUqQklQPUus/RYT6ifxij78YncxBknR4Qaf6siTZlBHDddeLT
	MUrJuqgMElBwdAWm7/1YaPd7ZWWl/cuywy9gwTZYEOWTqFzd+2ANP/GBsO3MBb4+tK5D+QDnRK/3N
	TveSXZ5UW7UadSG1nhUpdFhfH+yF+gbqTaNyetK+u25yXJDIGTKDeNwt51Hh7IrU6/x6vPjbCRrvc
	c2fQLwmHPk2pNRfnMSR5V1I6dQnQhlGXW0n0lQHXSBFnNymYVqvRKncFVijZR3qMcKqNjLnFFMh8E
	Rn9rJAnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1lX8-0000000EsZi-1lFK;
	Wed, 02 Sep 2026 14:01:46 +0000
Received: from mail.mainlining.org ([5.75.144.95])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1lX5-0000000EsYw-3Mq7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 14:01:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1788357698; bh=kRZwS841GcA5VzuOYLgzKhc
	r7/acQnTRJCI0lS681iY=; b=THYpt8plHH5PHoL0pm5ADvyOnwx8z5K4uGClagz7HRZ/25PLG1
	RmhMzMMLQ9bSDESWfULPx4k4yr2VpvwN+nFJyzQGClLk8CnvTcxXnqj9WyPzl0w41/BRJIVYUjG
	g+gChXg2CYyE4FBJsQNk8dzG+ErY2brU6aAN9lUv2mNavXr21v1pNLqz+61l+qesQwTxr/N/Icq
	S0TzWQ0SAQFojnkBEYZxlnlOKG61TJFqCgBEdmxgMHFjQusixUeeOPyjDGlLRz/wZRla0o3vz4C
	/WRFTdh6FkL5FY6sQPbGTy2qgyGcDqHD8pA8EBfYrTkMpKAKZLWe/G8ZHtp+hjePYsw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1788357698; bh=kRZwS841GcA5VzuOYLgzKhc
	r7/acQnTRJCI0lS681iY=; b=oR7N+qIW/Wl0QWs83dGRv5hC50V7ul9TSAiv1FzAKPrmzhDT1y
	MKqvSiMeUIyIoXQo2XnUdVMv2wnj3peCLKAw==;
Date: Wed, 02 Sep 2026 15:01:36 +0100
From: Bradley Morgan <brads@mainlining.org>
To: Mark Rutland <mark.rutland@arm.com>
CC: Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 James Morse <james.morse@arm.com>, Marc Zyngier <maz@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/7] arm64: head: correct comment for init_kernel_el()
In-Reply-To: <apgrlRLacxqhXsX-@J2N7QTR9R3.cambridge.arm.com>
References: <20260825205839.14571-1-brads@mainlining.org> <20260825205839.14571-3-brads@mainlining.org> <apgovCGT-D7OWbSE@J2N7QTR9R3.cambridge.arm.com> <FBC45096-70E5-4F97-B2F0-863BCC91BB4F@mainlining.org> <apgrlRLacxqhXsX-@J2N7QTR9R3.cambridge.arm.com>
Message-ID: <9489CCEF-9599-4F1D-AD03-CC995CF1956A@mainlining.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_070144_012685_88DE610D 
X-CRM114-Status: GOOD (  27.01  )
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

On 2 September 2026 14:58:45 BST, Mark Rutland <mark.rutland@arm.com>
wrote:
>On Wed, Sep 02, 2026 at 02:49:57PM +0100, Bradley Morgan wrote:
>> On 2 September 2026 14:46:36 BST, Mark Rutland <mark.rutland@arm.com>
>> wrote:
>> >On Tue, Aug 25, 2026 at 08:58:34PM +0000, Bradley Morgan wrote:
>> >> The comment above init_kernel_el() still says the function configures
>> >> the CPU to execute at the highest reachable EL, but that stopped
>being
>> >> true a while back. Ever since commit ae4b7e38e9a94798 ("arm64: Allow
>> >> sticky E2H when entering EL1"), init_kernel_el() always drops to EL1,
>> >> and it is finalise_el2() that brings us back up to EL2 when we want
>it.
>> >> 
>> >> Update the comment to match what the code actually does.
>> >> 
>> >> Signed-off-by: Bradley Morgan <brads@mainlining.org>
>> >> Cc: Ard Biesheuvel <ardb@kernel.org>
>> >> Cc: Catalin Marinas <catalin.marinas@arm.com>
>> >> Cc: James Morse <james.morse@arm.com>
>> >> Cc: Marc Zyngier <maz@kernel.org>
>> >> Cc: Will Deacon <will@kernel.org>
>> >> ---
>> >>  arch/arm64/kernel/head.S | 6 +++---
>> >>  1 file changed, 3 insertions(+), 3 deletions(-)
>> >
>> >This looks to be my patch [1], but with a (partially) rewritten commit
>> >message, and my S-o-B dropped.
>> >
>> >There was admittedly one typo in that commit message that needed to be
>> >fixed, but I don't think the rest of the changes were necessary, and I
>> >don't think it's approriate to drop my S-o-B.
>> >
>> >I think similar is true for the rest of the series. The patch fixing
>the
>> >_cpu_resume() only seems to have a paraphrased commit message.
>> >
>> >[1]
>>
>>https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git/commit/?id=ee4323ff6a2ba4c3989b38f13b2c1a516d6c27e4
>> >
>> >Mark.
>> >
>> >> 
>> >> diff --git a/arch/arm64/kernel/head.S b/arch/arm64/kernel/head.S
>> >> index 87a822e5c4ca..c6301557eee1 100644
>> >> --- a/arch/arm64/kernel/head.S
>> >> +++ b/arch/arm64/kernel/head.S
>> >> @@ -254,9 +254,9 @@ SYM_FUNC_END(__primary_switched)
>> >>  	.section ".idmap.text","a"
>> >>  
>> >>  /*
>> >> - * Starting from EL2 or EL1, configure the CPU to execute at the
>> >highest
>> >> - * reachable EL supported by the kernel in a chosen default state.
>If
>> >dropping
>> >> - * from EL2 to EL1, configure EL2 before configuring EL1.
>> >> + * Starting from EL2 or EL1, configure the CPU to execute at EL1.
>> >> + * If dropping from EL2 to EL1, configure EL2 before configuring
>EL1.
>> >> + * To use VHE we'll upgrade back to EL2 later in finalise_el2().
>> >>   *
>> >>   * Since we cannot always rely on ERET synchronizing writes to
>sysregs
>> >(e.g. if
>> >>   * SCTLR_ELx.EOS is clear), we place an ISB prior to ERET.
>> >> -- 
>> >> 2.47.3
>> Hi mark, do you **WANT** your sob? I don't mind.
>
>Please read Documentation/process/submitting-patches.rst
>
>The SoB lines form a chain of authorship and delivery. You *must not*
>drop an SoB line.
>
>> I dropped it because it seemed you didn't care about it (or were too
>> busy),hence, yeah.
>
>I was busy, then on holiday. Neither has any relevance to the SoB lines.
>
>I do care about these patches, and I'm going to have to review them
>regardless. The reason I hadn't posted them was that this is a subtle
>area that needs careful handling.
>
>Mark.
Sorry mate,

V2 will have your SOB on all patches

I removed them due to like, what if you said

"Remove my sob these patches are terrible and unrelated"

Well, this is a corner case, but I had to think this through,

Yep, V2 will have your sob on all 7 patches.
--- Thanks!
https://lore.kernel.org/all/EE579805-42F2-4C58-B752-F28779EEB717@grrlz.net/


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3E2CEA4FC1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 13:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TI4W58jR+3C1//PDYAuyDr0Z6iRNVdMXhQfmV3T4CNI=; b=DGQyWeeoD3zl8Hum1R82qSVqzN
	eAZG4i+kMTnq17jlEsRaCJvsoKILIC7TWWvu1Ua9eSI55XlnXx8GOARXCQykOyckcIAnuMlZUi77H
	sJx+Pf81qrAilomLe0T4TyGJkY7OlguuDkGm8uhWKW/83gsZBE9U3PZWSftB2rUI0p3ZQNf0MhK1/
	iTpobZkubRBp1EBBdcKPbNynSZtwIcnbmba0Dy93TVYZ6rv4PXeNHDNvN5vFvy6/ESsOY5Xbojrx1
	geBCiO8Rm1xd37xdpDy+sQy5Sw2UseIDqnN3Zm92reL78k4WWoERUwQCd8JMIgV3BlhuOs8xWxb49
	L9vr+FfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuWOD-00000000Q5h-3G4N;
	Mon, 23 Feb 2026 13:54:21 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuWO6-00000000Q3P-3sC8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 13:54:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0C2A060018;
	Mon, 23 Feb 2026 13:54:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94A4EC19424;
	Mon, 23 Feb 2026 13:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771854853;
	bh=BkbVqrxwslwfCuDaT1JocKp3CNCm6IksZzE7xGY/xTM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jkG5vNAooI9mXtVVkTGsqErbsf3ihx17bubrXaOQq22tESBMK+KAaN0yBwz44d13x
	 6+QUU+7VRfU4h7OQGFaHFJZRWLBnD0SkcStaAmLcanSkND5o9ypxpjpVoe+2zeQ63C
	 1SqqxtYxfF3rLYsMtMFjFxSQPypf4EBk8eemEDpq4+lsNXPjruCVgGxwUaqsrHtHKr
	 lhZgt+pZ+T4fjPiEp4I/bHP/1kNUs4Ll+UTbqANeIJP4/srbBe95/iHjwYCntGvRL/
	 gqHcS3elMXcNG1yWvyoOdQCeVESf79qfTIbJoRsZAiftw2lQoYsmJyQphs480F/1Iv
	 SEsS030xzeatA==
Message-ID: <d289cacf-043d-46f9-9337-b6249b294c24@kernel.org>
Date: Mon, 23 Feb 2026 14:54:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] fsl-mc: Move fsl_over to device MSI
To: Marc Zyngier <maz@kernel.org>, Ioana Ciornei <ioana.ciornei@nxp.com>
Cc: Thomas Gleixner <tglx@kernel.org>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
References: <20260218135203.2267907-1-maz@kernel.org>
 <kukzdg7cym2cwytx3zgbu5ik2cw7c2zq7irwp6q6o4jzupjzla@qgkrv7emus6f>
 <86ms0za8e0.wl-maz@kernel.org>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <86ms0za8e0.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

Hi Marc,

Le 23/02/2026 à 14:37, Marc Zyngier a écrit :
> On Fri, 20 Feb 2026 15:41:03 +0000,
> Ioana Ciornei <ioana.ciornei@nxp.com> wrote:
>>
>> On Wed, Feb 18, 2026 at 01:51:57PM +0000, Marc Zyngier wrote:
>>> Over the past few years, I have become increasingly annoyed by this
>>> sort of messages in my boot log:
>>>
>>> [    0.067861] fsl-mc MSI: ITS@0x100100040000 domain created
>>> [    0.073352] fsl-mc MSI: ITS@0x100100060000 domain created
>>> [    0.078841] fsl-mc MSI: ITS@0x100100080000 domain created
>>> [    0.084328] fsl-mc MSI: ITS@0x1001000a0000 domain created
>>> [    0.089815] fsl-mc MSI: ITS@0x1001000c0000 domain created
>>> [    0.095303] fsl-mc MSI: ITS@0x1001000e0000 domain created
>>> [    0.100792] fsl-mc MSI: ITS@0x100100100000 domain created
>>> [    0.106281] fsl-mc MSI: ITS@0x100100120000 domain created
>>>
>>> While this is useful on fsl-mc systems, this is completely irrelevant
>>> on 99.99999% of the arm64 machines, which know nothing about the
>>> Freescale stuff. Including all of my machine -- bar *one*.
>>>
>>> Global MSI domains such as the above have been obsoleted for the past
>>> two years, but nobody at NXP seems to have got the message.
>>
>> I do admit that I wasn't aware that this neeeded work. In the future,
>> please let me know of this kind of things and I will do the work.
> 
> I guess Thomas did too good a job not breaking fsl-mc when both PCI
> and platform MSIs were rewritten, hence you missing on the good stuff!
> 
>>
>>>
>>> The obvious solution is to delete some code! While my first port of
>>> call would be to just 'git rm -r drivers/bus/fsl-mc' (only kidding!),
>>> a less invasive solution is to drag that code into the present times.
>>> Which is what this series is doing by converting the whole thing to
>>> device MSI, reusing the platform MSI infrastructure instead of
>>> duplicating it.
>>>
>>> This results in the expected cleanup, and kills the last user of the
>>> non-device-MSI stuff on arm64. You're welcome.
>>
>> Thanks!
>>
>> Tested-by: Ioana Ciornei <ioana.ciornei@nxp.com> # LX2160ARDB, LS2088ARDB
>> Reviewed-by: Ioana Ciornei <ioana.ciornei@nxp.com>
> 
> Thanks for giving it a go.

Don't know what is your merge plan. I wanted to push it to soc fsl tree 
but it doesn't apply on top of v7.0-rc1:

$ LANG= b4 shazam -l 20260218135203.2267907-1-maz@kernel.org
Grabbing thread from 
lore.kernel.org/all/20260218135203.2267907-1-maz@kernel.org/t.mbox.gz
Checking for newer revisions
Grabbing search results from lore.kernel.org
Analyzing 14 messages in the thread
Analyzing 0 code-review messages
Checking attestation on all messages, may take a moment...
---
   ✓ [PATCH 1/6] fsl-mc: Remove MSI domain propagation to sub-devices
     + Tested-by: Ioana Ciornei <ioana.ciornei@nxp.com> (✓ DKIM/nxp.com)
     + Reviewed-by: Ioana Ciornei <ioana.ciornei@nxp.com> (✓ DKIM/nxp.com)
     + Tested-by: Sascha Bischoff <sascha.bischoff@arm.com> (✓ DKIM/arm.com)
     + Link: 
https://lore.kernel.org/r/20260218135203.2267907-2-maz@kernel.org
   ✓ [PATCH 2/6] fsl_mc: Add minimal infrastructure to use platform MSI
     + Tested-by: Ioana Ciornei <ioana.ciornei@nxp.com> (✓ DKIM/nxp.com)
     + Reviewed-by: Ioana Ciornei <ioana.ciornei@nxp.com> (✓ DKIM/nxp.com)
     + Tested-by: Sascha Bischoff <sascha.bischoff@arm.com> (✓ DKIM/arm.com)
     + Link: 
https://lore.kernel.org/r/20260218135203.2267907-3-maz@kernel.org
   ✓ [PATCH 3/6] irqchip/gic-v3-its: Add fsl_mc device plumbing to the 
msi-parent handling
     + Tested-by: Ioana Ciornei <ioana.ciornei@nxp.com> (✓ DKIM/nxp.com)
     + Reviewed-by: Ioana Ciornei <ioana.ciornei@nxp.com> (✓ DKIM/nxp.com)
     + Tested-by: Sascha Bischoff <sascha.bischoff@arm.com> (✓ DKIM/arm.com)
     + Link: 
https://lore.kernel.org/r/20260218135203.2267907-4-maz@kernel.org
   ✓ [PATCH 4/6] fsl_mc: Switch over to per-device platform MSI
     + Tested-by: Ioana Ciornei <ioana.ciornei@nxp.com> (✓ DKIM/nxp.com)
     + Reviewed-by: Ioana Ciornei <ioana.ciornei@nxp.com> (✓ DKIM/nxp.com)
     + Tested-by: Sascha Bischoff <sascha.bischoff@arm.com> (✓ DKIM/arm.com)
     + Link: 
https://lore.kernel.org/r/20260218135203.2267907-5-maz@kernel.org
   ✓ [PATCH 5/6] fsl_mc: Remove legacy MSI implementation
     + Tested-by: Ioana Ciornei <ioana.ciornei@nxp.com> (✓ DKIM/nxp.com)
     + Reviewed-by: Ioana Ciornei <ioana.ciornei@nxp.com> (✓ DKIM/nxp.com)
     + Tested-by: Sascha Bischoff <sascha.bischoff@arm.com> (✓ DKIM/arm.com)
     + Link: 
https://lore.kernel.org/r/20260218135203.2267907-6-maz@kernel.org
   ✓ [PATCH 6/6] platform-msi: Remove stale comment
     + Tested-by: Ioana Ciornei <ioana.ciornei@nxp.com> (✓ DKIM/nxp.com)
     + Reviewed-by: Ioana Ciornei <ioana.ciornei@nxp.com> (✓ DKIM/nxp.com)
     + Tested-by: Sascha Bischoff <sascha.bischoff@arm.com> (✓ DKIM/arm.com)
     + Link: 
https://lore.kernel.org/r/20260218135203.2267907-7-maz@kernel.org
   ---
   ✓ Signed: DKIM/kernel.org
---
Total patches: 6
---
Applying: fsl-mc: Remove MSI domain propagation to sub-devices
Applying: fsl_mc: Add minimal infrastructure to use platform MSI
Applying: irqchip/gic-v3-its: Add fsl_mc device plumbing to the 
msi-parent handling
Patch failed at 0003 irqchip/gic-v3-its: Add fsl_mc device plumbing to 
the msi-parent handling
error: patch failed: drivers/irqchip/irq-gic-its-msi-parent.c:186
error: drivers/irqchip/irq-gic-its-msi-parent.c: patch does not apply
hint: Use 'git am --show-current-patch=diff' to see the failed patch
hint: When you have resolved this problem, run "git am --continue".
hint: If you prefer to skip this patch, run "git am --skip" instead.
hint: To restore the original branch and stop patching, run "git am 
--abort".
hint: Disable this message with "git config set advice.mergeConflict false"


Let me know how you want to proceed.

Thanks
Christophe


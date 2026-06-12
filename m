Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1841FCD98CF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 15:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oj4OSBQnz0GA7HPixnt9F0Aom2fdEs5ktfnUHvQDLXM=; b=hL5aMyjdNbsRcUw84ohM7QkOLj
	IUpVO808XYOt4fbEbCuBN99hw+InGQQHw+3slm0FX9u+BTE4VU7HlaZ/ZtEmouySRxFB2IUV08IlB
	qcO8eSiXZY4fJw/eR0+/+zLephNX63dZ83X0T5Ef8yd5asP+/eSP3FA8C+NVpa+8Dfm0RZcEnN5Hq
	ZDfCfaMwNVuxdDWIsiJIiAiMjnarRYA6nwWIU9jdrrcbooLtTGC9unP+Z3Gq28CevzomDfK4CpbTo
	l5OpM3P8pVkH0ZBV8/F9uyEtUoYZd1gQFL1FdUDDhxKIxSPnFQPPdWTfIQhAYyY3sUofmhxF43C5O
	qOkiSgVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY3U8-0000000B87M-30EV;
	Fri, 12 Jun 2026 15:07:52 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY3U6-0000000B87D-2DOr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 15:07:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id AB74860008;
	Fri, 12 Jun 2026 15:07:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E7D01F000E9;
	Fri, 12 Jun 2026 15:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781276869;
	bh=oj4OSBQnz0GA7HPixnt9F0Aom2fdEs5ktfnUHvQDLXM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=omkZbzHekNdZpuoApEYoUVzTwjapKbAMA0o5TIjJZrmKExMXJOYICab2C2FeR01zx
	 tt62XIO3fJ0r+wJLprm6nhm5psF5O8tXI5uxb4D0ECTylNQqJD3bYHx1oad+JGXyfU
	 pLde+K/DmBPVW14Fiax7+pOhEDYHwjSS/k9PBiRJn6MYFKI5OGhh2wOD0LUZS2YMb3
	 ewDdAyJYLXarD2zcy9DY5fNOF3O53rp3IDu+8PKT8okNIv0K/MFr9pxmsR445k+Agn
	 IwxcT7dKkMBX/WdesRXz+XcvIWKiSULbI7lLFMnTr6ELuS9YIiL0Eg90Ap4aU3H0Mb
	 Ux4iQxyHhuPsw==
X-Mailer: emacs 30.2 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Mostafa Saleh <smostafa@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org, catalin.marinas@arm.com,
	will@kernel.org, rppt@kernel.org, maz@kernel.org
Subject: Re: [PATCH 3/3] arm64/coco: Add pKVM as a CC platform
In-Reply-To: <aivG1rEi3y4GN8kX@google.com>
References: <20260603110522.3331819-1-smostafa@google.com>
 <20260603110522.3331819-4-smostafa@google.com>
 <yq5a1pemsmuj.fsf@kernel.org> <aivG1rEi3y4GN8kX@google.com>
Date: Fri, 12 Jun 2026 20:37:42 +0530
Message-ID: <yq5av7bnlrup.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
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

Mostafa Saleh <smostafa@google.com> writes:

> On Thu, Jun 04, 2026 at 02:29:00PM +0530, Aneesh Kumar K.V wrote:
>> Mostafa Saleh <smostafa@google.com> writes:
>> 
>> > pKVM does support memory encryption, expose that to the rest of
>> > the kernel through cc_platform_has()
>> >
>> > At the moment, all devices inside the guest are emulated which
>> > requires its memory to be shared back to the host (decrypted), so
>> > set force_dma_unencrypted() to always return true.
>> >
>> > Although, typically pKVM guests rely on restricted-dma-pools to
>> > bounce traffic, with this change, it is possible to solely rely on
>> > the default SWIOTLB for that (assuming the appropriate size is set
>> > from the command line)
>> >
>> > Signed-off-by: Mostafa Saleh <smostafa@google.com>
>> > ---
>> > This change is critical for the ongoing refactoring of the DMA-API[1]
>> > that will break protected guests under pKVM with this patch. That is
>> > due to this rework will make the state of the SWIOTLB and restricted
>> > dma pools depends on the value returned by cc_platform_has()
>> >
>> > [1] https://lore.kernel.org/all/20260522042815.370873-1-aneesh.kumar@kernel.org/
>> > ---
>> >  arch/arm64/include/asm/hypervisor.h           | 13 +++++++++++++
>> >  arch/arm64/include/asm/mem_encrypt.h          |  3 ++-
>> >  arch/arm64/kernel/rsi.c                       | 12 ------------
>> >  arch/arm64/mm/init.c                          | 15 ++++++++++++++-
>> >  drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c |  3 +++
>> >  5 files changed, 32 insertions(+), 14 deletions(-)
>> >
>> > index d66291def0f4..26fe9c3f22e3 100644
> [...]
>> > --- a/drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c
>> > +++ b/drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c
>> > @@ -17,6 +17,7 @@
>> >  #include <asm/hypervisor.h>
>> >  
>> >  static size_t pkvm_granule;
>> > +DEFINE_STATIC_KEY_FALSE_RO(pkvm_guest);
>> >
>> 
>> Do we need EXPORT_SYMBOL on this? 
>
> I was not sure about that, all users of this are in tree, I saw RME
> code have the EXPORT but did not know why?
>

arm-cca-guest is one example. I was assuming is_protected_kvm_guest()
would be a helper that could get pulled into various code paths via
force_dma_unencrypted().

If we have not found any build failures for now, we can probably avoid
that change for now.

-aneesh


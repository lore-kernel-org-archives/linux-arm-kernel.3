Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65746606A326
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 12:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=myJ6B7CS;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=KWcOugTQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=44sQKkh8ZCNN9HhAnW328Mo4zI/my71RquicLXgmPs0=; b=myJ6B7CSn2+PkJzaPZStZ3Xnz6
	XiNf7VEnR7vXFsZyeRIQk/OF0O/kb4Cm0X5M7ht7ZH71AhrAfKkKHP6AjoblcrgP5h25P8VBai64E
	AaEb1NUz6m8riU5WFHuvyvgHDsQF32LmzcgeokFbCe/ID7OibDPdUmNpFIQ4hYhkaeganUE1WigMR
	7s5/Mg8ZciahZC9YhLJYs/lyHLYjw7ZrPuddB0V17n6+9k+3SmMvDnhvIkBgiSHBpdsPY1BL36h3b
	P/cUbC+nVzq1FyMzwh9sbdPAZAbt4lTw2Ul3EGvblpPHszPeFE/llMKxuBfibVWNU/NgDwCQtL3jw
	Omx/Szdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOE3B-00000002R5U-2h9L;
	Tue, 03 Nov 2026 12:55:41 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOE38-00000002R42-37Aj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 12:55:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A94C61595;
	Tue,  3 Nov 2026 04:55:32 -0800 (PST)
Received: from arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 39A5F3F628;
	Tue,  3 Nov 2026 04:55:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793710535; bh=FqopgaouZvkZO6sfW6cY0KxqGQEHnXLG2/V0ntSLV+E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KWcOugTQIf03uX1hwv1jxqrIelZdCwUAU4EZu9xmHLyA4xyikQEjhcDUZBLVYcvNK
	 NlYpNK4l4BzrUi5T7j1kNlTliRjGExW08buGFEggBRd5ls0KGLqMOQ/WDRU/tnbUXG
	 pzll+V3sHFhtjx2oRMZ35EE5FzPXnZ+n8vTlHqKg=
Date: Tue, 3 Nov 2026 13:55:23 +0100
From: Beata Michalska <beata.michalska@arm.com>
To: Xuewen Yan <xuewen.yan94@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, Vladimir.Murzin@arm.com,
	catalin.marinas@arm.com, will@kernel.org, suzuki.poulose@arm.com,
	James.Morse@arm.com, seanwang1@lenovo.com,
	linux-kernel@vger.kernel.org, Xuewen Yan <xuewen.yan@unisoc.com>
Subject: Re: [PATCH v4 0/2] arm64: errata: Share broken AMU constant-counter
 handling
Message-ID: <aunZu2vEPjsFPutU@arm.com>
References: <20261001090050.3849551-1-beata.michalska@arm.com>
 <CAB8ipk-3pec4PCteA8+moHveHobE4FZgHbc4WnpKkJRyt=Vwgg@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAB8ipk-3pec4PCteA8+moHveHobE4FZgHbc4WnpKkJRyt=Vwgg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_045538_826128_9181DED9 
X-CRM114-Status: GOOD (  18.94  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 27, 2026 at 02:40:00PM +0800, Xuewen Yan wrote:
Hi,
> Hi Beata,
> 
> Sorry for the late reply.
> 
> On Thu, Oct 1, 2026 at 5:00 PM Beata Michalska <beata.michalska@arm.com> wrote:
> >
> > This series factors out the existing Cortex-A510 erratum 2457168 AMU constant
> > counter workaround into a generic broken AMU constant-counter capability,
> > then wires Cortex-A725 erratum 3821522 into the same handling.
> >
> 
> Has this patch only been applied to the A510 and A725 so far? As far
> as I know, no chip has received a fix for this issue yet, including
> the C1-Pro...
> 
Will send an update shortly.

---
BR
Beata
> Thanks！
> > ---
> > v4:
> > - use midr range instead of multi cap list
> > - reword comment to be more generic
> >
> > v3:
> > - splitted the commit and droped changes for cpucap_is_possible
> > ---
> >
> > Beata Michalska (2):
> >   arm64: errata: Factor out broken AMU const counter cap
> >   arm64: errata: Add Cortex-A725 erratum 3821522 workaround
> >
> >  Documentation/arch/arm64/silicon-errata.rst |  2 ++
> >  arch/arm64/Kconfig                          | 30 +++++++++++++++++++++
> >  arch/arm64/kernel/cpu_errata.c              | 24 ++++++++++++-----
> >  arch/arm64/kernel/cpufeature.c              |  2 +-
> >  arch/arm64/kernel/topology.c                | 16 ++++++-----
> >  arch/arm64/tools/cpucaps                    |  2 +-
> >  6 files changed, 61 insertions(+), 15 deletions(-)
> >
> > --
> > 2.43.0
> >


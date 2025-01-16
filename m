Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7F2DC02187
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 15:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jlJ8pqY5C0bNjM+wMnYgJsyguzdkh4Eg/hpzks6Zipw=; b=2hd/cRG8eNv5+Vr4dAOEUbLR4W
	zI/S1JRUk2B4wU/33mMv2i+4x1MeBOM9daFcwXT7jpTTgQKTDaEPN7deiClFvxFBHBJmMHmW4QOqM
	mhyqLosgASWBUjzWbi2bN7tNrkyo/SsNm5cc652+LMc8WqvmLXBdS+OXrEBuR5XH5+ls5S/PvfJjd
	7BCme0ALGz+uPj/72zqNIAYFcbRJppeODmb4ukY/yjs6bvR34aU0jp3RQRr5TK7eU92IGfzWV98su
	Ac/IEDGxE8hCQOC2gRgTSO72je+u6Cov+XeVl0lUOaP9HqO36G3K/nhqMk7E25Btl/tqLnl/epzRw
	T0Yeya8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYRtt-0000000FLgb-1nie;
	Thu, 16 Jan 2025 15:35:17 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYRrQ-0000000FLLr-47zE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 15:32:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D7E7DA42056;
	Thu, 16 Jan 2025 15:30:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4B50C4CED6;
	Thu, 16 Jan 2025 15:32:40 +0000 (UTC)
Date: Thu, 16 Jan 2025 15:32:38 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Rob Herring <robh@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	linux-arm-kernel@lists.infradead.org, Will Deacon <will@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>,
	Eric Auger <eric.auger@redhat.com>, kvmarm@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] arm64/boot: Enable EL2 requirements for FEAT_PMUv3p9
Message-ID: <Z4kmlhnlpKjS_MII@arm.com>
References: <20241220072240.1003352-1-anshuman.khandual@arm.com>
 <20250102160402.GB3990035-robh@kernel.org>
 <Z30adHnQ7ZFaU9UR@arm.com>
 <CAL_JsqLLnh1o4L1=PpNt5brBwZZCgp7mOygByOYakchrzc29Ow@mail.gmail.com>
 <86wmf5wo8u.wl-maz@kernel.org>
 <CAL_JsqKKiEOj=a1k6U-bB0F6-ht7QokDnh3bspHupp-QG=haSg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAL_JsqKKiEOj=a1k6U-bB0F6-ht7QokDnh3bspHupp-QG=haSg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_073245_086555_45AACD0B 
X-CRM114-Status: GOOD (  16.69  )
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

On Wed, Jan 08, 2025 at 07:47:16AM -0600, Rob Herring wrote:
> On Wed, Jan 8, 2025 at 5:15 AM Marc Zyngier <maz@kernel.org> wrote:
> > On Tue, 07 Jan 2025 22:13:47 +0000,
> > Rob Herring <robh@kernel.org> wrote:
> > > On Tue, Jan 7, 2025 at 6:13 AM Catalin Marinas <catalin.marinas@arm.com> wrote:
> > > > But does KVM actually expose the feature to EL1 in ID_AA64DFR1_EL1 and
> > > > than traps it at EL2?
> > >
> > > As Marc pointed out KVM only advertises PMUv3.8. Regardless, guest
> > > accesses to these registers are trapped with or without this series.
> >
> > And most probably generates a nice splat in the kernel log, as nobody
> > updated KVM to handle *correctly* PMICNTR_EL0 traps, let alone deal
> > with the FGT2 registers.
> 
> Isn't that this series[1]? Should that have come first, I guess I know
> that *now*.
[...]
> [1] https://lore.kernel.org/all/20241210055311.780688-1-anshuman.khandual@arm.com/

It's not any clearer to me. Does this series depend on the 46-patch one?
Or, if we had the other, is this no longer needed? Or none of these,
they are independent.

-- 
Catalin


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8213AE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Dec 2024 16:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MeRRGLDDb0ux1182zAHVdE8lHrLfJb7fiMK9nZBfy2I=; b=V4gFMVdIw2ZqzgzEjGssiAW3rR
	4jwZjuZ/3JupgnAxm51/R9GzW38WC4MgA1+5YVsxCC1sB1vK+KC34sLMC01DBNNds0sHMMVx2PBCl
	HGD6t19rVA9Pav+H5c/k5FEsdB3A/vt0dTCjbBVnTF7XY+LRfLYho9nnVWjLbMtiKuSYtbliHqxGC
	nhZnzkHgRygNjW6MrDmycRmZGmzzH/iZ3kk6+PG1whnZHLsZFsJs6WCMgNFWYUlpT017XaoVF3fJ6
	qnnGrKAG6+OU+72PXb2wNbTkwGjI1Eo6ebRo/BJzTIbkFD7MUN+5X8xNVSl1RvLfV9fqbV0UZ57Jw
	9VrdXnGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM8xS-00000004UtA-2lvp;
	Fri, 13 Dec 2024 16:56:06 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM8ui-00000004UB2-20TQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Dec 2024 16:53:17 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C9E841480;
	Fri, 13 Dec 2024 08:53:41 -0800 (PST)
Received: from mazurka.cambridge.arm.com (mazurka.cambridge.arm.com [10.1.196.66])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C20F33F5A1;
	Fri, 13 Dec 2024 08:53:11 -0800 (PST)
Date: Fri, 13 Dec 2024 16:53:09 +0000
From: =?utf-8?Q?Miko=C5=82aj?= Lenczewski <miko.lenczewski@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Ryan Roberts <ryan.roberts@arm.com>, catalin.marinas@arm.com,
	will@kernel.org, corbet@lwn.net, oliver.upton@linux.dev,
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev
Subject: Re: [RESEND RFC PATCH v1 2/5] arm64: Add BBM Level 2 cpu feature
Message-ID: <20241213165309.GE30314@mazurka.cambridge.arm.com>
References: <20241211160218.41404-1-miko.lenczewski@arm.com>
 <20241211160218.41404-3-miko.lenczewski@arm.com>
 <87cyhxs3xq.wl-maz@kernel.org>
 <084c5ada-51af-4c1a-b50a-4401e62ddbd6@arm.com>
 <86ikrprn7w.wl-maz@kernel.org>
 <2b1cc228-a8d5-4383-ab25-abbbcccd2e2c@arm.com>
 <86h678sy00.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <86h678sy00.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_085316_558726_08718500 
X-CRM114-Status: GOOD (  21.74  )
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

> > 
> > From the ARM:
> > """
> > RFCPSG: If level 1 or level 2 is supported and the Contiguous bit in a set of
> > Block descriptors or Page descriptors is changed, then a TLB conflict abort can
> > be generated because multiple translation table entries might exist within a TLB
> > that translates the same IA.
> > """
> > 
> > Although I guess it's not totally explicit, I've interpretted that as saying
> > that conflicting TLB entries can only arise for the IA range for which the
> > contiguous bits have been modified in the translation tables.
> 
> Right, that's reassuring, thanks for digging that one.
> 

Thanks Ryan, will improve the comment and commit messages to make this
clearer and to include references to this information.

> > > If anything, this should absolutely check for FAR_EL1 and assert that
> > > this is indeed caused by such change.
> > 
> > I'm not really sure how we would check this reliably? Without patch 5, the
> > problem is somewhat constrained; we could have as many changes in flight as
> > there are CPUs so we could keep a list of all the {mm_struct, VA-range} that are
> > being modified. But if patch 5 is confirmed to be architecturally sound, then
> > there is no "terminating tlbi" so there is no bound on the set of {mm_struct,
> > VA-range}'s that could legitimately cause a conflict abort.
> 
> I didn't mean to imply that we should identify the exact cause of the
> abort. I was hoping to simply check that FAR_EL1 reports a userspace
> VA. Why wouldn't that work?
> 

Will do so.

Kind regards,
Mikołaj


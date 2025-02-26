Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A25DFC19776
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 17:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mBiqHB2obMC8e9sPF6jvTN0xYi6+AsQqwHFmIEjfryk=; b=ADHzmxydCyF7yKhSxDiiZ5XNhF
	9OOOSf/pvr3nXjdBvRE/FtiWd8KLqlWsESA0yL9c1wqRUScGTMjLnxyJSTz6dmv5ggGZZk1OPjRsr
	eQ86rueA3k0P2NPR4eq4tNmZKP3d7wcb176eYG6XiAM4juxP7cC1sp1gShaKNEPJyK953Y3Hmbill
	CPQKU7YY0lWpB80ujGl+hT39k/Tw9VpaiKiFmTSHIISHsSa2dg6QZulYXGHVa9krL/mlqtmkiSa2N
	tgY02Z4n2V/zyxHQ1v5YmIoCAsXN5nrXj6juu6UxCYNdoIjEKlTzFZGE+ZWCwjZZeGm3QLcw5YQZt
	gVXw/xgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnLUT-00000004m5x-1TWb;
	Wed, 26 Feb 2025 17:46:37 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnLSp-00000004ljZ-2LuL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 17:44:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1D1295C73C1;
	Wed, 26 Feb 2025 17:44:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 704AAC4CED6;
	Wed, 26 Feb 2025 17:44:52 +0000 (UTC)
Date: Wed, 26 Feb 2025 17:44:49 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Rob Herring <robh@kernel.org>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org, Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>,
	Eric Auger <eric.auger@redhat.com>, kvmarm@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2 7/7] arm64/boot: Enable EL2 requirements for
 FEAT_PMUv3p9
Message-ID: <Z79TETeXBDG_c8ep@arm.com>
References: <20250203050828.1049370-1-anshuman.khandual@arm.com>
 <20250203050828.1049370-8-anshuman.khandual@arm.com>
 <Z7x-EDH9QP7g4lC6@J2N7QTR9R3.cambridge.arm.com>
 <2ca1dc13-cd5a-4597-9733-2343e05f53b3@arm.com>
 <CAL_Jsq+dJiRLNM_QE_r6HOg7hEkJCPR6j-TGBpiJZLd+RDBbAA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAL_Jsq+dJiRLNM_QE_r6HOg7hEkJCPR6j-TGBpiJZLd+RDBbAA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_094455_644709_48E3D3FB 
X-CRM114-Status: GOOD (  12.18  )
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

On Wed, Feb 26, 2025 at 11:14:57AM -0600, Rob Herring wrote:
> On Tue, Feb 25, 2025 at 12:17 AM Anshuman Khandual
> <anshuman.khandual@arm.com> wrote:
> > To summarize
> >
> > - Update arm64/booting.rst regarding MDCR_EL3.EnPM2
> > - Add above mentioned "Fixes:" tag and "CC: stable"
> > - But should respin this patch or send a fix up instead ?
> 
> It is not applied yet, right? So respin.

It's applied but I'm fine with a respin, especially if we need a cc
stable + Fixes, it's easier to track.

Just don't repost the whole series, the first 6 patches are on the arm64
for-next/sysreg branch.

Thanks.

-- 
Catalin


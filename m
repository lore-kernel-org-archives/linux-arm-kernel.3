Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F648D35171
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 11:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xTEOHtVIN0npoeK++K0+EY9Tl2M2s58IAW8WD3t0Ygw=; b=hP2ACAjxibReQa/x3v/ajH0067
	HitgND+EecXYlwAIRURr/zI7aAznoB1rFNbMYoo35R6sSU0EdcV5rYELxyy9bxL1P7zunDwCzqGu0
	9rio2aZYqlseM4+3ckfP097l/exWGJznH5vu5RaH2KP7Ni+WWYtFFvYx3q6z7n9Uym4pZelorSFA1
	sG0Acteos/4fAzPwkD74Nx7+iok6vscspurW8KQEWIVL/egWHUm2kW54qAUs3fo1WeD4A13lkHtm4
	GnL0rutDM/u6OiWI/XRAQC2G9dUcQ5NMaGurRxJzWd6JYFWVNb9LCxUjv1CX2oTHbBRqWElkH1y+a
	lDLytH2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7tgU-0000000Edbs-0b2S;
	Wed, 01 Apr 2026 11:24:30 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7tgS-0000000Edb4-2Lcn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 11:24:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AE15F6013F;
	Wed,  1 Apr 2026 11:24:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B4B2C2BC9E;
	Wed,  1 Apr 2026 11:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775042667;
	bh=y/ngwuhS2Jpyc7YPVHpxC4rTjEHqs+MNlAUE9lvy6ms=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uFKQByonYUSgTjPkV2Aykn9g5VCvZzzHo/SC8SWELW+CT47wk5/9yIzsD9e5tgW0q
	 ikjhfUMqzGaiDJ3xfyewqYzurXovNyxW8PMZoWcae1t1qHdnBOkTsvGqXps7P0TEdX
	 q4mu4LTbUE1qxawxTqo52soq7OtLm/uC97bOmJu/ZHPyMFi/Y8uSXI9VSyu6cWsoN0
	 U021ThzgmwK4I3X76ee4qRsUs4KBXbFSomPFTTvGXSGoncqOIjfCilOgb3hScksV2A
	 vfZ9gB4d2csuedAb/TTiBnHD4vqKlEqeMXKD40bUBIDfHA+Z8CxC/M8BE7Vr4eQIMr
	 Lct2gHc9KEyoA==
Date: Wed, 1 Apr 2026 13:24:25 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: soc@kernel.org, linux-arm-kernel@lists.infradead.org, 
	kernel@pengutronix.de
Subject: Re: [GIT PULL] Reset controller fixes for v7.0, part 2
Message-ID: <20260401-imperial-hare-of-defense-8cfc87@quoll>
References: <20260324094255.3538772-1-p.zabel@pengutronix.de>
 <39b18202a275168eb4344a2515f7c18723eaf8b0.camel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <39b18202a275168eb4344a2515f7c18723eaf8b0.camel@pengutronix.de>
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

On Tue, Mar 24, 2026 at 10:55:47AM +0100, Philipp Zabel wrote:
> On Di, 2026-03-24 at 10:42 +0100, Philipp Zabel wrote:
> > Dear arm-soc maintainers,
> > 
> > The following changes since commit e0cf84109bc6c6768337123f1de24ff56b41c91b:
> > 
> >   reset: rzg2l-usbphy-ctrl: Check pwrrdy is valid before using it (2026-02-23 17:03:28 +0100)
> > 
> > are available in the Git repository at:
> > 
> >   https://git.pengutronix.de/git/pza/linux.git tags/reset-fixes-for-v7.0-2
> > 
> > for you to fetch changes up to a0e0c2f8c5f32b675f58e25a9338283cedb5ad2b:
> > 
> >   reset: spacemit: k3: Decouple composite reset lines (2026-03-23 12:25:47 +0100)
> > 
> > ----------------------------------------------------------------
> > Reset controller fixes for v7.0, part 2
> > 
> > * Decouple spacemit K3 reset lines that were incorrectly coupled
> >   together as one, but are in fact separate resets in hardware.
> 
> It is important that this makes v7.0, as it fixes an incorrect binding
> that has not been part of a release and which has no users yet.
> 
> > * Fix a double free in the reset_add_gpio_aux_device() error path.
> >   This has already been fixed on reset/next by commit a9b95ce36de4
> >   ("reset: gpio: add a devlink between reset-gpio and its consumer").
> 
> Because of this, commit fbffb8c7c7bb ("reset: gpio: fix double free in
> reset_add_gpio_aux_device() error path") introduces a merge conflict
> with reset/next:
> 
>   https://lore.kernel.org/all/acFRVzvV9Dww47v_@sirena.org.uk/
> 
> Should I resolve this myself by merging this tag in to reset/next as
> well, before submitting reset updates for v7.1?

Yes, please merge the fixes to your next branch. Or base next branch on
top of fixes commit, when starting next as new branch.

This merge conflict looks quite significant.

Best regards,
Krzysztof



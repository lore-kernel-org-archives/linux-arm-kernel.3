Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1E3CD58E4D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 07:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qMFyRd+j7d7R0AqLvlGfwF9aHgEaiOv7xHAZcYil3Cc=; b=uP7WeaRLP5L+fH5np5R9lOQqtP
	EjZGpX1eySVtHw+WDwJtyImHzL4QeLUXFPoaqV8EF6kVbxVmWvb23bcGhbwi6jjFKjXFf9rGdG8oe
	1d++2NBPEoESdbWGSLk/KysWqTNFL7DkwN5pzrvVjIqHks4UUfW2IVidr1mArsGlwaN/ku433aK68
	SiGN8zILPyNADv7P8NTtSYeTMR62BmgkoOxCLo5nS3ytf/rwB3B9kTZGINVSUoV0USrtLPez7QEW8
	OmsT3MkSI5yoy1IGy0JqULMkFzaZOi4+gGkiJKZxFMdXaOP1FdtcoZhg+rMswKCk9bu+FXLaiqIur
	CNIaiyRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxgpe-0000000Gd4C-43Sv;
	Wed, 04 Mar 2026 07:39:46 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxgpd-0000000Gd41-3Riu;
	Wed, 04 Mar 2026 07:39:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 40AEC6132D;
	Wed,  4 Mar 2026 07:39:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BE5AC19423;
	Wed,  4 Mar 2026 07:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772609984;
	bh=qdRtPAje6I7hfutoJeNmqVJEJbOGSUjuE1RqijSch3c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fx6eA5xbdBXKpUHh3/IErKPDYWgCQMOpGOgNwTTtlboSsMT2zDcFz4NP5doi6f89r
	 wDKDYQeygqdWZ3mckkpNuFdbCfd9ISn/LHbPM9+po9wMN0ke2Sq7okB4Em152CfeS7
	 cHnKusNJdzuRkyL49/kkyPGm0S05gkX52f+CEf8AkGOXVj/UAh7L7oxwfIh2Wjrk0z
	 Uxwt75SSIBzP873g1BaZ1O28zSg88gOejUG65uXc3y0NEGpIfjbh1ee3vw3ipsZ+K4
	 RNckEFqYZcobNZEEh/wYAn7allEHlvCfsipl4IjAMA9/4k7dAre3Z5h+ezsAFDvhaq
	 dolGMc42cY2Dg==
Date: Wed, 4 Mar 2026 08:39:42 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Bo Gan <ganboing@gmail.com>
Cc: Conor Dooley <conor@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
	lizhi2@eswincomputing.com, devicetree@vger.kernel.org, andrew+netdev@lunn.ch, 
	davem@davemloft.net, edumazet@google.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, netdev@vger.kernel.org, pabeni@redhat.com, 
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, rmk+kernel@armlinux.org.uk, 
	wens@kernel.org, pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, linux-riscv@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, ningyu@eswincomputing.com, linmin@eswincomputing.com, 
	pinkesh.vaghela@einfochips.com, pritesh.patel@einfochips.com, weishangjuan@eswincomputing.com
Subject: Re: [PATCH net-next v3 1/3] dt-bindings: ethernet: eswin: add clock
 sampling control
Message-ID: <20260304-stalwart-raptor-of-cleaning-446b61@quoll>
References: <20260303061525.846-1-lizhi2@eswincomputing.com>
 <20260303061637.872-1-lizhi2@eswincomputing.com>
 <20260303163846.156d18f7@kernel.org>
 <20260304-regulate-verdict-c3a361d2dc83@spud>
 <05a15890-392c-41c3-9566-8eb506ddfe5f@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <05a15890-392c-41c3-9566-8eb506ddfe5f@gmail.com>
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

On Tue, Mar 03, 2026 at 05:23:18PM -0800, Bo Gan wrote:
> Hi All,
> 
> On 3/3/26 16:47, Conor Dooley wrote:
> > On Tue, Mar 03, 2026 at 04:38:46PM -0800, Jakub Kicinski wrote:
> > > On Tue,  3 Mar 2026 14:16:37 +0800 lizhi2@eswincomputing.com wrote:
> > > > There are currently no in-tree users of the EIC7700 Ethernet driver, so
> > > > these changes are safe.
> > > 
> > > What do you mean by this sentence? The commit under Fixes was part of
> > > Linux v6.19 already.
> > 
> > The "funny" thing is that caring about users doesn't even really matter
> > on the devicetree patch, except for this hunk:
> > |@@ -81,7 +99,9 @@ properties:
> > |                          or external clock selection
> > |           - description: Offset of AXI clock controller Low-Power request
> > |                          register
> > |+          - description: Offset of register controlling TXD delay
> > |           - description: Offset of register controlling TX/RX clock delay
> > |+          - description: Offset of register controlling RXD delay
> > |
> > | required:
> > |   - compatible
> > And it only matters here because an item is injected mid-list. If this
> > was moved to the end with the RXD delay, the **dt-binding** changes
> > don't have issues with safety. I've not looked at whether there are
> > knock-on concerns about users in the driver or whatever yet, but from a
> > binding POV only that hunk can break something that currently works.
> 
> This was already discussed here in v1:
> https://lore.kernel.org/lkml/e7183ae1-8b8b-4e77-9f4e-3bc1b4b63556@lunn.ch/
> 
> The device-tree is not checked in yet by ESWIN folks, so there's currently
> no user of the dt-binding. No need to worry about backward compat.

Of course there is user of this binding, for example ESWIN. Or many
other vendors using it out of tree. You documented ABI.

Best regards,
Krzysztof



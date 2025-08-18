Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AED9DCA0EE9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 21:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kd+IXbkrMS5qiS+Sd0sXzW37rFNI73FRN7pVjSKY668=; b=4G675+TT1oEF0qHEALLfOvUl5N
	q2pMp8hccNhs3AiO1i/iTM2nfZjrFJiVyizJvdKsQ7zY6jtMVRel1duqZLeJvnefmIdUTMuuWNDl6
	j34XmKW36MdmJLC6RPcCn6ZXTx1a+zExpPIn1efJNG6K0VXVGMaIu+H6cmOPO2Je5iZLbXZeamnnM
	ZlT1f4df6mrdSWdpc6XXxzJmE+5nVJ7/8UZFcgrysd/vHsjbjM8aco7OJQgUDc7YH4hfq4xD5gC4O
	6l54bf2wMCuLlOdijQ2iQkdXjCOxkbPEO2s48X/tB9D7gaukPJkxi3kg4d8vJint3KxE55mzKjxkB
	2fMllhaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo7Nv-00000008i5W-3u4U;
	Mon, 18 Aug 2025 21:27:19 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo5Uy-00000008Vgg-2543
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 19:26:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Kd+IXbkrMS5qiS+Sd0sXzW37rFNI73FRN7pVjSKY668=; b=goN7U/QS6bPVXFS85mifHaha++
	mt627KyDXT7bQ2rbldEKEwyKL+Ibd3XZWKVfwmUKRPWs3t+Vc1yCjqDWYl17Ix4BhYydjKdaEZURC
	XHvfokBXFoV5bhY0UTdkJlpesXobGS0EwLeQ/oyzLRnnH7xpjYU/6iMO6iUKYenZO9bRO6C/IWgA1
	XYISo4fsVze3vSN3CN5MvoopPNbxehtEildTjTg1dncrsgZTrIfNJI7qUfpN5o+MhsQCFJ0Ho0T9t
	CzW+rD19rT5+KsztxLUvx/66g58mMe3/Q5KbH6nxNwBpzLPjihysdilfP3aOMmW+4kbsMhxj0YpYA
	dY/3SAaA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:38234)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1uo5Uf-00028K-1Q;
	Mon, 18 Aug 2025 20:26:10 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1uo5Ub-0002hA-1M;
	Mon, 18 Aug 2025 20:26:05 +0100
Date: Mon, 18 Aug 2025 20:26:05 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: linux-kernel@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Choong Yong Liang <yong.liang.choong@linux.intel.com>,
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFC] net: stmmac: Make DWMAC_ROCKCHIP and DWMAC_STM32
 depend on PM_SLEEP
Message-ID: <aKN-Tdfvc3_hD2p7@shell.armlinux.org.uk>
References: <7ee6a142-1ed9-4874-83b7-128031e41874@paulmck-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7ee6a142-1ed9-4874-83b7-128031e41874@paulmck-laptop>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_122628_532918_352D12E1 
X-CRM114-Status: GOOD (  18.47  )
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

On Mon, Aug 18, 2025 at 12:11:09PM -0700, Paul E. McKenney wrote:
> Hello!
> 
> This might be more of a bug report than a patch, but here goes...
> 
> Running rcuscale or refscale performance tests on datacenter ARM systems
> gives the following build errors with CONFIG_HIBERNATION=n:
> 
> ERROR: modpost: "stmmac_simple_pm_ops" [drivers/net/ethernet/stmicro/stmmac/dwmac-rk.ko] undefined!
> ERROR: modpost: "stmmac_simple_pm_ops" [drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.ko] undefined!

The kernel build bot caught this, and I asked questions of Rafael last
week and have been waiting for a response that still hasn't come.

However, there was some discussion over the weekend (argh) on IRC from
rdd and arnd, but I didn't have time over a weekend (shocking, I know,
we're supposed to work 24x7 on the kernel, rather than preparing to
travel to a different location for medical stuff) to really participate
in that discussion.

Nevertheless, I do have a patch with my preferred solution - but whether
that solution is what other people prefer seems to be a subject of
disagreement according to that which happened on IRC. This affects every
driver that I converted to use stmmac_simple_pm_ops, which is more than
you're patching.

I've been missing around with medical stuff today, which means I also
haven't had time today to do anything further.

It's a known problem, but (1) there's been no participation from the
kernel community to help address it and (2) over the last few days I've
been busy myself doing stuff related to medical stuff.

Yea, it's shocking, but it's also real life outside of the realms of
kernel hacking.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!


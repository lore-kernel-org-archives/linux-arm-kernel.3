Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC473E9A752
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 09:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O3zSGBMOP8SLkvjNah7bxtlePOkK0bAZhrbaj4sgYC0=; b=DX3rXoutr27pBwyYGKeOq4rIHA
	F4SMQjRCe0Mug05FMzzvpcA/Emf4mn8MdmccrDyYQL9OrvNbbmIj0SPrvdIM6T0Y7Sru+ID/wrpSf
	+2Ji//hY2ybNo8dp3ObwRUfl3OoL8x6j1rG8Do6lIOm9SrscHRXjtUdUcrDvcwJ4ZgdFLmrXTEBJ0
	ASl8HRIzAx1e88dJ/hdb1xX0W7G5r268t/OVVyP3r0oGCZDd+hKm+PesDOMuUWaVE8oiTRp6SB5oN
	xHt24Lpt/FsJuxdkzQh0LNAJbJhOr0FlY4SvzuBBnDePMnwQaLSOHqrRVyEGupX0pxEsXOsogkzyF
	89yb3QkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4yNn-0000000188j-2wse;
	Tue, 24 Mar 2026 09:49:07 +0000
Received: from pandora.armlinux.org.uk ([78.32.30.218])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4yNk-00000001887-2HUh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 09:49:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=O3zSGBMOP8SLkvjNah7bxtlePOkK0bAZhrbaj4sgYC0=; b=WdBMv7lOsX71X7cUozgMFqvRlJ
	DHuyWR1HAIB7+KhaI0Yeg5lREb6TcGa0VmTBcumcYtoEufxf/LjCR6dPA1i/sPgh6F+d+58qIPxnP
	0HRnoRDi/9HiBCzYlnUl3Bzi6m9qPbvHPQwKss/btlVQfCnJggD51pS7XJArB+X0AKIBX0HgKCoYW
	eqGgsBn0Nr6lPXHbIpHlgJAPyIWxTxjzwbk3FbckBB4J01cqOPC2/cUtcfZsEYI3z2F2vAbN4aZLx
	wgJlCcpfWUmgBxOp95WyJLgaxY6cc843MuQC6A+c2Mqn+P7aESeRBgHSBg0Vut9nbj/8F57QwuPk7
	wzoeiVAQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:56490)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1w4yNZ-000000001hO-22Vr;
	Tue, 24 Mar 2026 09:48:53 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1w4yNX-000000004xr-3Knl;
	Tue, 24 Mar 2026 09:48:51 +0000
Date: Tue, 24 Mar 2026 09:48:51 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Jakub Kicinski <kuba@kernel.org>,
	davem@davemloft.net, Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	thomas.petazzoni@bootlin.com,
	Alexis =?iso-8859-1?Q?Lothor=E9?= <alexis.lothore@bootlin.com>,
	Rohan G Thomas <rohan.g.thomas@altera.com>,
	Mun Yew Tham <mun.yew.tham@altera.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH net-next 2/5] net: stmmac: dwmac-socfpga: Use the
 socfpga_sgmii_config() helper
Message-ID: <acJeA6c2M4eSrxC4@shell.armlinux.org.uk>
References: <20260324092102.687082-1-maxime.chevallier@bootlin.com>
 <20260324092102.687082-3-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260324092102.687082-3-maxime.chevallier@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_024904_582268_4833913F 
X-CRM114-Status: UNSURE (   7.58  )
X-CRM114-Notice: Please train this message.
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

On Tue, Mar 24, 2026 at 10:20:57AM +0100, Maxime Chevallier wrote:
> Use the existing socfpga_sgmii_config() helper in
> socfpga_dwmac_fix_mac_speed(), instead of re-coding the register access.
> 
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Thanks!

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!


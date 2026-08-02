Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCB65C55171
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Aug 2026 15:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xLT0nYUZfgrQIfwgHzReTeSdEFhpRIhjhhekCFsbM6E=; b=iAZlPLxRSyhPd+EtLlQqyxIsWY
	1/c49KedJk+yfqtkQ3UKyeVVwtgMVELGDt/ZO/31cp5hOoXuV4eRUxai6ZSxKtU60gonJLX63t8R/
	yumE/x+OO1dbRkFkrTK7IGDn0nIxZhn7+I2pK/6Fb/bSqESLw3JMq/+Sz4TqI43wiQ5BUumm+EkJh
	EMg6E0mCAnArI6Cd7D/VPtxv/wKSeyKlyr1SaDX9NYV343gxIlEhHIF8147RuEuasgSMDen6I7XuN
	lvbJD/1np/MHRKtdJpv0J3ng3QOgATedP3GBxrKdUjZfNmY1jhNFsU9M0sSA0RwCv61Z9HrPEVsBf
	8YawLMiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqXi0-0000000Fluq-2uNu;
	Sun, 02 Aug 2026 15:02:36 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqXhy-0000000Fltw-2gPB
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Aug 2026 15:02:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=xLT0nYUZfgrQIfwgHzReTeSdEFhpRIhjhhekCFsbM6E=; b=xmowSal7u0s+kzQGmyUMBwtMj4
	IVWXC5+B4CyEczCVDAcIOuPU2BdnHDnRsl1Awfi3SIVhW3SVcfSCuhB14cl+C+s9Nm/pePX0jK6C9
	rd94MGaTt9BhWFZXFdeXy6cPOH02VfstvYE9wRKCnhAloU/Av7AYTciYPUn3FUz93CoU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wqXhn-00FaJs-7O; Sun, 02 Aug 2026 17:02:23 +0200
Date: Sun, 2 Aug 2026 17:02:23 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, Jakub Kicinski <kuba@kernel.org>,
	davem@davemloft.net, Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Russell King <linux@armlinux.org.uk>, thomas.petazzoni@bootlin.com,
	Alexis =?iso-8859-1?Q?Lothor=E9?= <alexis.lothore@bootlin.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH net-next 1/2] net: stmmac: ethtool: Comment the magic
 numbers in RIWT computation
Message-ID: <d82898bc-2d03-4701-8cdd-47716256c55a@lunn.ch>
References: <20260802114015.214212-1-maxime.chevallier@bootlin.com>
 <20260802114015.214212-2-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260802114015.214212-2-maxime.chevallier@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260802_080234_678165_718DB389 
X-CRM114-Status: UNSURE (   9.29  )
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

On Sun, Aug 02, 2026 at 01:40:13PM +0200, Maxime Chevallier wrote:
> Receive Interrupt Watchdog Timer is an RX interrupt coalescing mechanism
> used by some variants of dwmac. It allows waiting a bit before
> triggering the rx interrupts, allowing for batch processing.
> 
> The RIWT is configured with a granularity of 256 stmmac clk ticks. Let's
> add a comment for that and wrap the raw "1000000" into USEC_PER_SEC, as
> we're computing "how many clock cycles in one microsec" with that step.
> 
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew


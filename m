Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A232D3EE8A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 16:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x2dQyO1BXqOqYRRXDNe0klaUkU2ZBvXuHHMcmtAYPNU=; b=wcfTHwHoKyOKMCjo9nUjL42jyu
	92dehFfvFkmv0sRqSkANMF0TG0gZ/UPMWoVg/5eUjUP+vjnQ7NDbXV443euK7RE9gGc6VWcI85AxM
	Qfm1QR3pM6Zj0+M9uOZG3nPvqln/BVp+p0keT0q0P1M8mCSk/sA1T9dtGP3dMCx/Ff5/DdZt7xiL5
	Mndtgd6TRBegJUv3Y4YzWHJzw9DZnA8Pstt8hhW01Iu19tEoWLaKT9JRvntoWYUyrMb+u+Is9ccPZ
	ARREHNsNjEmHF3BQHiwRdwYMejDkAont9sUtBkt/cdRPnm1QSShmCJLgxmZmrWyNByKICGcV+w/L1
	hdj3QK7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vixTI-00000007RWA-1FDs;
	Thu, 22 Jan 2026 16:23:48 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vixTE-00000007RVN-3UJd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 16:23:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=x2dQyO1BXqOqYRRXDNe0klaUkU2ZBvXuHHMcmtAYPNU=; b=2FSC/6chOM83HZdThImQ2Mqwik
	RbgUT06piy1N76UQgy/ONN32jyONLx0rF6yc82LY0mRTZT3/3pCeDK69+BzEkqPY5vYVxL/tc+F6I
	A+wyepZpn6X39oZfy+/yZGUicb6j8/gZxPZ3v/SH16ukqz+eCEfAgp7PxBYVlleQ5JSM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vixT3-00401P-QJ; Thu, 22 Jan 2026 17:23:33 +0100
Date: Thu, 22 Jan 2026 17:23:33 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Lukasz Majewski <lukma@nabladev.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-clk@vger.kernel.org,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] clk: vf610: Add support for the Ethernet switch clocks
Message-ID: <4a593537-e848-4ed2-b6c9-fd2e6b165f73@lunn.ch>
References: <20260122130649.4150338-1-lukma@nabladev.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260122130649.4150338-1-lukma@nabladev.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_082344_869180_D69D13E5 
X-CRM114-Status: GOOD (  10.73  )
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

On Thu, Jan 22, 2026 at 02:06:49PM +0100, Lukasz Majewski wrote:
> The vf610 device has built in the MoreThanIP L2 switch. For proper
> operation it is required to enable ESW and MAC table lookup
> clocks.
> 
> The MAC table spans from 0x400E_C000 for 0x4000 and it is necessary
> to provide clocks for each AIPS1-"slot", which size is 0x1000
> (hence four separate entries).
> 
> Those can be enabled via clock gating CCM_CCGR10 register
> (0x4006_B068).

Sorry, i lost track of the state of the switch driver. Is there also a
patch to add consumers of these clocks?

> Signed-off-by: Lukasz Majewski <lukma@nabladev.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew


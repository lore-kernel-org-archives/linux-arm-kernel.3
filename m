Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 588EFD32D71
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 09:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CFkA5vd3pbYzo9B6L/nOgdQXK7gAvR8Xqv+AnYPVXxM=; b=DXBG7Y63f3TaFrt3tUexO1elYj
	3SD+GCLjFmQaThFKds7+8qICTz9W0c7zm+hUFrXsvq/dUMVxCGELDlM5MrHMozZexIUZrBvGzKWot
	8CHpt+tgNT7Unl8oiJrjelo2LLBu7Mgs8MK7CfJ51xEM3o4iX+ydOdZtyb9GHs7B+S+ewoaYfYPDP
	xcEEleQtJ1wMBsjNkLHwVx0uKKpcjXxeYu/wMwSms2xeMoQaevLJXmCrelPjuTDRfN5M+V2sk8oY6
	jFlndI5UwJYlcNBDDll6EGH9izrUZXEKhljt4sTUHv6VOytJRWjK6/+RERvwungVxbu0CCwlT7wAC
	EVJ4evHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAnCB-00000002onT-0x3r;
	Tue, 12 Nov 2024 09:28:23 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAn8h-00000002oA7-1PI0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 09:24:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=CFkA5vd3pbYzo9B6L/nOgdQXK7gAvR8Xqv+AnYPVXxM=; b=MRZSNQ0mF0X3fzA2xt2gd7wtP/
	mNYyJsjtiDgAWNpXI13dUaQTkuixDf8/RLbMsCVoWVfMHFtMCqZ+vFnMVuY/lWyGqznkPztKxjk+e
	rkCvaYOHKD1PrDceDINNIFg8w6RIFY9PBUdD0cJqL6teVijHnL6EcFl1ZKp8NF5+FN+AP1h8Y6dXG
	bsQ4gLlamHTsYTOpvBdxCmWBZHkKKlOss28f1nEC1x/2B4JZlgIKds2Aawt9g0ni1afzseINRd20c
	WT2XzVWHw1uEi+uJWd/AAdj+7uvdwlWYXxDA5rP/MhEOWm3v+eBSp8jM4IYqkkbuAYT0x3RHNbhhA
	Q/qOYAUA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:59136)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tAn8T-0003ok-1Y;
	Tue, 12 Nov 2024 09:24:33 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tAn8P-0007LO-1s;
	Tue, 12 Nov 2024 09:24:29 +0000
Date: Tue, 12 Nov 2024 09:24:29 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Choong Yong Liang <yong.liang.choong@linux.intel.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net v1 0/2] Fix ethtool --show-eee for stmmac
Message-ID: <ZzMezSoY2BK1hjLv@shell.armlinux.org.uk>
References: <20241112072447.3238892-1-yong.liang.choong@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241112072447.3238892-1-yong.liang.choong@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_012447_399254_AA0552AA 
X-CRM114-Status: UNSURE (   8.94  )
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

On Tue, Nov 12, 2024 at 03:24:45PM +0800, Choong Yong Liang wrote:
> This fix ensures that 'ethtool --show-eee' displays the correct
> status for stmmac.

What do you think is wrong? It seems stmmac is manipulating eee_enabled
depending on something. This is wrong. eee_enabled is a _user_
_configuration_ bit, not a status bit. If the user sets eee_enabled to
a particular state, then the user expects it to stay that way and not
be manipulated by the driver.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!


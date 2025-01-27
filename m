Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12039C0218C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jan 2025 09:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=emuqLGn2iU6jwoZrczhMrnjopGMTGD+Ycm8ZZp4rDeY=; b=qF8zuyUk/7Odz53wuBOAqYwlch
	Y2B77Sak1gG3OyxLDhhPX49aJ3j/AvutVG4td6PCZtdq2ZTcvk9UeU2EaiDL8IeXXdFvvxeZrCPcL
	XMg81gn590A7TGW+Gyjmsq/pZJ49KlXWY6S+vRpnRIiIzbKp1TalZp4i+baxQnl6pEx7U5nHvY2uu
	m6tO6iYpqF4AjIl0xs0jO5AYmQmH694vt6t3S2b2TU3jMJboKm1W9x21xFweCUx6SbCfXKCoHObUk
	JSyIi26V2F4fv9zLGykT0cj/JSwxc6jpuiDGT1TRlxUqjJVP12IAZcLyjLuq5BZyyPoSsAMuSEI7D
	c8xuf0yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcLpy-00000002575-44Jq;
	Mon, 27 Jan 2025 09:55:22 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcLoc-000000024qX-3el4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jan 2025 09:54:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=emuqLGn2iU6jwoZrczhMrnjopGMTGD+Ycm8ZZp4rDeY=; b=q2T1rl1S3/FvC5Db9YCSHkSLpx
	YTFiF1H4Zcgy+sh4Anuv2JOnLSdQ9CxQJR3ifcquciw4yWbFSAZkFN2poy/YcsAYfGpuotRVtkZDS
	3BllJgp5+wjHek+zrAdrdeGlxeLyd59wYqHUG7mpp3WsLjz1DgT+kUZIGDlroP6UvEm+uIizo7BcS
	ZBy5E8C3BINk5hxoVh+yV6+Q86IIYayIq1Y9raVUFCZslGYsYsTawywJBB9LnGNUSeKVcEASCFYGZ
	KlhhK/doddlBjkRhuXQRbvqm8/krMcv0WooXi+anPXtbrYu4wihfzUSpLy1ppwppTpqXjyCco/lPs
	8piUrr4g==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:56962)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tcLmO-0005RD-2N;
	Mon, 27 Jan 2025 09:51:40 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tcLmJ-0001V0-23;
	Mon, 27 Jan 2025 09:51:35 +0000
Date: Mon, 27 Jan 2025 09:51:35 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net 0/3] net: stmmac: Fix usage of maximum queue number
 macros
Message-ID: <Z5dXJ1EIUx8DAh6J@shell.armlinux.org.uk>
References: <20250127092450.2945611-1-hayashi.kunihiko@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250127092450.2945611-1-hayashi.kunihiko@socionext.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_015358_913646_7BDC6827 
X-CRM114-Status: GOOD (  12.91  )
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

On Mon, Jan 27, 2025 at 06:24:47PM +0900, Kunihiko Hayashi wrote:
> The maximum number of Rx and Tx queues is defined by MTL_MAX_RX_QUEUES and
> MTL_MAX_TX_QUEUES respectively.
> 
> There are some places where Rx and Tx are used in reverse. Currently these
> two values as the same and there is no impact, but need to fix the usage
> to keep consistency.

I disagree that this should be targetting the net tree - I think it
should be the net-next tree. Nothing is currently broken, this isn't
fixing a regression, there is no urgent need to get it into mainline.
It is merely a cleanup because both macros have the same value:

include/linux/stmmac.h:#define MTL_MAX_RX_QUEUES        8
include/linux/stmmac.h:#define MTL_MAX_TX_QUEUES        8

Please re-send for net-next after the merge window and net-next has
re-opened.

In any case, for the whole series:

Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Thanks!

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!


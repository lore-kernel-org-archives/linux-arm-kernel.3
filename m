Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D192DE81A3C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Feb 2026 15:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rtQGx8JaIvXg61aL8RGWRy89nLOrlWoGMW1moSYdF4U=; b=wNIOL4K51c04y1nu2SJDAhjf8c
	j3Z+b4AEeFc8QTFBpiynMFrel7l4ITNIByBvm3s0ZAumJPTlj9lkJlxkpjHQ3QWLDaaG8vora3M6o
	gtawdJ+ONrh4xtNLqxqnIC7GTXo8AM02dL/bJV6ZaovhLwVy0DGP1qhwirvpAUe4lJ1ZbkQZmydoY
	BxTmOjUimPp0A7++Nq0iUKiJoRW82wOpEyXSJTULgQsbG6H43TjZQZE3sjqdcbMdKY5DHfh2PCYXN
	j+tIKVNnq2wzf+1/Aod7P1ivwwgXgHAZPRbXIuVN0KajRPNjzP3pLUoTxp52Crm32F+BlQd+XY8k0
	7uprD1hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vs0jx-00000006vRl-0xZa;
	Mon, 16 Feb 2026 15:42:25 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vs0ju-00000006vRI-1ntE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Feb 2026 15:42:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=rtQGx8JaIvXg61aL8RGWRy89nLOrlWoGMW1moSYdF4U=; b=qgb3v+Vtq+yIqIbp+EvMyer2d5
	aOqdWJwZ9wUpJHfFUZg/NtJFsYcn/IHj3N2S1wrjFCYxQXNLsM8BItrnXAGIbqG4X2KQ/8IFu1yXS
	+LZDKwysogk6ieqLtopJz7trniT9lskIKGT8X/CsHCOX84pP8XxLP1HxAMdxEd14HLYzKLiinKjC9
	OPe2deRHvKTMwuR0v+6bHA2Sk/VpIV7ycJZxjZbC5uC121xwaPqGdUNIyXi6tm2NoiZWUybjBiNwv
	JbPEOk44dfUlk60GIKz7RGCa3DxR5B3JXaWpI5c3zUvC+ZJcijQXdPm8U/W6gn9SFnZH2cenlVfqM
	kY2cNW4Q==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:39088)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vs0jl-0000000075q-0Ygn;
	Mon, 16 Feb 2026 15:42:13 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vs0jh-000000000MC-0xiX;
	Mon, 16 Feb 2026 15:42:09 +0000
Date: Mon, 16 Feb 2026 15:42:09 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	Vinod Koul <vkoul@kernel.org>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Frank Li <Frank.Li@nxp.com>,
	imx@lists.linux.dev, Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH RFC net-next 0/9] net: stmmac: qcom-ethqos: cleanups and
 re-organise SerDes handling
Message-ID: <aZM60XiDOrgxHqeA@shell.armlinux.org.uk>
References: <aY0aJppQWUC52OUq@shell.armlinux.org.uk>
 <aY95qbcG2BLGVzHy@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aY95qbcG2BLGVzHy@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260216_074222_470680_B965E32D 
X-CRM114-Status: GOOD (  12.76  )
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

Hi,

On Sat, Feb 14, 2026 at 12:51:13AM +0530, Mohd Ayaan Anwar wrote:
> Hello Russell,
> 
> Things look pretty stable on the QCS9100 Ride R3 board (with the AQR115C
> PHY). I would like to test a bit more and should be happy to provide a
> Tested-by once that's complete.
> 
> I may also get access to a board with an RGMII PHY on Monday, so I’m
> hoping to verify the changes to ethqos_rgmii_macro_init as well as your
> patch from the previous series (“net: stmmac: qcom-ethqos: convert to
> set_clk_tx_rate() method”) soon.

Looking forward to hearing the results, thanks!

As you seem to be fairly active with the qcom-ethqos stuff, please
consider adding yourself to the "QUALCOMM ETHQOS ETHERNET DRIVER"
maintainers entry. Thanks.

Vinod, are you still actively involved with this, and if not,
should Mohd remove you from the entry for the dwmac-qcom-ethqos
driver?

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!


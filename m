Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81938C54ED1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 May 2025 19:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FDzdnEi5TtcfKfjBkwBIU4/mQNamhC7e6P0CVNdVIJw=; b=OWo1HftT9D1lbA0h5xlIUYTuD1
	9a85+Gl2VLcF5Z4maLNouO5swvOH+Mw7GF7ivEFhtSIdRLCXFGumAS20M7mjfrdIPUATMNKFKOsFi
	uVTO/LH7VLpOLqBfs4Lh1HLnpEgdJNIE8ob7nxEKJQ6XKlIvqqZwuu14hPQMlSfK6AhtVL2bo6UJ1
	8nszgPZZ3+cXS4myGublHMpG/jzbgCuYNvhlx4WTuPCj2DbKAH8OpwzFPzTIOZWFEPrt5kjkm/q37
	ABQri5BKX5hXPdwOmd6WnycNGYC/kifJSz2jpu1oKBISalOyd5P1Ef9/cLaq3XsKo4BFEHdOui53T
	StSpYaPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIuij-00000006COX-2XGi;
	Sat, 24 May 2025 19:39:49 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIufw-00000006C5f-0Br2
	for linux-arm-kernel@lists.infradead.org;
	Sat, 24 May 2025 19:36:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=FDzdnEi5TtcfKfjBkwBIU4/mQNamhC7e6P0CVNdVIJw=; b=HAt5yaoD8r1RszUzBbuF8pC43r
	6oAm8q6za/9fBu8kLaJV/wfUo1mDL9YbJN24T8ehAhOcgv1KvAaRQq9qcls3V1pNhtZ72ypqO4huO
	T+JQFwB3s23BdF/KqtFLnIcdJhDEQaW72xPKwVhW9bzjbdBXXhj6+O9gLx3mhZhQssUdBJlPvvZS/
	xK+2bfiQ7CXjruJHi0FeyQqKd9ki4wveUOyeKQxlMug29Mdri9yyYxhwAgn+ri1g5FNf9H9oZeSt4
	2awXIc4zwtCH2Mt8RLAF6Sd+a134GkvAA/diZAqtSuBDgq65VDnu1BgJ3SjjO/IWyg3/LWvWJgIgE
	QekY3i3g==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:59090)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1uIudU-0005Al-17;
	Sat, 24 May 2025 20:34:25 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1uIudJ-00075J-2Z;
	Sat, 24 May 2025 20:34:13 +0100
Date: Sat, 24 May 2025 20:34:13 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: lizhe <sensor1010@163.com>, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
	jonas@kwiboo.se, david.wu@rock-chips.com, wens@csie.org,
	u.kleine-koenig@baylibre.com, an.petrous@oss.nxp.com,
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: Re: [PATCH] net: dwmac-rk: MAC clock should be truned off
Message-ID: <aDIfNZtSwZ1HwW2l@shell.armlinux.org.uk>
References: <20250523151521.3503-1-sensor1010@163.com>
 <d5325aba-507e-47b6-83fb-b9156c1f351e@lunn.ch>
 <2525c791.3415.197029d3705.Coremail.sensor1010@163.com>
 <112fa3c4-908d-4e31-9288-b3a2949555b0@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <112fa3c4-908d-4e31-9288-b3a2949555b0@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250524_123656_088775_8EF17E79 
X-CRM114-Status: GOOD (  21.21  )
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

On Sat, May 24, 2025 at 04:48:15PM +0200, Andrew Lunn wrote:
> On Sat, May 24, 2025 at 10:05:47PM +0800, lizhe wrote:
> > Hi， Anerdw
> > The following is the logic for calling this function： 
> > 
> > 
> > rk_gmac_powerup() {
> > 
> > ret = phy_power_on(bsp_priv, true);      // here.
> > 
> > if (ret) {
> > 
> > gmac_clk_enable(bsp_priv, false);
> > 
> > return ret;
> > 
> > }
> > 
> > }
> 
> Ah, there is something funny with your patch. Look at the diff:
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> index 700858ff6f7c..036e45be5828 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> @@ -1648,7 +1648,7 @@  static int gmac_clk_enable(struct rk_priv_data *bsp_priv, bool enable)
> 
> This line tells you where in the file you are patching, and the
> function to be patched. This is what i looked at,
> gmac_clk_enable(). And gmac_clk_enable() has a similar structure, ret
> declared at the beginning, return 0 at the end. But the only way to
> that return 0 is without error.
> 
> But patch is actually for:
> 
>  static int phy_power_on(struct rk_priv_data *bsp_priv, bool enable)

Andrew, this is not a problem. This is how diffs work. If the function
hasn't actually started at the point the context starts, then the
previous function will appear in the comment after the line numbers.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!


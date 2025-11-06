Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 737A4CCFA03
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 10:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OMLwGIoNYOp5BTjdjZEw24Nsm4q49zJb/gk4akyApJw=; b=QyGQSYPvsWf3l14GqJfogD9/+X
	Zq+/j38V2AqSioFO8rHFezkJqNWUQjTvT4tmqNHK9iIxAgVOmFX6G5WIulzCmosEtAWMqnKn447EP
	BLl1Z+W9aAUMEQawYUcx7MV0hUS460CHHeJOVDTlQpYDcU9a7tWRc5+RDHPmZTvLICZCJtNVaReAi
	6YgmskTyo2DE03lGzHzemHrI4qdjsixjJcDLIEJCLvLVCdtSFE8YDxx6BVEfgl8DxO7D6TD/KiFfC
	gLuiYF5uBh5PGDmlBK0eC+xcxVrJJ9g2IF9m7yT2huxgilkUqihsy1+mvozwGMiRkl8nQjx8bwBwQ
	3McqV6pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGx9A-0000000FJbF-3fnh;
	Thu, 06 Nov 2025 10:23:16 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGx98-0000000FJaR-0weP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 10:23:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=OMLwGIoNYOp5BTjdjZEw24Nsm4q49zJb/gk4akyApJw=; b=0iLpV6p5k1d8XZXOo/2wtp0gck
	ILbjL960etTl/6BeAYcs/QMyVWExZWDAeMF+oAHtNoYiCOzpV5QEOK4xqvkNFufxXQLqyzGbQBefM
	RMMUgqcuHBZILrfmsDw4z2NejnvVU8Hm2SpjN5ogRVj7gLLFUL2K2PAffbccV3OjkNb2m18CB79uP
	FvsNUheSqT9dqIqb9Fh7EFTQB6NFTndHHzvyonYwYhVF9TCkkiuD+LsYjMhlZRojbmghmFQcT0Ovd
	ddYUd8ebcYjWLWluaPZO6Z3gdr6TwOZwoNfT6l56QjcsOeGh0yBA8Zxiph5QFPw4PZGaHrUspZwtC
	/wDPW3Dg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:60346)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vGx8z-000000004nS-3qZ9;
	Thu, 06 Nov 2025 10:23:05 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vGx8w-000000006ZU-32os;
	Thu, 06 Nov 2025 10:23:02 +0000
Date: Thu, 6 Nov 2025 10:23:02 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next v2 00/11] net: stmmac: ingenic: convert to
 set_phy_intf_sel()
Message-ID: <aQx3Brj6t48O6wPg@shell.armlinux.org.uk>
References: <aQxinH5WWcunfP7p@shell.armlinux.org.uk>
 <6ad7667a-f2be-4674-99a2-2895a82b762a@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6ad7667a-f2be-4674-99a2-2895a82b762a@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_022314_262541_0B7DF543 
X-CRM114-Status: GOOD (  17.66  )
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

On Thu, Nov 06, 2025 at 10:57:55AM +0100, Maxime Chevallier wrote:
> Hi Russell,
> 
> On 06/11/2025 09:55, Russell King (Oracle) wrote:
> > On Wed, Nov 05, 2025 at 01:25:54PM +0000, Russell King (Oracle) wrote:
> > Convert ingenic to use the new ->set_phy_intf_sel() method that was
> > recently introduced in net-next.
> > 
> > This is the largest of the conversions, as there is scope for cleanups
> > along with the conversion.
> > 
> > v2: fix build warnings in patch 9 by rearranging the code
> > 
> >  .../net/ethernet/stmicro/stmmac/dwmac-ingenic.c    | 165 ++++++---------------
> >  1 file changed, 45 insertions(+), 120 deletions(-)
> > 
> 
> Damned, missed that V2 and started reviewing V1... I'll resend the tags
> for V2.

Yes, Jakub reported build warnings on patch 9 last night, followed by
the kernel build bot reporting the same thing. The dangers of not
building with W=1, but then W=1 is noisy which makes spotting new
warnings difficult.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!


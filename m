Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5DA9C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 19:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AXdrK0FW7YBCiiP1kX6NoL+0DT8yWctwGO9dXqbApP0=; b=TL7hdYRLeDeMDr3BwSWxjSMGpO
	RZRR8LZmK6xYiI9l/5aAelYEJBsYnvJOuLPXFySS9peNrSuaiib6co0JmFW/ctz7Pkhdferderpco
	1PBOQdXkMOB04z+ZSQZVowl0H3H/T80qADH2XFaW15BERJdWXoIKtXo9ucINyAa2Ggm16oCF2TKdx
	WsmshRTl+KwuXOY3vZ3aa6QNptphI2vKcYNHL0PBQhTveJ5kBF7TS0NSPyHfvJvGVJ5eOpv78+0v2
	f9qMvnktlyDRhRdvAmIPJFsB0CBibFekISH5M3V5faTOQwFirn4aaZutjeW4eFjVz30O3vpXl7MIR
	2XtU0vqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkpj5-0000000EcYK-4ALN;
	Wed, 19 Feb 2025 19:27:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkpW1-0000000EYy7-2W1q
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 19 Feb 2025 19:13:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=AXdrK0FW7YBCiiP1kX6NoL+0DT8yWctwGO9dXqbApP0=; b=pI/yoAdIWO7darympVUoLUG74A
	X27b9iTuhLhQOEVTrotsNVgW40SbVjeoai3rZ5IhjKv2Gz+VfhTnYYoSvYatDYA1/WFhrmHfFaMpA
	d7iFfxvxlGCZyJT6GY+1TaBZPQDUwasiPeOQsd35lKFMPKwcx/b7NdptcinXgBM3b7VoYC73t+JpZ
	y83+WeHBuBCL18ATu9aUSERYFCfjoUMTO97e+R91gtd5aubKVBYPyDVygJp4cT64DFI/o9wDYLibU
	yoT5k+Hkw1mErUy0jjIjbziC4iadiUBGxielL2aqEcrixmRdn2G2K0ehqGMp0t+IWE1yxyLf2XySP
	vCZMBKQQ==;
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkpVy-00000002JK5-1f9D
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 19:13:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=AXdrK0FW7YBCiiP1kX6NoL+0DT8yWctwGO9dXqbApP0=; b=LBPbPLYVfyUVGqIt7OCUrlXrd5
	lIHTDU6Mx3DQRND5VLydjwu3aBm/affJCwLVJn++b0RWN6vGZj3IpBtIg7uRC++gz4TL4PwiVkYkU
	qiNkxSwrxIuWvOYHRkMit1/pf0mLV59aCtp7JQuSzNpGnsvy1jRMD434rxyMNWR3+/0TDBzcV0Uzp
	44/uqEJ46rBpP2qpKbwzunVcpM/Gyj6XWyJtPtkiqViAPKFHLk4on4POUr+EOJJ4nVb69TLcRs98K
	E5wtWMGa+mt4q7QuHVklVtwfJUeaG8K+iKE67srxZPrMY1Bk6DkswRG6fUrKnmz5vOu+xgTtk1RhZ
	M8GtZjXA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:36382)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tkpVm-0006ih-21;
	Wed, 19 Feb 2025 19:13:36 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tkpVi-00009w-2O;
	Wed, 19 Feb 2025 19:13:30 +0000
Date: Wed, 19 Feb 2025 19:13:30 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Bryan Whitehead <bryan.whitehead@microchip.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Marcin Wojtas <marcin.s.wojtas@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>, UNGLinuxDriver@microchip.com,
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH net-next 9/9] net: stmmac: convert to phylink managed EEE
 support
Message-ID: <Z7YtWmkVl0rWFvQO@shell.armlinux.org.uk>
References: <Z4gdtOaGsBhQCZXn@shell.armlinux.org.uk>
 <E1tYAEG-0014QH-9O@rmk-PC.armlinux.org.uk>
 <6ab08068-7d70-4616-8e88-b6915cbf7b1d@nvidia.com>
 <Z63Zbaf_4Rt57sox@shell.armlinux.org.uk>
 <Z63e-aFlvKMfqNBj@shell.armlinux.org.uk>
 <05987b45-94b9-4744-a90d-9812cf3566d9@nvidia.com>
 <Z68nSJqVxcnCc1YB@shell.armlinux.org.uk>
 <86fae995-1700-420b-8d84-33ab1e1f6353@nvidia.com>
 <Z7X6Z8yLMsQ1wa2D@shell.armlinux.org.uk>
 <203871c2-c673-4a98-a0a3-299d1cf71cf0@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <203871c2-c673-4a98-a0a3-299d1cf71cf0@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_191346_525541_7F1E9E89 
X-CRM114-Status: GOOD (  22.65  )
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

On Wed, Feb 19, 2025 at 05:52:34PM +0000, Jon Hunter wrote:
> On 19/02/2025 15:36, Russell King (Oracle) wrote:
> > So clearly the phylink resolver is racing with the rest of the stmmac
> > resume path - which doesn't surprise me in the least. I believe I raised
> > the fact that calling phylink_resume() before the hardware was ready to
> > handle link-up is a bad idea precisely because of races like this.
> > 
> > The reason stmmac does this is because of it's quirk that it needs the
> > receive clock from the PHY in order for stmmac_reset() to work.
> 
> I do see the reset fail infrequently on previous kernels with this device
> and when it does I see these messages ...
> 
>  dwc-eth-dwmac 2490000.ethernet: Failed to reset the dma
>  dwc-eth-dwmac 2490000.ethernet eth0: stmmac_hw_setup: DMA engine
>   initialization failed

I wonder whether it's also racing with phylib, but phylink_resume()
calling phylink_start() going in to call phy_start() is all synchronous.
That causes __phy_resume() to be called.

Which PHY device/driver is being used?

> > So, my preference would be to move phylink_resume() later, removing
> > the race condition. If there's any regressions, then we need to
> > _properly_ solve them by ensuring that the PHY keeps the RX clock
> > running by honouring PHY_F_RXC_ALWAYS_ON. That's going to need
> > everyone to test their stmmac platforms to find all the cases that
> > need fixing...
> 
> Thanks for the in-depth analysis and feedback. We have 3 SoCs that use this
> driver and so I will do some testing with this change on all of them.

Thanks!

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!


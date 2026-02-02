Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04DC4E7DEF0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 14:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=udxGf0xljtegrIJMFi88Nd41JfqjJkfTxsoBLvLuTok=; b=tJ9RqZBtSNGmf282a6UK60bGsx
	WKyh3kngwB6QiQ4jMt9EsZMtjz1/ls1Yl6dvNXWRlQ1jyoTFaiE2c5oNq6pQ4rzh9todA1u2OXnW7
	SOuJBXVy5r26OfaVzEcj27OxvfPVzX8+cGBd7ng1dY1FePfrl4bFoKEpMRh3vFnFj5PYlAeHYjRcg
	CDPa0m3bygZvmKL8QjZi5hRI+hPrPmqWjH2JMP0bBLQHvsdIEgRdD5LWVq/25ZXNMQUU4OR2bvwWO
	1kpcpCCdgoYKsmXaku5YprUQDj5vV08Us30JhdHeG7KBSy0+Q41EMDrkHI3HtUP0CQsTwLF52Ct4M
	+eb5AB+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmvLV-000000058WX-04dp;
	Mon, 02 Feb 2026 14:56:09 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmvLQ-000000058Up-3iPn;
	Mon, 02 Feb 2026 14:56:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=udxGf0xljtegrIJMFi88Nd41JfqjJkfTxsoBLvLuTok=; b=BvP8XhFNFHfFYcqQ5d1LiHaXxr
	JQvdJk6EbKEyUY/RbHqipwCf0fNGkgB9egtxe2JkNeUWe/0A9zIarl54uaWyUnn5Bi5k1KaIz/uyi
	/36dmO2/lMn8zSQkOJb1hb3YIWnoCkoutMpxK5Wqwfwmp4ZX/abo4PnE28gKqxjNJVro=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vmvLI-005pyz-Am; Mon, 02 Feb 2026 15:55:56 +0100
Date: Mon, 2 Feb 2026 15:55:56 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: Quentin Schulz <foss+kernel@0leil.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Heiko Stuebner <heiko.stuebner@cherry.de>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: rockchip: fix Ethernet PHY not found on
 PX30 Cobra
Message-ID: <38452338-6e65-47ad-a696-b90c02ac42f0@lunn.ch>
References: <20260202-px30-eth-phy-v1-0-ef365be64922@cherry.de>
 <20260202-px30-eth-phy-v1-1-ef365be64922@cherry.de>
 <33d3bdd5-0fed-41f6-8b8c-9690e7665346@lunn.ch>
 <567d6404-2a71-43ad-8ba7-5053fe1576bd@cherry.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <567d6404-2a71-43ad-8ba7-5053fe1576bd@cherry.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_065604_953698_B3362AC1 
X-CRM114-Status: GOOD (  32.17  )
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

On Mon, Feb 02, 2026 at 03:02:08PM +0100, Quentin Schulz wrote:
> Hi Andrew,
> 
> On 2/2/26 2:52 PM, Andrew Lunn wrote:
> > On Mon, Feb 02, 2026 at 11:27:25AM +0100, Quentin Schulz wrote:
> > > From: Quentin Schulz <quentin.schulz@cherry.de>
> > > 
> > > When not passing the PHY ID with an ethernet-phy-idX.Y compatible
> > > property, the MDIO bus will attempt to auto-detect the PHY by reading
> > > its registers and then probing the appropriate driver. For this to work,
> > > the PHY needs to be in a working state.
> > > 
> > > Unfortunately, the net subsystem doesn't control the PHY reset GPIO when
> > > attempting to auto-detect the PHY. This means the PHY needs to be in a
> > > working state when entering the Linux kernel. This historically has been
> > > the case for this device, but only because the bootloader was taking
> > > care of initializing the Ethernet controller even when not using it.
> > > We're attempting to support the removal of the network stack in the
> > > bootloader, which means the Linux kernel will be entered with the PHY
> > > still in reset and now Ethernet doesn't work anymore.
> > > 
> > > The devices in the field only ever had a TI DP83825, so let's simply
> > > bypass the auto-detection mechanism entirely by passing the appropriate
> > > PHY IDs via the compatible.
> > > 
> > > Cc: stable@vger.kernel.org
> > > Fixes: bb510ddc9d3e ("arm64: dts: rockchip: add px30-cobra base dtsi and board variants")
> > > Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
> > 
> > What is the justification for stable?
> > 
> 
> Bootloader without network stack = no network in Linux.

I can see this multiple ways....

Changing the bootloader introduces a regression. Hence you cannot
change the bootloader.

I personally also don't like boot loaders with basic functionality
missing. Why cripple the bootloader by removing the network stack?

But i also don't like Linux being dependent on the bootloader. Because
some vendors ship boards with crippled bootloaders and you need to
replace the bootloader. And then hidden vendor initialization is not
in the mainline version of the bootloader, and something breaks in
Linux.  Making Linux more robust is generally ongoing development, not
a bug fix.

However, it bootloader developers decide to break the contract between
the bootloader and the kernel, regressions have been reported, then it
would make sense to backport the fix to work around the bootloader
breakage.

I don't know the internal of uboot too well. Can you remove the IP
stack, but leave the drivers? Get the driver to probe and setup the
PHY, so you keep the agreed contract with Linux, but you also get the
crippled bootloader you want.

For the commit message, i would like to see a reasoned argument, based
on

https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html

why this should be in stable.

	 Andrew



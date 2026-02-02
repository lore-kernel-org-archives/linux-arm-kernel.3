Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 290A8E73179
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 13:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oXfG5HjD0eLexGaveDkivvSGOBEOw3IK1EmqCYt7KWE=; b=HEhGmbj6Q6yG65k86ILwgLPrEB
	BrMBciutrcYnwZeZQb2seNygncZ1heaYJ1scwP8g22m3B+K1attqJhloutf2OlxjMKBr16WERALF6
	wBeQmmYn8F4OyzPi5FWEm9JMP2AuzdK1qQCNydrf+1h4EAApwrwqzk3OTGh7r1IBhgD7BWynTX+ko
	2S/6pRSLXWtxk7rTYDkZBV7uQqtl9SBAiPJwnGk2cP7Fc/ypJSQ/zs/tpvKCUHO7MuLN1rd36HUt4
	sPVgcV36Ll0CGbmdlnYgB49Q3WeJLIkfwqz3ft8s7PI5CIbcFZSbicKlFX1QHUH3ij7DukbwkggM9
	+XRzY4+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmuLq-000000052Cd-2cze;
	Mon, 02 Feb 2026 13:52:26 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmuLn-000000052CF-3JNl;
	Mon, 02 Feb 2026 13:52:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=oXfG5HjD0eLexGaveDkivvSGOBEOw3IK1EmqCYt7KWE=; b=VkwL9o8v+yiNf1jpLT1CLwcH4Q
	mUFOK94yWW5aM/cJP7KqTfRjEwTDEGi8aA9Eeh813R7r9t4aCkLn8xdYT8t2LSqp3pjPPSPmLz4t1
	pAZBXRwNVQV9qkoIJazPfpskvN/HtemAAV62k6n3xsafWaHuty1fNhwNVxFCkiUzsNA4=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vmuLi-005pXN-7x; Mon, 02 Feb 2026 14:52:18 +0100
Date: Mon, 2 Feb 2026 14:52:18 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Quentin Schulz <foss+kernel@0leil.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Heiko Stuebner <heiko.stuebner@cherry.de>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	Quentin Schulz <quentin.schulz@cherry.de>, stable@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: rockchip: fix Ethernet PHY not found on
 PX30 Cobra
Message-ID: <33d3bdd5-0fed-41f6-8b8c-9690e7665346@lunn.ch>
References: <20260202-px30-eth-phy-v1-0-ef365be64922@cherry.de>
 <20260202-px30-eth-phy-v1-1-ef365be64922@cherry.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260202-px30-eth-phy-v1-1-ef365be64922@cherry.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_055223_896296_52A556A0 
X-CRM114-Status: GOOD (  18.70  )
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

On Mon, Feb 02, 2026 at 11:27:25AM +0100, Quentin Schulz wrote:
> From: Quentin Schulz <quentin.schulz@cherry.de>
> 
> When not passing the PHY ID with an ethernet-phy-idX.Y compatible
> property, the MDIO bus will attempt to auto-detect the PHY by reading
> its registers and then probing the appropriate driver. For this to work,
> the PHY needs to be in a working state.
> 
> Unfortunately, the net subsystem doesn't control the PHY reset GPIO when
> attempting to auto-detect the PHY. This means the PHY needs to be in a
> working state when entering the Linux kernel. This historically has been
> the case for this device, but only because the bootloader was taking
> care of initializing the Ethernet controller even when not using it.
> We're attempting to support the removal of the network stack in the
> bootloader, which means the Linux kernel will be entered with the PHY
> still in reset and now Ethernet doesn't work anymore.
> 
> The devices in the field only ever had a TI DP83825, so let's simply
> bypass the auto-detection mechanism entirely by passing the appropriate
> PHY IDs via the compatible.
> 
> Cc: stable@vger.kernel.org
> Fixes: bb510ddc9d3e ("arm64: dts: rockchip: add px30-cobra base dtsi and board variants")
> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>

What is the justification for stable?

     Andrew


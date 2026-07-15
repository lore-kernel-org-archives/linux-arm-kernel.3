Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1773EC44508
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 01:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=46KRPMy9u5mU2TKTccVzrsXsAqZY9tVODkcEVrUETYY=; b=Tb0RmdLeXiia1FfIJiTdBKz2dT
	iKYg7UZHEWyaQIdVd5O5sseRtAkshwEtnapfxtoNBIdXnuRYjku8uspzbXrsEOTHcvUuviXc5+hjZ
	tqzFdaDguCk/XrI9RkHNI5qWzg7LpBhRpzAlJLnNX/bQH6CtZTTa5vEeAo8+Rex7pJKoaYatW8B64
	bB1dLTwG4IFX90gfx/UXgphmGMSuUSqP2/mU1LQhe2WxknAuLk+hQrCe/mEENXHgRShC6rAEdW8bS
	yz0xfc3WqIcvGDbpmPaQl7qLGxzMLlzp20nvPWFhiYwdatm2X06fElBMdmk1QYiUe8MC//hCiP34l
	Zyhn+1iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjoL5-0000000DYZD-0L1x;
	Wed, 15 Jul 2026 01:23:07 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjoL2-0000000DYYV-1sED
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 01:23:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=46KRPMy9u5mU2TKTccVzrsXsAqZY9tVODkcEVrUETYY=; b=yVJcr72W8TTwXeNlB+kFnhdYDO
	fyUw7Fto58/Ps3cswXSx/M3Dh7S7VF32FAx23uQEnNWL9YrY9hfz2hne+dR/st6O0IfrD77k5DEPT
	V+kD7wV0i6eWdwbbiHl0uBcEgtMhxBiukbNoK3YH0VLvC6yThZxshugf2l571JTurhCo=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wjoKs-00CHOV-4g; Wed, 15 Jul 2026 03:22:54 +0200
Date: Wed, 15 Jul 2026 03:22:54 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: muhammad.nazim.amirul.nazle.asmade@altera.com
Cc: dinguyen@kernel.org, maxime.chevallier@bootlin.com,
	rmk+kernel@armlinux.org.uk, krzk+dt@kernel.org, conor+dt@kernel.org,
	robh@kernel.org, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, andrew+netdev@lunn.ch,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v3 4/4] net: stmmac: dwmac-socfpga: Add support
 for Agilex5 TSN GMAC with FPGA converter
Message-ID: <2f3763bc-678e-4346-b060-d3bc8afb67b3@lunn.ch>
References: <20260714021303.30042-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
 <20260714021303.30042-5-muhammad.nazim.amirul.nazle.asmade@altera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260714021303.30042-5-muhammad.nazim.amirul.nazle.asmade@altera.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_182304_509992_EF70FAD1 
X-CRM114-Status: GOOD (  11.09  )
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

On Mon, Jul 13, 2026 at 07:13:03PM -0700, muhammad.nazim.amirul.nazle.asmade@altera.com wrote:
> From: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
> 
> The Agilex5 SoCDK TSN Config2 board uses a GMII-to-RGMII converter
> implemented as FPGA soft IP between gmac1 and its PHY. This converter
> provides the RGMII TX/RX clock delays, so the MAC interface selector
> must be configured for GMII while the PHY is configured without delays.
> 
> Add the "altr,socfpga-stmmac-agilex5-tsn" compatible to the match table
> and detect it in probe to force GMII for the MAC interface selector and
> strip the delay bits from phy_interface so the PHY is not configured to
> add delays already provided by the FPGA converter.
> 
> Signed-off-by: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew


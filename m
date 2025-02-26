Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44318C19777
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 13:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=emOQzapFrQT5vVxsL8UHzprrVS/y5Fj4+zQUs5X4tHE=; b=tMEw6+urbZhlKGOa5vT72jko8F
	rBBoCv/7mxCTEB5a3j3FetkNFgefxdenWbEc5pXy7slKbssifdeAPVitiykPe6VKZT2BFxUAlMirl
	3Tc09c8hQ2N5DQC/ZbWgs7yxH7mh7DjXiqBfgvpg21Br+6J+LQNF/qgThivUPqAuuiSRbXYKEIDTK
	PtpTXxfnxahSmMxsLPPMMJiXc+jd8/QyZ/MoauRcbyhcD892WnAf2CJBInhfc8LpykRmB5zYEVI1G
	QmGUQZqNECY/DHvmg5z2MOvYLls8FnjRU5fyEYytJIRPEcncKDh3zug63vFh7iq3vT+eahpLzRsEL
	tEbL4BGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnHRd-00000003t0t-00Za;
	Wed, 26 Feb 2025 13:27:25 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnGSd-00000003fTT-3v4c
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 12:24:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=emOQzapFrQT5vVxsL8UHzprrVS/y5Fj4+zQUs5X4tHE=; b=N+imwegbzOoqUjYGfsuVGY8h1/
	UTPAQv5dwe/+Om4CMF/zSIMQ9vqmslf+3Ayv8tpsS9JP9gtvjdjN6HDFB0uBduYrpb/oiIYctKuUU
	yXPBzbaZDpnaLob4tBw338prJhgmbNg0eihxO4SJJXcPFYne4B7k+VzViKgmK0RULvkohOcU5IdGQ
	4XEG+2G+wbIzDigQl06K6kQMt18qejm82FahjXyLULVH+XglcvAvg/bimsdDx/cFpuK95yOPMdBp4
	eNP0//PJIwXFeOkHGYiZ5HbUJiVDzM5iKY2Mmw+wlh6fbhzQhByx++P0HqQm9gg77CEf932RoFTpf
	KYd9CVDA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:47836)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tnGSV-0004Cg-0N;
	Wed, 26 Feb 2025 12:24:15 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tnGSS-00074i-2i;
	Wed, 26 Feb 2025 12:24:12 +0000
Date: Wed, 26 Feb 2025 12:24:12 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Eric Dumazet <edumazet@google.com>,
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
	Inochi Amaoto <inochiama@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jan Petrous <jan.petrous@oss.nxp.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Minda Chen <minda.chen@starfivetech.com>, netdev@vger.kernel.org,
	NXP S32 Linux Team <s32@nxp.com>, Paolo Abeni <pabeni@redhat.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH RFC net-next 5/7] net: stmmac: s32: use generic
 stmmac_set_clk_tx_rate()
Message-ID: <Z78H7F7oBsC-cCB-@shell.armlinux.org.uk>
References: <Z7RrnyER5ewy0f3T@shell.armlinux.org.uk>
 <E1tkLZ6-004RZO-0H@rmk-PC.armlinux.org.uk>
 <x56yik7opvpr3o5vjlxoxzxdicrz2pimsh4lkpxol7c64r6irs@t7dfqy7ybn2a>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <x56yik7opvpr3o5vjlxoxzxdicrz2pimsh4lkpxol7c64r6irs@t7dfqy7ybn2a>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_042423_971632_063754AB 
X-CRM114-Status: GOOD (  17.46  )
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

On Tue, Feb 25, 2025 at 09:43:56PM +0100, Thierry Reding wrote:
> On Tue, Feb 18, 2025 at 11:15:00AM +0000, Russell King (Oracle) wrote:
> > Use the generic stmmac_set_clk_tx_rate() to configure the MAC transmit
> > clock.
> > 
> > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> 
> I wonder if the clk_set_rate() call for gmac->tx_clk could also be
> removed from s32_gmac_init(). Comparing to the other drivers that
> doesn't seem to be relevant since ->set_clk_tx_rate() will be called
> anyway when the interface is brought up.
> 
> But it might be more difficult because somebody would actually have to
> go and test this, whereas this patch here is the equivalent of the
> previous code, so:
> 
> Reviewed-by: Thierry Reding <treding@nvidia.com>

I'd prefer not to change the code behaviour in this patch series. It's
entirely possible that's somehow necessary to ensure a correct clock
is supplied before attempting to reset the MAC core on this hardware.

It could be something to be cleaned up in the future.

Thanks!

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!


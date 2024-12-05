Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 291F3E77170
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 17:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p5Iv8mfxtmO9Druz+kkxkhm6XzbPAF2CVdJuZPljSLQ=; b=ytb+uwW1XLZvHQug0JDJUQHpIi
	guXLmrpolFSy/2SO99SyH6IzjHQX0v7aBlBZ7YAzgpUhhFNyitz5unWsDqD3KR8Y4qNfMAEkq0AWR
	QGE7sjJyVkstnG/52xZC/abuvb3EdBL0P/Lo3J7mLAswRkV8xHu54DQ56R5JIvw91Ba7K3qeXIGiI
	kFKhgZIqUcHMlJ7Va0yaNaODMRZLurlAoT1HlL0dTXOmKfCEPjfMqET4SBSEOnDrSIzeuZwTM62XP
	sqM8J1bleM/uAJKdv57BrDAZJgbvdJGAGcgg7XCpwQW4VYolEggqSUBxNUorTZA1unS2/Cmjkamb9
	f1vmNJuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJFY7-0000000Gvjd-17EA;
	Thu, 05 Dec 2024 17:21:59 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJFEg-0000000GrVH-45lf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 17:01:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=p5Iv8mfxtmO9Druz+kkxkhm6XzbPAF2CVdJuZPljSLQ=; b=ksEiv5H68mvOWbi92UT+mbNnPd
	DiReXQWSRrcoZ58Trb1WbGFudxkZGWdZlKJdS4Lb70jm5B3faZfpTS6yZWSwiqqVnC+J4ItKPPjmh
	mpmlhnHOOibAknUuMkSkfyXBbuOn+4RyBFOvBs6H08qE0Ygf2QONsbiYWrbg/+zkCLFMZe8YfcE1i
	JYIsVzWT6XaZME6vhKqlKcXAtEWJYemMxlIRhyOVkDhCSuHlXIl7Jy8un6ry5tBFcXOft2vomZvqe
	lCdNY2Oknzr9gLUV57jBrO/vxpPNrgCoQI/AXvpscQ+QQ+mhT9/4rDhUfLcXVsRJtQfjxXh8sMGQ5
	NBcB1HWQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:42758)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tJFEG-0005Er-1R;
	Thu, 05 Dec 2024 17:01:28 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tJFEC-0006i8-04;
	Thu, 05 Dec 2024 17:01:24 +0000
Date: Thu, 5 Dec 2024 17:01:23 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Jan Petrous <jan.petrous@oss.nxp.com>
Subject: Re: [PATCH net-next v8 01/15] net: stmmac: Fix CSR divider comment
Message-ID: <Z1HcYyNG4FfnN84s@shell.armlinux.org.uk>
References: <20241205-upstream_s32cc_gmac-v8-0-ec1d180df815@oss.nxp.com>
 <20241205-upstream_s32cc_gmac-v8-1-ec1d180df815@oss.nxp.com>
 <Z1HaB6hT0QX4Jlyx@shell.armlinux.org.uk>
 <Z1Ha+me4+hbOj9JO@lsv051416.swis.nl-cdc01.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z1Ha+me4+hbOj9JO@lsv051416.swis.nl-cdc01.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_090155_013764_0AC931BE 
X-CRM114-Status: GOOD (  14.76  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, NXP S32 Linux Team <s32@nxp.com>, Emil Renner Berthing <kernel@esmil.dk>, imx@lists.linux.dev, Alexandre Torgue <alexandre.torgue@foss.st.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Eric Dumazet <edumazet@google.com>, Iyappan Subramanian <iyappan@os.amperecomputing.com>, Quan Nguyen <quan@os.amperecomputing.com>, Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>, 0x1207@gmail.com, Jose Abreu <joabreu@synopsys.com>, Jacob Keller <jacob.e.keller@intel.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Richard Cochran <richardcochran@gmail.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, Keyur Chudgar <keyur@os.amperecomputing.com>, Minda Chen <minda.chen@starfivetech.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, fancer.lancer@gmail.com, linux-kernel@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>, Vinod Koul <vkoul@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, "David S. Miller" <davem@davemloft.net>, Heiner Kallweit <hkallweit1@gmail.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Thu, Dec 05, 2024 at 05:55:22PM +0100, Jan Petrous wrote:
> On Thu, Dec 05, 2024 at 04:51:19PM +0000, Russell King (Oracle) wrote:
> > On Thu, Dec 05, 2024 at 05:42:58PM +0100, Jan Petrous via B4 Relay wrote:
> > > From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
> > > 
> > > The comment in declaration of STMMAC_CSR_250_300M
> > > incorrectly describes the constant as '/* MDC = clk_scr_i/122 */'
> > > but the DWC Ether QOS Handbook version 5.20a says it is
> > > CSR clock/124.
> > > 
> > > Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
> > > Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>
> > 
> > I gave my reviewed-by for this patch in the previous posting, but you
> > haven't included it.
> > 
> > Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> 
> Hi Russell,
> sorry for that, I missed it. Should I resend the v8 series?

Patchwork will add it if this series is merged, so there's no immediate
need to resend. However, please update your series with it in case there
is another reason to send another version.

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!


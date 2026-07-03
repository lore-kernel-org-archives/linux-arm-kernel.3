Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FCFDC43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 13:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7LVuA3dES9xFx01S3/rxFghM+Ukg8seLr4y0mol4SSE=; b=Tg22+5GjnWjJBPLwi47IV6fCYO
	2ceYuFKzUC9C+HXvejAxuM0Pf6WAgZsOjqscWPzHR5r0K4EXxR39l2OcJnR9FiUnhvVaN0RfTPccu
	Hxo99ylr0SSOcv2xFBG1R5B4aEnMH4Y/2ACMU83aUWObmMbcBlLW61OSG5gGrmkgeazftjHcKUGOW
	ywIrCjjV3N6Yt25OaBtHT4DGvVnztcV7cx34oUO2VwKp/b92C5ipmRSHEUg+GB/S6s7Bnp5KiQ2p5
	qgrdiR6NsR6z0DRKZDqUq5bupVdgFAxZTE71lDa0esDZcNgBCiYtOZBqSSfrpsc1LzgNUvR0NVVMS
	A33JdBxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfdk7-000000073xy-47p5;
	Fri, 03 Jul 2026 13:15:43 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfdk4-000000073xS-3K1p
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 13:15:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=7LVuA3dES9xFx01S3/rxFghM+Ukg8seLr4y0mol4SSE=; b=P7
	2ZYwPK/KAxOnzSjzznp2JAnJbCPV2klqZCb5350KPiIZlkqaEQLcfSKPmwhh2e4BegFSUar3DXaT1
	runiP28UqE3/sCRPPK3XArNnSdZTY7DFj52dbkvuFrZeuoasojH2d3FiGlM7kYEw58A4E07ZdesGN
	n+7Ta2fCBAuVcPc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wfdjw-00AYEi-Ix; Fri, 03 Jul 2026 15:15:32 +0200
Date: Fri, 3 Jul 2026 15:15:32 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: "Nazle Asmade, Muhammad Nazim Amirul" <muhammad.nazim.amirul.nazle.asmade@altera.com>
Cc: "dinguyen@kernel.org" <dinguyen@kernel.org>,
	"maxime.chevallier@bootlin.com" <maxime.chevallier@bootlin.com>,
	"rmk+kernel@armlinux.org.uk" <rmk+kernel@armlinux.org.uk>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>,
	"davem@davemloft.net" <davem@davemloft.net>,
	"edumazet@google.com" <edumazet@google.com>,
	"kuba@kernel.org" <kuba@kernel.org>,
	"pabeni@redhat.com" <pabeni@redhat.com>,
	"andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/3] net: stmmac: dwmac-socfpga: Add mac-mode DT property
 support
Message-ID: <431e5388-8406-467a-8053-7104b3a62a76@lunn.ch>
References: <20260630133108.27244-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
 <20260630133108.27244-4-muhammad.nazim.amirul.nazle.asmade@altera.com>
 <e489be4a-5940-46e5-ae06-b78f1c919352@lunn.ch>
 <f31704f2-cd98-481f-8290-203e3052b738@altera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f31704f2-cd98-481f-8290-203e3052b738@altera.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_061540_909230_035EBFA0 
X-CRM114-Status: GOOD (  13.89  )
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

> > I don't actually see a need for mac-mode. From what you are saying,
> > there is no choice. The MAC is hard wired to the converter block. So
> > you can just look at the compatible. You are going to need to use the
> > compatible anyway, to mask the phy-mode to handle the "MAC" doing the
> > RGMII delays.
> > 
> >        Andrew
> > 
> Hi Maxime, Andrew
> 
> Thanks for the reviews!
> 
> Hi Andrew,
> 
> The challenge with using compatible is that the TSN Config2 board has 
> two ports — only gmac1 uses the GMII-to-RGMII converter, while gmac2 
> connects directly to its PHY.

The two MACs are not compatible then, and each should have its own
compatible string. This is all in the SoC .dtsi file, so not really a
problem.

       Andrew


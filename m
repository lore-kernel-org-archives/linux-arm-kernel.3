Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 326B1EB48F3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 10:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xSFJcBfVZKp82+Db3xO54CWUoHlWgz8IeqJYSETUKnY=; b=H3Z+XDzSkPr4r2OjyPEC2HYkYd
	MKDti6ad2celosAs0e3c59yLYcgJIFhY/fCTmEuKPMe4/MtgzRx4N0FKUY4bOY/4taLvQzdNWzvAP
	QuL0IduyEkiTj+1ITw0d18ngwq6l3NGAjEgOCAmIzU0iG9vvF445IzrDzP5aPNtUcOKTMqZh1H8IR
	gyn6Twdjm+FJ6VlPawRxdjD025N2USIvETUy/iEnje3WQ7I8nZgKGkBu19BrBCu6Mxsgt6hsY/aX9
	mIVVV8O9qrq0vCS2PUVHy7jHIgvw4grkh3T0cia2B3W+N8QQz5HA2O/9d4X4+sGcMelxpl/BUjG80
	Wzmmt3lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqTw6-00000001wQ5-2rbS;
	Thu, 12 Feb 2026 10:28:38 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqTw3-00000001wP5-31nC;
	Thu, 12 Feb 2026 10:28:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=xSFJcBfVZKp82+Db3xO54CWUoHlWgz8IeqJYSETUKnY=; b=1riGLJb1LrUTq2AMxJAEE3fPYe
	GGAhsHEa5SOZDT9rTt0biTAUn50DlKRNx0SI58Ki1gpElxnFzDbIcTz3KYeBe3ZjGL1UmNW86V+Q/
	p5pUTRyhoyCSwsNJzEtmcqQvkPzP2RMr4aD7qeYVKI4ioPG0sQphqLV7Ej7U+LHbbLUqBKFhC87Ut
	RqYEns3IrdUHTgcItxWWeYTF4epkkC7RfnQcV0lVedVjPW8+NMnuNDdA1k5iOUTvK36Pr6+AxNjGG
	F2gQfai0V50HAyrXYgNq+ncht/5qgAPL3JGxKL7QFMnEQgOtSgbocJKaUuV9C+xvP+918nnj5CYB4
	+5wbXcxw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:49322)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vqTvt-000000004QW-3erv;
	Thu, 12 Feb 2026 10:28:25 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vqTvr-000000004hn-3a12;
	Thu, 12 Feb 2026 10:28:23 +0000
Date: Thu, 12 Feb 2026 10:28:23 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Vincent Guittot <vincent.guittot@linaro.org>,
	Rob Herring <robh@kernel.org>
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, ciprianmarian.costea@oss.nxp.com, s32@nxp.com,
	p.zabel@pengutronix.de, ghennadi.procopciuc@nxp.com,
	Ionut.Vicovan@nxp.com, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
	horms@kernel.org, Frank.li@nxp.com
Subject: Re: [PATCH 1/4 v2] dt-bindings: serdes: s32g: Add NXP serdes
 subsystem
Message-ID: <aY2rR3Hlm525kGUN@shell.armlinux.org.uk>
References: <20260203161917.1666696-1-vincent.guittot@linaro.org>
 <20260203161917.1666696-2-vincent.guittot@linaro.org>
 <20260210004011.GA2188625-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260210004011.GA2188625-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_022835_784017_F39AACF8 
X-CRM114-Status: GOOD (  15.51  )
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

On Mon, Feb 09, 2026 at 06:40:11PM -0600, Rob Herring wrote:
> On Tue, Feb 03, 2026 at 05:19:14PM +0100, Vincent Guittot wrote:
> > +description: |
> > +  The SerDes subsystem on S32G SoC Family includes two types of PHYs:
> > +    - One PCIe PHY: Supports various PCIe operation modes
> > +    - Two Ethernet Physical Coding Sublayer (XPCS) controllers
> > +
> > +  SerDes operation mode selects the enabled PHYs and speeds. Clock frequency
> > +  must be adapted accordingly. Below table describes all possible operation
> > +  modes.
> > +
> > +  Mode  PCIe	XPCS0		XPCS1		PHY clock	Description
> > +                SGMII		SGMII		  (MHz)
> > +  -------------------------------------------------------------------------
> > +  0	Gen3	N/A		N/A		100		Single PCIe
> > +  1	Gen2	1.25Gbps	N/A		100		PCIe/SGMII
> > +  2	Gen2	N/A		1.25Gbps	100		PCIe/SGMII
> > +  3	N/A	1.25Gbps	1.25Gbps	100,125		SGMII
> > +  4	N/A	3.125/1.25Gbps	3.125/1.25Gbps 	125		SGMII
> > +  5	Gen2	N/A	        3.125Gbps     	100		PCIe/SGMII
> 
> Mixed tabs and spaces. Drop the tabs.
> 
> What's not clear to me is do you have 2 or 4 lanes?
> 
...
> > +  nxp,sys-mode:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> 
>        maximum: 5
> 
> Though isn't this redundant with the child nodes? You could use the 
> standard 'phy-mode' property in each child.

phy-mode is ethernet, but the above is more than just ethernet.

I've been wondering why a generic PHY driver needs to know this via DT
when the generic PHY API has:

phy_set_mode() / phy_set_mode_ext()
 - sets the type of the PHY and its submode (e.g. ethernet interface
    mode)
phy_set_speed()
phy_set_bus_width()

Surely these are sufficient to describe what mode is required from the
generic PHY, and the generic PHY driver can figure out whether the
mode is permitted from the above table, programming the PHY as
desired.

For Ethernet, we don't call the 3.125Gbps "SGMII" using that term. We
use SGMII strictly for Cisco SGMII, which runs at 1.25Gbps. 3.125Gbps
single-lane serdes ethernet is not able to use Cisco SGMII inband
signalling because running the underlying data rate with 10 or 100
symbol replications makes no sense. So we have decided to all this
2500BASE-X. If such a SerDes is connected to a SFP cage, then we
support switching between 1.25Gbps and 3.125Gbps mode depending on
the module inserted, which requires dynamic reconfiguration of the
SerDes.

What I'm saying is that describing a single mode covering several ports
could make things difficult in the future, so make sure you think
carefully.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!


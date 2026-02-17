Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77237E9A03E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 20:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wlg17Kj/wYC+KcEPPN4TByd+mHs/UERfyc2emJHo0cc=; b=zOLpf1baf5HnkA+CkOJiy4SV27
	awPODAdNcQiz6IprW9fnrWaUED7bJwN5ClsiX5TxpTBPlRITmw7Limu6eThPIBRjRBL/5bT80wbnw
	vkymEicDEECXAw12z3N6Xs2a/VEp5vW1RLrUif4/UTnbAwmW1howQ0GAdIFu8+l/rbq+ELR+UzFyP
	zZaloXej/vCUIsm7fWT5WGpk4RBcfoOIcH+4yQpdB6V/BMkRYbJAQURnJSHvKotaW3zmuw/EVWgrv
	Bw2a1RCg5JGvJHRgvlIcCfLh4DCTn/3YIM6qsVDkv3QLxr09zqVX8BA0rx+GyEmPtV5lZR3bM/meL
	caRKUZog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsRul-00000008sBl-2tBb;
	Tue, 17 Feb 2026 20:43:23 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsRuj-00000008sBP-0tYL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 20:43:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=Wlg17Kj/wYC+KcEPPN4TByd+mHs/UERfyc2emJHo0cc=; b=i+51ALd7gisJbAn50Bu8vXVC2/
	6y0UR/QhvSBWqdN5tqTwjnWh5VLwllXxHc1VMKEV2+7QaixWChmNc11D8uLCRe3d5pnlvoktWIiBO
	Bhjo6abQHteJe+8zpmGcNFYmWALs3T6RDzSXKCs80cQ5wTIbAq3kp/DdZl3Uqx00rfu8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vsRue-007geQ-Nf; Tue, 17 Feb 2026 21:43:16 +0100
Date: Tue, 17 Feb 2026 21:43:16 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v1 03/11] arm64: dts: freescale: imx8mm-var-som: Update
 FEC support with MaxLinear PHY
Message-ID: <fceeda41-66cc-4bb2-ab53-d4b1ec25348a@lunn.ch>
References: <cover.1771353301.git.stefano.r@variscite.com>
 <3b984b93a43a07bc9c4f6414a08a3a0f45daaaa8.1771353301.git.stefano.r@variscite.com>
 <31f30651-7c99-42cb-9e27-e4806529d137@lunn.ch>
 <aZTCGH1rKWdvYg5-@Lord-Beerus.station>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aZTCGH1rKWdvYg5-@Lord-Beerus.station>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_124321_257988_EB840AFC 
X-CRM114-Status: GOOD (  19.33  )
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

On Tue, Feb 17, 2026 at 08:31:36PM +0100, Stefano Radaelli wrote:
> Hi Andrew!
> > 
> > I don't think you say this explicitly anywhere, so i will ask. The PHY
> > is on the SOM? The carrier just has magnetics and the RJ45?
> 
> Yes, the Ethernet PHY (MXL86110) is physically mounted on the VAR-SOM.

O.K. so far.

> All RGMII signals, MDIO and the LED outputs are routed to the SOM
> board-to-board connector. The carrier board only provides the magnetics
> and the RJ45 connector.

And here you loose me. RGMII is between the MAC and the PHY. The PHY
is on the SOM, so there is no need for RGMII to leave the SOM.

MDIO is can understand going to the carrier, because there can be
other devices on the bus, such as an Ethernet switch.

You say the LEDs are not on the SOM. So they should not be listed in
the .dtsi file for the SOM. It could be the RJ45 is a cheap one,
without LEDs. The colours will depend on the RJ45 socket. It could be
a single LED is connected to the front panel, which is typical of STB
etc. So the LEDs are a board property, not a SOM property.

> > >   Two LEDs are defined to match the VAR-SOM carrier design:
> > >     * LED@0: Yellow, netdev trigger.
> > >     * LED@1: Green, netdev trigger.
> > 
> > Where are the LEDs? You say "carrier design", so are they on the
> > carrier? The DT properties should then be in the .dts file for the
> > carrier.
> >
> 
> The LED signals are driven directly by the PHY and originate on the SOM.
> They are exposed on the SOM connector and are typically routed straight
> to the RJ45 integrated LEDs on the carrier.

The problem here is 'typically', not absolutely required, otherwise
the magic smoke will escape making the box useless.

	Andrew


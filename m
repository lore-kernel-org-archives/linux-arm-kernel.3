Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CA71C624D3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 14:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aXjp/EXi0ZgIATNPUvVJ6EllQtEXiudIzx0WzYh/Gy0=; b=Lc538JyHJNSqF7wZBWItDmrwWE
	BM4R97VauVayCKSxFd6m2xXrLdDYwgVin1KtjN7i8O92sidFo2I5OTAIFQgnLkiLnreAXL3Oo3NYz
	1P5Nu0agk5Ixyo1VWVIuYUmeCOg5d1UlCS78dmVzHqKavWcAOnF+8qtl/Rpn3cJQtuI3yu2dfhulv
	RwxCHR15QN49Nkj4RMYE97+MgJ/l0BW3ULB2fhhfuoxclT0b/kA8D4jBXM3xSOJvtAnlOw5XIJSMe
	JjqpXKclwMv1/iWKyJfVFXmQLoLgA8gqCFW+4+sJRP7fx9K5GplRpT/ZnbCZiY7cfdtkOehEwk97W
	2B5490OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1PWO-0000000CLDj-0qBd;
	Tue, 01 Sep 2026 14:31:32 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1PWJ-0000000CLCr-1fsi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 14:31:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=aXjp/EXi0ZgIATNPUvVJ6EllQtEXiudIzx0WzYh/Gy0=; b=MEU3tJ7+SkxV2q7efdUiHkyCBh
	Zpd75OjCTB3G2CH/Z/0njGMDG/OMSN9Mb4xnOHHXof2iXKYHGgJytaHCje0ndFc0mQ7f84lkarODL
	GVEh9h4CxBjeQ7VEon7Rgt5KVHnJjIQCYCibHfMfCPXc+OGDGO7rn++fgDvT93bMddb8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1x1PWA-002MyK-6p; Tue, 01 Sep 2026 16:31:18 +0200
Date: Tue, 1 Sep 2026 16:31:18 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: "Gupta, Suraj" <suraj.gupta2@amd.com>
Cc: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Michal Simek <michal.simek@amd.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Russell King <linux@armlinux.org.uk>, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH net-next v3 2/6] dt-bindings: net: xlnx,xxv-ethernet: Add
 Xilinx XXV 10G/25G Ethernet
Message-ID: <b5126d72-734b-4f4d-b953-807579c8583e@lunn.ch>
References: <20260831150816.1020883-1-suraj.gupta2@amd.com>
 <20260831150816.1020883-3-suraj.gupta2@amd.com>
 <bb36094f-07d1-49fb-be2a-ffe126e1b919@lunn.ch>
 <9717ad8d-0117-4320-9d6c-dda6b712ecee@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9717ad8d-0117-4320-9d6c-dda6b712ecee@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_073127_463546_6CC4421E 
X-CRM114-Status: GOOD (  15.36  )
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

On Tue, Sep 01, 2026 at 08:48:18AM +0530, Gupta, Suraj wrote:
> 
> 
> On 9/1/2026 7:57 AM, Andrew Lunn wrote:
> > > +  The Xilinx XXV Ethernet Subsystem implements a 10G/25G Ethernet MAC with an
> > > +  in-core PCS/PMA driving a high-speed serial transceiver. It supports the
> > > +  10GBASE-R and 25GBASE-R line rates, with 25G operation following the 25G
> > > +  Ethernet Consortium specification. It has no external MDIO PHY
> > 
> > What about MDIO bus?
> > 
> > 	Andrew
> 
> The 10G/25G (XXV) Ethernet Subsystem IP does not provide an MDIO master.

O.K. Please change the wording to make that clear. There are plenty to
10G PHYs available, but it seems like you do not consider that a use
case.

Has the MDIO bus master been replaced with I2C? I assume you intend
this device to be paired by an SFP cage, so an I2C bus will be
required. Is that a different IP which needs to be licensed?

> The contents of the appropriate MDIO registers are available in the IP control &
> status registers.

What does that mean?

     Andrew


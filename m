Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE803C36008
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Mar 2025 16:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MXUNQ3qwLDG8TCGsRA0HZ7ccSxkq0b8zwwJm6HgvBOc=; b=AA+6gnZaeQNl7Ij5txz/Ew6XEa
	4+Uf3Z03xi/8kE6b4TFvdGzTTp7aUv8O9c84cjkE3vkGITLwWvWQndRWmV0AuhpZeMm2WeoZGJ4Ao
	4A7JHtjIoBoItkaednfmbrFVLKJ/9+igKSs1t/vRTe4PVoSueTmwjNlD3kg6ZWKx3NbDNpI9oWcMN
	8a5ZzzYzKVApqAzRipqmKKQ47gAGi1/jJEhSHDhwkq2GV6xN+YAbc4wpyYCec6+Uyx0QrLZit85Rz
	osVn6nMSGgjkv8mDDx6AtK4uFwQsmVuxVOK+Nc8s64ycGNiJIZvy6pw+K31Icj4dk7L1bdkGmmMVD
	5lH5vQCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txTCm-00000008w8E-2ITZ;
	Wed, 26 Mar 2025 16:02:12 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txScT-00000008qfc-1Run
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Mar 2025 15:24:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=MXUNQ3qwLDG8TCGsRA0HZ7ccSxkq0b8zwwJm6HgvBOc=; b=LvhZHxxP4PkL3vrUPyY8fcGEbb
	8Kx5bTCmCSWT51Rbgcs3/unQVAE0hmuEmtn9rI4u2kH+ni6xLmDttEX5Yrr1tvj6QYrh538SD9Ofw
	tuUGDNrXIzDFlZ6MN/FvWO4UKsFh99mWPfyZ1/dicPLsOnH0uBTVJ+dJckbLDIvO5VA8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1txScK-007BQt-CA; Wed, 26 Mar 2025 16:24:32 +0100
Date: Wed, 26 Mar 2025 16:24:32 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Lukasz Majewski <lukma@denx.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>, davem@davemloft.net,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Richard Cochran <richardcochran@gmail.com>, netdev@vger.kernel.org,
	Maxime Chevallier <maxime.chevallier@bootlin.com>
Subject: Re: [PATCH 2/5] dt-bindings: net: Add MTIP L2 switch description
 (fec,mtip-switch.yaml)
Message-ID: <4297e9ae-bb10-4d0d-b750-96256ab573f3@lunn.ch>
References: <20250325115736.1732721-1-lukma@denx.de>
 <20250325115736.1732721-3-lukma@denx.de>
 <2ccab52d-5ed1-4257-a8f1-328c76127ebe@lunn.ch>
 <20250326144316.2ca252f7@wsk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250326144316.2ca252f7@wsk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_082441_416269_C8C0A311 
X-CRM114-Status: GOOD (  15.10  )
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

On Wed, Mar 26, 2025 at 02:43:16PM +0100, Lukasz Majewski wrote:
> Hi Andrew,
> 
> > > +  phy-reset-gpios:
> > > +    deprecated: true
> > > +    description:
> > > +      Should specify the gpio for phy reset.  
> > 
> > It seem odd that a new binding has deprecated properties. Maybe add a
> > comment in the commit message as to why they are there. I assume this
> > is because you are re-using part of the FEC code as is, and it
> > implements them?
> > 
> 
> In the case of MTIP L2 switch, the reset gpio line (in my case, but
> also on e.g. imx28-evk, and vf610) is single for both PHYs.

So this is known as an MDIO bus reset, not a PHY reset.

Documentation/devicetree/bindings/net/mdio.yaml

  reset-gpios:
    maxItems: 1
    description:
      The phandle and specifier for the GPIO that controls the RESET
      lines of all devices on that MDIO bus.

We have moved the handling of such reset lines into core code, which
is why per driver properties are deprecated, and you should use the
properties defined in the core.

	Andrew


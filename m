Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E330D1D480
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 16:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uQf5+PqsoN/BZz1kHM8KDEKsf5OhkvBgMB2wQzEFpJI=; b=UcwRGsMb3xQQimxGKj+hap05f5
	yii9BZTmKYEL1ezqYRSbx+zIm3LVfKRy5ixvGQY6QTUs3tObbyvmcuqDcXs8jt+i+dH7Y6kGIZm1U
	QxEVi7ia9EQLQX9cLaakFdh0KYlrwVAmA+jWjj7nIx1ZkAPF7cciQxdwo1b4NaCdGbFQ58QejAbq2
	hiNN1BGYGxzwQTvaanihT04gyMmd7cjeG6Bd5+UgeMEMpCRhK2K/56KaBZNDK2ex6Num1NosMbLEZ
	APxsY2GvkUsxO0G+HgYc2VrpGtWBEXqmghV3Pm4r2XW8yMp6phSGx0GKDVyLeauur6YkgWQAC3OnX
	7ab4XuxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdtMA-00000000Fgg-3Kzw;
	Thu, 08 Jan 2026 16:59:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdtM0-00000000FUm-17Xx
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 08 Jan 2026 16:59:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=uQf5+PqsoN/BZz1kHM8KDEKsf5OhkvBgMB2wQzEFpJI=; b=qfZp1LcxziVKoY92nCl1VWGDLE
	IM5/r9gy6tKTPsVrdSeA7fPX48l735FoXG/NtQQoP4AD94fhYYNRXWwcL5+IMbPbA7u+PeXC+RoNC
	d6ziDU1wffakQJdIhAlttg/R/AOZ720ZQM0afCYwXLTsulcFJLn/T3Jtt4wIU44LhB8aRJty6kkJq
	B55P28uX6lkQDDufmcSq4Q3x7t2xY24RVlh1BvfB3pd8RnDShp7yyrzy7tUxXBSDoUxRyvobklcQS
	aIDKFLRtssg2XMiRoc35qM76L+FBWW+0YWAVzZJE/GF0sz52btuDsM4jcPMXuMApepmSyd+eF5UmY
	UOttg1Dg==;
Received: from vps0.lunn.ch ([156.67.10.101])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdtLx-0000000DjUd-1tV2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 16:59:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=uQf5+PqsoN/BZz1kHM8KDEKsf5OhkvBgMB2wQzEFpJI=; b=glfExQLsR0hZ4sRZ6CiLG573SM
	wBfOXMbUFFxOZY0aGirZkoLAPPLhb7Uy2OCOlhjO8QuWzJy2/NrAYmRaGRLcpQzTNpMwGI/O8zgCS
	s6c7DAwdGU1XdQgDQPPuzKaT5+tzcufSpp6+sW1oJzTinQtTqpaGtsvYsKtnqCJ886RA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vdtLq-001zJe-M6; Thu, 08 Jan 2026 17:59:10 +0100
Date: Thu, 8 Jan 2026 17:59:10 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: davem@davemloft.net, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	thomas.petazzoni@bootlin.com, Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Herve Codina <herve.codina@bootlin.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	=?iso-8859-1?Q?K=F6ry?= Maincent <kory.maincent@bootlin.com>,
	Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	=?iso-8859-1?Q?Nicol=F2?= Veronese <nicveronese@gmail.com>,
	Simon Horman <horms@kernel.org>, mwojtas@chromium.org,
	Antoine Tenart <atenart@kernel.org>, devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Dimitri Fedrau <dimitri.fedrau@liebherr.com>,
	Tariq Toukan <tariqt@nvidia.com>
Subject: Re: [PATCH net-next v22 03/14] net: phy: Introduce PHY ports
 representation
Message-ID: <aa13419e-2e4e-4e26-ba35-54d640a49815@lunn.ch>
References: <20260108080041.553250-1-maxime.chevallier@bootlin.com>
 <20260108080041.553250-4-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260108080041.553250-4-maxime.chevallier@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_165917_665433_8BAEAC12 
X-CRM114-Status: GOOD (  21.00  )
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

On Thu, Jan 08, 2026 at 09:00:28AM +0100, Maxime Chevallier wrote:
> Ethernet provides a wide variety of layer 1 protocols and standards for
> data transmission. The front-facing ports of an interface have their own
> complexity and configurability.
> 
> Introduce a representation of these front-facing ports. The current code
> is minimalistic and only support ports controlled by PHY devices, but
> the plan is to extend that to SFP as well as raw Ethernet MACs that
> don't use PHY devices.
> 
> This minimal port representation allows describing the media and number
> of pairs of a BaseT port. From that information, we can derive the
> linkmodes usable on the port, which can be used to limit the
> capabilities of an interface.
> 
> For now, the port pairs and medium is derived from devicetree, defined
> by the PHY driver, or populated with default values (as we assume that
> all PHYs expose at least one port).
> 
> The typical example is 100M ethernet. 100BaseTX works using only 2
> pairs on a Cat 5 cables. However, in the situation where a 10/100/1000
> capable PHY is wired to its RJ45 port through 2 pairs only, we have no
> way of detecting that. The "max-speed" DT property can be used, but a
> more accurate representation can be used :
> 
> mdi {
> 	connector-0 {
> 		media = "BaseT";
> 		pairs = <2>;
> 	};
> };
> 
> >From that information, we can derive the max speed reachable on the
> port.
> 
> Another benefit of having that is to avoid vendor-specific DT properties
> (micrel,fiber-mode or ti,fiber-mode).
> 
> This basic representation is meant to be expanded, by the introduction
> of port ops, userspace listing of ports, and support for multi-port
> devices.
> 
> Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew


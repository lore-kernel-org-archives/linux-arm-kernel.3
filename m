Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 013E4D10F56
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 14:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mfg0ApTsZBuNNepuSTDvrLS0QmLBqFFmwPo/8UlDzWM=; b=nJ/UhUwrTuc0OtnrjFFzLjPi1Z
	czxCkH8RoLp5mLrqn2wfPYIk7d7YOJFN/edNm7WS/TnYA0wM8F3QrkTTWjN6oGuFRGOw23zbARnSR
	zPu0DzKrOrzex/evZZZncQ42AzRLaeEef4vIY2CuHuWWNizo1wm7gkRnxgp+VyDY59MxVUVVG9bf1
	GQB8xs8TSm7THT+8a2OGYDiZ1kBiqKWMvlTE3wEdLsZLlxR5GoXaNO2R79k9niAig8lduf7EhFWy/
	WOEzI+1sAUyZTel3HmQLN46ydBzh4gZ3T+lKLpMVb+jGI0B9zCGOhDQbNXkxBv02/J4WVZnB05tHU
	R2gwbpOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOGDa-0000000F5Bn-22xs;
	Wed, 26 Nov 2025 14:10:02 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOGDW-0000000F58Q-49rW;
	Wed, 26 Nov 2025 14:10:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=mfg0ApTsZBuNNepuSTDvrLS0QmLBqFFmwPo/8UlDzWM=; b=J2sQjWS7Hax5P1/pbf0MUa1otj
	b85hRFkepQK9OqNVx44xklhecjLP6XGrWx+eDJMoooUVohkSGS4BcWt2VeJvn4PFBgIHGgo2uPLTR
	UODbmiGYHKLOU5oPH4FShi5BIr4kNDj0/HR+qoa+Cxa/toX/kXBhKpCdOh1jj99YemOQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vOGDH-00F9qu-Hi; Wed, 26 Nov 2025 15:09:43 +0100
Date: Wed, 26 Nov 2025 15:09:43 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Daniel Golle <daniel@makrotopia.org>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Eric Woudstra <ericwouds@gmail.com>,
	Marek =?utf-8?B?QmVo4oia4oirbg==?= <kabel@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Holger Brunck <holger.brunck@hitachienergy.com>
Subject: Re: [PATCH net-next 1/9] dt-bindings: phy: rename
 transmit-amplitude.yaml to phy-common-props.yaml
Message-ID: <1b815a90-f50e-4bf5-8e43-2f4ac11f96bc@lunn.ch>
References: <20251122193341.332324-1-vladimir.oltean@nxp.com>
 <20251122193341.332324-2-vladimir.oltean@nxp.com>
 <0faccdb7-0934-4543-9b7f-a655a632fa86@lunn.ch>
 <20251125214450.qeljlyt3d27zclfr@skbuf>
 <b4597333-e485-426d-975e-3082895e09f6@lunn.ch>
 <20251126072638.wqwbhhab3afxvm7x@skbuf>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251126072638.wqwbhhab3afxvm7x@skbuf>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_061000_246664_F24D917C 
X-CRM114-Status: GOOD (  17.55  )
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

> All I'm trying to say is that we're missing an OF node to describe
> mv88e6xxx PCS electrical properties, because otherwise, it collides with
> case (1). My note regarding "phys" was just a guess that the "phy-handle"
> may have been mistaken for the port's SerDes PHY. Although there is a
> chance Holger knew what he was doing. In any case, I think we need to
> sort this one way or another, leaving the phy-handle logic a discouraged
> fallback path.
> 
> That being said, I'm not exactly an expert in determining _how_ we could
> best retrofit SerDes/PCS OF nodes on top of the mv88e6xxx bindings.
> It depends on how many SerDes ports there are in these switches
> architecturally, and what is their register access method, so it would
> need to be handled on a case-by-case basis rather than one-size-fits-all.
> PCS node in port node could be a starting point, I guess, but I don't
> know if it would work.

I would more likely have a PCS container node and then list each PCS
within it, using reg as the MDIO bus address. The 6352 has one PCS,
but depending on configuration port 5 or port 6 can make use of it. (I
might have the numbers wrong, but the principle is correct). Some of
the other switches have more PCSs but with a fixed mapping to
ports. And the 6390X has 2x 10G PCS. But you can take this 10G PCS and
split it into 2x 5G. And you can take those 5G PCS and split it into
two to give a PCS which can do 1/2.5G.

Given this flexibility, putting the PCS in the port would probably be
a bad idea.

	Andrew


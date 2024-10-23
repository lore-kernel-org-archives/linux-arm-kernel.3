Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4EAACFA45C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 18:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hCXcgtGPtEn2014ULSmg0P/AaZa90Zl7RHG/bEE0dtk=; b=l5+DFG1HQmsYuRfeoC0WkLBf7L
	9NWS7lFHZh2CFwDh04QJc6BXHUKa7E48XcUdHAG2S3hbbRzhwn0uhxnmt8ux24lSi9O5hQc217/UD
	+eWl1JUP/XIfI8HlYKPTQbrmYPDY1/Xvx9vHf7pKZN1Vp78FEJwswIXwgzsUyVD9dG2VfZ/lwkCGJ
	hQs7kTK9kGxxIgalGgc2ZIhSiOL7S/GC4o1ppdCyhcDjGr93za8Qn91Lhs3qNcWPIGYJLBeKRGMkD
	J+0QaoD/dp1nB4l33NpLvzoecZE8d8xTp2OLGvwsUheDfAYlVpmBYrD3j7ZAoaf3vhXk2ASdgZbFq
	ggRFRvcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3g5q-0000000FXMJ-0uP3;
	Wed, 23 Oct 2024 18:28:26 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3fKA-0000000FOsZ-1IJd;
	Wed, 23 Oct 2024 17:39:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=hCXcgtGPtEn2014ULSmg0P/AaZa90Zl7RHG/bEE0dtk=; b=qS0cwOVIg/cClPHaWZxurc/tnW
	LGtkJjOm0+MOJ1UNf1vbNAFHq9PLuCpUAs420xpmvdEPR5yI0Teo3X+WkQVtRR+ickluYg7wmotKa
	abCoX137Z4CcNo3mVF4Htvp1PwccARknsaQ2CVChwyp6IQaLcb450I7rFx0BBHqhlUvE=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1t3fK1-00Azxv-Lc; Wed, 23 Oct 2024 19:39:01 +0200
Date: Wed, 23 Oct 2024 19:39:01 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [net-next RFC PATCH v2 1/3] dt-bindings: net: dsa: Add Airoha
 AN8855 Gigabit Switch documentation
Message-ID: <77e99052-a14e-4495-9197-06d98257c590@lunn.ch>
References: <20241023161958.12056-1-ansuelsmth@gmail.com>
 <20241023161958.12056-2-ansuelsmth@gmail.com>
 <5761bdc3-7224-4de6-b0f5-bedc066c09f6@lunn.ch>
 <67192f00.7b0a0220.343b2b.9836@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <67192f00.7b0a0220.343b2b.9836@mx.google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_103910_399412_732D15AF 
X-CRM114-Status: GOOD (  18.84  )
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

> Well the first case that comes to mind is multiple switch and conflict.
> I have no idea if there are hw strap to configure this so I assume if a
> SoC have 2 switch (maybe of the same type), this permits to configure
> them (with reset pin and deasserting them once the base address is
> correctly configured)

Is this switch internal on an internal MDIO bus, or external?

Most PHYs and switches i've seen have strapping pins to set the base
address. It would be unusual if there was not strapping.

For the Marvell switches, the strapping moves all the MDIO
registers. This is why we have a reg at the top level in mv88e6xxx:

        ethernet-switch@0 {
            compatible = "marvell,mv88e6085";
            reg = <0>;

There is one family which use the values of 0 or 16, and each switch
uses 16 addresses. So you can put two on the bus.

> > > +  mdio:
> > > +    $ref: /schemas/net/mdio.yaml#
> > > +    unevaluatedProperties: false
> > > +    description:
> > > +      Define the relative address of the internal PHY for each port.
> > > +
> > > +      Each reg for the PHY is relative to the switch base PHY address.
> > 
> > Which is not the usual meaning of reg.
> > 
> > > +            mdio {
> > > +                #address-cells = <1>;
> > > +                #size-cells = <0>;
> > > +
> > > +                internal_phy0: phy@0 {
> > > +                    reg = <0>;
> > 
> > So given that airoha,base_smi_address defaults to 1, this is actually
> > address 1 on the MDIO bus?
> >
> 
> Yes correct. One problem I had was that moving this outside the swich
> cause panic as it does conflict with the switch PHY address...

I would make these addresses absolute, not relative. The example above
from the marvell switch, the device using addresses 16-31 has its PHYs
within that range, and we uses the absolute reg values.

	Andrew


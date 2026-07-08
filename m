Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0349C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 14:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3RsIPvZTD5nyIx31RnZBoJDbs5La8Zh1JeU+CoAk0mc=; b=unSK3ktwSCkRqrSLLMeCm+lPrZ
	owPWJaFMHyWfrtc/ua835BslO5XE9sUr5AENUrTKDl7oS6EgkenylWuDmK1ETe6U6mIk5Tnbuj+1V
	sVsWPfvk60t+RYe9CansRpFkP7Lvu8oRBHez1PHEDAN4GbEn78bdgnlJgq8H2hiDrYGC1mkxtRByZ
	bv6kDrxfEbcV1sTguR7Y7c1ylMsLjX8pvl4W1lgGXLrds0P5sWKwVSdyxFRnSORTDeiW0geZgVz+a
	si5TpJBdTYySTWFm8n4Cs2xPQaPuYmIgMvjuDfcCl/duagf7xXdoFn5Dzd65TK8dXntt2Ra5EAcRy
	D217YWhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whTNX-0000000HMah-0ILk;
	Wed, 08 Jul 2026 14:35:59 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whTNV-0000000HMa0-3aY1;
	Wed, 08 Jul 2026 14:35:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=3RsIPvZTD5nyIx31RnZBoJDbs5La8Zh1JeU+CoAk0mc=; b=Yb
	OHKqa1T/B64IUbHGnRIp5MUkE/sqUTcfU+fOTp4OdCC8IXPMUblg7xAEbtfI6mPatQsy5wLoEIfw5
	k9FEupjoPV+I/yDDkkQBFzXdcyd2+uZmyhbI8FrJpRIj2U70jU17dy+IY9pmVK3R++4cIYekuR7l7
	ftGjZ2nL0usWUlI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1whTNB-00BKwC-V6; Wed, 08 Jul 2026 16:35:37 +0200
Date: Wed, 8 Jul 2026 16:35:37 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Biao Huang <biao.huang@mediatek.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	maxime.chevallier@bootlin.com, rmk+kernel@armlinux.org.uk,
	kernel@collabora.com, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH net-next 1/6] dt-bindings: net: mediatek-dwmac: add
 support for MT8189 SoC
Message-ID: <6ea11726-8d50-411e-afab-da346e09ab9b@lunn.ch>
References: <20260707-dwmac-mediatek-mt8189-v1-0-17f345eaaca3@collabora.com>
 <20260707-dwmac-mediatek-mt8189-v1-1-17f345eaaca3@collabora.com>
 <b810b9cd-8f5e-4c9d-8496-908aae55dac1@lunn.ch>
 <8304b0a704c8db697767584b8c34388f07ba401d.camel@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8304b0a704c8db697767584b8c34388f07ba401d.camel@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_073557_892702_AA4F1C0B 
X-CRM114-Status: GOOD (  16.20  )
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

> On Tue, 2026-07-07 at 14:42 +0200, Andrew Lunn wrote:
> > > +  - if:
> > > +      properties:
> > > +        compatible:
> > > +          contains:
> > > +            enum:
> > > +              - mediatek,mt8189-gmac
> > > +    then:
> > > +      properties:
> > > +        clocks:
> > > +          items:
> > > +            - description: MAC Main clock
> > > +            - description: PTP clock
> > > +            - description: RMII reference clock provided by MAC
> > 
> > Since this is a MAC, it sounds like it is consuming its own clock?
> 
> In the driver ([1]), this clock is described as being only used and
> needed in RMII when MAC provides the reference clock, and useless
> otherwise (RGMII/MII or RMII when PHY provides the reference clock).

So it sounds like this is a clock output, going to the PHY, as its
reference clock input. So ideally, the PHY should consume this clock,
not the MAC.

> Its use and configuration also depends on the "mediatek,rmii-clk-from-
> mac" vendor property ([2]) presence in devicetree.

This makes it sounds like it is historically wrong, and the patch is
just extending this to the new device.

Do you have a board using RMII? Can you list the clock in the PHY
node, not the MAC, and see if it still works?

Ideally, for a new device, we should not repeat past errors.

	 Andrew


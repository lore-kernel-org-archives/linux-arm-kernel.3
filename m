Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF248D4335D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 13:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1o0PT+VvYeF2Yc1hTEqEhN6nNmR8jwyG9x4O7dGE/Wk=; b=0+zB+Cko5CZzDFF9QwvEpV7gpe
	LwDN3Ad/5zirNP1krsZ+fAp66XUzmkNmyg7HSDDZxtIZcFbZqKg0PjpvLIgjTqAPxDDWzNSpz97ZQ
	HC4tijuBe2+Kjq2hYkEERazrpjMy7Z6GIyEVSSnoC6PmxakwgiNnWn2e6N4y2KWKhImqu82E+N7f6
	nBXGLH1dnZ+Hgqz+HIzHeyMpjsWq3jJ7gEkMulVUWKTm1XXMrqjWkrRsSrh3C7kqg10USAtmEuG5N
	glbtnQ7Ib2JFkQtUMESmIkU9LfnkfR1sjEzhqqzGjog6anihKkm/ja6Kn1F0dtJDBVSUE294u8PDF
	EL6uIsQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t92Rj-000000074Vx-3glp;
	Thu, 07 Nov 2024 13:21:11 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t92Pi-000000074As-2MJk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Nov 2024 13:19:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=1o0PT+VvYeF2Yc1hTEqEhN6nNmR8jwyG9x4O7dGE/Wk=; b=qo
	PZCD8fmKsuqe8MM0+5HAxgA1V6sLxp1dxWT6dgRzFLKJ+Uj612/2my5BcrbEkzNKu2cGnhqk12oGB
	/a4BAt4NCaZn7xVX092i/qM2JCfjxaohRr5xqBfTcg7hjl+yJ2+6TiiQ3PRLlum+gfT49bcro6kXI
	u2un0pipZbINs5Y=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1t92PO-00CSlH-Qe; Thu, 07 Nov 2024 14:18:46 +0100
Date: Thu, 7 Nov 2024 14:18:46 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Joey Lu <a0987203069@gmail.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, mcoquelin.stm32@gmail.com,
	richardcochran@gmail.com, alexandre.torgue@foss.st.com,
	joabreu@synopsys.com, ychuang3@nuvoton.com, schung@nuvoton.com,
	yclu4@nuvoton.com, linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 1/3] dt-bindings: net: nuvoton: Add schema for Nuvoton
 MA35 family GMAC
Message-ID: <9455e2f6-b41d-476e-bda9-fc01958e48d5@lunn.ch>
References: <20241106111930.218825-1-a0987203069@gmail.com>
 <20241106111930.218825-2-a0987203069@gmail.com>
 <f3c6b67f-5c15-43e2-832e-28392fbe52ec@lunn.ch>
 <21a00f02-7f2f-46da-a67f-be3e64019303@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <21a00f02-7f2f-46da-a67f-be3e64019303@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_051906_623094_9DDA2026 
X-CRM114-Status: GOOD (  16.33  )
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

On Thu, Nov 07, 2024 at 06:31:26PM +0800, Joey Lu wrote:
> Dear Andrew,
> 
> Thank you for your reply.
> 
> Andrew Lunn 於 11/7/2024 2:13 AM 寫道:
> > > +  phy-mode:
> > > +    enum:
> > > +      - rmii
> > > +      - rgmii-id
> > The phy-mode deepened on the board design. All four rgmii values are
> > valid.
> I will add them.
> > > +
> > > +  tx_delay:
> > > +    maxItems: 1
> > > +    description:
> > > +      Control transmit clock path delay in nanoseconds.
> > > +
> > > +  rx_delay:
> > > +    maxItems: 1
> > > +    description:
> > > +      Control receive clock path delay in nanoseconds.
> > If you absolutely really need these, keep them, but i suggest you drop
> > them. They just cause confusion, when ideally we want the PHY to be
> > adding RGMII delays, not the MAC.
> > 
> > If you do need them, then they should be in pS.
> 
> I will fix it.
> 
> We have customers who use a fixed link instead of a PHY, so these properties
> may be necessary.

That is a legitimate use case which can require the MAC to add delays,
but i generally try to get the switch on the other end to add the
delays, just to keep with the uniform setup.

Also, please take a look at ethernet-controller.yaml, these should be
called rx-internal-delay-ps & tx-internal-delay-ps.

	Andrew


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 954F8CCFA04
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 13:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1RoProTG9PzhyYdQtnEke6X8DcnYXk+jaxvxgzqlOOM=; b=YNZ45MrLZJeloaXu3kwpxTT+T5
	lOyc1w4iqu4hbPuVsZygz+lSrDfd3zuYjs1LRLLPujQjPhmOZUa+Kb2zT6QwqJuVMPZqaj4GKVaYt
	DCvEGQgv9jEk4qKunw23wCmJBdPVWFkfOX3AmTYOkE0D+c1G+td7XSRP/JBWz127DAqG2btGfHNkj
	HNZArtBuBrSWJl1ORt2O5IMxvkpv7PB2hwJdSofjcOplZoBQOQ/pkrOphn+dcPSEH2G0wgFylgsjC
	5JcN4fCli6aUSoQQlc3aGdFYvNe6qrVU4QpK8b7LQ5/DAVZwpbEy6/G8luKhX3hDNJlzwfd3dX1w6
	yDHA65jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGHRL-0000000Bv4L-2TCK;
	Tue, 04 Nov 2025 13:51:15 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGHRI-0000000Bv3I-25Y8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 13:51:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=1RoProTG9PzhyYdQtnEke6X8DcnYXk+jaxvxgzqlOOM=; b=0fVMoEM2YIUsV39yO4/4GFCh1C
	W4SVgioyHTwO+McaUh/604S2HDExj5aRUIq2NI6OU8B1J79LrMxGrh49mMr5DR6Nb+qT7RaGc6gLl
	iuzuYrhb0OSwO6VXHp76u6bRwdoKoiAnDZe9JjVQ/aok5ME/MUIPVXT/AZvq/+R8su7I=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vGHQy-00CtNF-Ri; Tue, 04 Nov 2025 14:50:52 +0100
Date: Tue, 4 Nov 2025 14:50:52 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Jacky Chou <jacky_chou@aspeedtech.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Po-Yu Chuang <ratbert@faraday-tech.com>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
	"taoren@meta.com" <taoren@meta.com>
Subject: Re: =?utf-8?B?5Zue6KaGOiBbUEFUQ0ggbmV0LW5l?=
 =?utf-8?Q?xt_v3_1=2F4=5D_dt-bindings?= =?utf-8?Q?=3A?= net: ftgmac100: Add
 delay properties for AST2600
Message-ID: <eaff1dbb-b836-42b1-a9f0-715698bd0a6f@lunn.ch>
References: <20251103-rgmii_delay_2600-v3-0-e2af2656f7d7@aspeedtech.com>
 <20251103-rgmii_delay_2600-v3-1-e2af2656f7d7@aspeedtech.com>
 <cf5a3144-7b5e-479b-bfd8-3447f5f567ab@lunn.ch>
 <SEYPR06MB5134396D2CD9BD7EE47137F09DC4A@SEYPR06MB5134.apcprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SEYPR06MB5134396D2CD9BD7EE47137F09DC4A@SEYPR06MB5134.apcprd06.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_055113_207835_AC6A2989 
X-CRM114-Status: GOOD (  25.93  )
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

On Tue, Nov 04, 2025 at 05:22:59AM +0000, Jacky Chou wrote:
> > > diff --git
> > > a/Documentation/devicetree/bindings/net/faraday,ftgmac100.yaml
> > > b/Documentation/devicetree/bindings/net/faraday,ftgmac100.yaml
> > > index d14410018bcf..de646e7e3bca 100644
> > > --- a/Documentation/devicetree/bindings/net/faraday,ftgmac100.yaml
> > > +++ b/Documentation/devicetree/bindings/net/faraday,ftgmac100.yaml
> > > @@ -19,6 +19,12 @@ properties:
> > >                - aspeed,ast2500-mac
> > >                - aspeed,ast2600-mac
> > 
> > I don't know if it is possible, but it would be good to mark aspeed,ast2600-mac
> > as deprecated.
> > 
> > I also think some comments would be good, explaining how
> > aspeed,ast2600-mac01 and aspeed,ast2600-mac23 differ from
> > aspeed,ast2600-mac, and why you should use them.
> > 
> 
> Thanks for the suggestion.
> We keep "aspeed,ast2600-mac" in the compatible list mainly for backward compatibility.
> There are already many existing device trees and systems using this string.
> Removing or deprecating it right now might break those setups.

I'm not saying remove it. I'm just saying mark it as deprecated. For
properties you add an extra attribute, e.g.

https://elixir.bootlin.com/linux/v6.17.7/source/Documentation/devicetree/bindings/net/snps,dwmac.yaml#L433

but for a compatible, i've no idea if YAML supports it. However,
snps,dwmac.yam actually places st,spear600-gmac at the end of the list
after a comment. Maybe that is the best way to do this, and in the
comment you can explain what it gets wrong and why you should not use
it.

> In the future, if someone submits a new DTS for an AST2600-based platform,
> I think they should add the new compatible string and properly describe the TX/RX delay and 
> phy-mode properties in their DTS.

Yes, i agree. It would be good if you can keep on out of for such
patches, and make review comments. I assume you will also update the
vendor documentation with this recommendation.

	Andrew


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17379CCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 02:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8N27r7Oyc3ywyYoactwLwAQqQuBjFkaj2XYsC9wqqK8=; b=gO1Mhgk7Z1v6BdeAjgvEm0vfit
	Q/VAYQoiAA2vqaLDVt/0SvbQzQmLHhddeAS9cmA1LRXVcTyEXFBfez+3p3IivBZqxkH41j6nRd6bq
	XwErjKVC54vPlKeEMoYD8Uwgcm7C+aSgPe7UGpZz1RXWtYLNzcEwLGU8IbFp3ZffrHu/UwAeoJlK/
	v3unXkFK/9Xy+I8SCkblryaqLAKcXmD/y9c+vk6CHMURQEdj0LYDiZCaD3fi+TA4/rQRSytqZ1yE0
	OdoAtnO4QXAl7Qqf+MTASNndGTtHpev9eEVx8zswjZbnWw3k/3Uc9V/MxX5v3vUFVrqZDR+eCTJ1P
	UxQYrAbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHBnZ-0000000GY8L-2KDD;
	Fri, 07 Nov 2025 02:01:57 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHBnV-0000000GY7q-1YNZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 02:01:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=8N27r7Oyc3ywyYoactwLwAQqQuBjFkaj2XYsC9wqqK8=; b=a8anxoyBx7wvtgUTEJpLKERgMl
	V+UTcgG4iGjmD2EgxRzkEjCoc7DoHYXIuQHqcF0m9ASAg/1S5j9bxDOoEd4U72iMpsPLAN93IpNUE
	CR3416YcFDWFVvbfyoiq3ftgKJA+x2HK0P9NJwc4bEsCP7cu9fEDb/it4hufMRwquxBo=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vHBn3-00DAwe-UJ; Fri, 07 Nov 2025 03:01:25 +0100
Date: Fri, 7 Nov 2025 03:01:25 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Jacky Chou <jacky_chou@aspeedtech.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
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
Subject: Re: [PATCH net-next v3 1/4] dt-bindings: net: ftgmac100: Add delay
 properties for AST2600
Message-ID: <8b2f985f-d24e-427e-88cc-94d9bc5815b2@lunn.ch>
References: <20251103-rgmii_delay_2600-v3-0-e2af2656f7d7@aspeedtech.com>
 <20251103-rgmii_delay_2600-v3-1-e2af2656f7d7@aspeedtech.com>
 <20251104-victorious-crab-of-recreation-d10bf4@kuoka>
 <SEYPR06MB5134B91F5796311498D87BE29DC4A@SEYPR06MB5134.apcprd06.prod.outlook.com>
 <9ae116a5-ede1-427f-bdff-70f1a204a7d6@kernel.org>
 <SEYPR06MB5134004879B45343D135FC4B9DC2A@SEYPR06MB5134.apcprd06.prod.outlook.com>
 <1f3106e6-c49f-4fb3-9d5a-890229636bcd@kernel.org>
 <SEYPR06MB51346AEB8BF7C7FA057180CE9DC3A@SEYPR06MB5134.apcprd06.prod.outlook.com>
 <44776060-6e76-4112-8026-1fcd73be19b8@lunn.ch>
 <SEYPR06MB5134F0CF51189317B94377C09DC3A@SEYPR06MB5134.apcprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SEYPR06MB5134F0CF51189317B94377C09DC3A@SEYPR06MB5134.apcprd06.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_180153_432812_0B500A7B 
X-CRM114-Status: GOOD (  22.73  )
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

On Fri, Nov 07, 2025 at 01:12:08AM +0000, Jacky Chou wrote:
> Hi Andrew
> 
> > > There are four MACs in the AST2600. In the DT bindings and DTS files,
> > > what would be the recommended way to identify which MAC is which?
> > > In version 3 of my patches, I used the aliases in the DTSI file to
> > > allow the driver to get the MAC index.
> > 
> > It is a bit ugly, but you are working around broken behaviour, so sometimes you
> > need to accept ugly. The addresses are fixed. You know
> > 1e660000 is mac0, 1e680000 is mac1, etc. Put the addresses into the driver,
> > for compatible aspeed,ast2600-mac.
> > 
> 
> I used this fixed address as MAC index in the first version of this series.
> But the other reviewer mentioned maybe there has the other better way to 
> identify index.
> https://lore.kernel.org/all/20250317095229.6f8754dd@fedora.home/
> I find the "aliase", on preparing the v2 and v3, I think it may be a way to
> do that. But I am not sure.
> So, I would like to confirm the other good way before submitting the next
> version.

The problem with alias is that it normally a board property, in the
.dts file. A board might want a different mapping, which could then
break delays.

	Andrew


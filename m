Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A091C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 14:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0yf+Edtj7qyHSUTzNfZ+JKXVNOrD8jm+TXRXVg69QbA=; b=SRwEHX0k/pn6XcsQFRByK5nslb
	Dxrs61fSm5mx/+e6j0vGcnj892pRD4xZd7Id0Zn+8iFVsSSGgrj9crS3avcmMYAM0NV+lwDaORibA
	bcSxElorBAf35rxBLHsMolycxMy4r5ZSSors+pClytyltdKZoSknG4akDsp16X04BypEt/AkpYh85
	w5pVFjNBiJ2CWbD18Y/lIxD0bjwCMm72WoMRixLLJX+6Q2zCVFcbXFct4nNSgN8UpWafv6XZ61uGM
	qnaDB4DIbktygl3I1oVvtCNQGKTorq7eyZJ5YW7NL2Wc/DaPYjEUkgt9wh0i9NBf1akgdo5e995fA
	yUTeEJ+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuXbO-000000068Ba-0CZw;
	Tue, 18 Mar 2025 14:07:30 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuXXJ-000000067JQ-3xc3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 14:03:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=0yf+Edtj7qyHSUTzNfZ+JKXVNOrD8jm+TXRXVg69QbA=; b=357SSSF22yh5nMcYWPclY7KXns
	bBTRpnsCM0yabQo6ggsqvDtS521lMh5u73mchyQSJ01CwKeyG0v+3YePiHNisxh+qWVKy4GBaVYcn
	r0Q3lIM+FIwRUz5pkuG+bJ7OENHhjUHK7BtAmWbnOGI3HE7L6QrQAaz1gFMU1LblELAo=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tuXX5-006Gct-Rs; Tue, 18 Mar 2025 15:03:03 +0100
Date: Tue, 18 Mar 2025 15:03:03 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Jacky Chou <jacky_chou@aspeedtech.com>
Cc: "andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>,
	"davem@davemloft.net" <davem@davemloft.net>,
	"edumazet@google.com" <edumazet@google.com>,
	"kuba@kernel.org" <kuba@kernel.org>,
	"pabeni@redhat.com" <pabeni@redhat.com>,
	"robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"joel@jms.id.au" <joel@jms.id.au>,
	"andrew@codeconstruct.com.au" <andrew@codeconstruct.com.au>,
	"ratbert@faraday-tech.com" <ratbert@faraday-tech.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
	BMC-SW <BMC-SW@aspeedtech.com>
Subject: Re: =?utf-8?B?5Zue6KaGOiBbbmV0LW5leA==?= =?utf-8?Q?t?= 2/4] ARM:
 dts: ast2600-evb: add default RGMII delay
Message-ID: <8c0195dd-50b3-4f30-a021-c5b77d39d895@lunn.ch>
References: <20250317025922.1526937-1-jacky_chou@aspeedtech.com>
 <20250317025922.1526937-3-jacky_chou@aspeedtech.com>
 <5db47dea-7d90-45a1-85a1-1f4f5edd3567@lunn.ch>
 <SEYPR06MB5134A69692C6C474BDE9A6A99DDE2@SEYPR06MB5134.apcprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SEYPR06MB5134A69692C6C474BDE9A6A99DDE2@SEYPR06MB5134.apcprd06.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_070317_980598_C87519D6 
X-CRM114-Status: GOOD (  12.04  )
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

On Tue, Mar 18, 2025 at 11:00:27AM +0000, Jacky Chou wrote:
> Hi Andrew,
> 
> Thank you for your reply.
> 
> > >  	phy-mode = "rgmii";
> > >  	phy-handle = <&ethphy2>;
> > >
> > > +	tx-internal-delay-ps = <8>;
> > > +	rx-internal-delay-ps = <4>;
> > > +
> > 
> > Ideally you want:
> > 
> > 	phy-mode = "rgmii-id";
> > 	tx-internal-delay-ps = <0>;
> > 	rx-internal-delay-ps = <0>;
> > 
> > Since 'rgmii-id' correctly describes the hardware.
> 
> I still confuse about ethernet-controller.yaml.
> It lists 'rgmi', 'rgmii-rxid', 'rgmii-txid' and 'rgmii-id'.

DT describes the board. Does the board add the 2ns delay via extra
long clock lines? If yes, use rgmii. If the MAC/PHY pair need to add
the 2ns delay, use rgmii-id.

If the MAC/PHY pair is adding the delay, the DT says nothing about how
they add the delay.

The general rule is the PHY adds the delay. If you look at
drivers/net/phy/*.c, every PHY that implements RGMII support both
PHY_INTERFACE_MODE_RGMII_ID and PHY_INTERFACE_MODE_RGMII. There is no
reason not to follow ever other MAC/PHY pair and have the PHY add the
delay. The MAC can then do fine tuning if needed, adding small delays.

	Andrew


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E45ECCFA04
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 13:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ITCLqcPKdtMfzHDn3f1hMx+q58ZaP4E+ZYDldEc3toE=; b=fBrAfiRPeNFtzrGQ4bLF9CDTtE
	4bLTCEroFTx+L/UOgt9hi+H0d3yeg/8oJZ/odkk9GETQpd4mjxrhfE/EQxKWVlprTNgwqls+npmiN
	Fs/bFsy8esUuxQFNQY4sHS6TQ9FqNSK5Y1Q0qXmjh0+MtR5Zauez07gYi7kJIpSSA3BIc74JuJvIZ
	1vlokiLpwpo6+wcsrk+fsVFCTuRlJ4yznUGnvKNcXp5WgY3zKjloglfAJ73DYDmD+vy0sBP829x79
	USbT6qJ1PL7Zj0rMnCTpVVlQRFYVvUn96HVHp/lsPoH7ZgUTDeASfa1BhuJ8plAdywvXSThifoSZK
	AMXfnWag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGHHR-0000000BtfC-2UaP;
	Tue, 04 Nov 2025 13:41:01 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGHHO-0000000BteY-3gfq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 13:41:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=ITCLqcPKdtMfzHDn3f1hMx+q58ZaP4E+ZYDldEc3toE=; b=y6KWc+d1T0EMoGe0Uz8xFsN4wG
	Hlk1wADkucu+s+tHZWPnOVCGTF2eItOAjrhVLD3QdPb5iAThErckAfFf4rZJdIe3i26+IzHZy7IiV
	wGBMJUlRL0FiD9UZoZfhBArAmMCJDIV71TCE6UEZVmbXZMAVSw2X6IEm0YKhLRidusVc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vGHGu-00CtIS-V1; Tue, 04 Nov 2025 14:40:28 +0100
Date: Tue, 4 Nov 2025 14:40:28 +0100
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
Subject: Re: [PATCH net-next v3 1/4] dt-bindings: net: ftgmac100: Add delay
 properties for AST2600
Message-ID: <d7b08607-73a3-4f6b-ab8b-3eb4ff8b8647@lunn.ch>
References: <20251103-rgmii_delay_2600-v3-0-e2af2656f7d7@aspeedtech.com>
 <20251103-rgmii_delay_2600-v3-1-e2af2656f7d7@aspeedtech.com>
 <2424e7e9-8eef-43f4-88aa-054413ca63fe@lunn.ch>
 <SEYPR06MB5134AB242733717317AAEDEA9DC4A@SEYPR06MB5134.apcprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SEYPR06MB5134AB242733717317AAEDEA9DC4A@SEYPR06MB5134.apcprd06.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_054058_919468_FDB2DDAD 
X-CRM114-Status: GOOD (  21.85  )
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

On Tue, Nov 04, 2025 at 05:14:41AM +0000, Jacky Chou wrote:
> Hi Andrew,
> 
> Thank you for your reply.
> 
> > > +  - if:
> > > +      properties:
> > > +        compatible:
> > > +          contains:
> > > +            const: aspeed,ast2600-mac01
> > > +    then:
> > > +      properties:
> > > +        rx-internal-delay-ps:
> > > +          minimum: 0
> > > +          maximum: 1395
> > > +          multipleOf: 45
> > 
> > I would add a default: 0
> > 
> 
> Agreed.
> I will add it in next version.
> 
> > > +        tx-internal-delay-ps:
> > > +          minimum: 0
> > > +          maximum: 1395
> > > +          multipleOf: 45
> > 
> > and also here.
> > 
> 
> Agreed.
> 
> > > +      required:
> > > +        - scu
> > > +        - rx-internal-delay-ps
> > > +        - tx-internal-delay-ps
> > 
> > and then these are not required, but optional.
> > 
> 
> Configure the tx/rx delay in the scu register.
> At least, the scu handle must be required.

Sorry, i was unclear. By says 'and then', i was trying to chain it to
the previous comment, that the delays should default to 0. With
defaults set, rx-internal-delay-ps and tx-internal-delay-ps become
optional. I agree scu is required.

> Here I have one question.
> In v3 patches series, if the ftgmac driver cannot find one of 
> tx-internal-delay-ps and rx-internal-delay-ps, it will return error in probe 
> stage.
> If here is optional, does it means that just add warning and not return error when
> lack one of them and use the default to configure? Or not configure tx/rx delay just
> return success in probe stage?

Once you add the default statement, it is clear what delay should be
added if they property is not listed, 0. No warning is needed.

What you should find in the end is that most boards just set the new
compatible and 'rgmii-id', and need nothing else. Only badly designed
boards tend to need tx-internal-delay-ps and rx-internal-delay-ps.

	Andrew


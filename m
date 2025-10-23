Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 691A9CCD193
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 18:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dF8Bsuxs1bOw/Vu4h6JauGctQLAvBIWDKoMFcT9IHNI=; b=xI40/xwlZ+po8/FGhjkNlLHkPY
	M5j0VR45XAjcquI/beN1owUEntdiGmMBHAFBujZdDXdPtNf5/vDI9qegeYk63siMmH5OfE/Ls12ma
	P9BjG1eOaROwlqaZHQZjWehLcO0zbzEKdOgLxOKc2bl1HbdG/x6AuhRaXuMMm/AW3n0IO8bvn/sNT
	pu0481xFcJFhuEsSSGNTRnYKN4TFWeea5OazvQ/PgygNXh/5BEjMAvNWKhk7T4SlM8jPFgNXh4f6x
	fL0H4eaMb2SlmyQt7kQvHrpjZifAbncT3dRmwa5GHhr6pzz4TsG3BkuVBRqWp6f4cFo4n6HOBWn+5
	kusSuJDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC03D-00000007E7G-3eEe;
	Thu, 23 Oct 2025 18:28:39 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC03B-00000007E5a-2B6O
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Oct 2025 18:28:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=dF8Bsuxs1bOw/Vu4h6JauGctQLAvBIWDKoMFcT9IHNI=; b=ycDkGYCDrUPhwkysgMTElO7lrA
	oERm9YjauhNyWsqRqlB3gXptN4R4DH72ymIRKKbzc1/7OkCcI2fZAh76tcJ2Ij/Vkj2XkTYfdvDR9
	kHTNA76wKvjT4ijztRf1xYtkrLcZ4kgnDBdN/KpoAk4GPM4ZX169WMM14ZnspA1FGLmo=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vC02b-00BuNV-VB; Thu, 23 Oct 2025 20:28:01 +0200
Date: Thu, 23 Oct 2025 20:28:01 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Ryan Chen <ryan_chen@aspeedtech.com>
Cc: Arnd Bergmann <arnd@arndb.de>, BMC-SW <BMC-SW@aspeedtech.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Jeremy Kerr <jk@codeconstruct.com.au>, Lee Jones <lee@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Nishanth Menon <nm@ti.com>,
	=?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>,
	Taniya Das <quic_tdas@quicinc.com>,
	"Lad, Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Eric Biggers <ebiggers@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 4/6] arm64: dts: aspeed: Add initial AST2700 SoC
 device tree
Message-ID: <b048afc1-a143-4fd0-94c9-3677339d7f56@lunn.ch>
References: <20251022070543.1169173-1-ryan_chen@aspeedtech.com>
 <20251022070543.1169173-5-ryan_chen@aspeedtech.com>
 <b5441728-06a7-44ea-8876-3a9fc3cf55be@app.fastmail.com>
 <TY2PPF5CB9A1BE626A2F0F6307461D8F64BF2F0A@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TY2PPF5CB9A1BE626A2F0F6307461D8F64BF2F0A@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_112837_576423_5E956400 
X-CRM114-Status: GOOD (  15.58  )
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

> > > +		mdio0: mdio@14040000 {
> > > +			compatible = "aspeed,ast2600-mdio";
> > > +			reg = <0 0x14040000 0 0x8>;
> > > +			resets = <&syscon1 SCU1_RESET_MII>;
> > > +			status = "disabled";
> > > +		};
> > 
> > I see that you use the old compatible="aspeed,ast2600-mdio" string exclusively
> > here. While this works, I would suggest you list both a more specific
> > "aspeed,ast2700-mdio" string to refer to the version in this chip as well as the
> > fallback "aspeed,ast2600-mdio" string as the generic identifier.
> > 
> > The binding obviously has to describe both in that case, but the driver does not
> > need to be modified as long as both behave the same way.
> 
> Thanks, will submit ast2700-mdio. 
> Question, should I add in here patch series?
> Or go for another patch thread?

Please submit it to net-next. Since you will have aspeed,ast2600-mdio
as a fail back, it will work until everything meets up in linux-next.

	Andrew


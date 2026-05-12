Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AC0DCD4F26
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 07:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J4lTy/dApuMcsfjzQY1Js5ALZSDDFfpNZfq5R1P+Z9E=; b=zuSj8fOjmXdXHCyxCC4x7aIPr5
	2rPDkN8MKqxo/i2SfhKnY0AppsWV3Q+1hiNK99vEpEhUCwMEpQjVOhpbu30GWh7EkpMGBeqprM2/T
	k5S21eJMEU+zF1IpuVIUV3GroNWVryzPuKZ9TYzatfOATeNaXyyfBe2sllL6hst8Rj9v+Aiwj6pDv
	B8VbGFZI9Wl8igPdud87HoiqADUv+1nIG0zG15W5noacvgjgqBpxcebBjoCCXPAn7pdo5+4PvsFbr
	Eno3LQrCcui/qUwsgbivAF56ZVnZRDsR8ib7h3+yaTb67y7UtMt7f1CoaoSuMrZ52vI6uLRE32N7G
	taTPCOOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMhuq-0000000Fzep-1tyB;
	Tue, 12 May 2026 07:52:32 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMhuo-0000000Fzcu-1QLp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 07:52:31 +0000
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 3D3831FA0A;
	Tue, 12 May 2026 09:52:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1778572348;
	bh=J4lTy/dApuMcsfjzQY1Js5ALZSDDFfpNZfq5R1P+Z9E=; h=From:To:Subject;
	b=k4BKNHCCUBnSwJqLOi09Ddx8mg7oBEONZde487DzKz0vc9v/Y1LI9Aj/EsKvxpOmY
	 6d1L1508UM3+0Aq2/0fn197Uf57zKY05qqywumjNxOf5voeJAqHU+toU/xEUGTWs2W
	 riQnUJK4xdc4t7pYMyaWLx3vmOE/Ni4BULcS+m215mWmfPk3rlxCz6O1IlMbWgpSsR
	 +FzNjySF9OulrHmx3WnYZnmbgW3E99oohojtwpSweIn6NfmftOkaI1snTu5U4Esdan
	 tU98SdOtbDR/MZwV5Z7sKDBwZ2kzbtE+ymBhP7V3l8lSoL/8SdS8g3o7iVfQQ7EcEU
	 OgXRWB4UV5wWA==
Date: Tue, 12 May 2026 09:52:27 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] ARM: dts: imx6qdl-sabrelite: add mdio phy address 0
Message-ID: <20260512075227.GC5820@francesco-nb>
References: <20260511-b4-imx25_dts_simple_warning-v1-0-01b855a5ce25@nxp.com>
 <20260511-b4-imx25_dts_simple_warning-v1-1-01b855a5ce25@nxp.com>
 <f04fadf2-8d73-435b-b713-9d07e48e80ae@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f04fadf2-8d73-435b-b713-9d07e48e80ae@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_005230_536239_12432F07 
X-CRM114-Status: GOOD (  14.59  )
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

On Tue, May 12, 2026 at 12:15:08AM +0200, Andrew Lunn wrote:
> On Mon, May 11, 2026 at 05:04:56PM -0400, Frank Li wrote:
> > According to IEEE 802.3 Clause 22.2.4.5.5 PHYAD (PHY Address), A PHY that
> > is connected to the station management entity via the mechanical interface
> > defined in 22.6 shall always respond to transactions addressed to PHY
> > Address zero <00000>.
> 
> Did you read 22.6? I've not seen a mechanical interface as defined in
> 22.6 for at least 20 years, maybe 30 years.
> 
> That cause does not apply in this context.
> 
> > -		ethphy: ethernet-phy {
> > +		ethphy: ethernet-phy@0 {
> >  			compatible = "ethernet-phy-ieee802.3-c22";
> > +			reg = <0>;
> 
> This could very well break this board. Without a reg value, the core
> will find the first PHY on the bus, at whatever address it is at. If
> you hard code 0, the PHY must be at 0, otherwise it will not be found.

Whoops, I replied without reading your answer first.

Yes, I agree, this change will break the board functionality.



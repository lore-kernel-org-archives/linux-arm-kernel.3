Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D464ECA5FFC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 13:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ODCTZAb7yCutEAg61KAN127W0Xr4Uf0HpQFO8eWY668=; b=y/74fJO4uOwAtGlaKOpYgdtqlt
	z7Z8rXqadNShJwFCyhClezxgiOOAwVmNCHhu5nU0hJl7m+X4v3PUnFRr8XOO45jCl63/o+TJyCs79
	5Y6hN86IgEOxHeGEY7CW1qhU79XkiTASH0OfNAXAqDLoxDn8xrDpkSTd++wybxOaj5euRKxIG+Ha/
	iqlwtPsyEkzyFIq8UJDObXPt5ahmVxkKu46C3M9cYeqa5MJerQeMImZFlQ2v0kYoLlPsiH+cDZVX8
	3p7RyYIVOzwpyiJ0aiZwuYx7RYYRSYFCzH3AnQRMwgipyBtJDjVFe9lxjK0ihEBAO8RJrUFQ8tX5u
	dls4tX8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xERRx-00000002Vyi-2s2N;
	Wed, 07 Oct 2026 13:12:49 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xERRu-00000002Vxz-2Sju;
	Wed, 07 Oct 2026 13:12:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=ODCTZAb7yCutEAg61KAN127W0Xr4Uf0HpQFO8eWY668=; b=EGjnEmdNwKR/iAlHfjQRl3D4w6
	2P/GYhl77uLT3erz810QPl4qjUPMgpF94TcGVojUJDsMV3NI41WuvWZShnxo/ZVbriNUdhwTjEZ3H
	e7IMpCOXb6qXzJaP21s/6O/CdOMw0qVrireAA9PMhUNSqYBGwWneJ/ffwtYRDwMo7zn0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xERRg-009SjM-M0; Wed, 07 Oct 2026 15:12:32 +0200
Date: Wed, 7 Oct 2026 15:12:32 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Lucas Tanure <tanure@linux.com>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v2 6/7] arm64: dts: amlogic: t7: add the ethernet
 controller
Message-ID: <c1764303-9f18-4487-ba93-06173cd8a53f@lunn.ch>
References: <20261007082627.63807-1-tanure@linux.com>
 <20261007082627.63807-7-tanure@linux.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261007082627.63807-7-tanure@linux.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_061246_628813_28CC9A3C 
X-CRM114-Status: GOOD (  12.15  )
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

On Wed, Oct 07, 2026 at 09:26:26AM +0100, Lucas Tanure wrote:
> The SoC has a Synopsys gigabit MAC, a block of glue registers that
> selects the interface type and trims the clock timing, and a
> multiplexer that points the management bus at the on-chip 100M PHY


> +					internal_ephy: ethernet-phy@8 {
> +						compatible = "ethernet-phy-id0180.3301",
> +							     "ethernet-phy-ieee802.3-c22";
> +						interrupts = <GIC_SPI 340 IRQ_TYPE_LEVEL_HIGH>;
> +						reg = <8>;
> +						max-speed = <100>;

It is a 100M PHY. What supported speeds does it report in its
registers?

You should only need max-speed when the PHY is broken, says it can do
more than it actually can do, or when a 1G PHY only has two of the
four pairs connected to the outside world etc.

	Andrew


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6FBEC55184
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 12:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h3RZ9MZrJRlYpmJWGBALRfdgpWl81bAE0/bWp0ApIOY=; b=wPMNbMhYnwUlzyNrZsoPCZ58oV
	Jj5pyqABIlu7/SqylnA2PFMM9MaFAviXmj3chw5ELFMb0gfFKb6wD2GeqELnQaSa2LcH9qOoqahzK
	fYXrTuBoEvOeEBoaklpW0N+9cUQUntACDCGq1s35CPT5vxNqFMsFRBGwhRu6zN5foTYxHqmoQlDAG
	lDRljHWPnUyoqqAUl13if66ltEYmydLdjkd4eAJEkPjpQRvvf3XNgbSP2Obih+P3MVtbV/snwRQsd
	EqRCA//DClZIm+KlNn+n9WoqPq+nLZDvCoxo7tHmjzWJoendtqw6MZABXHh4sLOzLLg8f1h7t7Izk
	IYsE1/tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqsFL-0000000H5rl-3y0w;
	Mon, 03 Aug 2026 12:58:23 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqsFJ-0000000H5qj-2NEn;
	Mon, 03 Aug 2026 12:58:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=h3RZ9MZrJRlYpmJWGBALRfdgpWl81bAE0/bWp0ApIOY=; b=XPvO/U2DqO7spL0YdgbUNARhiN
	IV21tBivZ4qqClwaWOpn/2TW1bLemo/ud6v9m73u0/K/JkL+qag97XzdbNhX9tBn0Ypl3DG7xLL17
	pKxw77Qn0Y3S/+D17G37K3voCR/R4iCeQz4WYq+Yy3QKfguKXLfWC/XKTXGwjtguI2vc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wqsFF-00Fiw8-46; Mon, 03 Aug 2026 14:58:17 +0200
Date: Mon, 3 Aug 2026 14:58:17 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: =?utf-8?B?6a2U5YqbIOmXquWFiQ==?= <molishanguang@outlook.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	"linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chukun Pan <amadeus@jmu.edu.cn>
Subject: Re: [RFC PATCH] arm64: dts: rockchip: H28K: release RTL8211F reset
 before MDIO probing
Message-ID: <d2780faf-54e8-4c0a-8070-93d36c91cb19@lunn.ch>
References: <SJ2PR04MB851017E50140354C2F5B3FF3B5D52@SJ2PR04MB8510.namprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SJ2PR04MB851017E50140354C2F5B3FF3B5D52@SJ2PR04MB8510.namprd04.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_055821_600706_74508BE2 
X-CRM114-Status: UNSURE (   7.85  )
X-CRM114-Notice: Please train this message.
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

> This is an RFC: snps,reset-gpios is deprecated in favour of the
> ethernet-PHY reset bindings, so feedback on the preferred way to release
> the reset early is welcome.

> + snps,reset-gpios = <&gpio4 RK_PC2 GPIO_ACTIVE_LOW>;
> + snps,reset-delays-us = <0 20000 100000>;

  snps,reset-gpio:
    deprecated: true
    maxItems: 1
    description:
      PHY Reset GPIO

  snps,reset-active-low:
    deprecated: true
    $ref: /schemas/types.yaml#/definitions/flag
    description:
      Indicates that the PHY Reset is active low

  snps,reset-delays-us:
    deprecated: true
    description:
      Triplet of delays. The 1st cell is reset pre-delay in micro
      seconds. The 2nd cell is reset pulse in micro seconds. The 3rd
      cell is reset post-delay in micro seconds.
    minItems: 3
    maxItems: 3

As you say, deprecated: true. You should not be adding new uses of
deprecated properties.

Try using the reset properties in mdio.yaml

    Andrew


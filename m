Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE0BFCC6B1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 12:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hvc2V3oM2jK/anoO6/69ZkcwK/ZYlgwZcHP0MTpy6U4=; b=UcTcJr3AXyZsqJ6Q/kwe0PT3IW
	UmelPDGRJ8+tvHdXIABTsFI2u9KYPTF0aNuw72CjMH53oxnEPiYxFuwDDV7dzmO/AlfFBQNBh7NEs
	TCODWf5NLhGYhhxDrCxPLlleo846lFFju+t+k1ajv7pjfQhtBksi4Ymt3BIQ06ow4LVpTZnNL1h5H
	ST5KK4NwrYVMDXqvS269pjYh9h8CxZwc9cCssnhzBigZNawxgEl5YLBJcJwwyt4L5rRfW3BDMdRYA
	sLyDBVSirr/1tgmp4MytWDGUimbx2KkaEt8kgNUMySkEZc0XjNu/okZFgbJXOnbktUOL0SfTSuHaE
	42IAJSEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGySz-0000000FVAJ-1Zw9;
	Wed, 14 Oct 2026 12:52:21 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGySq-0000000FV9B-48gy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 12:52:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=hvc2V3oM2jK/anoO6/69ZkcwK/ZYlgwZcHP0MTpy6U4=; b=A/L8DwWencGpuxcWNwuJFUtr8M
	vfAWBJ4RbgFT2vLUKpXYH7A6Cxda3UVNSAMZNgvohP/aLkLNvbHqYmeCmlCybYr5735dSrDGB9DDs
	xBL1tG6Q1yVPbgEtOXQHhQpnV+4oeT+ElpJtuyrGCskr+tr2nfGvpzjHqYkdJZE6SmMg=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xGySo-00Aje5-IV; Wed, 14 Oct 2026 14:52:10 +0200
Date: Wed, 14 Oct 2026 14:52:10 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Navid Ghahremani <ghahramani.navid@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, arnd@arndb.de,
	stefandoesinger@gmail.com, krzk@kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 24/24] ARM: dts: zte: Add ZTE ZXHN H3600 board
Message-ID: <0386c1dc-5026-4c45-9679-cc6e76f58e36@lunn.ch>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com>
 <20261014072109.1759502-25-ghahramani.navid@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014072109.1759502-25-ghahramani.navid@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_055213_024217_65C3E9ED 
X-CRM114-Status: UNSURE (   8.52  )
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

> +&gmac_port4 {
> +	label = "wan";
> +	phy-handle = <&phy8>;
> +	phy-mode = "gmii";
> +	nvmem-cells = <&macaddr_tag_1e 1>;
> +	nvmem-cell-names = "mac-address";
> +	status = "okay";
> +};
> +
> +&mdio {
> +	/* the ZX5201 WAN PHY */
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&ext_phy_pins>;
> +	status = "okay";
> +
> +	/* external Sanechips ZX5201; its SerDes answers on address 9 */
> +	phy8: ethernet-phy@8 {
> +		reg = <8>;
> +	};

You have phy-mode == gmii. Such a PHY does not need a SERDES. We need
a better understanding of what is actually used here.

	Andrew


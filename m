Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8B9EFF8875
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 01:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xr++0uW3/aWfxubO3cxQcvyMCVatN4XOXUV5OwG2V2w=; b=tn+JVlj8+cy5o4DXn7k8g9ZO3a
	tlCQFd+EZGlCWDkhFbjMX1DMAKBPV28VoYDnPiJGvY5Lp0ShvhSaMqRrF45qwfBSmWx6qx+vIC3t0
	GEm3eYZNd4Pk5A3PrY9IdSwBVt1gqWNdjY9rBe9MTHkYHF2yFliQn/7L/xImO+xctJsxoHKG5zHx3
	HOuHioJtRk59Yhq9Zi8BONkgL5fl1FkdfcZai6sqW+rc5GPCKnRt9XpkrvQS4bndrvIICKDfhQASV
	eW1HgNk/yy+kV63Rb6UMapleHsvlc4X4A7OuscKRpMLjpirlbiJg1Ys47KOt3OZAgmSJlxfNQTRp6
	RLmeUd/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHtwG-00000002jqx-2QHx;
	Wed, 29 Apr 2026 01:42:08 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHtwD-00000002jps-2GMi;
	Wed, 29 Apr 2026 01:42:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=xr++0uW3/aWfxubO3cxQcvyMCVatN4XOXUV5OwG2V2w=; b=kp+edf72edokyxU3mtqEnZKTr3
	IdsBZ36KjZkY+e6Mq+wkNkDnqeAGDWrgyJ93hMP+ALlz9+l3ZutV6C30c3TTf1iuG0U5PLgIzieVn
	XNbOI/kNLVqt5Yk26Maej/3KG2oCWZjyZb6Uwktr5gIfLqnUtIv8x4BMfVTQ1yt+/QTY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wHtw1-000Rgl-Lj; Wed, 29 Apr 2026 03:41:53 +0200
Date: Wed, 29 Apr 2026 03:41:53 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: lizhi2@eswincomputing.com
Cc: devicetree@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, netdev@vger.kernel.org,
	pabeni@redhat.com, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, rmk+kernel@armlinux.org.uk,
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	maxime.chevallier@bootlin.com, ningyu@eswincomputing.com,
	linmin@eswincomputing.com, pinkesh.vaghela@einfochips.com,
	pritesh.patel@einfochips.com, weishangjuan@eswincomputing.com,
	horms@kernel.org
Subject: Re: [PATCH net-next v7 4/4] riscv: dts: eswin:
 eic7700-hifive-premier-p550: enable Ethernet controller
Message-ID: <d662fa07-cd0f-48c4-a6e4-03c5fd390e92@lunn.ch>
References: <20260427072353.1114-1-lizhi2@eswincomputing.com>
 <20260427072603.1191-1-lizhi2@eswincomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260427072603.1191-1-lizhi2@eswincomputing.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_184205_576736_E23E8950 
X-CRM114-Status: GOOD (  12.76  )
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

> +&gmac1 {
> +	phy-handle = <&gmac1_phy0>;
> +	/*
> +	 * For the TX path of gmac1, there is a skew between the TX clock
> +	 * and data on the MAC controller inside the silicon. This skew happens
> +	 * to be approximately 2 ns. Therefore, it can be considered that the
> +	 * 2 ns delay of TX is provided by the MAC.
> +	 * No delay configuration for tx is needed in software via PHY driver.
> +	 */
> +	phy-mode = "rgmii-rxid";

This is wrong. Take a read of

https://elixir.bootlin.com/linux/v6.15/source/Documentation/devicetree/bindings/net/ethernet-controller.yaml#L287

phy-mode describes the board. If the board provides the 2ns delay, you
use rgmii. If the MAC/PHY pair needs to provide the delay, you using
rgmii-id.

If rgmii-id is used, it is up to the MAC/PHY to decide which will add
the delay. If the MAC adds the delay, it needs to mask the value of
phy-mode it passes to the PHY so it does not also add the delay.

Your broken hardware means you cannot support 'rgmii' or 'rgmii-rx',
since you cannot turn off this 2ns delay, so you end up with double
delays if anybody designs a board with 2ns TX delay on the board
itself. So please validate the PHY modes and return -EINVAL if these
modes are used.

    Andrew

---
pw-bot: cr


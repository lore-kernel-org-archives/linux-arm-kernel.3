Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C236EC44500
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jul 2026 15:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HptUES/0sfPU3Gkj8T4/h/5gi9Cj/ZvB7ArF8RxIxNg=; b=nLIwA5ebeFcFqMxzmGS9wopHvr
	0M1yO35aaxXOen4YugUZv481uZ7Wv4ZDeThzO98BsJWN+jyXOj9TgOWrq5tRkEznNRHZYCn+0FnSr
	JjJ3ABCLKGzKYbFRHuOtBPZtMKpEvgSRxPURmpDxXmkjar1W/V4qmhEjp60TI+jldNPQ+MCXXwlPR
	GvLboRoE70gDadtVWbfdNbldFnRH+3yeH1GUoB4X6TPk3cG89HZL6nuTw3DH6F6a+CKQvFgiOkbEq
	HkKfzFBtmiwlxSx/NJ/RSNB4bUcd5yPtroPCwPLZwBMu5kKqGeVkRNqNXJJgW7vUEFUt0ESnMSH0Q
	taxvsu/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgOVt-00000009QVc-1SbL;
	Sun, 05 Jul 2026 15:12:09 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgOVr-00000009QV5-0gKe;
	Sun, 05 Jul 2026 15:12:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=HptUES/0sfPU3Gkj8T4/h/5gi9Cj/ZvB7ArF8RxIxNg=; b=gmFGAFXzeorkLhLgDBMjGel4Ae
	4cMuKTf4Yzd94nkLb1gY11bD1CFBzXBUGnud0NGEg1hyxgbPlPcd1wsVVAVZEwod9VypYE+St30AQ
	IMhcNUnJOgNg7IQvwFzIkvC0TWwt+v67R2qZsGPK6mHOodtlFFWWUUSsQBDyJ8EZt5LM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wgOVi-00AqXH-1s; Sun, 05 Jul 2026 17:11:58 +0200
Date: Sun, 5 Jul 2026 17:11:58 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: LemonFan-maker <2254650260@qq.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: rockchip: Add EmbedFire LubanCat 4 board
Message-ID: <1ac2d0f4-e027-4633-9d34-2709cb3e43ec@lunn.ch>
References: <20260705135014.1004166-1-2254650260@qq.com>
 <tencent_6D311DC5F405B157049538DD5B080082A10A@qq.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_6D311DC5F405B157049538DD5B080082A10A@qq.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_081207_573342_0746908E 
X-CRM114-Status: UNSURE (   7.67  )
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

> +&gmac1 {
> +	clock_in_out = "output";
> +	phy-handle = <&rgmii_phy1>;
> +	/* The board has 1.5ns delays on RX lines; TX delay is provided by the MAC. */

That is pretty unusual. How is this RX delay done?

> +	phy-mode = "rgmii-rxid";
> +	pinctrl-0 = <&gmac1_miim
> +		     &gmac1_tx_bus2
> +		     &gmac1_rx_bus2
> +		     &gmac1_rgmii_clk
> +		     &gmac1_rgmii_bus>;
> +	pinctrl-names = "default";
> +	tx_delay = <0x1b>;

please take a read of:

https://elixir.bootlin.com/linux/v6.15/source/Documentation/devicetree/bindings/net/ethernet-controller.yaml#L287

Ideally, you want to the PHY adding the delay, not the MAC. 99% of
rockchip boards get this wrong, they have phy-mode 'rgmii', and
{tx|rx}_delay properties. And i tell developers to swap to 'rgmii-id'
and remove the delay properties.

With the PCB adding some delays, you board is slightly
different. Please drop the tx_delay and adjust the phy-mode so the PHY
adds the delay.

	Andrew


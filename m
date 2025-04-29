Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AACB8C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 16:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hiDUcEAvkqAct7DYr49674W2ZeDjMHFKnQgfifte+sw=; b=IrbJGZ+t/pHbKVqPvwvh0BrbBb
	G1uhbuDs4BxXhEsC8/VOarv/S/j8OO8V6AqnDbRZGXnXawltrc+QLQViXOYBPUYJFP/Oa7pAJjOip
	T8ewbJbYgqxyii1iG2Gbo2EBqW73ovENwcuhyCXOoe9w76QB6k66LJhBE8JQmp3KMXED9bmOB7d+X
	vDWhKFoi6IpIVDCdXaWcwQVmSYM3ZScJKfZbGmN+zUM80BgdoNdI0y9S4uTrQqekE7yxE0uOyFKKq
	fabHu5vrhwMPCC9WFPeF3UCnEJZ4TmUvlr8kRAN9ypzOqWcJsF6Jp4YZsnCg1MFrl0YIzt2Gq7obp
	hYSl1NHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9nac-0000000ADuL-2nny;
	Tue, 29 Apr 2025 16:13:46 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9n9H-0000000AAM6-2Mb5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 15:45:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=hiDUcEAvkqAct7DYr49674W2ZeDjMHFKnQgfifte+sw=; b=w/q8z4H6p3pxP0VMQ72dJ7iUHL
	8UVYbXmdNTuoRKXbqStlm2tzHb2LciDe/oBZIkn7p4Ob8ZQ+sfjRIoJl/qMoNYZUvAA9YKde0eZSE
	UdVoZcoI80DDmP3u4+/fOiT6YJNq9N5emUKcO8yB+nRAMD5JqNYUcQeDIhjffjHmzVgQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1u9n9A-00AxJU-AE; Tue, 29 Apr 2025 17:45:24 +0200
Date: Tue, 29 Apr 2025 17:45:24 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>
Cc: Andre Przywara <andre.przywara@arm.com>, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, wens@csie.org,
	samuel@sholland.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: allwinner: h6: Add OrangePi 3 LTS DTS
Message-ID: <2486dae4-c5a5-4df2-8048-87b4b2d46d54@lunn.ch>
References: <20250413134318.66681-1-jernej.skrabec@gmail.com>
 <6a056bf8-9f39-4204-9378-8cc39be60038@lunn.ch>
 <4645060.LvFx2qVVIh@jernej-laptop>
 <4975791.GXAFRqVoOG@jernej-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4975791.GXAFRqVoOG@jernej-laptop>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_084531_598554_A3ED3E3E 
X-CRM114-Status: UNSURE (   9.76  )
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

> I just to be clear, I tested various combinations, including rgmii-id, and it
> didn't work, except rgmii-rxid, which matches strapping. Of course Motorcomm
> PHY driver took that into account and set registers accordingly.

So we have:

&emac {
	pinctrl-names = "default";
	pinctrl-0 = <&ext_rgmii_pins>;
	phy-mode = "rgmii-rxid";
	phy-handle = <&ext_rgmii_phy>;
	phy-supply = <&reg_gmac_3v3>;
	allwinner,rx-delay-ps = <0>;
	allwinner,tx-delay-ps = <700>;
	status = "okay";
};

and

&mdio {
	ext_rgmii_phy: ethernet-phy@1 {
		compatible = "ethernet-phy-ieee802.3-c22";
		reg = <1>;

		motorcomm,clk-out-frequency-hz = <125000000>;

		reset-gpios = <&pio 3 14 GPIO_ACTIVE_LOW>; /* PD14 */
		reset-assert-us = <15000>;
		reset-deassert-us = <100000>;
	};
};

The RX path looks O.K. RGMII-RXID means the PHY should be adding the
2ns delay. The allwinner,rx-delay-ps = <0> should be redundant, that
should be the driver default. And there are no properties in the PHY
node about RX. All good.

TX is the problem. The allwinner,tx-delay-ps = <700> causes the MAC to
add 700ps delay, and 'rgmii-rxid' means the PHY should not add any
delay. But 700ps is too low. It should be around 2000ps. So something
else is adding a delay, or the 700ps is not really 700ps.

You say the PHY is a YT8531C. These PHYs also accept
rx-internal-delay-ps and tx-internal-delay-ps properties in their DT
node.

Try setting 'rgmii-id', allwinner,tx-delay-ps = <0>, and both
rx-internal-delay-ps and tx-internal-delay-ps in the PHY node to 1950.
If that does not work, try other values in the PHY node.

	Andrew


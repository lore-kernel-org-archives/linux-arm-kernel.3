Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4E68CCD187
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Oct 2025 15:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g4l5GAPIMMhyjBnF/J/i/Kh1LXO9yDiAGGqH1Ts9qQo=; b=dyRgjbBBEXTpjyb1I52cHnDEg1
	LBWbAJDM7L+YjHAlYislp7uVnjhFk5tlxtR9+GORRBFNkAiVDk5I+xS7+kAEgQovhM0ucEwNLUeyv
	ppBrJFh3j0gN5OrJzx57U54jCn0sxvaLcRWKUm/Nri7lJxKVLLaDvtFtl+L1ipk4IZQn+ql9udmVu
	rWV3dheBKLQa4uTLPjRWD4+LxJ7l4c+LsZWKihfR0pqSVgePACISACdBMIC/7nBG+mjeWfno+N3rx
	9wsqI64Jz/dJjHvSYNGrMOBhSkho1NQc8p+GpanMTLghKC6eBozuftXzSpjdQlJq0r7piFslfA8p5
	RHSfL0tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7xd3-0000000BS3R-1K1r;
	Sun, 12 Oct 2025 15:04:57 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7xd0-0000000BS2T-1yfl
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Oct 2025 15:04:55 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <jre@pengutronix.de>)
	id 1v7xcb-0007bV-LG; Sun, 12 Oct 2025 17:04:29 +0200
Message-ID: <adc5287f-416d-4bb9-8ae9-b65a59b0ea93@pengutronix.de>
Date: Sun, 12 Oct 2025 17:04:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] arm64: dts: add Protonic PRT8ML board
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Shengjiu Wang <shengjiu.wang@nxp.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Vladimir Oltean <vladimir.oltean@nxp.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, David Jander <david@protonic.nl>,
 Lucas Stach <l.stach@pengutronix.de>,
 Oleksij Rempel <o.rempel@pengutronix.de>
References: <20250924-imx8mp-prt8ml-v3-0-f498d7f71a94@pengutronix.de>
 <20250924-imx8mp-prt8ml-v3-3-f498d7f71a94@pengutronix.de>
 <20251012023714.GF20642@nxa18884-linux.ap.freescale.net>
Content-Language: en-US
From: Jonas Rebmann <jre@pengutronix.de>
In-Reply-To: <20251012023714.GF20642@nxa18884-linux.ap.freescale.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: jre@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251012_080454_507828_79C5E671 
X-CRM114-Status: GOOD (  15.96  )
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

Hi Peng

On 2025-10-12 04:37, Peng Fan wrote:
> On Wed, Sep 24, 2025 at 10:34:14AM +0200, Jonas Rebmann wrote:
>> +&a53_opp_table {
>> +	opp-1200000000 {
>> +		opp-microvolt = <900000>;
>> +	};
>> +
>> +	opp-1600000000 {
>> +		opp-microvolt = <980000>;
>> +	};
>> +
>> +	/delete-node/ opp-1800000000;
> 
> Why drop this?
> 

The board is designed for the industrial variant of the i.MX 8M Plus and
therefore only for the 1.2GHz and 1.6GHz modes. There exist however some
units which which where assembled with the consumer variant. As the
power supply is not outfitted for their 1.8GHz mode, it must be
disabled.

I'll add a comment in v4.

>> +};
>> +
>> +&ecspi2 {
>> +	pinctrl-names = "default";
>> +	pinctrl-0 = <&pinctrl_ecspi2>;
>> +	cs-gpios = <&gpio5 13 GPIO_ACTIVE_HIGH>;
> 
>> +	/delete-property/ dmas;
>> +	/delete-property/ dma-names;
> 
> Why remove dmas?

Sadly, in drivers/spi-imx.c we don't have proper heuristics to choose on
which chips to use dma or to use polling at which speeds and transfer
sizes. Therefore in cases where there is a high number of small
transfers, for which dma is inefficient, this way of manually disabling
dma is the only current way of meeting specific performance
requirements.

I'll add a comment in v4.

>> +	status = "okay";
>> +
>> +
>> +&iomuxc {
>> +
>> +	pinctrl_tps65987ddh_0: tps65987ddh_0grp {
> 
> tps65987ddh_0grp - > tps65987ddh-0grp
> 
>> +		fsl,pins = <
>> +			MX8MP_IOMUXC_GPIO1_IO12__GPIO1_IO12	0x1d0
>> +		>;
>> +	};
>> +
>> +	pinctrl_tps65987ddh_1: tps65987ddh_1grp {
> 
> tps65987ddh_1grp -> tps65987ddh-1grp

Will rename those in 4v.

Regards,
Jonas

-- 
Pengutronix e.K.                           | Jonas Rebmann               |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-9    |


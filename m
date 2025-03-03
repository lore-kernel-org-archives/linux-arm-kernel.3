Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA739C282CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 14:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	Cc:Subject:To:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zDbYOoICs0kyLksCA3nSrPEKG2UdDgw1p8IdLbEdbwc=; b=uy5HtVRYvAcTr7YH1cSfWNWqR1
	Be+wujNvtiRJ6VxkyEWZ1GQWNjzHoHNvBH8XmM3fuMBJG/wXLzJriCLa1M7upuaLGHgA9OKtvf5a2
	TLJCBErS3kNZhDwe4Hn9xXBNkkO0W29F7oAVh0I9zmrFYn/TMcspch3I+cyMxNRIS3RO/d8Fmf4GK
	/s5ATozlrZl12Z4/xLPYS8iMoM4DkxO1wVH3b7lYDM9qwl+2ouq/WtokxeFo4rCxfiir6wJVKY8Eu
	tzgoB5OXmzx+TRdu52CNV7mRoufimWHywHHazkZN3Xpa1MVuuNTRx+hi0Bqq+wiKJABxyqusLB1bH
	5RhtxCaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp79m-00000001B3E-1MP3;
	Mon, 03 Mar 2025 14:52:34 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp74M-00000001AFR-12c1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 14:47:00 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 53A77441B6;
	Mon,  3 Mar 2025 14:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1741013214;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zDbYOoICs0kyLksCA3nSrPEKG2UdDgw1p8IdLbEdbwc=;
	b=iPeLLtChV/otssqNfOVqg/51Ax+8DPi61GCdSSCQbbagWxWJzYEBg3l40sx0HR8vL/FcjN
	YPIEIj6U1vkI4upDHidgNQ8e9Km2WBlAReRsXPJxC6DxRxONNNmoAjW2I8Nj6LwQeuTNOC
	Wp7lHluAeJ1lNWyGcUxejLyptqDRAs0cf6rFgciBihlwxe93sVob+FFtyJKPLOQ03LmlMT
	KYqihn5tiLeSwsYURXSt8/wjPhVCWBBFSAtZ3uiGZDGFeDKhl9lH91V5qHQBHpwEazfZiT
	JLeeuw63SVObqVR4c3RoHvK63HYEZuxBeTemjsouNPpS75JnLjMVgF3p2R7DCA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 03 Mar 2025 15:46:52 +0100
Message-Id: <D86POCANGF07.3HE2LVK396FGX@bootlin.com>
To: "Shawn Guo" <shawnguo2@yeah.net>
Subject: Re: [PATCH v2 2/3] ARM: dts: imx6ul: Add Variscite VAR-SOM-MX6UL
 SoM support
Cc: "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Shawn Guo"
 <shawnguo@kernel.org>, "Sascha Hauer" <s.hauer@pengutronix.de>,
 "Pengutronix Kernel Team" <kernel@pengutronix.de>, "Fabio Estevam"
 <festevam@gmail.com>, "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250127-varsom6ul-concerto-dts-v2-0-4dac29256989@bootlin.com>
 <20250127-varsom6ul-concerto-dts-v2-2-4dac29256989@bootlin.com>
 <Z7njGg4Hhc4wcZHU@dragon>
In-Reply-To: <Z7njGg4Hhc4wcZHU@dragon>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdelleegtdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggfgtgffkffvufevhffofhgjsehtqhertdertdejnecuhfhrohhmpedftehnthhonhhinhcuifhouggrrhgufdcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepjedtteejveetjedtgfektddvvdduueevffetieejteegfeeitdekjeeufeduheejnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehledphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedufedprhgtphhtthhopehshhgrfihnghhuohdvseihvggrhhdrnhgvthdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgp
 dhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehshhgrfihnghhuoheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshdrhhgruhgvrhesphgvnhhguhhtrhhonhhigidruggvpdhrtghpthhtohepkhgvrhhnvghlsehpvghnghhuthhrohhnihigrdguvgdprhgtphhtthhopehfvghsthgvvhgrmhesghhmrghilhdrtghomh
X-GND-Sasl: antonin.godard@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_064659_038965_5E706CDE 
X-CRM114-Status: GOOD (  10.21  )
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

Hi Shawn,

On Sat Feb 22, 2025 at 3:45 PM CET, Shawn Guo wrote:
[...]
>> +	reg_gpio_dvfs: reg-gpio-dvfs {
>> +		compatible =3D "regulator-gpio";
>> +		regulator-min-microvolt =3D <1300000>;
>> +		regulator-max-microvolt =3D <1400000>;
>> +		regulator-name =3D "gpio_dvfs";
>> +		regulator-type =3D "voltage";
>> +		gpios =3D <&gpio4 13 GPIO_ACTIVE_HIGH>;
>
> Don't we need 'enable-active-high'?

I am not specifying 'enable-gpios' but 'gpios' here so from my understandin=
g of
gpio-regulator.yaml and examples from other device trees I don't think so.

>> +		states =3D <1300000 0x1 1400000 0x0>;
>> +	};
>> +
>> +	rmii_ref_clk: rmii-ref-clk-grp {
>
> What does "-grp" in node name mean?

A mistake on my side, I will rename the label to "rmii-ref-clk".

>> +		compatible =3D "fixed-clock";
>> +		clock-output-names =3D "rmii-ref";
>> +	};
>> +};
>> +
>> +&cpu0 {
>> +	dc-supply =3D <&reg_gpio_dvfs>;
>> +};
>> +
>> +&clks {
>> +	assigned-clocks =3D <&clks IMX6UL_CLK_PLL4_AUDIO_DIV>;
>> +	assigned-clock-rates =3D <786432000>;
>> +};
>> +
>> +&fec1 {
>> +	pinctrl-names =3D "default";
>> +	pinctrl-0 =3D <&pinctrl_enet1>, <&pinctrl_enet1_gpio>, <&pinctrl_enet1=
_mdio>;
>> +	phy-mode =3D "rmii";
>> +	phy-reset-gpios =3D <&gpio5 0 GPIO_ACTIVE_LOW>;
>> +	phy-reset-duration =3D <100>;
>> +	phy-handle =3D <&ethphy0>;
>> +	status =3D "okay";
>> +
>> +	mdio {
>> +		#address-cells =3D <1>;
>> +		#size-cells =3D <0>;
>> +
>> +		ethphy0: ethernet-phy@1 {
>> +			compatible =3D "ethernet-phy-ieee802.3-c22";
>> +			micrel,rmii-reference-clock-select-25-mhz =3D <1>;
>> +			micrel,led-mode =3D <1>;
>> +			clocks =3D <&rmii_ref_clk>;
>> +			clock-names =3D "rmii-ref";
>> +			reg =3D <1>;
>
> We generally sort properties like:
>
>   - compatible
>   - reg
>   - generic ones
>   - vendor prefixed ones
>
> So in this case, we will get:
>
> 	compatible =3D "ethernet-phy-ieee802.3-c22";
> 	reg =3D <1>;
> 	clocks =3D <&rmii_ref_clk>;
> 	clock-names =3D "rmii-ref";
> 	micrel,rmii-reference-clock-select-25-mhz =3D <1>;
> 	micrel,led-mode =3D <1>;

Thanks for clarifying that! I will revise this for the next version.

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


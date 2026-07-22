Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C5A0C44539
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 11:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BWcCusQ28FbVznAVl+tc3Bd3miMXsSj/x/rAhqbfUa4=; b=u5sPG2VMXM9fOpnBGGhYNG13Ds
	Z0qgb0SxStkxz7SJ+iCHk0JiEJKi+fJa5KmI65li/YeQtLFvNnUvrmRqxWQGeIk+ng3dWhRYbFYDq
	B7HtiIFq9yTPeWQ654mXKWsF4LyyAE/SXgYqolvHZVtufoYVuPMKbUU1Z/RRb5TXWVtOoPxf5pfHi
	rZkBk+0YEPx/fgoRFX1tYn0esCdGDwT+iRAGj7uqH3kzw25k8LPYbKywSG1SEwx1JxKs3vKTI89X+
	KHYHE3O7tf1CofAc7aBe3yenlsCDO/PWQTJutgRbmqe2pL47jDjHWoZ5u/ndE9wL1Q6dM4KDpfAbq
	CDC7lUbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmVPc-0000000BftV-2328;
	Wed, 22 Jul 2026 11:46:56 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmVPI-0000000BfqX-3Hr7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 11:46:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1784720794;
	bh=BWcCusQ28FbVznAVl+tc3Bd3miMXsSj/x/rAhqbfUa4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=JkpvVUfUdMIzlFefv4cRZkhynvd7wAubwbSMBmvFJ0Q/21oUq6YfApbKZ2Z0m/eJt
	 ogG3DApQoHwMFnVc5Xr34XUsOpmAPxRSuYzscQviykpMsgO8TJpMg2F6nWr/AAbzkh
	 GuZw4E0wvX8lCTatFcpdWz8bOljjcmbs0i0WKUkmPO1cWYw4uauY/tb1S5BHDk1JnL
	 R9n14gFWYxA/DXpssirUUjl3o1mdkZ1qaBwTqh1ZUdfgxohrbir6sbZMGUQtWqXdnG
	 R7pVczUByMRRndbcPq/N5w+bsWqs1qZ0aYPXlyhxFTvzjWCgmyhjziiqvy2551u5ZT
	 k0IxNzNLX4QwQ==
Received: from [192.168.68.117] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 6DB93662E1;
	Wed, 22 Jul 2026 19:46:34 +0800 (AWST)
Message-ID: <de6f82c5601a4481e418270171e803340368bd2a.camel@codeconstruct.com.au>
Subject: Re: [PATCH v8 2/2] ARM: dts: aspeed: ventura2: Add Meta ventura2 BMC
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Kyle Hsieh <kylehsieh1995@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley
	 <joel@jms.id.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Date: Wed, 22 Jul 2026 21:16:34 +0930
In-Reply-To: <20260615-ventura2_initial_dts-v8-2-c89f92c80447@gmail.com>
References: <20260615-ventura2_initial_dts-v8-0-c89f92c80447@gmail.com>
	 <20260615-ventura2_initial_dts-v8-2-c89f92c80447@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_044637_028828_1DE815D5 
X-CRM114-Status: GOOD (  12.57  )
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

On Mon, 2026-06-15 at 10:46 +0800, Kyle Hsieh wrote:
> Ventura2 is a Rack Management Controller. It is a modular
> device designed to manage liquid cooling systems and monitor hardware
> states within an IT rack. The system uses an AST2600 BMC for management.
>=20
> RMCv2 serves several critical roles:
> - Detects liquid leakage at both tray and rack levels.
> - Communicates with and controls liquid cooling equipment.
> - Manages leakage events and executes system recovery protocols.
>=20
> Key hardware features include:
> - An extensive I2C and IO expander topology to support comprehensive
> =C2=A0 sensor monitoring and backward compatibility with legacy trays.
> - MCTP over I2C support for asynchronous device communications.
> - A dual-flash design for BMC firmware redundancy.
>=20
> Signed-off-by: Kyle Hsieh <kylehsieh1995@gmail.com>
> ---
> =C2=A0arch/arm/boot/dts/aspeed/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0=C2=A0=C2=A0 1 +
> =C2=A0.../dts/aspeed/aspeed-bmc-facebook-ventura2.dts=C2=A0=C2=A0=C2=A0 |=
 2903 ++++++++++++++++++++
> =C2=A02 files changed, 2904 insertions(+)

We now have scripts/dtc/dt-check-style. Running it over the dts with '-
-mode relaxed' yields 49 instances of 'mixed-indent-chars' - these must
be fixed. Further, can you please look at the output with '--mode
strict', address all the warnings that are reasonable, and then discuss
what's left?

Otherwise, there are still some concerns reported against the bindings:

   $ make CHECK_DTBS=3Dy aspeed/aspeed-bmc-facebook-ventura2.dtb W=3D1
   ...
     DTC [C] arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dtb
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dtb: /ahb/apb/lpc@=
1e789000/lhc@a0: failed to match any schema with compatible: ['aspeed,ast26=
00-lhc']
   /home/andrew/src/kernel.org/linux/origin/build.arm.aspeed_g5/arch/arm/bo=
ot/dts/aspeed/aspeed-bmc-facebook-ventura2.dtb: fan-controller@20 (maxim,ma=
x31790): 'channel@2', 'channel@5' do not match any of the regexes: '^fan@[0=
-9]+$', '^pinctrl-[0-9]+$'
           from schema $id: http://devicetree.org/schemas/hwmon/maxim,max31=
790.yaml
   /home/andrew/src/kernel.org/linux/origin/build.arm.aspeed_g5/arch/arm/bo=
ot/dts/aspeed/aspeed-bmc-facebook-ventura2.dtb: i2c@400 (aspeed,ast2600-i2c=
-bus): Unevaluated properties are not allowed ('aspeed,hw-timeout-ms' was u=
nexpected)
           from schema $id: http://devicetree.org/schemas/i2c/aspeed,i2c.ya=
ml
   /home/andrew/src/kernel.org/linux/origin/build.arm.aspeed_g5/arch/arm/bo=
ot/dts/aspeed/aspeed-bmc-facebook-ventura2.dtb: adc@48 (ti,ads1015): '#addr=
ess-cells' is a required property
           from schema $id: http://devicetree.org/schemas/iio/adc/ti,ads101=
5.yaml
   /home/andrew/src/kernel.org/linux/origin/build.arm.aspeed_g5/arch/arm/bo=
ot/dts/aspeed/aspeed-bmc-facebook-ventura2.dtb: adc@48 (ti,ads1015): '#size=
-cells' is a required property
           from schema $id: http://devicetree.org/schemas/iio/adc/ti,ads101=
5.yaml
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dtb: /ahb/apb/bus@=
1e78a000/i2c@580/power-monitor@69: failed to match any schema with compatib=
le: ['pmbus']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dtb: /ahb/apb/bus@=
1e7a0000/syscon@0: failed to match any schema with compatible: ['aspeed,ast=
2600-i3c-global', 'syscon']

Can you please tidy these up?

Thanks,

Andrew


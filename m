Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3F9BD1CA0F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 00:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IjJLJ70mG0yXKyq0C8oBtomjbMZt3HhC5EaMaSbO7Kc=; b=LC6Tyf2u2h0jjJQ/IVHyZfr9io
	3Xmmg2bP4JM9cmtq+g3h/8n5cPXzGtINVw7LIZa/PAAjxz7q0N0G90f8nptkEoIODz9HaaTxOod1o
	Kw7d+hvLmAK9XNzoMYJDsStcH1YXfRqmyXEECSPPh4yiMmpYbbymb5zWaEi+mkIUkp4xLWdS9DzAe
	yqK6NhWCRlbmhDk2IBzO2eqmjTiDaDHHJN3MMA9zjqt/m+TuEjqlq3ULxA0flvf57b/GTM/pCOAGQ
	glSXWZDfvNRQymWB+Px1Wbr5/NgXmZ0R9Yb58krpIfQvfEowkzpT2e499tJzm9PHugbZ89GOUf5Kz
	fcg9KusA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t87AV-0000000FSKZ-2qcs;
	Tue, 05 Nov 2024 00:11:35 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t878n-0000000FS3P-02xn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 00:09:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1730765380;
	bh=IjJLJ70mG0yXKyq0C8oBtomjbMZt3HhC5EaMaSbO7Kc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=bVLQHcMFG/lHwHLYBE5Jjz6Tdn/3U3MOp0kh+E16OhOzKDp4U5iBeRw+YCXQWWsPk
	 7zO0yZRvC6R41KdPVVPEKAse4f0sMISbIj/SkCke5jX+bGooxZyzdEgddI7a8ALRzU
	 3UX8aSdti7p9Ps81L/CfvzW5fiwVr30b7zbLCG0ryn35jwPSCIm8StIVEtCc8APgYU
	 WBV95ajz/U5JmouPbpAHluo3zqSiUpDCBjPLTOYUxRULkt1Z/YyXEJLapN1Fo9Hab0
	 s9/m3iigWtirVGX0y6IbySRHrbFYUehpwHA2OCRh7dQVbA1W3zozjclUefuqshUh3t
	 3GefuGksYuy2w==
Received: from [192.168.68.112] (ppp118-210-162-114.adl-adc-lon-bras34.tpg.internode.on.net [118.210.162.114])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 9758C6A3C9;
	Tue,  5 Nov 2024 08:09:37 +0800 (AWST)
Message-ID: <f468a5c0a0112cee35815fb6c7b7f9933934adc2.camel@codeconstruct.com.au>
Subject: Re: [PATCH v6 1/2] dt-bindings: arm: aspeed: add IBM SBP1 board
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Conor Dooley <conor@kernel.org>, "Rob Herring (Arm)" <robh@kernel.org>
Cc: Naresh Solanki <naresh.solanki@9elements.com>, jdelvare@suse.com, Conor
 Dooley <conor.dooley@microchip.com>, linux-aspeed@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 krzk+dt@kernel.org,  sylv@sylv.io, linux-arm-kernel@lists.infradead.org,
 linux-hwmon@vger.kernel.org,  linux@roeck-us.net, Joel Stanley
 <joel@jms.id.au>, conor+dt@kernel.org
Date: Tue, 05 Nov 2024 10:39:34 +1030
In-Reply-To: <20241104-saturate-device-d020a0d7321f@spud>
References: <20241104092220.2268805-1-naresh.solanki@9elements.com>
	 <173072771091.3690717.11563964377469449295.robh@kernel.org>
	 <20241104-saturate-device-d020a0d7321f@spud>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_160949_788164_F75EA428 
X-CRM114-Status: GOOD (  28.82  )
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

Hi Conor,

On Mon, 2024-11-04 at 18:49 +0000, Conor Dooley wrote:
> On Mon, Nov 04, 2024 at 08:39:21AM -0600, Rob Herring (Arm) wrote:
> >=20
> > On Mon, 04 Nov 2024 14:52:14 +0530, Naresh Solanki wrote:
> > > Document the new compatibles used on IBM SBP1.
> > >=20
> > > Signed-off-by: Naresh Solanki <naresh.solanki@9elements.com>
> > > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > > ---
> > > Changes in V4:
> > > - Retain Acked-by from v2.
> > > - Fix alphabetic order
> > > ---
> > > =C2=A0Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
> > > =C2=A01 file changed, 1 insertion(+)
> > >=20
> >=20
> >=20
> > My bot found new DTB warnings on the .dts files added or changed in
> > this
> > series.
> >=20
> > Some warnings may be from an existing SoC .dtsi. Or perhaps the
> > warnings
> > are fixed by another series. Ultimately, it is up to the platform
> > maintainer whether these warnings are acceptable or not. No need to
> > reply
> > unless the platform maintainer has comments.
> >=20
> > If you already ran DT checks and didn't see these error(s), then
> > make sure dt-schema is up to date:
> >=20
> > =C2=A0 pip3 install dtschema --upgrade
> >=20
> >=20
> > New warnings running 'make CHECK_DTBS=3Dy aspeed/aspeed-bmc-ibm-
> > sbp1.dtb' for
> > 20241104092220.2268805-1-naresh.solanki@9elements.com:
>=20
> Really? This many warnings on a v6?
>=20

I understand that it's surprising and disappointing, however these
warnings are from the Aspeed DTSIs and not directly from the proposed
DTS. Many are an artefact of history, and I'm (slowly) working to clean
them up. Recently I haven't had any time to dedicate to that effort,
and as I'm somewhat responsible for the state of things, I'm not
prepared to block other people's patches and push my own
responsibilities onto them.

I've been replying to those proposing new Aspeed-based devicetrees to
separate the warnings they're introducing from the warnings that
already exist, and requiring them to fix the issues they're responsible
for. I hope that I'll have time to continue to improve the situation,
as this is obviously a tedious task for me too.=20

Andrew

> >=20
> > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: timer: 'clocks'
> > does not match any of the regexes: 'pinctrl-[0-9]+'
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0from schema $id:
> > http://devicetree.org/schemas/timer/arm,arch_timer.yaml#
> > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: /sdram@1e6e0000:
> > failed to match any schema with compatible: ['aspeed,ast2600-sdram-
> > edac', 'syscon']
> > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: bus@1e600000:
> > compatible: ['aspeed,ast2600-ahbc', 'syscon'] is too long
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0from schema $id:
> > http://devicetree.org/schemas/bus/aspeed,ast2600-ahbc.yaml#
> > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: syscon@1e6e2000:
> > 'smp-memram@180' does not match any of the regexes: '^interrupt-
> > controller@[0-9a-f]+$', '^p2a-control@[0-9a-f]+$', '^pinctrl(@[0-
> > 9a-f]+)?$', '^silicon-id@[0-9a-f]+$', 'pinctrl-[0-9]+'
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0from schema $id:
> > http://devicetree.org/schemas/mfd/aspeed,ast2x00-scu.yaml#
> > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb:
> > /ahb/apb@1e6e0000/syscon@1e6e2000/smp-memram@180: failed to match
> > any schema with compatible: ['aspeed,ast2600-smpmem']
> > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb:
> > /ahb/apb@1e6e0000/syscon@1e6e2000/interrupt-controller@560: failed
> > to match any schema with compatible: ['aspeed,ast2600-scu-ic0']
> > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb:
> > /ahb/apb@1e6e0000/syscon@1e6e2000/interrupt-controller@570: failed
> > to match any schema with compatible: ['aspeed,ast2600-scu-ic1']
> > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb:
> > /ahb/apb@1e6e0000/display@1e6e6000: failed to match any schema with
> > compatible: ['aspeed,ast2600-gfx', 'syscon']
> > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: adc@1e6e9000:
> > 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0from schema $id:
> > http://devicetree.org/schemas/iio/adc/aspeed,ast2600-adc.yaml#
> > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: adc@1e6e9100:
> > 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0from schema $id:
> > http://devicetree.org/schemas/iio/adc/aspeed,ast2600-adc.yaml#
> > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: crypto@1e6fa000:
> > 'aspeed,ahbc' does not match any of the regexes: 'pinctrl-[0-9]+'
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0from schema $id:
> > http://devicetree.org/schemas/crypto/aspeed,ast2600-acry.yaml#
> > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb:
> > /ahb/video@1e700000: failed to match any schema with compatible:
> > ['aspeed,ast2600-video-engine']
> > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: sdc@1e740000:
> > sdhci@1e740100:compatible: ['aspeed,ast2600-sdhci', 'sdhci'] is too
> > long
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0from schema $id:
> > http://devicetree.org/schemas/mmc/aspeed,sdhci.yaml#
> > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: sdc@1e740000:
> > sdhci@1e740200:compatible: ['aspeed,ast2600-sdhci', 'sdhci'] is too
> > long
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0from schema $id:
> > http://devicetree.org/schemas/mmc/aspeed,sdhci.yaml#
> > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb:
> > /ahb/sdc@1e740000/sdhci@1e740100: failed to match any schema with
> > compatible: ['aspeed,ast2600-sdhci', 'sdhci']
> > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb:
> > /ahb/sdc@1e740000/sdhci@1e740200: failed to match any schema with
> > compatible: ['aspeed,ast2600-sdhci', 'sdhci']
> > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb:
> > /ahb/apb@1e780000/timer@1e782000: failed to match any schema with
> > compatible: ['aspeed,ast2600-timer']
> > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: lpc@1e789000:
> > lpc-snoop@80: 'clocks' does not match any of the regexes: 'pinctrl-
> > [0-9]+'
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0from schema $id:
> > http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
> > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: lpc@1e789000:
> > reg-io-width: 4 is not of type 'object'
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0from schema $id:
> > http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
> > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: kcs@24: 'clocks'
> > does not match any of the regexes: 'pinctrl-[0-9]+'
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0from schema $id:
> > http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-bmc.yaml#
> > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: kcs@28: 'clocks'
> > does not match any of the regexes: 'pinctrl-[0-9]+'
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0from schema $id:
> > http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-bmc.yaml#
> > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: kcs@2c: 'clocks'
> > does not match any of the regexes: 'pinctrl-[0-9]+'
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0from schema $id:
> > http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-bmc.yaml#
> > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: kcs@114: 'clocks'
> > does not match any of the regexes: 'pinctrl-[0-9]+'
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0from schema $id:
> > http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-bmc.yaml#
> > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb:
> > /ahb/apb@1e780000/lpc@1e789000/lhc@a0: failed to match any schema
> > with compatible: ['aspeed,ast2600-lhc']
> > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb:
> > /ahb/apb@1e780000/lpc@1e789000/ibt@140: failed to match any schema
> > with compatible: ['aspeed,ast2600-ibt-bmc']
> > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb:
> > /ahb/apb@1e780000/bus@1e78a000/i2c@280/bmc-slave@10: failed to
> > match any schema with compatible: ['ipmb-dev']
> > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: fsi@1e79b000:
> > compatible: ['aspeed,ast2600-fsi-master', 'fsi-master'] is too long
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0from schema $id:
> > http://devicetree.org/schemas/fsi/aspeed,ast2600-fsi-master.yaml#
> > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb:
> > /ahb/apb@1e790000/fsi@1e79b000: failed to match any schema with
> > compatible: ['aspeed,ast2600-fsi-master', 'fsi-master']
> > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: fsi@1e79b100:
> > compatible: ['aspeed,ast2600-fsi-master', 'fsi-master'] is too long
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0from schema $id:
> > http://devicetree.org/schemas/fsi/aspeed,ast2600-fsi-master.yaml#
> > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb:
> > /ahb/apb@1e790000/fsi@1e79b100: failed to match any schema with
> > compatible: ['aspeed,ast2600-fsi-master', 'fsi-master']
> > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb:
> > /ahb/apb@1e790000/dma-controller@1e79e000: failed to match any
> > schema with compatible: ['aspeed,ast2600-udma']
> >=20
> >=20
> >=20
> >=20
> >=20



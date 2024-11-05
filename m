Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DA91D2B925
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 13:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mFlJcbl3DlbfwuDN87mdbDM9flef9BgUD38InRXLEwQ=; b=3nxZhxXe33qYjl
	sJa1OINRPPujeSCLl/s3R+iyio6R5VjrZk9+O9T3kXMf2uaKe4WTUe9qrzQws5WulXC5CV1KJBJ3u
	VH/t97MHou4Ofk4ZyypkQgryu6vYuk8b1rGTiT1D9cg+fNGpr5TWEHr7XbA6bC1cdGkT5O4UbVZcg
	eFPbGNCoHoFzDiv5EEEXosSwlRGmV1v2kS5ccLD+7hdyFSPnA0bl8UT5bojuht8HyHDpqV/de06Jb
	OthHu1Al9/l0xdWyxI7Jx6fwVSNXmGirrTGm+/wKDwHI2mWynPvjaABpW9LL+6V3xzASBj9iWOo7y
	NvvihgscfOJoQ1z6pLhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8Jlm-0000000H9TC-13KB;
	Tue, 05 Nov 2024 13:38:54 +0000
Received: from phobos.denx.de ([85.214.62.61])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8Jhp-0000000H8Qi-3KSu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 13:34:51 +0000
Received: from [192.168.1.107] (87-97-112-21.pool.digikabel.hu [87.97.112.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: hs@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 5372D88CEC;
	Tue,  5 Nov 2024 14:34:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1730813688;
	bh=mFlJcbl3DlbfwuDN87mdbDM9flef9BgUD38InRXLEwQ=;
	h=Date:Subject:To:Cc:References:Reply-To:From:In-Reply-To:From;
	b=H2x8aTqtlPBSwXW4aaq1VQwaAQgR7Z+au0bqVyCYgRJiwEo33knSb3Dq2BAf1eTA+
	 Qp4Gr63fZTuX4Sjfae9+D9aR7hW3pSH6VyynQ0C1tqF/B+GfQtx6BXO7RZmoiTKffD
	 7CBsm2ovA0Bu+0GfQxTpB3w/h8YY1UYEeNhJZKzqqvq19lFFiJm/UwuJpJr2ch3YYN
	 AgUMIbPt6fhzC7DxIbnp0cwr9R++G15V5ItS3yzuSJt7buTaj23O++4ZNp/mFlbnXH
	 rTqBS1Oqq5w5uZoW0XRZBo79pzZyT2qmnjc0v5OG8SO59YjcNzjgeIpLCbuCudyXwQ
	 8JYkuP2X1eVwg==
Message-ID: <c8ebdc70-759e-d51a-d63e-00898ef59d1e@denx.de>
Date: Tue, 5 Nov 2024 14:32:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v3 0/3] arm64: dts: imx8mp: add support for the ABB SoM
 and carrier
Content-Language: en-US
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
 Mathieu Othacehe <m.othacehe@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Hiago De Franco <hiago.franco@toradex.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Joao Paulo Goncalves <joao.goncalves@toradex.com>,
 Shawn Guo <shawnguo2@yeah.net>, Krzysztof Kozlowski <krzk@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Hugo Villeneuve <hvilleneuve@dimonoff.com>,
 Gregor Herburger <gregor.herburger@ew.tq-group.com>,
 Max Merchel <Max.Merchel@ew.tq-group.com>, imx@lists.linux.dev,
 Fabio Estevam <festevam@gmail.com>, linux-gpio@vger.kernel.org,
 Michael Walle <mwalle@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org,
 Peng Fan <peng.fan@nxp.com>, Linus Walleij <linus.walleij@linaro.org>,
 Tim Harvey <tharvey@gateworks.com>, devicetree@vger.kernel.org
References: <20241105064206.43626-1-hs@denx.de>
 <173081219627.3053080.8796298549026571114.robh@kernel.org>
From: Heiko Schocher <hs@denx.de>
In-Reply-To: <173081219627.3053080.8796298549026571114.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_053450_167546_C6AE1622 
X-CRM114-Status: GOOD (  34.19  )
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
Reply-To: hs@denx.de
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hello Rob,

On 05.11.24 14:11, Rob Herring (Arm) wrote:
> 
> On Tue, 05 Nov 2024 07:42:03 +0100, Heiko Schocher wrote:
>> The board uses an ABB specific SoM from ADLink, based on NXP
>> i.MX8MP SoC. The SoM is used on 3 different carrier boards,
>> with small differences.
>>
>> series is based on:
>> 819837584309 - (tag: v6.12-rc5, origin/master, origin/HEAD) Linux 6.12-rc5
>>
>> patches are now checked with
>>
>> make W=1 dt_binding_check
>> make W=1 dtbs_check
>> make W=1 CHECK_DTBS=y {for each dtb introduced in this series)
>>
>> as Krzysztof suggested.
>>
>> Changes in v3:
>> added Reviewed-by from Krzysztof
>> - worked in comments from Krzysztof
>>    gpio-line-names should match the actual number of
>>    gpios of the device.
>> - added comments from Shawn Guo
>>    removed unneeded new lines
>>    sort nodes, properties alphabetical
>>    rename pcie0-refclk -> clock-xxx
>>    used GPIO_ACTIVE_HIGH instead of 0
>> - added comments from Fabio Estevam
>>    instead of settting each brightness-level in
>>    brightness-levels add num-interpolated-steps
>> - changes from me
>>    fix gpio-line-names for semtech gpio controller
>>    in imx8mp-aristainetos3-proton2s.dts as patch
>>    "dt-bindings: pinctrl: sx150xq: allow gpio line naming"
>>    of this series adds the dtb checks for them and 17 entries
>>    needed now.
>>
>> Changes in v2:
>> reworked the compatible strings for ABB imx8mp based boards
>> called dtb checks, no errors for this patch
>> patch dt-bindings: pinctrl: sx150xq: allow gpio line naming new in v2
>> - worked in comments from Krzysztof
>>    - removed unneeded dtbos and build now dtbs for each
>>      carrierboard.
>>    - removed user spidev entries, as I do not know the
>>      real spi devices connected to...
>>    - call dtb check targets as described in cover letter
>>      and fixed warnings except warnings see below:
>> not fixed dtb check warnings
>> - pci (warning pops up for each new dtb from this patch, but
>>    also for a lot of other boards, which are already in tree)
>> imx8mp-aristainetos3-adpismarc.dtb: pcie-ep@33800000: reg: [[864026624, 4194304], [402653184, 134217728]] is too short
>>          from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
>> imx8mp-aristainetos3-adpismarc.dtb: pcie-ep@33800000: reg-names: ['dbi', 'addr_space'] is too short
>>          from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
>> - proton2s dtb specific:
>>    - rs485
>>      imx8mp-aristainetos3-proton2s.dtb: serial@30a60000: rs485-rts-delay:0: 0 is not of type 'array'
>>          from schema $id: http://devicetree.org/schemas/serial/fsl-imx-uart.yaml#
>>      imx8mp-aristainetos3-proton2s.dtb: serial@30a60000: rs485-rts-delay:1: 0 is not of type 'array'
>>          from schema $id: http://devicetree.org/schemas/serial/fsl-imx-uart.yaml#
>>      imx8mp-aristainetos3-proton2s.dtb: serial@30a60000: Unevaluated properties are not allowed ('linux,rs485-enabled-at-boot-time', 'rs485-rts-active-low', 'rs485-rts-delay' were unexpected)
>>          from schema $id: http://devicetree.org/schemas/serial/fsl-imx-uart.yaml#
>>      do not see, what I am doing wrong, also rs485 works fine
>>    - led driver
>>      imx8mp-aristainetos3-proton2s.dtb: /soc@0/bus@30800000/i2c@30a30000/tlc59108@40: failed to match any schema with compatible: ['ti,tlc59108']
>>      I use the comaptible entry used in drivers/leds/leds-tlc591xx.c
>>      Ah, may because file
>>      Documentation/devicetree/bindings/leds/leds-tlc591xx.txt
>>      is not converted to yaml?
>>    - pinctrl driver
>>      adding 'gpio-line-names' leads in a warning as this property
>>      is not checked yet (and so a warning is dropped).
>>      add this check in new patch
>>      dt-bindings: pinctrl: sx150xq: allow gpio line naming
>>      in v2
>>
>> Heiko Schocher (3):
>>    dt-bindings: arm: fsl: Add ABB SoM and carrier
>>    dt-bindings: pinctrl: sx150xq: allow gpio line naming
>>    arm64: dts: imx8mp: add aristainetos3 board support
>>
>>   .../devicetree/bindings/arm/fsl.yaml          |    9 +
>>   .../bindings/pinctrl/semtech,sx1501q.yaml     |   43 +
>>   arch/arm64/boot/dts/freescale/Makefile        |    5 +
>>   .../imx8mp-aristainetos3-adpismarc.dts        |   37 +
>>   .../imx8mp-aristainetos3-helios-lvds.dtso     |  113 ++
>>   .../freescale/imx8mp-aristainetos3-helios.dts |   98 ++
>>   .../imx8mp-aristainetos3-proton2s.dts         |  161 +++
>>   .../imx8mp-aristainetos3a-som-v1.dtsi         | 1107 +++++++++++++++++
>>   8 files changed, 1573 insertions(+)
>>   create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-adpismarc.dts
>>   create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-helios-lvds.dtso
>>   create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-helios.dts
>>   create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-proton2s.dts
>>   create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-aristainetos3a-som-v1.dtsi
>>
>> --
>> 2.20.1
>>
>>
>>
> 
> 
> My bot found new DTB warnings on the .dts files added or changed in this
> series.
> 
> Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
> are fixed by another series. Ultimately, it is up to the platform
> maintainer whether these warnings are acceptable or not. No need to reply
> unless the platform maintainer has comments.
> 
> If you already ran DT checks and didn't see these error(s), then
> make sure dt-schema is up to date:
> 
>    pip3 install dtschema --upgrade
> 
> 
> New warnings running 'make CHECK_DTBS=y freescale/imx8mp-aristainetos3-adpismarc.dtb freescale/imx8mp-aristainetos3-helios.dtb freescale/imx8mp-aristainetos3-proton2s.dtb' for 20241105064206.43626-1-hs@denx.de:
> 
> arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-proton2s.dtb: /soc@0/bus@30800000/i2c@30a30000/tlc59108@40: failed to match any schema with compatible: ['ti,tlc59108']

Yep, reason I explained above in commit comment:

 >>    - led driver
 >>      imx8mp-aristainetos3-proton2s.dtb: /soc@0/bus@30800000/i2c@30a30000/tlc59108@40: failed to 
match any schema with compatible: ['ti,tlc59108']
 >>      I use the comaptible entry used in drivers/leds/leds-tlc591xx.c
 >>      Ah, may because file
 >>      Documentation/devicetree/bindings/leds/leds-tlc591xx.txt
 >>      is not converted to yaml?

So the compatible entry is fully okay, just the check is poping up,
as yaml file is missing...

bye,
Heiko
-- 
DENX Software Engineering GmbH,      Managing Director: Erika Unter
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: +49-8142-66989-52   Fax: +49-8142-66989-80   Email: hs@denx.de


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E531E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 06:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GC/DrlLoSA87gsyjAs/dvGkNKg7ZjWHgVvyPR97og+Y=; b=RcV86B/X1dyLdNAtT1FYzZXYqs
	F6E3WoPF+hpIsNGn/HBFjIL5kee6XzW6PH6VvvwA5xPgaioJxAAryXbTLEOhl37DQ/Ltkc8X5mPAh
	oJzMSpBCFFOj0ouU+Wht3TF2asp0iVWzM8Z3xuI5NGoPx0iI5L4Fn3t7p7RXh/asc7aPgqv3YI7LZ
	gvlNLUaePk2fhZ6ttB/FgGau6EMU/GErJJ+BVrgD3l40WClYlLfMrZgthphW5IdlT60Oms1bC6Jaf
	kUpQKAS6l3GTXu8j9pUgVJmalmbg10OgBl5/gIUIzwaDCGxonUTKVfSehNdz4EE1TpGUIoSwrr+/W
	PsFwx1Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOWPk-000000044xE-3lKc;
	Fri, 20 Dec 2024 06:23:08 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOWOb-000000044l0-44w2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 06:21:59 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tOWOI-0001i8-15; Fri, 20 Dec 2024 07:21:38 +0100
Message-ID: <44278a64-7578-4109-aef3-4888627166d1@pengutronix.de>
Date: Fri, 20 Dec 2024 07:21:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] arm64: dts: freescale: imx8mp-skov: switch to nominal
 drive mode
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Abel Vesa <abel.vesa@linaro.org>,
 Marek Vasut <marex@denx.de>, linux-clk@vger.kernel.org, imx@lists.linux.dev,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20241219-imx8m-clk-v1-0-cfaffa087da6@pengutronix.de>
 <20241220061613.GB8295@localhost.localdomain>
Content-Language: en-US
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <20241220061613.GB8295@localhost.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_222158_014763_837CE56A 
X-CRM114-Status: GOOD (  26.20  )
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

Hello Peng,

On 20.12.24 07:16, Peng Fan wrote:
> On Thu, Dec 19, 2024 at 08:27:31AM +0100, Ahmad Fatoum wrote:
>> Unlike the i.MX8MM and i.MX8MN SoCs added earlier, the imx8mp.dtsi
>> configures some clocks at frequencies that are only validated for
>> overdrive mode, i.e., when VDD_SOC is 950 mV.
>>
>> For the Skov i.MX8MP board, we want to run the SoC at the lower voltage of
>> 850 mV though to reduce heat generation and power usage. For this to work,
>> clock rates need to adhere to the limits of the nominal drive mode.
>>
>> This is done by this series: A new imx8mp-nominal.dtsi reconfigures
>> the imx8mp.dtsi clock tree to be compatible with nominal mode, an adaptation
>> to the Linux clock driver makes it sanity check the actual clock rates against
>> the SoC operating mode's constraints and finally the Skov DT makes use
>> of it.
>>
>> Actual configuration of the VDD_SOC rail continues to happen prior to Linux
>> as well as PLL configuration that needs to happen earlier than the kernel
>> running. See the corresponding barebox patch series[1] for details.
>> Note that the barebox series didn't yet include VDD_SOC reconfiguration
>> to 850mV, that would follow once the kernel changes have been merged.
> 
> Good to see this. I had same plan to support i.MX9.
> 
> I see you introduce a new property, how about using a boot pararmeter,
> saying "mode=nominal" or "mode=overdrive". Then drivers could
> act accordingly.

I assume you would place that parameter in drivers/soc/imx/soc-imx8m.c?

That's certainly possible as well, but I think for such a hardware property,
the device tree is the natural place.

Thanks,
Ahmad

> 
> Regards,
> Peng
> 
>>
>> [1]: https://lore.kernel.org/barebox/20240503103717.1370636-1-a.fatoum@pengutronix.de/
>>
>> ---
>> Ahmad Fatoum (6):
>>      dt-bindings: clock: imx8m: document nominal/overdrive properties
>>      arm64: dts: imx8mp: Add optional nominal drive mode DTSI
>>      arm64: dts: imx8mp: add fsl,nominal-mode property into nominal.dtsi
>>      arm64: dts: freescale: imx8mp-skov: fix LDB clock rate configuration
>>      arm64: dts: freescale: imx8mp-skov: operate SoC in nominal mode
>>      clk: imx8mp: inform CCF of maximum frequency of clocks
>>
>> .../devicetree/bindings/clock/imx8m-clock.yaml     |  14 ++
>> arch/arm64/boot/dts/freescale/imx8mp-nominal.dtsi  |  64 +++++++++
>> .../arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi |   5 +-
>> .../freescale/imx8mp-skov-revb-mi1010ait-1cp1.dts  |  19 +--
>> drivers/clk/imx/clk-imx8mp.c                       | 147 +++++++++++++++++++++
>> 5 files changed, 233 insertions(+), 16 deletions(-)
>> ---
>> base-commit: 78d4f34e2115b517bcbfe7ec0d018bbbb6f9b0b8
>> change-id: 20241217-imx8m-clk-9467763dfcd8
>>
>> Best regards,
>> -- 
>> Ahmad Fatoum <a.fatoum@pengutronix.de>
>>
> 


-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |


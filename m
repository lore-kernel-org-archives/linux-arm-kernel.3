Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0DD2C282D0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 09:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A8hOQJ07eyFciQGkVhB+wgS9JCDA4c73w2foey0Curs=; b=B01ui7VUlDecrh9o1r6zLVOydS
	jOmBKNpQRjaOsI7gKuwggp+A8+ZoGXkvDHOoN976vXkc3DNr9XKnlhBwVScaOt8hE4kyynPANU9GI
	MPZ6BlTHG4qZ8dS4FGX4wQZdt2Iy+DadBsXYLAEVYBZfmj4rEL8myotoKtNufLKMkMXYtHhX9W6aF
	DjVGhb5BJMCJm1uOX9dvJVI4o2k4XXbdbB8MUufhY5JbZdrBcPdtUJlhBXoU3BFKKs6Yo2CG9CUvv
	ot85wxz0FqhZEtqXC14sN/FTKbA8XgbDyrFiaRJodk7xB7KWzQbo46popy/NXk5J+DH+44RtjtFGV
	J8O0i11A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpOMK-00000003pI4-3bmd;
	Tue, 04 Mar 2025 09:14:40 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpN8m-00000003XEE-33CP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 07:56:38 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tpN8b-0003qJ-4c; Tue, 04 Mar 2025 08:56:25 +0100
Message-ID: <4175faf6-1d41-4409-89db-dd902c966dd5@pengutronix.de>
Date: Tue, 4 Mar 2025 08:56:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/6] arm64: dts: freescale: imx8mp-skov: switch to
 nominal drive mode
To: Abel Vesa <abel.vesa@linaro.org>, Abel Vesa <abelvesa@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Peng Fan <peng.fan@nxp.com>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Frank Li <Frank.li@nxp.com>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Marek Vasut <marex@denx.de>
References: <20250218-imx8m-clk-v4-0-b7697dc2dcd0@pengutronix.de>
 <174102306220.2928950.8878245519332562153.b4-ty@linaro.org>
 <Z8XnuIIfDFykrKH8@linaro.org>
Content-Language: en-US
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <Z8XnuIIfDFykrKH8@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_235636_770647_8AA91F98 
X-CRM114-Status: GOOD (  15.66  )
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

Hello Abel,
Hello Shawn,

On 03.03.25 18:32, Abel Vesa wrote:
> On 25-03-03 19:31:02, Abel Vesa wrote:
>>
>> On Tue, 18 Feb 2025 19:26:40 +0100, Ahmad Fatoum wrote:
>>> Unlike the i.MX8MM and i.MX8MN SoCs added earlier, the imx8mp.dtsi
>>> configures some clocks at frequencies that are only validated for
>>> overdrive mode, i.e., when VDD_SOC is 950 mV.
>>>
>>> For the Skov i.MX8MP board, we want to run the SoC at the lower voltage of
>>> 850 mV though to reduce heat generation and power usage. For this to work,
>>> clock rates need to adhere to the limits of the nominal drive mode.
>>>
>>> [...]
>>
>> Applied, thanks!
>>
>> [1/6] dt-bindings: clock: imx8m: document nominal/overdrive properties
>>       commit: d5992f1af1550a9e11e42cfa2ca1ad2a1b7fd7f3
>> [2/6] arm64: dts: imx8mp: Add optional nominal drive mode DTSI
>>       (no commit info)
>> [3/6] arm64: dts: imx8mp: add fsl,nominal-mode property into nominal.dtsi
>>       (no commit info)
>> [4/6] arm64: dts: freescale: imx8mp-skov: configure LDB clock automatically
>>       (no commit info)
>> [5/6] arm64: dts: freescale: imx8mp-skov: operate SoC in nominal mode
>>       (no commit info)
>> [6/6] clk: imx8mp: inform CCF of maximum frequency of clocks
>>       commit: 06a61b5cb6a8638fa8823cd09b17233b29696fa2
> 
> Applied only patches 1 and 6.
> 
> My b4 setup messed up. Sorry.

Thanks for applying, Abel!

@Shawn, could the remainder of the patches go through your tree?

Thanks!
Ahmad

> 
>>
>> Best regards,
>> -- 
>> Abel Vesa <abel.vesa@linaro.org>
>>
> 


-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |


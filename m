Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03EF2E77184
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 20:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/3lQJzS6wuZV4cCoDIXIhuyb4Tvn4iNhpTyYCBfv4Yk=; b=SWATCLAGEjGYx7ZeJW9y6Q6xTs
	lLZpVttR5YzQKhAS9Q4PRr2aV44AjPUYef+/Vq64dqR2GNSbd6Gz1/gRgr/lfDAUkpgRY1wt5z41V
	L+e7W53au2YOxPwvHIQUbuYDuZwu/Eh95MgSJbAfP+f1BHG9Mf2C2iM/1DuUYfHNIybuMN4x2tdkA
	PACFlgi5tOoJk68Cn5viHViLdhe09OWRWp9Vr24SUze1eMzYv+Ue2lmR06/xxtoHwA1isTpDkDsou
	Fg1XRZ5HlelF7UnIwFKueei1CxAmJ+SFplg0986AFaNn9hOHKVKLx68rqXL5R30pclp/OeI8jEJ32
	OLZT3fsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tON5W-0000000320p-3xu9;
	Thu, 19 Dec 2024 20:25:38 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOMut-00000002znr-0Dga
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Dec 2024 20:14:40 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tOMuR-0004TF-Sj; Thu, 19 Dec 2024 21:14:11 +0100
Message-ID: <4e2250b3-5170-4e88-aa0a-dd796b81e78b@pengutronix.de>
Date: Thu, 19 Dec 2024 21:14:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] dt-bindings: clock: imx8m: document nominal/overdrive
 properties
To: Conor Dooley <conor@kernel.org>
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
 <20241219-imx8m-clk-v1-1-cfaffa087da6@pengutronix.de>
 <20241219-lash-lather-31443ced0e0c@spud>
Content-Language: en-US
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <20241219-lash-lather-31443ced0e0c@spud>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_121439_094724_0F9CFE85 
X-CRM114-Status: GOOD (  27.10  )
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

Hello Conor,

On 19.12.24 20:49, Conor Dooley wrote:
> On Thu, Dec 19, 2024 at 08:27:32AM +0100, Ahmad Fatoum wrote:
>> The imx8m-clock.yaml binding covers the clock controller inside all
>> of the i.MX8M Q/M/N/P SoCs. All of them have in common that they
>> support two operating modes: nominal and overdrive mode.
> 
> This implies that only the two modes you mention are possible, but you
> leave the option open to a dts author to use either. How come?
> 
> Makes it seem like we only need one of these, for whatever the
> non-default option is?

There is no real default. The mode is configured implicitly by the
bootloader setting VDD_SOC and then kernel needs to adhere to the
limits that imposes.

For i.MX8M Mini and Nano, the kernel SoC DTSIs has assigned-clock-rates
that are all achievable in nominal mode. For i.MX8MP, there are some
rates only validated for overdrive mode.

But even for the i.MX8M Mini/Nano boards, we don't know what rates they
may configure at runtime, so it's not possible to infer from just the
device tree what the mode is, which is why I need to allow for absence
of either property. I can make it a single property with two possible
values though if that's preferable.

Theoretically, we could infer mode at runtime from VDD_SOC voltage,
but we need to set up clocks to read out the PMIC and I want to
apply the constraints as early as possible as I don't want the SoC
to run outside of spec even for a short while.

Thanks,
Ahmad

> 
>>
>> While the overdrive mode allows for higher frequencies for many IPs,
>> the nominal mode needs a lower SoC voltage, thereby reducing
>> heat generation and power usage.
>>
>> In any case, software should respect the maximum clock rate limits
>> described in the datasheet for each of the two operating modes.
>>
>> To allow device tree consumers to enforce these limits, document two new
>> optional properties that can be used to sanity check the clock tree.
>>
>> Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
>> ---
>>  Documentation/devicetree/bindings/clock/imx8m-clock.yaml | 14 ++++++++++++++
>>  1 file changed, 14 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/clock/imx8m-clock.yaml b/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
>> index c643d4a81478..a6ae5257ef53 100644
>> --- a/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
>> +++ b/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
>> @@ -43,6 +43,14 @@ properties:
>>        ID in its "clocks" phandle cell. See include/dt-bindings/clock/imx8m-clock.h
>>        for the full list of i.MX8M clock IDs.
>>  
>> +  fsl,nominal-mode:
>> +    description: Set if SoC is operated in nominal mode
>> +    $ref: /schemas/types.yaml#/definitions/flag
>> +
>> +  fsl,overdrive-mode:
>> +    description: Set if SoC is operated in overdrive mode
>> +    $ref: /schemas/types.yaml#/definitions/flag
>> +
>>  required:
>>    - compatible
>>    - reg
>> @@ -95,6 +103,12 @@ allOf:
>>              - const: clk_ext2
>>              - const: clk_ext3
>>              - const: clk_ext4
>> +  - if:
>> +      required:
>> +        - fsl,overdrive-mode
>> +    then:
>> +      properties:
>> +        fsl,nominal-mode: false
>>  
>>  additionalProperties: false
>>  
>>
>> -- 
>> 2.39.5
>>


-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |


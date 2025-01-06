Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C46BBE77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 19:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dEeC2ukI5ZmjqAIH3frqZPd6crzzbKaq5apFahgAFw8=; b=TcYjkV/cMr8ZfuBNMJhXQmzNNK
	qFCqaj1oOAtB6l2RBy2eEYFYthXLVU+8FCuo9XbgbXJCGW97XX4OHdNaXxgb1+4f4wlT03JFFHDeR
	ufKrUiRXhYUzXHFtYeika4ik0KkaB9KH7YtR209XdbaQXaTkTy5dDX/I3pO9llkWP+NY+uQzLeag+
	iEOQ4SFumQ8nJtTpYQb8BCVs8GT2Ta1S0P+Y05VyrQTTBu5AKP4f+Y8ycChWyMLHwUCaFhLYERsDi
	xKZZD4Ioq0eVc7izCbPCJGrZlPld5Oz20qC32wDvJJvW6VrQ3JmDV0UdHhZt3mOjNcIOhg9eX0LaL
	XOSB0+TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUskt-00000002RYz-0s6U;
	Mon, 06 Jan 2025 19:27:15 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUsjh-00000002RN1-0dB7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 19:26:02 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tUsjL-0001KR-8T; Mon, 06 Jan 2025 20:25:39 +0100
Message-ID: <957ad153-17f3-4cb8-8878-73093a9a2724@pengutronix.de>
Date: Mon, 6 Jan 2025 20:25:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] dt-bindings: clock: imx8m: document
 nominal/overdrive properties
To: Frank Li <Frank.li@nxp.com>
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
 linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
References: <20250106-imx8m-clk-v2-0-6aaeadac65fe@pengutronix.de>
 <20250106-imx8m-clk-v2-1-6aaeadac65fe@pengutronix.de>
 <Z3wHp6eLQuV9GGvh@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <Z3wHp6eLQuV9GGvh@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_112601_193405_7B26DF57 
X-CRM114-Status: GOOD (  20.70  )
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

Hello Frank,

On 06.01.25 17:41, Frank Li wrote:
> On Mon, Jan 06, 2025 at 03:21:42PM +0100, Ahmad Fatoum wrote:

[snip]

>> Allowing for absence of both properties is
>> needed, because there is no default suitable for all boards:
>>
>> For i.MX8M Mini and Nano, the kernel SoC DTSIs has assigned-clock-rates
>> that are all achievable in nominal mode. For i.MX8MP, there are some
>> rates only validated for overdrive mode.
>>
>> But even for the i.MX8M Mini/Nano boards, we don't know what rates they
>> may configure at runtime, so it has not been possible so far to infer from
>> just the device tree what the mode is.

[snip]

>> +  fsl,nominal-mode:
>> +    description: Set if SoC is operated in nominal mode
>> +    $ref: /schemas/types.yaml#/definitions/flag
>> +
>> +  fsl,overdrive-mode:
>> +    description: Set if SoC is operated in overdrive mode
>> +    $ref: /schemas/types.yaml#/definitions/flag
>> +
> 
> why need two flags? suppose "not set fsl,overdrive-mode" is equal to
> fsl,nominal-mode

Conor had the same question on v1[1] and I have addressed this in the commit
message of v2, see above.

In short, there is unfortunately no universally applicable default.

[1]: https://lore.kernel.org/all/4e2250b3-5170-4e88-aa0a-dd796b81e78b@pengutronix.de/

Thanks,
Ahmad


> 
> Frank
> 
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
> 


-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |


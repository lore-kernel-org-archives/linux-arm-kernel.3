Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 466DDEB7EB6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 09:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0QOY3SwlDPrGm+6EJVdxOMdbUCm/cndSMZI5zzeh0dI=; b=ERdbdyC0L4gG2r4otBA15r/c5d
	+HRmP6d6uivrSAPFVPX8rDZ/GTDh5BxX02Wp0ACYP0Cwmi1MRkgsNm+6093SE9VQkDneBu6giNLBO
	1MPOJ5L0UtM8IC1v9aujiEzpbkX2LGHCD6++cZqcpbwN4sYcfoAWyoqIa2+ojkUt1H4NKjaQ4xqpe
	j+dBQGWcv+IPE6HmJatz1iCddlXb2WXtpEXxS9CjC553MTow3zRP5MoPemlnqQSBdCKBFquVOp03i
	YSHzrqdHGh5uBw9NwQilpV8p5lzT1ZkMC6zRNdyKKHwyA2ItQ3QXwhn1+SenGbUuDB8UUJmT/31Lj
	IkIA8Whw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxiEZ-0000000GqI1-23Ad;
	Wed, 04 Mar 2026 09:09:35 +0000
Received: from mail.cjdns.fr ([5.135.140.105])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxiEX-0000000GqHB-0d1c;
	Wed, 04 Mar 2026 09:09:34 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6471B22953A;
	Wed,  4 Mar 2026 10:09:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1772615369; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=0QOY3SwlDPrGm+6EJVdxOMdbUCm/cndSMZI5zzeh0dI=;
	b=d5U8vb6pBn5ABOYJsTtCnPXgqoJsbhO0uLtdRutCR/zeXaC+BKOEY1MZg+X7cB00LZyYD/
	tvls+YGM9G4/i15SovrHmKK1Ikt3mBp74ZiRxlqgP3qHBkfHoSyOWFrwghYZBtpA/Toc13
	0JxoAEscHkZYZjS7H8KC05CD1oe2Oth1w2lNxtCGmrH7e3FJYRhDaqPYEMR39Y/EgT4rJ+
	How3mchqTzXemRlWZO/2TEax9ylq46DxosIW80V8jvyRuSpff48d0/WpVVq/cDjHKfehlC
	K+/DzLb4pbYKJFIWkec2nvS7YUVsQgGgC5UuYMpPHcoCqyJR7GoBKq+3Rm+MXQ==
Message-ID: <7888e449-fec9-4a23-8133-ad0c9651a354@cjdns.fr>
Date: Wed, 4 Mar 2026 10:09:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH 1/8] dt-bindings: clock, reset: Add econet EN751221
 bindings
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-mips@vger.kernel.org, naseefkm@gmail.com, mturquette@baylibre.com,
 sboyd@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 tsbogend@alpha.franken.de, ryder.lee@mediatek.com,
 jianjun.wang@mediatek.com, lpieralisi@kernel.org, kwilczynski@kernel.org,
 mani@kernel.org, bhelgaas@google.com, vkoul@kernel.org,
 neil.armstrong@linaro.org, p.zabel@pengutronix.de, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, nbd@nbd.name, ansuelsmth@gmail.com,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
References: <20260303190948.694783-1-cjd@cjdns.fr>
 <20260303190948.694783-2-cjd@cjdns.fr>
 <20260304-accomplished-helpful-orca-5d6b81@quoll>
Content-Language: en-US
From: Caleb James DeLisle <cjd@cjdns.fr>
In-Reply-To: <20260304-accomplished-helpful-orca-5d6b81@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_010933_572981_0901A0EC 
X-CRM114-Status: GOOD (  22.85  )
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


On 04/03/2026 09:39, Krzysztof Kozlowski wrote:
> On Tue, Mar 03, 2026 at 07:09:41PM +0000, Caleb James DeLisle wrote:
>> Add clock and reset bindings for EN751221 as well as
>> a "chip-scu" which is an additional regmap that is used
>> by the clock driver as well as others. This split of the
>> SCU across two register areas is the same as the Airoha
>> AN758x family.
> Please wrap commit message according to Linux coding style / submission
> process (neither too early nor over the limit):
> https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597
OK
> A nit, subject: drop second/last, redundant "bindings". The
> "dt-bindings" prefix is already stating that these are bindings.
> See also:
> https://elixir.bootlin.com/linux/v6.17-rc3/source/Documentation/devicetree/bindings/submitting-patches.rst#L18
OK
>> Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
>> ---
>>   .../bindings/clock/airoha,en7523-scu.yaml     | 19 ++++++-
>>   .../mips/econet,en751221-chip-scu.yaml        | 41 ++++++++++++++++
>>   MAINTAINERS                                   |  3 ++
>>   .../dt-bindings/clock/econet,en751221-scu.h   | 15 ++++++
>>   .../dt-bindings/reset/econet,en751221-scu.h   | 49 +++++++++++++++++++
>>   5 files changed, 126 insertions(+), 1 deletion(-)
>>   create mode 100644 Documentation/devicetree/bindings/mips/econet,en751221-chip-scu.yaml
>>   create mode 100644 include/dt-bindings/clock/econet,en751221-scu.h
>>   create mode 100644 include/dt-bindings/reset/econet,en751221-scu.h
>>
>> diff --git a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
>> index a8471367175b..e60e54273393 100644
>> --- a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
>> +++ b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
>> @@ -32,6 +32,7 @@ properties:
>>         - enum:
>>             - airoha,en7523-scu
>>             - airoha,en7581-scu
>> +          - econet,en751221-scu
>>   
>>     reg:
>>       items:
>> @@ -67,7 +68,10 @@ allOf:
>>     - if:
>>         properties:
>>           compatible:
>> -          const: airoha,en7581-scu
>> +          items:
> Drop items, it's just enum
>
>> +            - enum:
>> +                - airoha,en7581-scu
>> +                - econet,en751221-scu
>>       then:
>>         properties:
>>           reg:
>> @@ -98,3 +102,16 @@ examples:
>>                 #reset-cells = <1>;
>>         };
>>       };
>> +
>> +  - |
>> +    soc {
>> +      #address-cells = <1>;
>> +      #size-cells = <1>;
> No need for new example, especially without any differences. You already
> have there two.
OK
>> +
>> +      scuclk2: clock-controller@1fb00000 {
>> +        compatible = "econet,en751221-scu";
>> +        reg = <0x1fb00000 0x970>;
>> +        #clock-cells = <1>;
>> +        #reset-cells = <1>;
>> +      };
>> +    };
>> diff --git a/Documentation/devicetree/bindings/mips/econet,en751221-chip-scu.yaml b/Documentation/devicetree/bindings/mips/econet,en751221-chip-scu.yaml
>> new file mode 100644
>> index 000000000000..7c7c8cf8d2a5
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mips/econet,en751221-chip-scu.yaml
>> @@ -0,0 +1,41 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/mips/econet,en751221-chip-scu.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: EcoNet Chip SCU Controller for EN751221 SoC
>> +
>> +maintainers:
>> +  - Caleb James DeLisle <cjd@cjdns.fr>
>> +
>> +description:
>> +  The EcoNet chip-scu block provides a configuration interface for clock,
>> +  io-muxing and other functionalities used by multiple controllers (e.g. clock,
>> +  pinctrl, ecc) on EN751221 SoC.
>> +
>> +properties:
>> +  compatible:
>> +    items:
>> +      - const: econet,en751221-chip-scu
>> +      - const: syscon
> And it does not fit existing syscon bindings file, because ... ?


If you're asking why it needs to be named "econet,en751221-chip-scu" and 
not just "syscon", it's because the actual clock/scu searches for it by 
compatible. This is patterned after "airoha,en7581-chip-scu" ( 
https://lore.kernel.org/20241023-en7581-pinctrl-v9-1-afb0cbcab0ec@kernel.org 
).

I could drop this file and use "airoha,en7581-chip-scu" in the DT and 
clk driver, but I do not think it is identical to the actual EN7581 chip 
scu.

I could also drop the file and add "econet,en751221-chip-scu" as a 
compatible to airoha,en7581-chip-scu.yaml, but that file lives in /arm 
and this is a MIPS.

I chose this route because it seemed least hackish, but I would defer to 
your judgement on the matter.

>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    soc {
>> +      #address-cells = <1>;
>> +      #size-cells = <1>;
>> +      syscon@1fa20000 {
>> +        compatible = "econet,en751221-chip-scu", "syscon";
>> +        reg = <0x1fa20000 0x388>;
>> +      };
>> +    };
> ...
>
>> +
>> +#define EN751221_MAX_CLKS	6
> Drop, not a binding.
OK
>
>> +
>> +#endif /* _DT_BINDINGS_CLOCK_ECONET_EN751221_SCU_H_ */
>> diff --git a/include/dt-bindings/reset/econet,en751221-scu.h b/include/dt-bindings/reset/econet,en751221-scu.h
>> new file mode 100644


Thank you kindly for the prompt review.

Caleb


> Best regards,
> Krzysztof
>
>


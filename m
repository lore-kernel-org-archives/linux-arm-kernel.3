Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55EE4CCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 13:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SgZfesCetY4oHvl5h838KNujUcn8Vd//cFUVGen2iPY=; b=Yn5NxNY19DEtFzJl1k5zFiZdGi
	SAhtKrQPQx86IoIitguH0/lrrTtMUpo6TYPMwyDyWWZ/Nb4I7I4EAR4rCa2U7EDPhw33PfREyJu8x
	71OZFqnFVAq7TWQ2Y5+ylPDGD4TTzvCURt7JYtXOAs3fBHUZMLFv6cd6fnpxIcg0do1/SI8MIiVlt
	WPHL+IrHxdeNgV5FJL+a9baVXJiCsgdT8ihTt4u2snufMqtuxx9tey1hDGj7ISUs7Ykl+r4tMdiB3
	u2TLt/XJu6tOkQsF2z7PsyC4KyD9vHLYUAGzgqkNcJVYqFXPeJOy80mKoMuL2eraxLz5D5gDwzolr
	bQa1LZ1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJB2q-00000008rIr-28Hp;
	Wed, 12 Nov 2025 13:37:56 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJB2m-00000008rI4-3v02
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 13:37:55 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id A24711A1A29;
	Wed, 12 Nov 2025 13:37:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6ADE06070B;
	Wed, 12 Nov 2025 13:37:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 126FA102F16E2;
	Wed, 12 Nov 2025 14:37:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762954669; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=SgZfesCetY4oHvl5h838KNujUcn8Vd//cFUVGen2iPY=;
	b=FMJuKDZ8BinI+FLM8rQQYM1P95xSOnbXoDKeJX1JKeNhlx2VD2Kgvt38kskzvKKYSJ/S78
	vPGvQGQL/hJ659RvOdvPRl30w0qoHWa/n73nGPqDDVGqRWVzvLvfBF6NK9VrGALfq05uY8
	nX9KCCokyIq4T5m9kAPBa1/z4YToLM7HYuWEMMpaXbflNe6dzzZwzFXv+2KmDRLEvQR2tY
	BhxpY5iT3dgg88OczC6vCcb0MSmVTR67/YZTEmmjhgsu7L6DG8O0pA14w6r5bSpYj7ZNbe
	3CnRca/IH3scqTddJqWPsgBrjX+qcBSFGY+9ac4YjgQn7AnZYl4vlHsTczY/Cw==
Message-ID: <7c96aca1-ffa7-49b9-9fc2-04229da338b6@bootlin.com>
Date: Wed, 12 Nov 2025 14:37:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v15 01/15] dt-bindings: net: Introduce the
 ethernet-connector description
To: Rob Herring <robh@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 thomas.petazzoni@bootlin.com, Andrew Lunn <andrew@lunn.ch>,
 Jakub Kicinski <kuba@kernel.org>, Eric Dumazet <edumazet@google.com>,
 Paolo Abeni <pabeni@redhat.com>, Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Herve Codina <herve.codina@bootlin.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 =?UTF-8?Q?K=C3=B6ry_Maincent?= <kory.maincent@bootlin.com>,
 =?UTF-8?Q?Marek_Beh=C3=BAn?= <kabel@kernel.org>,
 Oleksij Rempel <o.rempel@pengutronix.de>,
 =?UTF-8?Q?Nicol=C3=B2_Veronese?= <nicveronese@gmail.com>,
 Simon Horman <horms@kernel.org>, mwojtas@chromium.org,
 Antoine Tenart <atenart@kernel.org>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Romain Gantois <romain.gantois@bootlin.com>,
 Daniel Golle <daniel@makrotopia.org>,
 Dimitri Fedrau <dimitri.fedrau@liebherr.com>
References: <20251106094742.2104099-1-maxime.chevallier@bootlin.com>
 <20251106094742.2104099-2-maxime.chevallier@bootlin.com>
 <20251112124355.GA1269790-robh@kernel.org>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <20251112124355.GA1269790-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_053753_111193_4F80BBE4 
X-CRM114-Status: GOOD (  27.42  )
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

Hi Rob,

On 12/11/2025 13:43, Rob Herring wrote:
> On Thu, Nov 06, 2025 at 10:47:26AM +0100, Maxime Chevallier wrote:
>> The ability to describe the physical ports of Ethernet devices is useful
>> to describe multi-port devices, as well as to remove any ambiguity with
>> regard to the nature of the port.
>>
>> Moreover, describing ports allows for a better description of features
>> that are tied to connectors, such as PoE through the PSE-PD devices.
>>
>> Introduce a binding to allow describing the ports, for now with 2
>> attributes :
>>
>>  - The number of lanes, which is a quite generic property that allows
>>    differentating between multiple similar technologies such as BaseT1
>>    and "regular" BaseT (which usually means BaseT4).
>>
>>  - The media that can be used on that port, such as BaseT for Twisted
>>    Copper, BaseC for coax copper, BaseS/L for Fiber, BaseK for backplane
>>    ethernet, etc. This allows defining the nature of the port, and
>>    therefore avoids the need for vendor-specific properties such as
>>    "micrel,fiber-mode" or "ti,fiber-mode".
>>
>> The port description lives in its own file, as it is intended in the
>> future to allow describing the ports for phy-less devices.
>>
>> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
>> ---
>>  .../bindings/net/ethernet-connector.yaml      | 53 +++++++++++++++++++
>>  .../devicetree/bindings/net/ethernet-phy.yaml | 18 +++++++
>>  MAINTAINERS                                   |  1 +
>>  3 files changed, 72 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/net/ethernet-connector.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/net/ethernet-connector.yaml b/Documentation/devicetree/bindings/net/ethernet-connector.yaml
>> new file mode 100644
>> index 000000000000..2b67907582c7
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/net/ethernet-connector.yaml
>> @@ -0,0 +1,53 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/net/ethernet-connector.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Generic Ethernet Connector
>> +
>> +maintainers:
>> +  - Maxime Chevallier <maxime.chevallier@bootlin.com>
>> +
>> +description:
>> +  An Ethernet Connector represents the output of a network component such as
>> +  a PHY, an Ethernet controller with no PHY, or an SFP module.
>> +
>> +properties:
>> +
>> +  pairs:
>> +    description:
>> +      Defines the number of BaseT pairs that are used on the connector.
>> +    $ref: /schemas/types.yaml#/definitions/uint32
> 
> Constraints? Wouldn't 4 pairs be the max?

Andrew also made that remark on the code, I'll add a constraint on
1, 2 or 4 pairs.

> 
> Is it possible you need to know which pairs are wired?

For now I don't think so, except maybe for when 2 pairs are wired
when 4 are supported on the PHY and connector, but even then I don't
think HW designers have a choice about which one to use. It's unclear
to me wether this would be useful.

> 
>> +
>> +  media:
> 
> Both of these names are a bit generic though I don't have a better 
> suggestion.
> 
>> +    description:
>> +      The mediums, as defined in 802.3, that can be used on the port.
>> +    enum:
>> +      - BaseT
>> +      - BaseK
>> +      - BaseS
>> +      - BaseC
>> +      - BaseL
>> +      - BaseD
>> +      - BaseE
>> +      - BaseF
>> +      - BaseV
>> +      - BaseMLD
>> +
>> +required:
>> +  - media
>> +
>> +allOf:
>> +  - if:
>> +      properties:
>> +        media:
>> +          contains:
>> +            const: BaseT
>> +    then:
>> +      required:
>> +        - pairs
> 
> else:
>   properties:
>     pairs: false
> 
> ??

Ah I didn't know this was necessary, I'll add that, thanks !

> 
>> +
>> +additionalProperties: true
>> +
>> +...
>> diff --git a/Documentation/devicetree/bindings/net/ethernet-phy.yaml b/Documentation/devicetree/bindings/net/ethernet-phy.yaml
>> index 2ec2d9fda7e3..f434768d6bae 100644
>> --- a/Documentation/devicetree/bindings/net/ethernet-phy.yaml
>> +++ b/Documentation/devicetree/bindings/net/ethernet-phy.yaml
>> @@ -277,6 +277,17 @@ properties:
>>  
>>      additionalProperties: false
>>  
>> +  mdi:
>> +    type: object
>> +
>> +    patternProperties:
>> +      '^connector-[a-f0-9]+$':
> 
> Unit addresses are hex, index suffixes are decimal: connector-[0-9]+

Ah right, indeed. I'll address that.

> 
> 
>> +        $ref: /schemas/net/ethernet-connector.yaml#
>> +
>> +        unevaluatedProperties: false
>> +
>> +    additionalProperties: false
>> +
>>  required:
>>    - reg
>>  
>> @@ -313,5 +324,12 @@ examples:
>>                      default-state = "keep";
>>                  };
>>              };
>> +            /* Fast Ethernet port, with only 2 pairs wired */
>> +            mdi {
>> +                connector-0 {
>> +                    pairs = <2>;
>> +                    media = "BaseT";
>> +                };
>> +            };
>>          };
>>      };
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 1ab7e8746299..19ba82b98616 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -9276,6 +9276,7 @@ R:	Russell King <linux@armlinux.org.uk>
>>  L:	netdev@vger.kernel.org
>>  S:	Maintained
>>  F:	Documentation/ABI/testing/sysfs-class-net-phydev
>> +F:	Documentation/devicetree/bindings/net/ethernet-connector.yaml
>>  F:	Documentation/devicetree/bindings/net/ethernet-phy.yaml
>>  F:	Documentation/devicetree/bindings/net/mdio*
>>  F:	Documentation/devicetree/bindings/net/qca,ar803x.yaml
>> -- 
>> 2.49.0
>>

Thanks for reviewing !

Maxime



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C77C4E7718A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 10:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oq5JO8IAGHUgtWKu3N5PTBR3nqLoTI/1Srn3kmjKxgM=; b=FV3TJ9S1X5B5SlL6D42cAnzZGt
	uLNDnnQlXqhgS/cliL1Hbv9cBLeBTf6Qxjyyk6gNC/a8hEIQno7FV4XB80hu7T2DtufM5belL1lv1
	YVXobn9WB8ToY/mW7jb32ATJ3V0EOmTlk6NqCVh74WXxTDO6HlwOZGH+aMyPboA+nxwMaytGlva2f
	678FE2AQdFtVTqmwHZtkcQqqdn31vwRe6ZIFc6UfFFUhuseXUjoiPfJqr0b8TNTBKD0XYpG6xXjG/
	/zMCmuHnOVvZPkspYR09qAn0I7H42GgS9gD76zopnyBvWZ5wzRFvVqICLwrPVN/9xb1ppx/Fk22vd
	ZENIELuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOECk-00000001asC-0w1Y;
	Thu, 19 Dec 2024 10:56:30 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOEAa-00000001aT5-0wHr;
	Thu, 19 Dec 2024 10:54:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1734605654;
	bh=6DnBAetO0n/Dt6GuKQiaQjG4sHkyUy/qLhkhpG6lREU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BKQJ395aphVnmIKWFGKR7MYowS/uaeNkIdyc3+FbEH+RDwQ2n8YzBZKSniaLpT3td
	 lBImymLI0EVILte+Nh3YXqhHNjbehfrVQ9JTAhQEsNufY2SS0CzqLMV6yHK9z59D0q
	 pDmeqzq7MN3BZael32voW88hN8cWgX1e/IaHsPWBwEExo4T/puTKRwHEZEymzxvwqQ
	 hO3pnzTH9U3pUInPhMHC2LcG8XfbVB/I0ibVKxUFDqKzYtoj4Y0ZZfaMO6LuKMiqPU
	 /hTDVv3Ux3whEJ7iYvW4X+A2w4F05h8eUX3Q8va7rzzaeNUOblc+6wxMlzj5iRVdrc
	 WRiGPms7XSrDw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 31D5617E3612;
	Thu, 19 Dec 2024 11:54:13 +0100 (CET)
Message-ID: <9a75e88c-d90d-4ea8-b5c3-6d056d4f0498@collabora.com>
Date: Thu, 19 Dec 2024 11:54:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/33] dt-bindings: display: mediatek: Add binding for
 MT8195 HDMI-TX v2
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, matthias.bgg@gmail.com, ck.hu@mediatek.com,
 jitao.shi@mediatek.com, jie.qiu@mediatek.com, junzhi.zhao@mediatek.com,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com,
 dmitry.baryshkov@linaro.org
References: <20241217154345.276919-1-angelogioacchino.delregno@collabora.com>
 <20241217154345.276919-8-angelogioacchino.delregno@collabora.com>
 <rsnyljmkdf7i74bkrlf5nesp2sa3n6xcnzsqao4znmczjpfyq2@dsakz56s4ypt>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <rsnyljmkdf7i74bkrlf5nesp2sa3n6xcnzsqao4znmczjpfyq2@dsakz56s4ypt>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_025416_420417_3CC7DFE9 
X-CRM114-Status: GOOD (  16.29  )
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

Il 18/12/24 09:20, Krzysztof Kozlowski ha scritto:
> On Tue, Dec 17, 2024 at 04:43:19PM +0100, AngeloGioacchino Del Regno wrote:
>> +  i2c:
>> +    type: object
>> +    $ref: /schemas/display/mediatek/mediatek,mt8195-hdmi-ddc.yaml
>> +    unevaluatedProperties: false
>> +    description: HDMI DDC I2C controller
>> +
>> +  phys:
>> +    maxItems: 1
>> +    description: PHY providing clocking TMDS and pixel to controller
>> +
>> +  phy-names:
>> +    items:
>> +      - const: hdmi
>> +
>> +  pinctrl-0: true
>> +
>> +  pinctrl-names:
>> +    items:
>> +      - const: default
> 
> Drop both pinctrl entries.
> 
>> +
>> +  power-domains:
>> +    maxItems: 1
>> +
>> +  '#sound-dai-cells':
>> +    const: 1
>> +
>> +  ports:
>> +    $ref: /schemas/graph.yaml#/properties/ports
>> +
>> +    properties:
>> +      port@0:
>> +        $ref: /schemas/graph.yaml#/properties/port
>> +        description:
>> +          Input port, usually connected to the output port of a DPI
>> +
>> +      port@1:
>> +        $ref: /schemas/graph.yaml#/properties/port
>> +        description:
>> +          Output port that must be connected either to the input port of
>> +          a HDMI connector node containing a ddc-i2c-bus, or to the input
>> +          port of an attached bridge chip, such as a SlimPort transmitter.
>> +
>> +    required:
>> +      - port@0
>> +      - port@1
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - clocks
>> +  - clock-names
> 
> Please keep the same order of things here and in main properties
> section.
> 
>> +  - interrupts
>> +  - power-domains
>> +  - phys
>> +  - phy-names
>> +  - ports
>> +
> 
> You need allOf: with ref to dai-common.yaml.
> 
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/mt8195-clk.h>
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/power/mt8195-power.h>
>> +
>> +    soc {
>> +        #address-cells = <2>;
>> +        #size-cells = <2>;
>> +
>> +        hdmi-tx@1c300000 {
> 
> hdmi@
> 
> Best regards,
> Krzysztof
> 

Thanks for the great review krzk.

I was wondering if it'd be more straightforward to just send the bindings in a
different series, instead of sending another batch of 33 (actually, 34, because
I forgot one commit adding the DDC binding, ugh!) patches...

CK, any objections?

Cheers,
Angelo


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75C32D58D4D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Nov 2024 14:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=paVCNFvIfD4uYGyrcPxt4wW584lW4zxeDdrALC78N2k=; b=qRyrdz7GAfz4i+XI4GlkRtgkcs
	We0/zAbF2WEYMCDgwmxmSLFNrPwV1aGGpAD3mTCjAaxygTZnhFwHeRi28rBFk2JT6ilpV/ud2X0sc
	kn+x5+HvkGeoMf6k2yf6PACgCIW4cfK2mPUJtEN7wLYwXAb489UIt3XWLSblLt2pYr30ssCMKOsVj
	4GgtkPzdsOrhJezTo3+4RID3Z8mU8lHINshA4Ahi560zk6Piws9ZO1di/q5EHtK2nqPKyIU3KNyky
	gcAvsnem5ChI/xgpS7mNk3PTAJMqQIkPgUwY5iLCKHvsChz7Ar9EY1oTBdYZ4thcD43U2oEMOWDL0
	3rihISaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFZsf-00000008G00-1QCe;
	Mon, 25 Nov 2024 14:16:01 +0000
Received: from marcansoft.com ([212.63.210.85] helo=mail.marcansoft.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFZrg-00000008Fkq-1tBL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Nov 2024 14:15:02 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: marcan@marcan.st)
	by mail.marcansoft.com (Postfix) with ESMTPSA id 21AA341DF4;
	Mon, 25 Nov 2024 14:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=marcan.st; s=default;
	t=1732544094; bh=u2XUWhrR6ss2d9FlTj8Plfh2W/SE71nSefpQ0lgJHkQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=cNdY7SNXxqheP/0KddCcPuwen1NKykhMWb6bNamgVZXyM3ezVRM0HUdEY6L69M4CG
	 /fJLMTvwVaUN//eLm2uXZJNQmIMbseOLk3Dk4P/EufLqPJdbZGnnniwrauJMV6Bb06
	 SwXy0JLKwwnMfNSm3NowFr1Ywo/6TFks+sJ2VUREv3HnLhHI1EjN2p9/ab0hzDoUfx
	 QghpKyWji6vfozrrnNHuM4gEZMSIFY4SAutMDXW3MB2W83onm+tslqNsgDLE1QCcyn
	 ScCODCDPzEVRt0FZLpOx1dnsJ2D0KTT7YNlr9k1D9IHIYj7+Mw+W1Bc7j1+AHbY+4Y
	 tWD9FLrZ82LBg==
Message-ID: <a9d1568e-6240-49a4-b6a0-dcc0d9229eb1@marcan.st>
Date: Mon, 25 Nov 2024 23:14:51 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] dt-bindgins: display: Add Apple pre-DCP display
 controller bindings
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Sasha Finkelstein <fnkl.kernel@gmail.com>
Cc: Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig
 <alyssa@rosenzweig.io>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241124-adpdrm-v1-0-3191d8e6e49a@gmail.com>
 <20241124-adpdrm-v1-1-3191d8e6e49a@gmail.com>
 <ksdp54qj55v7igvvcshl6y2cxpmqy7rlsh4xsixpptjn7s7wlu@76ejtq6ytvbp>
From: Hector Martin <marcan@marcan.st>
Content-Language: en-US
In-Reply-To: <ksdp54qj55v7igvvcshl6y2cxpmqy7rlsh4xsixpptjn7s7wlu@76ejtq6ytvbp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_061500_899613_88811635 
X-CRM114-Status: GOOD (  20.69  )
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

On 2024/11/25 16:45, Krzysztof Kozlowski wrote:
> On Sun, Nov 24, 2024 at 11:29:24PM +0100, Sasha Finkelstein wrote:
>> Add bindings for a secondary display controller present on certain
>> Apple laptops.
>>
>> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
>> ---
>>  .../bindings/display/apple,display-pipe.yaml       | 59 ++++++++++++++++++++++
>>  .../bindings/display/panel/apple,summit.yaml       | 24 +++++++++
>>  2 files changed, 83 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/display/apple,display-pipe.yaml b/Documentation/devicetree/bindings/display/apple,display-pipe.yaml
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..bd25ddc6e09dd636c0221c854e594113f6011866
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/apple,display-pipe.yaml
> 
> No, use fallback compatible as filename.
> 
>> @@ -0,0 +1,59 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/display/apple,display-pipe.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Apple pre-DCP display controller.
>> +
>> +maintainers:
>> +  - asahi@lists.linux.dev
>> +  - Sasha Finkelstein <fnkl.kernel@gmail.com>
>> +
>> +description: |
> 
> Drop |
> 
>> +  A secondary display controller used to drive the "touchbar" on certain
>> +  Apple laptops.
>> +
>> +properties:
>> +  compatible:
>> +    items:
>> +      - enum:
>> +        - "apple,t8112-display-pipe"
>> +        - "apple,t8103-display-pipe"
>> +      - const: "apple,h7-display-pipe"
> 
> 
> This wasn't tested... Drop all quotes. Do you see any file with quotes?
> Why doing things entirely different than everyone else?
> 
>> +
>> +  reg:
>> +    minItems: 3
> 
> Drop
> 
>> +    maxItems: 3
>> +
>> +  reg-names:
>> +    items:
>> +      - const: be
>> +      - const: fe
>> +      - const: mipi
>> +
>> +  power-domains: true
> 
> List the items instead or maxItems: 1.
> 
>> +
>> +  interrupts:
>> +    minItems: 2
> 
> Drop
> 
>> +    maxItems: 2
>> +
>> +  interrupt-names:
>> +    items:
>> +      - const: be
>> +      - const: fe
>> +
>> +  iommus: true
> 
> 
> maxItems: 1
> 
>> +
>> +  "#address-cells":
>> +    const: 1
>> +
>> +  "#size-cells":
>> +    const: 0
>> +
>> +additionalProperties: true
> 
> This cannot be true. Must be false.
> 
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - interrupts
> 
> This goes before additionalProperties.
> 
> Missing example: that's a strong NAK and prove that this could not be
> even tested.
> 
> Do you see any device schema without example? No. Do not develop things
> differently, Apple is not unique, special or exceptional.

Krzysztof, it is entirely possible to express this same feedback without
being condescending and rude. I'm pretty sure you can do better than this.

> 
> 
>> diff --git a/Documentation/devicetree/bindings/display/panel/apple,summit.yaml b/Documentation/devicetree/bindings/display/panel/apple,summit.yaml
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..dc281c1f52c1ed07cc2f7f804dcfd2f3b4239d89
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/panel/apple,summit.yaml
>> @@ -0,0 +1,24 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/display/panel/apple,summit.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Apple "Summit" display panel.
>> +
>> +maintainers:
>> +  - asahi@lists.linux.dev
>> +  - Sasha Finkelstein <fnkl.kernel@gmail.com>
>> +
>> +properties:
>> +  compatible:
>> +    const: apple,summit
> 
> No, too generic. Panels need much more properties, this is heavily
> incomplete. See other panel bindings.
> 
> Best regards,
> Krzysztof
> 
> 
> 

- Hector



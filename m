Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D34E1CCD183
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 07:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YuxOUXeYN4A2Ts3Y/21HEt+dbo/FhNxdRvhGxbbaR4A=; b=c0+XJPAzXhEnFwyb5Fws8Fw45A
	8xm15/x8wRtKnjNDgeAlDezVxThvlEmMzcVwT+yaHnxlp0pW/+XlZrSodvSY23wuB0E9M5wwIojp4
	XMwwo3eFIe9yAvNY7iXgzfTD7+7aRcDL3vlAQjxB4SkTISJSCeC9Uxdo4Vy529Z/M7nLUXBDCvi7L
	cdzD9Cf8w0udcL6x9/4Bhvv/JhXMgLPB6Q+EjgkVc30kg52A+deHGg9d50YoDSGoqs+Kx7Bk16Qmv
	v6YcXMhN5F9zguEI305BuwS0eLnfV7ExQAMIoOXrvEo/R2g+faMU95kDC7JZH6PK4SJd5xO9iDUbJ
	dbUuq9Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6l2e-00000005MsF-1dxp;
	Thu, 09 Oct 2025 07:26:24 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6l2c-00000005Ms5-2oQd;
	Thu, 09 Oct 2025 07:26:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C9163621E4;
	Thu,  9 Oct 2025 07:26:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F072C4CEE7;
	Thu,  9 Oct 2025 07:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759994781;
	bh=aUZwCKZriS2mx9oDnUC1YNntsIyiN+ubGEGIPBl8MwA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=En7eMwMeJGkepvaJ8q2srUeiz31pgUGFFzkOIzFoManANQwcx6mbKGZs+E2G7b58P
	 uZJjFFiIWFCKTpHTzKGIGNNsYl8lBBzUWfpLKaoZOTvSywrOLh9EMAF+2P1msiWk1j
	 f4qZavZzm/ghXKSO4E4w3GSDLjAhtXbjlpAQYV0xyZTFZwlDa1Zac09X2UkPkd9A3s
	 w/3kITa3qYybgFGNJ3JBpHGYHjTwF8Sx7RUD+L2f0+MepcjlTfSkRtI46gBSUR3//A
	 ht2Up9KKwspeIpZCwqN7VC0V9TpD4gEHaULy3BBKSSwOsJxFW3gyj4G+H+VUkpD/W9
	 9u2X+9Q3z94Og==
Message-ID: <9ee299c1-edf4-4738-8b5e-6a684f683fbd@kernel.org>
Date: Thu, 9 Oct 2025 16:26:08 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] dt-bindings: usb: dwc3: Add Google Tensor G5 DWC3
To: Roy Luo <royluo@google.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Joy Chakraborty <joychakr@google.com>, Naveen Kumar <mnkumar@google.com>,
 Badhri Jagan Sridharan <badhri@google.com>, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org
References: <20251008060000.3136021-1-royluo@google.com>
 <20251008060000.3136021-2-royluo@google.com>
 <8966b6a9-ff70-4833-a5c7-c6d6c13c6c8b@kernel.org>
 <CA+zupgwLu-y26X9eiENyC28i9ZxCkuhb0X8X9H6HBpqkqJ7O3w@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <CA+zupgwLu-y26X9eiENyC28i9ZxCkuhb0X8X9H6HBpqkqJ7O3w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

On 09/10/2025 14:12, Roy Luo wrote:
> On Wed, Oct 8, 2025 at 4:56 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>
>> On 08/10/2025 14:59, Roy Luo wrote:
>>> Document the device tree bindings for the DWC3 USB controller found in
>>> Google Tensor SoCs, starting with the G5 generation.
>>>
>>> The Tensor G5 silicon represents a complete architectural departure from
>>
>>
>> G5 does not have a model number like G1-G4?
> 
> There's no model number for G5, I'm sticking to the existing "gs" prefix
> as they're still in the same SoC family.  Please let me know if you have any
> concerns.
> 
>>
>>> previous generations (like gs101), including entirely new clock/reset
>>> schemes, top-level wrapper and register interface. Consequently,
>>> existing Samsung/Exynos DWC3 USB bindings and drivers are incompatible,
>>
>> Do not reference drivers. Explain the hardware.
> 
> Ack, all mentions of "driver" will be removed in the next patch.
> 
>>
>>> necessitating this new device tree binding.
>>>
>>> The USB controller on Tensor G5 is based on Synopsys DWC3 IP and features
>>> Dual-Role Device single port with hibernation support.
>>>
>>> Signed-off-by: Roy Luo <royluo@google.com>
>>> ---
>>>  .../bindings/usb/google,gs-dwc3.yaml          | 145 ++++++++++++++++++
>>>  1 file changed, 145 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/usb/google,gs-dwc3.yaml
>>>
>>> diff --git a/Documentation/devicetree/bindings/usb/google,gs-dwc3.yaml b/Documentation/devicetree/bindings/usb/google,gs-dwc3.yaml
>>> new file mode 100644
>>> index 000000000000..9eb0bf726e8d
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/usb/google,gs-dwc3.yaml
>>> @@ -0,0 +1,145 @@
>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>>> +# Copyright (c) 2025, Google LLC
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/usb/google,gs-dwc3.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Google Tensor Series (G5+) DWC3 USB SoC Controller
>>> +
>>> +maintainers:
>>> +  - Roy Luo <royluo@google.com>
>>> +
>>> +description: |
>>
>>
>> Do not need '|' unless you need to preserve formatting.
> 
> Ack, will fix this in the next patch.
> 
>>
>>> +  Describes the DWC3 USB controller block implemented on Google Tensor SoCs,
>>> +  starting with the G5 generation. Based on Synopsys DWC3 IP, the controller
>>> +  features Dual-Role Device single port with hibernation add-on.
>>> +
>>> +properties:
>>> +  compatible:
>>> +    items:
>>> +      - enum:
>>> +          - google,gs5-dwc3
>>> +
>>> +  reg:
>>> +    minItems: 3
>>
>> Drop
>>
>>> +    maxItems: 3
>>> +
>>> +  reg-names:
>>> +    description: |
>>> +      The following memory regions must present:
>>> +        - dwc3_core: Core DWC3 IP registers.
>>> +        - host_cfg_csr: Hibernation control registers.
>>> +        - usbint_csr: Hibernation interrupt registers.
>>
>> Drop description or move it to items in reg. See other bindings.
> 
> Ack, will use an item list in reg instead.
> 
>>
>>> +    items:
>>> +      - const: dwc3_core
>>> +      - const: host_cfg_csr
>>> +      - const: usbint_csr
>>> +
>>> +  interrupts:
>>> +    minItems: 3
>>
>> Drop
> 
> Ack, will use an item list instead.
> 
>>
>>> +    maxItems: 3
>>> +
>>> +  interrupt-names:
>>> +    description: |
>>> +      The following interrupts must present:
>>> +        - dwc_usb3: Core DWC3 interrupt.
>>> +        - hs_pme_irq: High speed remote wakeup interrupt for hibernation.
>>> +        - ss_pme_irq: Super speed remote wakeup interrupt for hibernation.
>>
>> From where did you get this style? Don't write bindings with chat gpt or
>> whatever other tool. it is a waste of our time.
> 
> I referenced the style from a recent dt binding change [1] that adds
> "Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml".
> I thought it would be a good reference because it's relatively new
> and is also a binding for SNPS dwc3 glue logic. Perhaps that style
> doesn't apply here because qcom,snps-dwc3.yaml supports
> multiple compatible and here we have only one?
> 
> Just to clarify, I'm a Gemini user and this patch is 100% organic,
> hand-crafted by a living human brain :)
> 
> [1] https://lore.kernel.org/all/20250414-dwc3-refactor-v7-2-f015b358722d@oss.qualcomm.com/

Your code is not at all like above, you do not have any variants here,
so you cannot use that syntax - is not correct here.

Best regards,
Krzysztof


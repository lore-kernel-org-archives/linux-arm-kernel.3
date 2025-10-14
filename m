Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EC59CCD18E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 08:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hlWzDfZQBmTwEpZ5vSSpisMnt2EPPyBsNFrhmtAfOt4=; b=GrTfZgxSyCKtqR8tu0nqWz4bs7
	/L7sJDJOV7Nx2/aZJ/qaO83ppy22cvwO6LsqOi0sgM4GmUz/xs9dR1ndQlGAy6TVgZs5IVXYKXxo6
	G20FUXXtv6GlUWL71hKYLFCTotoGPZ3crF/hZ2qu+xRsYkyPEPP9WVmzOyWu1WCLjy3amiFkxv+rR
	s6h9rlGgTKdqzaEO+RTrGo0QL01tLM9nsCIhJVdxV8IDGxCrBel2ClVlQfW8r91xrlk/DZFNMSLPA
	2PaLvEo17uUL9vibJ7jPRWHA8xjuzYNP7fqSHDXvTRP2iQ+mnqgS5a3nSTLkV28Yzi6gof0Y9k0/N
	vckGldig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8aIz-0000000Fb8U-1xG7;
	Tue, 14 Oct 2025 08:22:49 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8aIy-0000000Fb7y-21du;
	Tue, 14 Oct 2025 08:22:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B9A64621EF;
	Tue, 14 Oct 2025 08:22:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DC85C4CEE7;
	Tue, 14 Oct 2025 08:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760430137;
	bh=Vlj6tP3JBHPNk8PgyCr78TrY0haPC3Xs1lzW10Q8cLQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lZh/f3/Fc7dCqb6CDiY5tbcF9lWWIzM7REjTEic65K1WxpJhP9paD7iOWZjj/Y+Wl
	 MCwhrgVrUc2HiR6nIBY2UXCxb516F1/kDTinX8shqb2b+g5M4vLRBCdRSl4DcAMq2D
	 nv+FOWHFuTQ9tv3hmz509d6OyfqKZWSPJnWQWj7GHIamJEaCB/IEhdg2RUA8aNrrBi
	 Ys+gVyn7W4USl4yzyKCR0gqCgiCDDZpRwP4v//qwyN4LOSSi2nIoFwj4nKBWBtP5Gp
	 Lr0ploa3eB3xB+jXVL2E5QMpBE65dRCaLJ6CLKEffRcdnsBSSHGfpFt3trToDEUu6/
	 8PgGVHCVqCkCw==
Message-ID: <b7b3de64-c656-4a84-8ba4-2d5c7eda9783@kernel.org>
Date: Tue, 14 Oct 2025 10:22:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] dt-bindings: usb: dwc3: Add Google Tensor G5 DWC3
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
References: <20251010201607.1190967-1-royluo@google.com>
 <20251010201607.1190967-2-royluo@google.com>
 <066a9598-ad30-4327-be68-87299bba6fda@kernel.org>
 <CA+zupgwc7b51pNRLWRy2CX=n4=FTm=AP7J0dRP2RLjyK5LxGtw@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <CA+zupgwc7b51pNRLWRy2CX=n4=FTm=AP7J0dRP2RLjyK5LxGtw@mail.gmail.com>
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

On 14/10/2025 03:40, Roy Luo wrote:
> On Fri, Oct 10, 2025 at 5:09 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>
>> On 10/10/2025 22:16, Roy Luo wrote:
>>> Document the device tree bindings for the DWC3 USB controller found in
>>> Google Tensor SoCs, starting with the G5 generation.
>>>
>>> The Tensor G5 silicon represents a complete architectural departure from
>>> previous generations (like gs101), including entirely new clock/reset
>>> schemes, top-level wrapper and register interface. Consequently,
>>> existing Samsung/Exynos DWC3 USB bindings are incompatible, necessitating
>>> this new device tree binding.
>>>
>>> The USB controller on Tensor G5 is based on Synopsys DWC3 IP and features
>>> Dual-Role Device single port with hibernation support.
>>
>> You still mix, completely unnecessarily, subsystems. For Greg this is
>> actually even undesired, but regardless don't do this for any cases
>> because it just makes everything slower or more difficult to apply.
>>
>> Really, think how maintainers should deal with your patches.
>>
> 
> Understood, I will separate the patches into two distinct series: one for
> the controller and one for the PHY.
> Appreciate the feedback and the explanation.
> 
>>>
>>> Signed-off-by: Roy Luo <royluo@google.com>
>>> ---
>>>  .../bindings/usb/google,gs5-dwc3.yaml         | 141 ++++++++++++++++++
>>>  1 file changed, 141 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/usb/google,gs5-dwc3.yaml
>>>
>>> diff --git a/Documentation/devicetree/bindings/usb/google,gs5-dwc3.yaml b/Documentation/devicetree/bindings/usb/google,gs5-dwc3.yaml
>>> new file mode 100644
>>> index 000000000000..6fadea7f41e8
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/usb/google,gs5-dwc3.yaml
>>> @@ -0,0 +1,141 @@
>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>>> +# Copyright (c) 2025, Google LLC
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/usb/google,gs5-dwc3.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Google Tensor Series (G5+) DWC3 USB SoC Controller
>>> +
>>> +maintainers:
>>> +  - Roy Luo <royluo@google.com>
>>> +
>>> +description:
>>> +  Describes the DWC3 USB controller block implemented on Google Tensor SoCs,
>>> +  starting with the G5 generation. Based on Synopsys DWC3 IP, the controller
>>> +  features Dual-Role Device single port with hibernation add-on.
>>> +
>>> +properties:
>>> +  compatible:
>>> +    const: google,gs5-dwc3
>>> +
>>> +  reg:
>>> +    items:
>>> +      - description: Core DWC3 IP registers.
>>> +      - description: USB host controller configuration registers.
>>> +      - description: USB custom interrrupts control registers.
>>> +
>>> +  reg-names:
>>> +    items:
>>> +      - const: dwc3_core
>>> +      - const: host_cfg
>>> +      - const: usbint_cfg
>>> +
>>> +  interrupts:
>>> +    items:
>>> +      - description: Core DWC3 interrupt.
>>> +      - description: High speed power management event for remote wakeup from hibernation.
>>> +      - description: Super speed power management event for remote wakeup from hibernation.
>>
>> Wrap at 80 (see coding style) or just shorten these.
> 
> Ack, will fix it in the next patch.
> 
>>
>>> +
>>> +  interrupt-names:
>>> +    items:
>>> +      - const: dwc_usb3
>>
>> So just "core"?
> 
> I'd prefer to stick to "dwc_usb3" as that's
> 1. more expressive by referring to the underlying IP name,


But that's completely redundant name.

> 2. consistent with established dwc3 bindings such as
>     Documentation/devicetree/bindings/usb/snps,dwc3.yaml,

If you use only one interrupt. You don't use one interrupt here.

>     Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml,
> unless you have a strong preference for the alternative naming.

Such namings are discouraged, because they tell absolutely nothing.
Also, schematics or datasheets usually do not use them, either.


Best regards,
Krzysztof


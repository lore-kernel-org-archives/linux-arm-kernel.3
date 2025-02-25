Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 696FBC021BC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 08:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VB8AIGyA0YIVy7WjS8g6i8Fe1/7Ue1c6pb/z3w/xUAs=; b=jg6ho0y2txQJEUMgln8f2pbFfR
	+LjtuUNE8/ySRwu7uT/eN2UdaQ1DaBSqPHBlwbG/OHAXGlyVLfKlkwPq4GnfKfhCUf6YFdy5XCWzp
	3AxqfL6UaoUUTCWFPGZECSdG9QgWwkTG1QAq3oohyPqSRLetVphiZBEX+jeBLfahWYAUa+KAhPWK5
	of5reKX9TFZ8QbdtwUFb0gHw1cpqpgUsLQ9ge1NsmybtOuVuowU2NJmzeV55jjq6YzCC7mC/SMii4
	GMuM9nCEJg7yH92Z0haHGzsB8h6hNRzc68pj3Cxpr04Zr3NX4cTZWlrwr7FJBp/plC/Uw+VyF5e4Z
	8ioXFauA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmq5K-0000000GL3F-28R5;
	Tue, 25 Feb 2025 08:14:34 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmq2I-0000000GKiM-0X5d;
	Tue, 25 Feb 2025 08:11:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 13B1D5C6285;
	Tue, 25 Feb 2025 08:10:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9453C4CEDD;
	Tue, 25 Feb 2025 08:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740471084;
	bh=aLquZf07TT12h1ddFK/vUtibJHM+LwbHdlfjiJfmXKo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=EvGsygq9wqCVlTBUSN6xE6f4CrZsYmf7CLTK5P2BU4TjqRECnR6QMxOakWWb+fdGS
	 s0HKJWy99e21ibkWrl9I7glsYYtdr8KCeHxcdtQ6JND8f4XSJbO+/9CkJNWSTlKM6z
	 NgFr9kV/QoiQfY35WX6eH+IW9rYKCoHqF5cSb8PksFNW+FO732KedeJvK+iYQcg/rk
	 dm5YiNM3Qqnd4iOh/Hm09TMSD/dKscNbezJdSIWU8CCwG/HiqpBXasw3hXkkJWITby
	 3yRL11Mi3wqPycMQKUnPkdD5uN9w0SQb45LnIuosLClFP/GK+IwgbTdqcgV6QqpTKs
	 NTatOsoQOIcBA==
Message-ID: <c8184542-5dab-4403-bee4-867810397ae4@kernel.org>
Date: Tue, 25 Feb 2025 09:11:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/8] dt-bindings: phy: add
 samsung,exynos2200-usbcon-phy schema file
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Abel Vesa <abel.vesa@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250223122227.725233-1-ivo.ivanov.ivanov1@gmail.com>
 <20250223122227.725233-4-ivo.ivanov.ivanov1@gmail.com>
 <20250224-curly-cyber-spaniel-efdc39@krzk-bin>
 <a4f63721-d094-4eda-b68a-6ef62ff54680@gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <a4f63721-d094-4eda-b68a-6ef62ff54680@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_001126_262025_8DC0456B 
X-CRM114-Status: GOOD (  24.21  )
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

On 24/02/2025 11:48, Ivaylo Ivanov wrote:
> On 2/24/25 10:56, Krzysztof Kozlowski wrote:
>> On Sun, Feb 23, 2025 at 02:22:22PM +0200, Ivaylo Ivanov wrote:
>>> The Exynos2200 SoC has a USB controller PHY, which acts as an
>>> intermediary between a USB controller (typically DWC3) and other PHYs
>>> (UTMI, PIPE3). Add a dt-binding schema for it.
>>>
>>> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
>>> ---
>>>  .../phy/samsung,exynos2200-usbcon-phy.yaml    | 76 +++++++++++++++++++
>>>  1 file changed, 76 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/phy/samsung,exynos2200-usbcon-phy.yaml
>> You have undocumented dependencies which prevent merging this file.
>> First, dependencies have to be clearly expressed.
> 
> They are, in the cover letter.

Where? I read it twice. Dependencies is the most important thing and
should scream at beginning of the cover letter, so if you bury them
somewhere deep it also would not matter - just like they were missing.

> 
>> Second, you should
>> rather decouple the code from header dependencies, otherwise this cannot
>> be merged for current release (just use clocks with long names, without IDs).
> 
> Sure


> 
>>
>>> diff --git a/Documentation/devicetree/bindings/phy/samsung,exynos2200-usbcon-phy.yaml b/Documentation/devicetree/bindings/phy/samsung,exynos2200-usbcon-phy.yaml
>>> new file mode 100644
>>> index 000000000..7d879ec8b
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/phy/samsung,exynos2200-usbcon-phy.yaml
>>> @@ -0,0 +1,76 @@
>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/phy/samsung,exynos2200-usbcon-phy.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Exynos2200 USB controller PHY
>>> +
>>> +maintainers:
>>> +  - Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
>>> +
>>> +description:
>>> +  Exynos2200 USB controller PHY is an intermediary between a USB controller
>>> +  (typically DWC3) and other PHYs (UTMI, PIPE3).
>> Isn't this the same as usbdrd phy? see: samsung,usb3-drd-phy.yaml
> 
> It's not (I think). There's a few reasons I've decided to make this separate
> from the usb3-drd-phy bindings and exynos5-usbdrd driver:
> 
> 1. This PHY does not provide UTMI and PIPE3 on its own. There's no tuning

USBDRD phy does not provide UTMI and PIPE on its own either if you look
at diagram - they call it phy controller.

> for them, and all that is needed from it is to disable HWACG, assert/
> deassert reset and force bvalid/vbusvalid. After that SNPS eUSB2
> initialization can be done and USB2 works. If the USBCON phy is not set
> up before the eUSB2 one, the device hangs, so there is definitely a
> dependancy between them. For PIPE3 we'd need to control the pipe3
> attaching/deattaching and then initialize the synopsys USBDP combophy.

Does it mean there is no USB DRD phy controller as before?

Anyway the problem is you have DWC3 -> PHY -> PHY. Looks one phy too many.


> 
> 2. With the way it's modelled, we need to parse phandles from eUSB2 and
> USBDP to the controller. Adding that to the usbdrd driver would be...
> weird. It makes more sense to model it as a separate driver, because
> it functions in a different way.

Just to be clear: we don't talk about drivers here.


Best regards,
Krzysztof


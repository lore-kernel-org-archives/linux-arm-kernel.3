Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C70DC79F89
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 06:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:In-Reply-To:From:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Apw2iUirqek8VKGufyLgdLjs5Rfxgc8/vl6/NyrKW8k=; b=fJenbqCsNKt7e7WQ6N5/qSq1ll
	HFl8EOza04fml/zceH9bhkL3xT6Azlj2rWb99zei2uGe3bf+XSkNy6JAEwm9wddHGXK8n2tjXo/W1
	kO1cN24JvPnG3K6CZ9pRS3Nsv4Mt0vZ6AIC9fsV8SmBCo2LNBf0VLOpebfoy+Fcha/04hBhsDLev6
	ccwUiEYXV+3lF2pEK6jkZUNlOs0ZAnxGHJcWfPIp4sJ4NaWlI4b8HWNK0F/KX/tKYqhy8uyo300r0
	hrE93xz+VqTlSn1SRHe0Oh/uRGulg6KMLJGxW9W25JY9HtlQ4y5lVq/TDYgpN6hF7KBofTgS06Sa8
	zELE4OXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3STU-00000005zK0-01gT;
	Mon, 07 Sep 2026 06:05:00 +0000
Received: from mailout2.samsung.com ([203.254.224.25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3STO-00000005zHu-2u5M
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 06:04:58 +0000
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20260907060445epoutp02700acff3a588a10c21031fccdcd9b0e2~S9LrXJiXm2150521505epoutp02a
	for <linux-arm-kernel@lists.infradead.org>; Mon,  7 Sep 2026 06:04:45 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20260907060445epoutp02700acff3a588a10c21031fccdcd9b0e2~S9LrXJiXm2150521505epoutp02a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1788761085;
	bh=Apw2iUirqek8VKGufyLgdLjs5Rfxgc8/vl6/NyrKW8k=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=slcRk5m+WGQ1SjbuuoGM/zupLNokbYmmpTiZPQm2hBMLwBwpJquqgA75gVj2kx5ZW
	 qItUWlQ3NBdlpuha6fRDXLcS8npdspRdWWEJffIYY3vEAEKgK5GEG+PxQb/o/JTUWz
	 7M6tfDOsVP0F/W1L01kCkHwkO/ot09Pv1oqCFH28=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20260907060444epcas5p28eb4578f521d4d2b9e0694c18df3def2~S9LqPUohf2359923599epcas5p2F;
	Mon,  7 Sep 2026 06:04:44 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.95]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4hdc3b0q6yz6B9m7; Mon,  7 Sep
	2026 06:04:43 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20260907060442epcas5p309df4da89d1a3040ddcec14195fc2b3b~S9Lo4EmvD1977119771epcas5p3s;
	Mon,  7 Sep 2026 06:04:42 +0000 (GMT)
Received: from [107.122.5.126] (unknown [107.122.5.126]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260907060440epsmtip21f4fd38dcbbe0387455b812404e9bd80~S9LmbZNx51077310773epsmtip2O;
	Mon,  7 Sep 2026 06:04:39 +0000 (GMT)
Message-ID: <e4bafeea-4548-41ef-b5e2-98ade2864e74@samsung.com>
Date: Mon, 7 Sep 2026 11:34:38 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] dt-bindings: usb: Introduce samsung,snps-dwc3
To: Krzysztof Kozlowski <krzk@kernel.org>, peter.griffin@linaro.org,
	alim.akhtar@samsung.com, gregkh@linuxfoundation.org, robh@kernel.org,
	conor+dt@kernel.org, Thinh.Nguyen@synopsys.com,
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: jh0801.jung@samsung.com, dh10.jung@samsung.com, akash.m5@samsung.com,
	hongpooh.kim@samsung.com, eomji.oh@samsung.com, shijie.cai@samsung.com,
	muhammed.ali@samsung.com, thiagu.r@samsung.com
Content-Language: en-US
From: Selvarasu Ganesan <selvarasu.g@samsung.com>
In-Reply-To: <ad1d8c01-a810-443a-9ad5-721d6d0b68b1@kernel.org>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260907060442epcas5p309df4da89d1a3040ddcec14195fc2b3b
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260903071318epcas5p4b804edb84554847c576d1d034b814d7a
References: <20260903071250.3421499-1-selvarasu.g@samsung.com>
	<CGME20260903071318epcas5p4b804edb84554847c576d1d034b814d7a@epcas5p4.samsung.com>
	<20260903071250.3421499-3-selvarasu.g@samsung.com>
	<ad1d8c01-a810-443a-9ad5-721d6d0b68b1@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260906_230455_356700_133BBF2A 
X-CRM114-Status: GOOD (  28.78  )
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


On 9/5/2026 12:52 PM, Krzysztof Kozlowski wrote:
> On 03/09/2026 09:12, Selvarasu Ganesan wrote:
>> The Samsung Exynos8855 USB glue is not separate from the Synopsys DWC3
>> core, using a flattened model where the DWC3 controller is directly
>> addressable rather than nested as a child node of a glue layer.
>>
>> Describe the Exynos USB block as a single node, referencing the split
>> out Synopsys DWC3 core properties via snps,dwc3-common.yaml. The new
>> binding follows the same approach as qcom,snps-dwc3.
>>
>> A generic fallback compatible "samsung,snps-dwc3" is introduced to
>> describe this binding, selected by the validator based on the presence
>> of the fallback string in the compatible list. Future Exynos SoCs
> This is AI slop text. Over longish useless sentence describing diff
> without actual information WHY.
>
> Don't send AI generated slop messages.

Sorry for the misleading info on this commit message. We were trying to 
explain why a separate flattened representation is being introduced with 
using generic fallback string, and follow the style of some other DWC3 
flattened refactors (like the Qualcomm : 
https://lore.kernel.org/all/20250414-dwc3-refactor-v7-2-f015b358722d@oss.qualcomm.com) 
to justify the separate binding, but it became too long. We'll simplify 
it and keep only the technical reasoning.


>
>> utilizing the same flattened model can be added by extending the
>> compatible enum with per SoC clock and property constraints.
>>
>> Co-developed-by: Muhammed Ali <muhammed.ali@samsung.com>
>> Signed-off-by: Muhammed Ali <muhammed.ali@samsung.com>
>> Signed-off-by: Selvarasu Ganesan <selvarasu.g@samsung.com>
>> ---
>>
>> Krzysztof Kozlowski is added as a maintainer of this YAML binding, as
>> he is the ARM/Samsung SoC architecture maintainer (ARM/SAMSUNG S3C,
>> S5P AND EXYNOS ARM ARCHITECTURES) who already maintains Samsung Exynos
>> DT bindings (e.g. samsung,exynos-dwc3.yaml) and reviews all
>> Samsung related binding changes. This follows the same convention used
>> by existing Samsung Exynos DT binding schemas.
>> ---
>>   .../bindings/usb/samsung,snps-dwc3.yaml       | 98 +++++++++++++++++++
>>   1 file changed, 98 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/usb/samsung,snps-dwc3.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/usb/samsung,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/samsung,snps-dwc3.yaml
>> new file mode 100644
>> index 000000000000..480308c16f37
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/usb/samsung,snps-dwc3.yaml
>> @@ -0,0 +1,98 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: https://protect2.fireeye.com/v1/url?k=1a7dfa9a-7bf6efdd-1a7c71d5-000babff99aa-643f51fc0561c489&q=1&e=c6c89336-1f3a-4d30-a005-615c2b8d9c6f&u=http%3A%2F%2Fdevicetree.org%2Fschemas%2Fusb%2Fsamsung%2Csnps-dwc3.yaml%23
>> +$schema: https://protect2.fireeye.com/v1/url?k=515f3c48-30d4290f-515eb707-000babff99aa-9a67f9f3980bd8f3&q=1&e=c6c89336-1f3a-4d30-a005-615c2b8d9c6f&u=http%3A%2F%2Fdevicetree.org%2Fmeta-schemas%2Fcore.yaml%23
>> +
>> +title: Samsung Exynos SoC DWC3 USB Controller
>> +
>> +maintainers:
>> +  - Krzysztof Kozlowski <krzk@kernel.org>
>> +  - Selvarasu Ganesan <selvarasu.g@samsung.com>
>> +
>> +description:
>> +  Describes the DWC3 USB controller block implemented on Samsung Exynos SoCs.
> Huh? Did you even look at existing bindings?


Yes, We checked samsung,exynos-dwc3.yaml. Exynos8855 could use it, but 
that binding uses a parent and child representation. This patch 
introduces a flattened model where the USB vendor block and SNPS dwc3 
block are in a single node. The goal is to use this for Exynos8855 and 
eventually migrate the other samsung USB implementations from the old 
parent and child model to this one. We'll make this clearer and shorter 
in the commit message.

>
>> +
>> +select:
>> +  properties:
>> +    compatible:
>> +      contains:
>> +        const: samsung,snps-dwc3
>> +  required:
>> +    - compatible
>> +
>> +properties:
>> +  compatible:
>> +    items:
>> +      - enum:
>> +          - samsung,exynos8855-dwc3
>> +      - const: samsung,snps-dwc3
> There is no snps device from Samsung, neither DWC3. The name of device
> is completely wrong. snps is a vendor, not a device.
>
> Anyway, don't use generic fallbacks.
Understood. The fallback was intended to cover upcoming SoCs (8865, 
9955, 9965) and the migration of older SoCs without adding a unique 
string for every project, similar to the qcom,snps-dwc3 approach.

We agree that the naming was incorrect since  "snps" is the vendor. We 
can switch to per SoC compatible strings, but would a corrected fallback 
name like samsung,exynos-dwc3-common or samsung,exynos-snps-dwc3 be 
acceptable instead?
>
>
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  power-domains:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    description: |
>> +      Several clocks are used, depending on the variant. Typical ones are:
>> +       - ref: Reference clock for SOF/ITP generation.
>> +       - bus: Bus (APB) clock for register access.
>> +    minItems: 1
>> +    maxItems: 4
>> +
>> +  clock-names:
>> +    minItems: 1
>> +    maxItems: 4
> You have only one device, why is this flexible?


Exynos8855 only needs two clocks, but maxItems: 4 was added to support 
other samsung USB implementations that use up to four. Since we plan to 
migrate those to the flattened representation later, we wanted the 
binding to cover those requirements as well. Example required 4 clocks 
for gs101-dwusb3 (ref: 
Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml)


>
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - clocks
>> +  - clock-names
>> +  - interrupts
>> +
>> +allOf:
>> +  - $ref: snps,dwc3-common.yaml#
>> +
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: samsung,exynos8855-dwc3
>> +    then:
>> +      properties:
>> +        clocks:
>> +          minItems: 2
>> +          maxItems: 2
>> +        clock-names:
>> +          items:
>> +            - const: ref
>> +            - const: bus
> Why do you need all this? Look at existing code, don't duplicate. And
> for sure do not introduce one more DWC3 binding claiming to be for
> Samsung devices and completely ignoring existing ones.


We understand the concern about adding another binding. The goal is to 
migrate all samsung USB implementations to this flattened model, and 
then deprecate samsung,exynos-dwc3.yaml to avoid duplication.


Thanks,
Selva

>
> Best regards,
> Krzysztof


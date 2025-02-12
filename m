Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 025F4C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 23:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bF6ePzz3cN2y4GYtn1pyoRmQYzjv5ZNDww08RM/kA5w=; b=kq6djaZk02J+0+7h0HxsP9Kdzm
	IptqLAwRHqrbZ6+LoaKkc0uX3Kehy2zCCi9rNeWrOZrZWh6EbaNlMfumBHz3H2ZmLEcr+5YIlJW+j
	ZyqC4ZfbdFJv9W8QAnikS2Dx4a9vwU8rcuMQYf1EiL9K5MmSDtbiAs2neCCEByOkjpqm7gkYGcDn3
	SQzpA3bC5GStkTMVKG2RmLo2cYIJFOPT0CYTTP6yFSSPam3iwxpadvxYTpyc7EdURp1RSHtW3eb7Q
	rkzyIoO/dIvf4/aI1wYGIITmJT1bRTK95pFqZKbNEMUlS3j1E1YGhOXBHoDnM76HZOfMhnnJRdKE6
	JIyzlCMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiMd4-00000009ERy-0Qsx;
	Wed, 12 Feb 2025 23:58:54 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiMbc-00000009EH7-3sYz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 23:57:26 +0000
Received: from [10.137.184.60] (unknown [131.107.160.188])
	by linux.microsoft.com (Postfix) with ESMTPSA id A3E52203F3C9;
	Wed, 12 Feb 2025 15:57:23 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com A3E52203F3C9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1739404643;
	bh=bF6ePzz3cN2y4GYtn1pyoRmQYzjv5ZNDww08RM/kA5w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SXLJJ4OFPJZkogD0StqTyUAgwfIJIPnY8/4TngSfN1c5mhPDJIm7aVYDdimj/oAnX
	 Yd7w/OE1MVKPuIswlc5gyslqUL+d311wjoJ4MwCIU3B0b3BIqYgPZwXNs7GC9thVN3
	 s91qYLYjt5mzVMS08XeoNubtxgKPcmd+OIFopIII=
Message-ID: <bb863c8f-a92c-42d0-abc4-ff0b92f701c2@linux.microsoft.com>
Date: Wed, 12 Feb 2025 15:57:23 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH hyperv-next v4 4/6] dt-bindings: microsoft,vmbus: Add GIC
 and DMA coherence to the example
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: arnd@arndb.de, bhelgaas@google.com, bp@alien8.de,
 catalin.marinas@arm.com, conor+dt@kernel.org, dave.hansen@linux.intel.com,
 decui@microsoft.com, haiyangz@microsoft.com, hpa@zytor.com,
 krzk+dt@kernel.org, kw@linux.com, kys@microsoft.com, lpieralisi@kernel.org,
 manivannan.sadhasivam@linaro.org, mingo@redhat.com, robh@kernel.org,
 ssengar@linux.microsoft.com, tglx@linutronix.de, wei.liu@kernel.org,
 will@kernel.org, devicetree@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-hyperv@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, x86@kernel.org,
 benhill@microsoft.com, bperkins@microsoft.com, sunilmut@microsoft.com
References: <20250212014321.1108840-1-romank@linux.microsoft.com>
 <20250212014321.1108840-5-romank@linux.microsoft.com>
 <20250212-rough-terrier-of-serendipity-68a0db@krzk-bin>
Content-Language: en-US
From: Roman Kisel <romank@linux.microsoft.com>
In-Reply-To: <20250212-rough-terrier-of-serendipity-68a0db@krzk-bin>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_155725_023206_CC29F4B4 
X-CRM114-Status: GOOD (  27.32  )
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



On 2/11/2025 10:42 PM, Krzysztof Kozlowski wrote:
> On Tue, Feb 11, 2025 at 05:43:19PM -0800, Roman Kisel wrote:
>> The existing example lacks the GIC interrupt controller property
>> making it not possible to boot on ARM64, and it lacks the DMA
> 
> GIC controller is not relevant to this binding.
> 

Will remove, thank you for pointing that out!

>> coherence property making the kernel do more work on maintaining
>> CPU caches on ARM64 although the VMBus trancations are cache-coherent.
>>
>> Add the GIC node, specify DMA coherence, and define interrupt-parent
>> and interrupts properties in the example to provide a complete reference
>> for platforms utilizing GIC-based interrupts, and add the DMA coherence
>> property to not do extra work on the architectures where DMA defaults to
>> non cache-coherent.
>>
>> Signed-off-by: Roman Kisel <romank@linux.microsoft.com>
>> ---
>>   .../devicetree/bindings/bus/microsoft,vmbus.yaml      | 11 +++++++++++
>>   1 file changed, 11 insertions(+)
> 
> Last time I said: not tested by automation.
> Now: I see automation build failures, although I do not see anything
> incorrect in the code, so that's a bit surprising. Please confirm that
> binding was tested on latest dtschema.

They weren't for which I am sorry. Read through

https://www.kernel.org/doc/html/v6.14-rc2/devicetree/bindings/writing-schema.html

and was able to see and fix the break by bringing the YAML to [1].
Getting now this

/Documentation/devicetree/bindings/bus/microsoft,vmbus.example.dtb: 
vmbus@ff0000000: 'dma-coherent', 'interrupts' do not match any of the 
regexes: 'pinctrl-[0-9]+'
         from schema $id: 
http://devicetree.org/schemas/bus/microsoft,vmbus.yaml#

so maybe I need to add some more to the "requires" section. Will follow
other examples as you suggested.

> 
>>
>> diff --git a/Documentation/devicetree/bindings/bus/microsoft,vmbus.yaml b/Documentation/devicetree/bindings/bus/microsoft,vmbus.yaml
>> index a8d40c766dcd..5ec69226ab85 100644
>> --- a/Documentation/devicetree/bindings/bus/microsoft,vmbus.yaml
>> +++ b/Documentation/devicetree/bindings/bus/microsoft,vmbus.yaml
>> @@ -44,11 +44,22 @@ examples:
>>               #size-cells = <1>;
>>               ranges;
>>   
>> +            gic: intc@fe200000 {
>> +              compatible = "arm,gic-v3";
>> +              reg = <0x0 0xfe200000 0x0 0x10000>,   /* GIC Dist */
>> +                    <0x0 0xfe280000 0x0 0x200000>;  /* GICR */
>> +              interrupt-controller;
>> +              #interrupt-cells = <3>;
>> +            }
> 
> I fail to see how this is relevant here. This is example only of vmbus.
> Look how other bindings are done. Drop the example.

The bus refers to the interrupt controller, and I didn't have it, so
added it :) Now I in other examples that is not required, and the
tooling generates fake intc's. Appreciate your advice very much!

> 
> 
>> +
>>               vmbus@ff0000000 {
>>                   compatible = "microsoft,vmbus";
>>                   #address-cells = <2>;
>>                   #size-cells = <1>;
>>                   ranges = <0x0f 0xf0000000 0x0f 0xf0000000 0x10000000>;
>> +                dma-coherent;
>> +                interrupt-parent = <&gic>;
>> +                interrupts = <1 2 1>;
> 
> Use proper defines for known constants.

Will do as in [1], thank you!

> 

[1]

--- a/Documentation/devicetree/bindings/bus/microsoft,vmbus.yaml
+++ b/Documentation/devicetree/bindings/bus/microsoft,vmbus.yaml
@@ -28,6 +28,7 @@ properties:
  required:
    - compatible
    - ranges
+  - interrupts
    - '#address-cells'
    - '#size-cells'

@@ -35,6 +36,8 @@ additionalProperties: false

  examples:
    - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
      soc {
          #address-cells = <2>;
          #size-cells = <1>;
@@ -44,14 +47,6 @@ examples:
              #size-cells = <1>;
              ranges;

-            gic: intc@fe200000 {
-              compatible = "arm,gic-v3";
-              reg = <0x0 0xfe200000 0x0 0x10000>,   /* GIC Dist */
-                    <0x0 0xfe280000 0x0 0x200000>;  /* GICR */
-              interrupt-controller;
-              #interrupt-cells = <3>;
-            }
-
              vmbus@ff0000000 {
                  compatible = "microsoft,vmbus";
                  #address-cells = <2>;
@@ -59,7 +54,7 @@ examples:
                  ranges = <0x0f 0xf0000000 0x0f 0xf0000000 0x10000000>;
                  dma-coherent;
                  interrupt-parent = <&gic>;
-                interrupts = <1 2 1>;
+                interrupts = <GIC_PPI 2 IRQ_TYPE_EDGE_RISING>;
              };
          };
      };

> Best regards,
> Krzysztof

-- 
Thank you,
Roman



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62449C0218A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jan 2025 12:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mIm4WqPp/dkTscFEnkHrVW1e2DmoJBczeyzHhlv8SX0=; b=ALoMGc+YIiorke2a+d6S/lXM8V
	eMuyaN3uOC2jU4m4EmrXT2/SZiS+jSk4zPzwawrt1/Ag4jdnEG/BijJMHrMTduey6P/Symp7mL63M
	/JK7IxRizm9xXpCudahEozhEgm12tzt8I50IcpJvxON7GgUYNTWm8ZYoF+D7izh1ZU3KqCXO4urWX
	9OsxgyuU4H03aIRiQwaKqN8t8hGvRCidYMZiZx4faWeutCqLU1FcaS4v9GHG+JbUwgQylfSVW/EDj
	ffDNNH2oYw+bvY5nAvO+Q9qpzfZZksf9rAc/n2pBYFJYi6uMY/h7s53cccnpMjEW4k3rTApSob2L5
	pSglJnxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdTQj-00000008ksG-2gq0;
	Thu, 30 Jan 2025 12:13:57 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdTPQ-00000008koe-1UhR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jan 2025 12:12:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id AC131A41E49;
	Thu, 30 Jan 2025 12:10:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3835CC4CED3;
	Thu, 30 Jan 2025 12:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738239155;
	bh=Hi6/OCGoOquSDrzW77IQQxL0ssxA8h7c2jy3kT2D8oI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PQ8BYJkp+8SCQEsLzT/ygA0Naqkd5pjBYpsvxAyWTPVSRc0gPaQx5zbSCiTedfSBq
	 sWGRVzgb92E3MJZyBK62IS/+GeeLc3BQB9SMjRfc/nc7S0jPQDH5knQvdiqjPkAvyv
	 FWHHDiH7SrjXDjMeujlIpNtvuffxnb9Fd7Dy7jJmQcNN0PuVojmsPn7RBC6g+k+8Ch
	 n2PzuVLrTNgTNh3TxJs+S2nhV1WDIfITnlOeGrZb1NumEEhG66F/O2SnTi4ffaDvlM
	 n0z86Dsk5lt5dxn+DO8llwlaO/IAy6rVGVaWc3zICTafy9Qrnw2Wf/XPr3/vCZuVbz
	 VBBnSqWCDrenA==
Message-ID: <951e4d16-2bb2-44b1-99e7-dd28349f20aa@kernel.org>
Date: Thu, 30 Jan 2025 13:12:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/9] dt-bindings: memory-controllers: Add STM32 Octo
 Memory Manager controller
To: Patrice CHOTARD <patrice.chotard@foss.st.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, linux-spi@vger.kernel.org,
 devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 christophe.kerello@foss.st.com
References: <20250128081731.2284457-1-patrice.chotard@foss.st.com>
 <20250128081731.2284457-4-patrice.chotard@foss.st.com>
 <20250129-hilarious-glittering-mustang-fb5471@krzk-bin>
 <3660580d-72eb-45ca-8240-55557e334e37@foss.st.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <3660580d-72eb-45ca-8240-55557e334e37@foss.st.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_041236_541774_EE92C8E6 
X-CRM114-Status: GOOD (  42.54  )
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

On 30/01/2025 09:57, Patrice CHOTARD wrote:
> 
> 
> On 1/29/25 08:52, Krzysztof Kozlowski wrote:
>> On Tue, Jan 28, 2025 at 09:17:25AM +0100, patrice.chotard@foss.st.com wrote:
>>> From: Patrice Chotard <patrice.chotard@foss.st.com>
>>>
>>> Add bindings for STM32 Octo Memory Manager (OMM) controller.
>>>
>>> OMM manages:
>>>   - the muxing between 2 OSPI busses and 2 output ports.
>>>     There are 4 possible muxing configurations:
>>>       - direct mode (no multiplexing): OSPI1 output is on port 1 and OSPI2
>>>         output is on port 2
>>>       - OSPI1 and OSPI2 are multiplexed over the same output port 1
>>>       - swapped mode (no multiplexing), OSPI1 output is on port 2,
>>>         OSPI2 output is on port 1
>>>       - OSPI1 and OSPI2 are multiplexed over the same output port 2
>>>   - the split of the memory area shared between the 2 OSPI instances.
>>>   - chip select selection override.
>>>   - the time between 2 transactions in multiplexed mode.
>>>
>>> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
>>> ---
>>>  .../memory-controllers/st,stm32-omm.yaml      | 190 ++++++++++++++++++
>>>  1 file changed, 190 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/memory-controllers/st,stm32-omm.yaml
>>>
>>> diff --git a/Documentation/devicetree/bindings/memory-controllers/st,stm32-omm.yaml b/Documentation/devicetree/bindings/memory-controllers/st,stm32-omm.yaml
>>> new file mode 100644
>>> index 000000000000..7e0b150e0005
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/memory-controllers/st,stm32-omm.yaml
>>
>>
>> Filename as compatible, so st,stm32mp25-omm.yaml
>>
>> You already received this comment.
> 
> Sorry, i missed this update
> 
>>
>>> @@ -0,0 +1,190 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/memory-controllers/st,stm32-omm.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: STM32 Octo Memory Manager (OMM)
>>> +
>>> +maintainers:
>>> +  - Patrice Chotard <patrice.chotard@foss.st.com>
>>> +
>>> +description: |
>>> +  The STM32 Octo Memory Manager is a low-level interface that enables an
>>> +  efficient OCTOSPI pin assignment with a full I/O matrix (before alternate
>>> +  function map) and multiplex of single/dual/quad/octal 		SPI interfaces over
>>> +  the same bus. It Supports up to:
>>> +    - Two single/dual/quad/octal SPI interfaces
>>> +    - Two ports for pin assignment
>>> +
>>> +properties:
>>> +  compatible:
>>> +    const: st,stm32mp25-omm
>>> +
>>> +  "#address-cells":
>>> +    const: 2
>>> +
>>> +  "#size-cells":
>>> +    const: 1
>>> +
>>> +  ranges:
>>> +    description: |
>>> +      Reflects the memory layout with four integer values per OSPI instance.
>>> +      Format:
>>> +      <chip-select> 0 <registers base address> <size>
>>
>> Do you always have two children? If so, this should have maxItems.
> 
> No, we can have one child.

For the same SoC? How? You put the spi@ in the soc, so I don't
understand how one child is possible.

> 
>>
>>> +
>>> +  reg:
>>> +    items:
>>> +      - description: OMM registers
>>> +      - description: OMM memory map area
>>> +
>>> +  reg-names:
>>> +    items:
>>> +      - const: regs
>>> +      - const: memory_map
>>> +
>>> +  memory-region:
>>> +    description: Phandle to node describing memory-map region to used.
>>> +    minItems: 1
>>> +    maxItems: 2
>>
>> List the items with description instead with optional minItems. Why is
>> this flexible in number of items?
> 
> If only one child (OCTOSPI instance), only one memory-region is needed.

Which is not possible... look at your DTSI.

> 
> Another update, i will reintroduce "memory-region-names:" which was 
> wrongly removed in V2, i have forgotten one particular case.
> 
> We need memory-region-names in case only one OCTOSPI instance is 
> used. If it's OCTOCPI2 and the whole memory-map region
> is dedicated to OCTOSPI2 (OCTOSPI1 unmapped, OCTOSPI2 (256 Mbytes)
> 
> We need to know to which OCTOSPI instance the memory region is associated
> with, in order to check "st,syscfg-amcr" 's value which must be coherent 
> with memory region declared.
> 
> so i will add :
> 
>   memory-region-names:
>     description: |
>       OCTOSPI instance's name to which memory region is associated
>     items:
>       - const: ospi1
>       - const: ospi2
> 

I don't think this matches what you are saying to us. Let's talk about
the hardware which is directly represented by DTS/DTSI. You always have
two instances.


>>
>>> +
>>> +  clocks:
>>> +    maxItems: 1
>>> +
>>> +  resets:
>>> +    maxItems: 1
>>> +
>>> +  access-controllers:
>>> +    maxItems: 1
>>> +
>>> +  st,syscfg-amcr:
>>> +    $ref: /schemas/types.yaml#/definitions/phandle-array
>>> +    description: |
>>> +      The Address Mapping Control Register (AMCR) is used to split the 256MB
>>> +      memory map area shared between the 2 OSPI instance. The Octo Memory
>>> +      Manager sets the AMCR depending of the memory-region configuration.
>>> +      Format is phandle to syscfg / register offset within syscfg / memory split
>>> +      bitmask.
>>
>> Don't repeat constraints in free form text.
> 
> ok
> 
>>
>>> +      The memory split bitmask description is:
>>> +        - 000: OCTOSPI1 (256 Mbytes), OCTOSPI2 unmapped
>>> +        - 001: OCTOSPI1 (192 Mbytes), OCTOSPI2 (64 Mbytes)
>>> +        - 010: OCTOSPI1 (128 Mbytes), OCTOSPI2 (128 Mbytes)
>>> +        - 011: OCTOSPI1 (64 Mbytes), OCTOSPI2 (192 Mbytes)
>>> +        - 1xx: OCTOSPI1 unmapped, OCTOSPI2 (256 Mbytes)
>>> +    items:
>>> +      minItems: 3
>>> +      maxItems: 3
>>
>> You do not have there three phandles, but one. Look how other bindings
>> encode this.
> 
> yes, i see, will update with 
> 
>     items:
>       - description: phandle to syscfg
>       - description: register offset within syscfg
>       - description: register bitmask for memory split
> 
>>
>>> +
>>> +  st,omm-req2ack-ns:
>>> +    description: |
>>> +      In multiplexed mode (MUXEN = 1), this field defines the time in
>>> +      nanoseconds between two transactions.
>>> +
>>> +  st,omm-cssel-ovr:
>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>> +    description: |
>>> +      Configure the chip select selector override for the 2 OCTOSPIs.
>>> +      The 2 bits mask muxing description is:
>>
>> bit mask of size? 1? Then just enum string, no?
> 
> I didn't get your point ? the size of bitmask is 2 bits as indicated.
>     -bit 0: Chip select selector override setting for OCTOSPI1
>     -bit 1: Chip select selector override setting for OCTOSPI2
> 
> 
>>
>>> +        -bit 0: Chip select selector override setting for OCTOSPI1
>>> +          0x0: the chip select signal from OCTOSPI1 is sent to NCS1
>>> +          0x1: the chip select signal from OCTOSPI1 is sent to NCS2
>>> +        -bit 1: Chip select selector override setting for OCTOSPI2
>>> +          0x0: the chip select signal from OCTOSPI2 is sent to NCS1
>>> +          0x1: the chip select signal from OCTOSPI2 is sent to NCS2
>>
>> I don't understand why this is so complicated. First, can you even send
>> chip select OCTOSPI1 to NCS2 and use 0x1 as mux? or 0x3 as mux?
> 
> 
> By default, if st,omm-cssel-ovr property is not present:
>   _ chip select OCTOSPI1 is send to NCS1
>   _ chip select OCTOSPI2 is send to NCS2
> 
> It's the default configuration.
> 
> If st,omm-cssel-ovr property is present, you can mux the chip select 
> of both OCTOSPI instance on NCS1 or NCS2 as you want.
> 
> Yes you can send chip select OCTOSPI1 to NCS2 by using 0x1 as bitmask mux
> (in this case chip select OCTOSPI2 is sent to NCS1).
> 
> If you use 0x3 as bitmask mux, you send  :
>    _ chip select OCTOSPI1 is sent to NCS2
>    _ chip select OCTOSPI2 is sent to NCS2
> 
>>
>> Second, your bitmask value of "0x0" means OCTOSPI1 and OCTOSPI2 are sent
> 
> i think the 0x0/0x1 in the description brings to confusion as it's only the 
> bit value not the bitmask.
> 
>> to NCS1 (whateveer NCS is). This sounds wrong, but your binding says is
>> perfectly correct. Is that true? Is that correct binding?
> 
>  4 bitmask possible choice :
>    0x0 : the chip select signal from OCTOSPI1 is sent to NCS1
> 	 the chip select signal from OCTOSPI2 is sent to NCS1
> 
>    0x1 : the chip select signal from OCTOSPI1 is sent to NCS2
> 	 the chip select signal from OCTOSPI2 is sent to NCS1
> 
>    0x2 : the chip select signal from OCTOSPI1 is sent to NCS1
> 	 the chip select signal from OCTOSPI2 is sent to NCS2
> 
>    0x3 : the chip select signal from OCTOSPI1 is sent to NCS2
> 	 the chip select signal from OCTOSPI2 is sent to NCS2
> 
> 
> I propose to update the st,omm-cssel-ovr description as following
> 
>   st,omm-cssel-ovr:
>     $ref: /schemas/types.yaml#/definitions/uint32
>     description: |
>       Configure the chip select selector override for the 2 OCTOSPIs.
>         - 0: OCTOSPI1 chip select send to NCS1 OCTOSPI2 chip select send to NCS1
>         - 1: OCTOSPI1 chip select send to NCS2 OCTOSPI2 chip select send to NCS1
>         - 2: OCTOSPI1 chip select send to NCS1 OCTOSPI2 chip select send to NCS2
>         - 3: OCTOSPI1 chip select send to NCS2 OCTOSPI2 chip select send to NCS2
>     minimum: 0
>     maximum: 3
> 

My concerns were because I understood that this is not a real bitmask,
IOW you cannot set two of them to NCS2. But you said that setting of
0x3, so both going to NCS2, is perfectly correct setting, so it's fine.



Best regards,
Krzysztof


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BA3AD0E6C3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Nov 2025 11:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y2JQER0lFK1M26fgvZXl0qEaOQl6f/vBNAqV/ub35qM=; b=YZwzfgLaYFD5qhFofDZxNc6Wu5
	KhXt9UPd6IQoCDF7oMi6hWhOUZ1KxCyWVAeoE5QiigCkx+KinOpB5aXSvSBCWrx+v/zWVpQdpMW2J
	Matp40BMTe/uoT6LzWRjIckxkhUeiLbC92npkeRmFJRbue/u71R8Hish9Gx9aMdzirY4goUs25ug2
	EXG6IzPAd8cYfPn8dai7K3+NDsDzXM+OTM/qfBiLYijxfkK5kUTkP6wLlFim6OPbA+rHWtymhYvRx
	2FjFdTra+n287lD7/zsbUoJ6JtKdeK3idGtjWOuU/lh1nirrj4Q2fKAq3m5SCcOMvofjTSVTmb3o9
	5jFAl3aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNqmw-0000000DAfz-25e6;
	Tue, 25 Nov 2025 11:00:50 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNqms-0000000DAfa-2DWW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Nov 2025 11:00:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 960EE4185E;
	Tue, 25 Nov 2025 11:00:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7036CC4CEF1;
	Tue, 25 Nov 2025 11:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764068445;
	bh=QiOgoJoXqDk9M6kPeTKYdXRgOzf255a/k246EvsS2gQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Yb8IaVk8lxZFuHa84VJqUArkGxDdR1eb6k/enxf2TEAf46rpXl/9aoySTcS0gYEHI
	 NXmUrLr/haloP6mbpuZJRRz9kPzaQzfoCe9COK7CAG2TEVRE2bjd1vDnmANEK2aYWP
	 z0qBsks04D/X/DW8rq+UhwUhXLDePpUar1sRQsqbkkZvmTIJp6fEgy8qDtYM+D8gfj
	 BGFQDR1pAl9J91CsWuOA2AAzZZK9aF3liUM4XPSWWixCuNxNYkItV9ARC0O1AdIgLx
	 XFuyIjfA7WO9kf3NBNuJPwc1EoYSAZpvvsIzm6Fq3dP8ykasNKiUDAraOr2jFb1zHj
	 T82gAXSDVItFQ==
Message-ID: <25ee55eb-91d6-4da2-a798-b704acfae4fe@kernel.org>
Date: Tue, 25 Nov 2025 12:00:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: firmware: coreboot: Convert to YAML
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 chrome-platform@lists.linux.dev, Julius Werner <jwerner@chromium.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251125064851.3781993-1-wenst@chromium.org>
 <20251125-outgoing-boisterous-millipede-6dabaf@kuoka>
 <CAGXv+5FPaJMuN7wCP7g0Rxa0mXD3Ru0rxka=m8B_rv+XUkJPWA@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <CAGXv+5FPaJMuN7wCP7g0Rxa0mXD3Ru0rxka=m8B_rv+XUkJPWA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_030046_631986_FF8E8714 
X-CRM114-Status: GOOD (  21.79  )
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

On 25/11/2025 11:41, Chen-Yu Tsai wrote:
>>> diff --git a/Documentation/devicetree/bindings/firmware/coreboot.yaml b/Documentation/devicetree/bindings/firmware/coreboot.yaml
>>> new file mode 100644
>>> index 000000000000..568afd1abb92
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/firmware/coreboot.yaml
>>> @@ -0,0 +1,60 @@
>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/firmware/coreboot.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: COREBOOT firmware information
>>
>> Coreboot
> 
> OK. Side note, coreboot is stylized in all lowercase letters.
> Should I follow that or just use standard English rules?

Just choose one. Here was capitals, but in description not. Preferably
Coreboot or coreboot


> 
>>> +
>>> +maintainers:
>>> +  - Julius Werner <jwerner@chromium.org>
>>> +
>>> +description:
>>> +  The device tree node to communicate the location of coreboot's
>>> +  memory-resident bookkeeping structures to the kernel. Coreboot's
>>> +  FIT image payload can insert the node into the device tree. If a
>>> +  second-stage bootloader (a coreboot "payload") is used, then it
>>> +  is responsible for inserting the node.
>>> +
>>> +properties:
>>> +  compatible:
>>> +    const: coreboot
>>
>> Blank line (it is always here, there is no example without, which makes
>> me wonder which file you took as starting point)
> 
> I actually converted the existing text file directly, copying
> boilerplate, i.e. the top few lines, from another file.
> 
>>> +  reg:
>>> +    description: Address and length of the following two memory regions
>>
>> Drop description, redundant.
> 
> Ack.
> 
>>> +    items:
>>> +      - description:
>>> +          The coreboot table. This is a list of variable-sized descriptors
>>> +          that contain various compile- and run-time generated firmware
>>> +          parameters. It is identified by the magic string "LBIO" in its first
>>> +          four bytes.
>>> +
>>> +          See coreboot's src/commonlib/include/commonlib/coreboot_tables.h for
>>> +          details.
>>> +      - description:
>>> +          The CBMEM area. This is a downward-growing memory region used by
>>> +          coreboot to dynamically allocate data structures that remain resident.
>>> +          It may or may not include the coreboot table as one of its members. It
>>> +          is identified by a root node descriptor with the magic number
>>> +          0xc0389481 that resides in the topmost 8 bytes of the area.
>>> +
>>> +          See coreboot's src/include/imd.h for details.
>>> +
>>> +required:
>>> +  - compatible
>>> +  - reg
>>> +
>>> +additionalProperties: false
>>> +
>>> +examples:
>>> +  - |
>>> +    firmware {
>>> +        #address-cells = <1>;
>>> +        #size-cells = <1>;
>>> +        ranges;
>>> +
>>> +        /* Firmware actually emits "coreboot" node without unit name */
>>> +        coreboot@fdfea000 {
>>> +            compatible = "coreboot";
>>> +            reg = <0xfdfea000 0x264>, <0xfdfea000 0x16000>;
>>
>> That's the same address in both places, so the same one entry. You need
>> two distinctive addresses or binding needs changes to have only one item
>> as well.
> 
> The description does mention that the latter block can include the
> former. It's really up to the firmware. If you like I can include
> two examples to cover both cases.

Lovely, I don't think we should accept growing this binding at all until
coreboot fixes this mess (duplicated entry and missing unit address).


Best regards,
Krzysztof


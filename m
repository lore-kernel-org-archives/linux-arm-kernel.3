Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 301A7C5AC7A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 07:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ui/dJztSjklpZgdgdTpBoQ/4RYKD0Hs+Yl/44j6P7IM=; b=l2qmpVXc4Gr6ZPVivTGEYWJhuK
	R/vt4XH5jsspPe0Zqe50lrGDb25triTZUwu0A3JyxwC3+sFR43YNLjXQ844Ch9iE6yj6EQYfwWHQE
	jaim7JYprLSpmORpbAIk7zY67xU1aCwD4LH9HQLxMTYhX7SCRqYEZGx+gWgZZeP1TGHVOOFrgKeeo
	HIiSI6KfokUuXgpC5yMo5DAY/GJtPIx/rlIL7jCOeos/wzrz0ROWbMkSoF4qzlVRayxzOiT56CgQB
	aY19Gl22VSYHPrtQ8+6b2YZXLzf4IAXzH1CtxVxdh3bOicowBftn87auPcm8ez9aP9Lt1jAAqdDeo
	Hxz7fe0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsFN3-00000007Iu8-3CRt;
	Fri, 07 Aug 2026 07:52:01 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsFN3-00000007ItY-0I9C;
	Fri, 07 Aug 2026 07:52:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CE183419E8;
	Fri,  7 Aug 2026 07:52:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 927871F000E9;
	Fri,  7 Aug 2026 07:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786089120;
	bh=ui/dJztSjklpZgdgdTpBoQ/4RYKD0Hs+Yl/44j6P7IM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=iphmv/dtqzAEEkp2drdJnJNRmvsei4fRFyNo+qjT9hVWxZzpjf9cDBJ2X0lPWTyq3
	 Bg3BXuyiZ1ul4ufTneP8oZW/hA1HnqIK060ZQyyQ1t8OkSalxMFrLElP/XM8O5NtKp
	 EWpVgfsdGcntOcc2lu7XiV/Zw/+akY797trWzpWcCMQQTbZHtQtrCheLPIEPBZ//Ey
	 U0ddh9qGwunV49FZ9JM6XhW3y1dzO+vIJN4KzLdFKLrANZ55r6p/+edKThZOAfO8F3
	 iHOl27+qvI4QWXkLECZRcTwaatqFR7wvMcx75DcQwzRhtSCaxBSuhkJTrkEhaiCDnB
	 56E/NTYkQKGmA==
Message-ID: <d28fc845-9614-43c6-9c38-face930184e9@kernel.org>
Date: Fri, 7 Aug 2026 09:51:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] dt-bindings: Add Bao I/O dispatcher driver binding
To: =?UTF-8?Q?Jo=C3=A3o_Peixoto?= <jpeixoto@osyx.tech>,
 joaopeixoto@osyx.tech, linux-kernel@vger.kernel.org
Cc: ajd@linux.ibm.com, alex@ghiti.fr, aou@eecs.berkeley.edu,
 bagasdotme@gmail.com, catalin.marinas@arm.com, conor+dt@kernel.org,
 corbet@lwn.net, dan.j.williams@intel.com, davidmcerdeira@osyx.tech,
 devicetree@vger.kernel.org, dev@kael-k.io, gregkh@linuxfoundation.org,
 haren@linux.ibm.com, heiko@sntech.de, jose@osyx.tech,
 kever.yang@rock-chips.com, krzk+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-riscv@lists.infradead.org, maddy@linux.ibm.com, mani@kernel.org,
 nathan@kernel.org, neil.armstrong@linaro.org, palmer@dabbelt.com,
 pjw@kernel.org, prabhakar.mahadev-lad.rj@bp.renesas.com, robh@kernel.org,
 will@kernel.org
References: <20251224135217.25350-1-joaopeixoto@osyx.tech>
 <20260107162829.416885-1-joaopeixoto@osyx.tech>
 <20260107162829.416885-4-joaopeixoto@osyx.tech>
 <35100734-e2ea-459e-9b47-5cc62aa99b38@kernel.org>
 <20f4dad8-0ac5-4fc0-866a-38721371ba63@osyx.tech>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <20f4dad8-0ac5-4fc0-866a-38721371ba63@osyx.tech>
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

On 07/08/2026 09:43, João Peixoto wrote:
> 
> On 1/7/26 16:47, Krzysztof Kozlowski wrote:
>> On 07/01/2026 17:28,joaopeixoto@osyx.tech wrote:
>>> From: João Peixoto<joaopeixoto@osyx.tech>
>>>
>>> This patch introduces a device tree binding for the Bao I/O Dispatcher,
>>> a device used in backend VMs running virtualized devices (e.g., VirtIO).
>>>
>>> Signed-off-by: João Peixoto<joaopeixoto@osyx.tech>
>>> ---
>>>   .../bindings/bao/bao,io-dispatcher.yaml       | 75 +++++++++++++++++++
>>>   1 file changed, 75 insertions(+)
>>>   create mode 100644 Documentation/devicetree/bindings/bao/bao,io-dispatcher.yaml
>>>
>>> diff --git a/Documentation/devicetree/bindings/bao/bao,io-dispatcher.yaml b/Documentation/devicetree/bindings/bao/bao,io-dispatcher.yaml
>>> new file mode 100644
>>> index 000000000000..8ca450e4b9d5
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/bao/bao,io-dispatcher.yaml
>>> @@ -0,0 +1,75 @@
>>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>>> +%YAML 1.2
>>> +---
>>> +$id:http://devicetree.org/schemas/bao/bao,io-dispatcher.yaml#
>>> +$schema:http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Bao I/O Dispatcher Device
>> No, you don't get multiple devices per every driver.
>>
>> Look at gunyah or Mediatek Genio. Come back when you solve ENTIRE
>> FEEDBACK given to them first. And then say how you solved that feedback
>> because so far I see you only ignoring review of your LLM slop or other
>> Microslop product.
>>
>> Best regards,
>> Krzysztof
> Thanks for the pointers, and sorry for the earlier churn. I looked at how
> gunyah and the Mediatek Genio bindings model this and reworked the 
> dispatcher
> the same way: there is no longer a single node describing N devices. Each
> backend device is its own node with one reg region and one interrupt:
> 
>    shmem@50000000 {
>        compatible = "bao,io-dispatcher";
>        reg = <0x50000000 0x01000000>;
>        interrupts = <0x0 0x08 0x1>;
>        bao,id = <0>;
>    };
> 
> A backend guest that services several frontends instantiates several such
> nodes. reg and interrupts therefore have maxItems: 1. The driver was
> rewritten to match (one platform device -> one device model -> one
> /dev/bao-dmX) dropping the internal N-device array, the global DM list and
> the indirection ioctl.
> 
> I have also gone through the rest of the feedback on the series (the 
> ipcshmem
> binding, the misc-device conversion, commit messages, changelog, threading)
> and addressed each item; the cover letter enumerates them. The binding 
> passes
> `make dt_binding_check`.

Where is any upstream DTS using this? Why do we want another software
nodes in DT?

Best regards,
Krzysztof


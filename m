Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1010CCA470
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Oct 2025 08:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7PQljK8xrIGlV1/Oi6KbHBFsxdUhazL3roixtJUOajk=; b=fP3oD9zwrJaSpzUwSMmIYBVrM/
	VIdiHgImVxqsOLZUoihzrmK6Ien7WKQAoEidhwFlDMagUPjuaHUaVOs0MwtGZIhnHXxcLWdDAXx+E
	myvAItlRxrqe+hARBYuPQVdJTeWPHtc7BrGP3WwroTlKEowj1h/VqAE8aZBwzHg8rLUDYxAk7jg77
	qaMp81+su0iVOHXwMFn1CoRv7fIicMvA17vHEueUZM//ZKGMevTDXeHZ6Mj0V3OYes+e2+NWVFgCD
	Xf7eStMqI/bS98yYQS47sMDw5bGK1sYZJdq4yCS25sSeWOJ8Gyy+7Xb69RHQR6/VHMXdMDBc/0SHu
	NoLHuAZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6PHU-00000003Q0h-3IIC;
	Wed, 08 Oct 2025 08:12:16 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6PHS-00000003Pzy-1ivV;
	Wed, 08 Oct 2025 08:12:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BDC9643C75;
	Wed,  8 Oct 2025 08:12:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E36D2C4CEF4;
	Wed,  8 Oct 2025 08:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759911133;
	bh=c2GoYT8KDL1eyEVGxGi2+EGCXK+Kst3nZpOtV/b7mRI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=rGBjfUmIyYr045AoFAFtC5WxvZZSyRdgeyLM8tzfmR56rQvImMVp2pNQ3wu8GG8h0
	 uq3fYEE9KLbDy07nlDJYm6S/B8QVeZneKLnp95OvZHDlVFUv6b7d32LkEYICetaPQY
	 8ft1ZIjmxLeQwqauQYwFh4pjWgTe3dsIFD+QU41nt0Js8soqRN2Yluveb/bTW1nY8T
	 2Lq0fgOoOoFu9Dk87Gyu93qDIfkbkLJ+MaZi0lkJ/lyJFWAkhDcNt/RhpcUKr16opL
	 hRSvLxtaXcKh/berPk2u5uoUFow/IwyGWqnmMm2n1vTst8WMPZGWVjDX8tcoLbyel+
	 w9yUlBpM6ux1w==
Message-ID: <c33a26a8-a054-4ce6-86d9-4945014f69cf@kernel.org>
Date: Wed, 8 Oct 2025 17:12:01 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/6] dt-bindings: phy: samsung,usb3-drd-phy: add
 ExynosAutov920 HS phy compatible
To: Pritam Manohar Sutar <pritam.sutar@samsung.com>, vkoul@kernel.org,
 kishon@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 alim.akhtar@samsung.com, andre.draszik@linaro.org, peter.griffin@linaro.org,
 kauschluss@disroot.org, ivo.ivanov.ivanov1@gmail.com,
 igor.belwon@mentallysanemainliners.org, m.szyprowski@samsung.com,
 s.nawrocki@samsung.com
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, rosa.pila@samsung.com,
 dev.tailor@samsung.com, faraz.ata@samsung.com, muhammed.ali@samsung.com,
 selvarasu.g@samsung.com
References: <20250903073827.3015662-1-pritam.sutar@samsung.com>
 <CGME20250903072936epcas5p4a28d0e63c7f0792b516b0cbc68bf3a8e@epcas5p4.samsung.com>
 <20250903073827.3015662-2-pritam.sutar@samsung.com>
 <0df74c2b-31b9-4f29-97d3-b778c8e3eaf1@kernel.org>
 <007801dc2893$18ed4a20$4ac7de60$@samsung.com>
 <02ef5180-ad56-45f0-a56f-87f442bf6793@kernel.org>
 <007f01dc2b81$84ef19b0$8ecd4d10$@samsung.com>
 <808d166a-b615-49c6-b0f5-bf5101721381@kernel.org>
 <000001dc380e$612b5680$23820380$@samsung.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <000001dc380e$612b5680$23820380$@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_011214_490725_13A73614 
X-CRM114-Status: GOOD (  10.98  )
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

On 08/10/2025 13:45, Pritam Manohar Sutar wrote:
> Hi Krzysztof,
> 
>> -----Original Message-----
>> From: Krzysztof Kozlowski <krzk@kernel.org>
>> Sent: 07 October 2025 11:54 AM
>> To: Pritam Manohar Sutar <pritam.sutar@samsung.com>; vkoul@kernel.org;
>> kishon@kernel.org; robh@kernel.org; krzk+dt@kernel.org;
>> conor+dt@kernel.org; alim.akhtar@samsung.com; andre.draszik@linaro.org;
>> peter.griffin@linaro.org; kauschluss@disroot.org;
>> ivo.ivanov.ivanov1@gmail.com; igor.belwon@mentallysanemainliners.org;
>> m.szyprowski@samsung.com; s.nawrocki@samsung.com
>> Cc: linux-phy@lists.infradead.org; devicetree@vger.kernel.org; linux-
>> kernel@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-samsung-
>> soc@vger.kernel.org; rosa.pila@samsung.com; dev.tailor@samsung.com;
>> faraz.ata@samsung.com; muhammed.ali@samsung.com;
>> selvarasu.g@samsung.com
>> Subject: Re: [PATCH v8 1/6] dt-bindings: phy: samsung,usb3-drd-phy: add
>> ExynosAutov920 HS phy compatible
>>
>> On 22/09/2025 14:26, Pritam Manohar Sutar wrote:
>>> This phy needs 0.75v, 0.18v and 3.3v supplies for its internal
>>> functionally. Power Supply's names are as per phy's User Data-Book.
>>> These names, (dvdd, vdd18 and vdd33), are considered  for 0.75v, 1.8v
>>> and 3.3v respectively.
>>> "
>>>
>>>>
>>>> I still cannot find constraints for the rest of properties, though.
>>>
>>> Sorry I didn't get it completely. Can you please elaborate on the same?
>>
>>
>> Writing bindings and introductory talks elaborate on that. You add properties
>> without constraints. That's not what we want. We want constraints.
>>
> 
> Have added only supplies in this patch-set. However, was going 
> through schema example and it says nothing is needed to define
> in terms of supply. 


I don't have original patchset in my inbox anymore, so not sure what was
there, but most likely you miss constraining the presence of these
properties per each variant. IOW, not each of devices in the bindings
have these supplies, so I expect syntax similar as in example-schema.

https://elixir.bootlin.com/linux/v5.19/source/Documentation/devicetree/bindings/example-schema.yaml#L212


Best regards,
Krzysztof


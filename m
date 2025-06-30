Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44958C8302D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 09:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FvqBLm4/k3CbYBQDP+pb9D3DmetcQvkRyKiP9FPRaUw=; b=Ipb3R2kXoCRRySNHJdFfiO4+a9
	ysWJcmoinqfe7PZA75NnXVKPTdKxNGZA3hMnKe3jjy6CahFfD4ozI4o7AsNaU81MYBwe2lQYKEgpa
	R1ccqTVk9CqwrVRsyqbCJ0K4nirrXEPr/JyLF6YRTxTEwoUdMvJ3n3FEGYiFQDxT3BLhfEB5Hozvj
	XVf3ITeCiRK9r+7k5caRxix46gA8R0BtwZvhNM/bEbJAfL94EsTyGWaH3NixTG9Zcek2SdRbYNYJo
	CQJAfVKgCc3dob1PBpUZDSRYicALkKtyEn41DO2N/yOoYVEg0+gYKlQeuk1P7ioFN82n+QfKH1sFp
	YoZMHzXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWB3X-00000001mN9-4BEP;
	Mon, 30 Jun 2025 09:44:08 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWAwF-00000001ljC-0vcq;
	Mon, 30 Jun 2025 09:36:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1751276193;
	bh=u1wSOQ/c7/ofEu2h9hbQ/4iI7lWdBhtbLLe0jwM9Ou4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Z4FMDe5yXZNkebN+3Zo/Uj/Nqc7Zt1c/Vzh/95R+B15UKHo51B+khrudvuTItHBC8
	 SwXJacNZE16Pj0PkwP8/ySOz7KI5jlWd7sEbSS8792+SBk9JQ84KKfKeZVye5/fcQw
	 u7CjVh4/F9c04rTSg2aIh6YaheMdDXrdMY21iuHklz8GDFIaVBggjvTsMvoT/b7e1x
	 XJuRxI9ygnW59VOqoNSDB20+0rgfeY5x+bqL/UAhnAprZGxHhAJ3qg7WM6F5CnBjt7
	 hUhObydkS2dAVZ/Jquw3Y35aS6w4mCJO4ksHagkXS8IvznaP88k/yuXcM8u3ojtCkC
	 Yrbj0FQZx5zKQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6FF5317E0342;
	Mon, 30 Jun 2025 11:36:32 +0200 (CEST)
Message-ID: <e59b2bbb-ee1e-42b5-9516-f2e545dbf700@collabora.com>
Date: Mon, 30 Jun 2025 11:36:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 01/13] dt-bindings: power: mediatek: Document
 mediatek,bus-protection
To: Rob Herring <robh@kernel.org>
Cc: linux-mediatek@lists.infradead.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, matthias.bgg@gmail.com, ulf.hansson@linaro.org,
 y.oudjana@protonmail.com, fshao@chromium.org, wenst@chromium.org,
 lihongbo22@huawei.com, mandyjh.liu@mediatek.com, mbrugger@suse.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
 kernel@collabora.com
References: <20250623120154.109429-1-angelogioacchino.delregno@collabora.com>
 <20250623120154.109429-2-angelogioacchino.delregno@collabora.com>
 <20250627201543.GA4171766-robh@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250627201543.GA4171766-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_023635_440375_58BD52BC 
X-CRM114-Status: GOOD (  16.43  )
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

Il 27/06/25 22:15, Rob Herring ha scritto:
> On Mon, Jun 23, 2025 at 02:01:42PM +0200, AngeloGioacchino Del Regno wrote:
>> Add a new mediatek,bus-protection property in the main power
>> controller node and deprecate the old mediatek,infracfg,
>> mediatek,infracfg-nao and mediatek,smi properties located in
>> the children.
>>
>> This is done in order to both simplify the power controller
>> nodes and in preparation for adding support for new generation
>> SoCs like MT8196/MT6991 and other variants, which will need
>> to set protection on new busses.
> 
> Protection like access controls? We have the access-controller binding
> for that.
> 

I was not aware of that - but that's *so* cool.

 From a very (very, very) fast look, it looks like that fits this case perfectly.
I'll check if that's right and will come up with a v2 for that.

Thanks a lot!
Angelo

>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   .../power/mediatek,power-controller.yaml      | 40 +++++++++++++++++++
>>   1 file changed, 40 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
>> index 9c7cc632abee..2530c873bb3c 100644
>> --- a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
>> +++ b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
>> @@ -44,6 +44,18 @@ properties:
>>     '#size-cells':
>>       const: 0
>>   
>> +  mediatek,bus-protection:
>> +    $ref: /schemas/types.yaml#/definitions/phandle-array
>> +    description:
>> +      A number of phandles to external blocks to set and clear the required
>> +      bits to enable or disable bus protection, necessary to avoid any bus
>> +      faults while enabling or disabling a power domain.
>> +      For example, this may hold phandles to INFRACFG and SMI.
>> +    minItems: 1
>> +    maxItems: 3
>> +    items:
>> +      maxItems: 1
>> +
>>   patternProperties:
>>     "^power-domain@[0-9a-f]+$":
>>       $ref: "#/$defs/power-domain-node"
>> @@ -123,14 +135,17 @@ $defs:
>>         mediatek,infracfg:
>>           $ref: /schemas/types.yaml#/definitions/phandle
>>           description: phandle to the device containing the INFRACFG register range.
>> +        deprecated: true
>>   
>>         mediatek,infracfg-nao:
>>           $ref: /schemas/types.yaml#/definitions/phandle
>>           description: phandle to the device containing the INFRACFG-NAO register range.
>> +        deprecated: true
>>   
>>         mediatek,smi:
>>           $ref: /schemas/types.yaml#/definitions/phandle
>>           description: phandle to the device containing the SMI register range.
>> +        deprecated: true
>>   
>>       required:
>>         - reg
>> @@ -138,6 +153,31 @@ $defs:
>>   required:
>>     - compatible
>>   
>> +allOf:
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            enum:
>> +              - mediatek,mt8183-power-controller
>> +    then:
>> +      properties:
>> +        mediatek,bus-protection:
>> +          minItems: 2
>> +          maxItems: 2
>> +
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            enum:
>> +              - mediatek,mt8365-power-controller
>> +    then:
>> +      properties:
>> +        mediatek,bus-protection:
>> +          minItems: 3
>> +          maxItems: 3
>> +
>>   additionalProperties: false
>>   
>>   examples:
>> -- 
>> 2.49.0
>>


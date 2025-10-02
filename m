Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29598CAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Oct 2025 08:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N0TohroCiXkyWQ05AuhTxt+XmDpEOTenEj6RXccTgbM=; b=YA3+cszPTydQFMgRYf8xjktiZL
	m2p2n8Nj+8xelGg1Y4HqgBSQbnx/rmAJVNSnW1IEPvPbjM1KfIUN9U1ZjAHzZYtQqbEi8koto/sGb
	38854s6kRhviiNMFBF2QfPc9icqF22O0OrPaINTtH5FVIFYKN/hn/sZen7TDhxIWTNrs8ONfDb61x
	4zPwWGLBC9ag7AEbmzfeecqO4Vy2LyjlBRmQNuKzs93EILl7hCPru/9uvNIO2Xr3Y+XCwu/r7ybbf
	e7ypeMNGfh6hZMTy6dua/BHltnXnH7mtEfv4GF3Uhv2fAI0fNMI5WWDUtUwWm7hkGyhPRnBI80Hd/
	YORtHVRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4EGE-00000009qX0-0GCw;
	Thu, 02 Oct 2025 08:01:58 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4EGB-00000009qWR-3War;
	Thu, 02 Oct 2025 08:01:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1759392113;
	bh=Hr60drvLfL1YnuE4KY5/qlJit8NkSU47rT83xTzVQdQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=d/u8+HlQ67vxa1gJdWO61ZfwqBsj1e2ZElsUb60KjXiUbvJ4qmXGss70wU9RjDaH+
	 p62WaCtaIwoypiQfBJw8qRFyHofPfaKMAMpADrFEGwpOniIQB6Ss/G+lixLZTlotIh
	 G9RGIWiDepWsNZ7lgyPhR4BMumef6/6GdIyOyrnanP8vVaSSQNmxXdGaw5UlE3Amh/
	 qiO1qflTR9B6JlE9O6lgOCgQATvR6syetO95kpmnazYDRUps4D4qpTQYlLr3qZRzxg
	 9R4wuOdOdP8vjfsZ2MurG4quvfJDMBHIUFJ7a0a/uwf5J+vJBPO1PKKz4vQjGnzDD8
	 IQXFRFKpkj6CA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5C91617E038B;
	Thu,  2 Oct 2025 10:01:53 +0200 (CEST)
Message-ID: <c14d80e9-f383-4311-afa7-4d2879e1e4cb@collabora.com>
Date: Thu, 2 Oct 2025 10:01:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/9] dt-bindings: regulator: Document MediaTek MT6316
 PMIC Regulators
To: Rob Herring <robh@kernel.org>
Cc: linux-mediatek@lists.infradead.org, lee@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, matthias.bgg@gmail.com, lgirdwood@gmail.com,
 broonie@kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com, wenst@chromium.org,
 igor.belwon@mentallysanemainliners.org
References: <20251001111316.31828-1-angelogioacchino.delregno@collabora.com>
 <20251001111316.31828-2-angelogioacchino.delregno@collabora.com>
 <20251001154537.GA1833526-robh@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20251001154537.GA1833526-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251002_010156_030642_E40F5FF0 
X-CRM114-Status: GOOD (  17.00  )
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

Il 01/10/25 17:45, Rob Herring ha scritto:
> On Wed, Oct 01, 2025 at 01:13:08PM +0200, AngeloGioacchino Del Regno wrote:
>> Add bindings for the regulators found in the MediaTek MT6316 PMIC,
>> usually found in board designs using the MT6991 Dimensity 9400 and
>> on MT8196 Kompanio SoC for Chromebooks.
>>
>> This chip is fully controlled by SPMI and has multiple variants
>> providing different phase configurations.
>>
>> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
>> Link: https://lore.kernel.org/r/20250715140224.206329-2-angelogioacchino.delregno@collabora.com
> 
> Why do we want a link to v5 here in the git history forever? You've seen
> Linus' recent comments on Link usage?
> 

Yes, I've seen that, and I fully agree with him.

That was a mistake and was totally unintentional - I actually wanted to, but then
forgot to, remove the links.

I really have to spend those 5 minutes to configure b4 correctly.

Sorry about that, will fix in v7.

>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   .../regulator/mediatek,mt6316b-regulator.yaml | 46 +++++++++++++++++++
>>   .../regulator/mediatek,mt6316c-regulator.yaml | 46 +++++++++++++++++++
>>   .../regulator/mediatek,mt6316d-regulator.yaml | 41 +++++++++++++++++
>>   3 files changed, 133 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,mt6316b-regulator.yaml
>>   create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,mt6316c-regulator.yaml
>>   create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,mt6316d-regulator.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/regulator/mediatek,mt6316b-regulator.yaml b/Documentation/devicetree/bindings/regulator/mediatek,mt6316b-regulator.yaml
>> new file mode 100644
>> index 000000000000..e7a6b70cdab2
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/regulator/mediatek,mt6316b-regulator.yaml
>> @@ -0,0 +1,46 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/regulator/mediatek,mt6316b-regulator.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: MediaTek MT6316 BP/VP SPMI PMIC Regulators
>> +
>> +maintainers:
>> +  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> +
>> +description:
>> +  The MediaTek MT6316BP/VP PMICs are fully controlled by SPMI interface, both
>> +  feature four step-down DC/DC (buck) converters, and provides 2+2 Phases,
>> +  joining Buck 1+2 for the first phase, and Buck 3+4 for the second phase.
>> +
>> +properties:
>> +  compatible:
>> +    const: mediatek,mt6316b-regulator
>> +
>> +  vbuck12:
>> +    type: object
>> +    $ref: regulator.yaml#
>> +    unevaluatedProperties: false
>> +
>> +  vbuck34:
>> +    type: object
>> +    $ref: regulator.yaml#
>> +    unevaluatedProperties: false
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    pmic {
>> +      regulators {
>> +        compatible = "mediatek,mt6316b-regulator";
>> +
>> +        vbuck12 {
>> +          regulator-min-microvolt = <450000>;
>> +          regulator-max-microvolt = <965000>;
>> +          regulator-always-on;
>> +        };
>> +      };
>> +    };
> 
> One complete example for the pmic please rather than incomplete child
> node examples.
> 

Thanks for making me notice - actually, this example is even wrong... as I
eventually changed the node, but for whatever reason I completely forgot
about updating the binding. UGH.

The MT6316(x) are PMICs themselves, providing only regulators.

I'll come up with a decent example.

Cheers,
Angelo



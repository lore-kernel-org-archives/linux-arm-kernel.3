Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD971CD98D5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 19:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sSmElYIYOFrisvQwDCGz3/P+2Vw/ZOXr/m32JCzG3ck=; b=aZJNTh2VYj4PO/g9sW1lRd+07i
	8diFvUfz5uTitzK8qomLTUgp7pxkSmPE/NfqE88pap354QR43iv9LRkK14Eynpe9+fUypn7BN42OD
	9vI0pUtms8SRa4FsvWPdo/12/iNmRI8OqBvUnStSKKKu01Zc4ExcTXbmyBftWueITKGVuoyJ0xDGS
	m5iJkJ8omCFR+zRAPe2nVKs/E73afDkkp+/6+mefmatWkG/WqbUfPeBy/4JIN4Cf3gHYR9fVQ3RS/
	5JW9mbxqW1/IdOq0omOvxNAkU35PWKKgu39YR0Gvya6psLr6yuJ1SxRU/26fPjLxaKwgxZmUNnVF2
	PaFvCS5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJdCf-0000000B1r2-3LpX;
	Thu, 13 Nov 2025 19:41:57 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJdCe-0000000B1qk-2YKS;
	Thu, 13 Nov 2025 19:41:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D7E6C60123;
	Thu, 13 Nov 2025 19:41:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAD1CC4CEF1;
	Thu, 13 Nov 2025 19:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763062915;
	bh=rd2zpPCHj2LC0VX+Ni1vP+XGAM697mBCGbgOGiSycFc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ESVbNSBN5U75Smbj3dlhdPq58cUYnJoFgHs7TbvPT8SisZiJDqF81eX/Kp4/7LYR/
	 ubATuM17Fg0p/LMsk88h2One9ciuWnpeYqCD8nFvn6gfjbN8uyk+dbCNdTjskFqzj8
	 gFfiAm1Mt5naSEI9o6gNCtLWiMIeXP0rKoNHaQbhnPpCVStGUF7NlnCKlnBA2mBzRP
	 1BKfOXDR2IIjfSqTaK4uCE/vEqUyyPjd4YF4C4rZYLq+MjCW8O0pD9BgUYHnw0TAbD
	 /gd89hC9xhggKM5UlfKMq6OFobhfphUi8sfX7BWgtssrSloOgvwcIVOfkB0goGvNGU
	 1cf69nyUgUyvw==
Message-ID: <8fafec79-febd-464a-903b-e7e8b841b6c9@kernel.org>
Date: Thu, 13 Nov 2025 20:41:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] dt-bindings: mfd: Add Realtek ISO system controller
To: =?UTF-8?B?RWxlYW5vciBMaW4gW+ael+elkOWQm10=?= <eleanor.lin@realtek.com>,
 "afaerber@suse.de" <afaerber@suse.de>, "robh@kernel.org" <robh@kernel.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>, "lee@kernel.org"
 <lee@kernel.org>, =?UTF-8?B?SmFtZXMgVGFpIFvmiLTlv5fls7Bd?=
 <james.tai@realtek.com>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-realtek-soc@lists.infradead.org"
 <linux-realtek-soc@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 =?UTF-8?B?Q1lfSHVhbmdb6buD6Ymm5pmPXQ==?= <cy.huang@realtek.com>,
 =?UTF-8?B?U3RhbmxleSBDaGFuZ1vmmIzogrLlvrdd?= <stanley_chang@realtek.com>
References: <20251105104452.6336-1-eleanor.lin@realtek.com>
 <20251105104452.6336-3-eleanor.lin@realtek.com>
 <88d90e44-88d9-4b5c-ba76-1e27dd28f78b@kernel.org>
 <06078f60af0948d19b1abae53eeec7f6@realtek.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <06078f60af0948d19b1abae53eeec7f6@realtek.com>
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

On 11/11/2025 13:19, Eleanor Lin [林祐君] wrote:
> Hi Krzysztof,
> 
> Sorry for the delay in responding to you.
> 
>> On 05/11/2025 11:44, Yu-Chun Lin wrote:
>>> Add DT binding schema for Realtek system controller.
>>>
>>> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
>>> ---
>>>  .../bindings/mfd/realtek,iso-system.yaml      | 65
>> +++++++++++++++++++
>>>  1 file changed, 65 insertions(+)
>>>  create mode 100644
>>> Documentation/devicetree/bindings/mfd/realtek,iso-system.yaml
>>>
>>> diff --git
>>> a/Documentation/devicetree/bindings/mfd/realtek,iso-system.yaml
>>> b/Documentation/devicetree/bindings/mfd/realtek,iso-system.yaml
>>> new file mode 100644
>>> index 000000000000..6fbdedd3ee5b
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/mfd/realtek,iso-system.yaml
>>> @@ -0,0 +1,65 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/mfd/realtek,iso-system.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Realtek ISO System Controller
>>> +
>>> +description: |
>>
>>
>> Do not need '|' unless you need to preserve formatting.
>>
> 
> I will remove it in V2.
> 
>>> +  The Realtek ISO System Controller is a register area that contains
>>> + miscellaneous system registers for the SoC and serves as a parent
>>> + node  for other functions.
>>> +
>>> +maintainers:
>>> +  - James Tai <james.tai@realtek.com>
>>> +  - Yu-Chun Lin <eleanor.lin@realtek.com>
>>> +
>>> +properties:
>>> +  compatible:
>>> +    items:
>>> +      - enum:
>>> +          - realtek,iso-system
>>
>> No clue what is "iso system", neither commit msg, nor title nor description
>> explain me that. Please add first bindings for the iso soc or if this is not soc,
>> then use only soc-specific compatibles (see writing bindings doc).
>>
> 
> I will rename 'realtek,misc' for clarity.

How "misc" clarifies a lot? In what way this helps anyone to understand:
1. What is this hardware?
2. What device it is?
3. How do you fulfill requirements from writing-bindings?


Best regards,
Krzysztof


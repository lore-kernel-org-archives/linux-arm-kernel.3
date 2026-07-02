Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B516C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 07:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3iImYy89gH1RliWnirUBiV7qgObwtLceJC+1Hq5PgIw=; b=DQIq94D0wnrVL0XBk204pK4JKD
	s1crk56Al2aFMXAzp/Cht6K2WNUsvORZW93rQBpVq8STxqGlZoyMrIBLLt3Bs4zPZWv671wzpPehV
	t427qflcTkgmfnVAeR6FB2K/DRnhgJr6F6t43Yey5eHrBVt9orcUjFPf+Be0NoWHuxEwKe6yYle7S
	h246/YpDr3w8L+rAn/XkCi2JhlxF2gl5aYPPfc6cz7cUUYfKR8d8Mn/+tT3jwYDtx/+fTX4mOKH3K
	fDOGkaurbyfXePTDLqN9KmBYxInNI0F7dKcQqIx/+lEOYDyJ71z2bh1NtPGphJj5TvYjSEC8/Aq4q
	JCn4mPkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfC0T-00000003kpp-3NPy;
	Thu, 02 Jul 2026 07:38:45 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfC0S-00000003kpb-14Sb;
	Thu, 02 Jul 2026 07:38:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E57884195B;
	Thu,  2 Jul 2026 07:38:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57F301F000E9;
	Thu,  2 Jul 2026 07:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782977923;
	bh=3iImYy89gH1RliWnirUBiV7qgObwtLceJC+1Hq5PgIw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=Jb/X5XdUJBmsmVbLc1H9r1BUgLaavVSOV/22zguUPDoETIqWLJNkenDm8uP0ViWkD
	 OFjh4emKLP23Gvhe7SGFNuNvRggpgH1jcho7FQgD3GFq2jduug2MNOIAU00lOPUA00
	 rz/rlimPMdfMlklBYGAcYxDyUpCgj5T+ul/8ydN8Q62mnBu3mRII6VCmwBnAygp+Ip
	 +MZ8FoWjicfUlEKDJaTB+8fZ41Z3njf4uCWMaHfvzFQFUgBNVLU28OMsPnw1QlKEAs
	 w/Ae5qBdnJ72i+BiKGEnKsUZhGdxoqzXWf22GE5eFyubz6++rI7oMGoEZpEBM1aOuT
	 nMWvD82VFehuQ==
Message-ID: <b0415193-76c8-4b1b-9582-8a4a220eae9f@kernel.org>
Date: Thu, 2 Jul 2026 09:38:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 net-next 1/2] dt-bindings: phy: cadence-torrent: Update
 property values to support 3 clocks
To: Gokul Praveen <g-praveen@ti.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, krzk+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, neil.armstrong@linaro.org, nm@ti.com,
 robh@kernel.org, sjakhade@cadence.com, kristo@kernel.org, vigneshr@ti.com,
 vkoul@kernel.org, yamonkar@cadence.com
References: <20260701142457.81874-1-g-praveen@ti.com>
 <20260701142457.81874-2-g-praveen@ti.com>
 <20260702-vigilant-tody-of-inquire-ffbede@quoll>
 <f40839d9-445e-4e48-ada9-97feb8e40584@ti.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 xsFNBFVDQq4BEAC6KeLOfFsAvFMBsrCrJ2bCalhPv5+KQF2PS2+iwZI8BpRZoV+Bd5kWvN79
 cFgcqTTuNHjAvxtUG8pQgGTHAObYs6xeYJtjUH0ZX6ndJ33FJYf5V3yXqqjcZ30FgHzJCFUu
 JMp7PSyMPzpUXfU12yfcRYVEMQrmplNZssmYhiTeVicuOOypWugZKVLGNm0IweVCaZ/DJDIH
 gNbpvVwjcKYrx85m9cBVEBUGaQP6AT7qlVCkrf50v8bofSIyVa2xmubbAwwFA1oxoOusjPIE
 J3iadrwpFvsZjF5uHAKS+7wHLoW9hVzOnLbX6ajk5Hf8Pb1m+VH/E8bPBNNYKkfTtypTDUCj
 NYcd27tjnXfG+SDs/EXNUAIRefCyvaRG7oRYF3Ec+2RgQDRnmmjCjoQNbFrJvJkFHlPeHaeS
 BosGY+XWKydnmsfY7SSnjAzLUGAFhLd/XDVpb1Een2XucPpKvt9ORF+48gy12FA5GduRLhQU
 vK4tU7ojoem/G23PcowM1CwPurC8sAVsQb9KmwTGh7rVz3ks3w/zfGBy3+WmLg++C2Wct6nM
 Pd8/6CBVjEWqD06/RjI2AnjIq5fSEH/BIfXXfC68nMp9BZoy3So4ZsbOlBmtAPvMYX6U8VwD
 TNeBxJu5Ex0Izf1NV9CzC3nNaFUYOY8KfN01X5SExAoVTr09ewARAQABzSVLcnp5c3p0b2Yg
 S296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+wsGPBBMBCgA5AhsDBgsJCAcDAgYVCAIJCgsE
 FgIDAQIeAQIXgBYhBJvQfg4MUfjVlne3VBuTQ307QWKbBQJp2mE8AAoJEBuTQ307QWKbeaIP
 /ihHTkTW4KsN/DQ945JJbyu5tI0J80Wue7QyyLPglyKfhgb5cLLNPpOC8cCIJsc7+W3i2P38
 s2c1cOH6CYGE7E9ur3Vfme8NW2S2I/Z8VC7bZnzyS23wT17LrsdS/qCpx4o8U+pt/xdXDKph
 EGRYrIEmMpUWvyYzyYKGIe25FtaayIIKpq8eZYyFcp2f/sG5IkOW5uZzHPMPdcm87jU7fyuQ
 rAU2vx9r+ulUfQ/q9Z2roC/ode3l7t2pN7BCBCsUDp6JCrUyZrtT1e7EbA0ZRP3aOBNk2P2E
 DQOgJGjGdO5Yx2Y9LFtltu6JbsBJHi1syGRX3AtQYOMc4Y1WGoeZJmMlvKj2ZqqXNkcWi2DS
 IQEWB0uW6CqFsBBIMGDa+6OzdaVO/uAVXWDWml02Men3CILdI1MbVjoh8ECqYUY7OQ+JJvNN
 vnliuq5WM3Ghd3jg/LZZrxXjdIginRHFQCjIJYLKpLZWm1/iDFedcfzqRNYmTtqscdCNHW41
 oT3Z7BmO9xwdjuwBS6nmS6JJwkbf5Ot2QR4pB/DRU7ZwjT1qHe+9r9gF32wXVQatHNGK/VVu
 sfwOnkdxCWkp/qb2gdQRmZh+SedStWshigH6sNfuHBloF/q+hjMRc8b2m326OZdrbSHwY1Sz
 vti8Hn7n8NjdHO9LKB7BIdjkA9DA5WsqOuVCzsFNBFVDXDQBEADNkrQYSREUL4D3Gws46JEo
 Z9HEQOKtkrwjrzlw/tCmqVzERRPvz2Xg8n7+HRCrgqnodIYoUh5WsU84N03KlLueMNsWLJBv
 BaubYN4JuJIdRr4dS4oyF1/fQAQPHh8Thpiz0SAZFx6iWKB7Qrz3OrGCjTPcW6eiOMheesVS
 5hxietSmlin+SilmIAPZHx7n242u6kdHOh+/SyLImKn/dh9RzatVpUKbv34eP1wAGldWsRxb
 f3WP9pFNObSzI/Bo3kA89Xx2rO2roC+Gq4LeHvo7ptzcLcrqaHUAcZ3CgFG88CnA6z6lBZn0
 WyewEcPOPdcUB2Q7D/NiUY+HDiV99rAYPJztjeTrBSTnHeSBPb+qn5ZZGQwIdUW9YegxWKvX
 XHTwB5eMzo/RB6vffwqcnHDoe0q7VgzRRZJwpi6aMIXLfeWZ5Wrwaw2zldFuO4Dt91pFzBSO
 IpeMtfgb/Pfe/a1WJ/GgaIRIBE+NUqckM+3zJHGmVPqJP/h2Iwv6nw8U+7Yyl6gUBLHFTg2h
 YnLFJI4Xjg+AX1hHFVKmvl3VBHIsBv0oDcsQWXqY+NaFahT0lRPjYtrTa1v3tem/JoFzZ4B0
 p27K+qQCF2R96hVvuEyjzBmdq2esyE6zIqftdo4MOJho8uctOiWbwNNq2U9pPWmu4vXVFBYI
 GmpyNPYzRm0QPwARAQABwsF2BBgBCgAgAhsMFiEEm9B+DgxR+NWWd7dUG5NDfTtBYpsFAmna
 YUkACgkQG5NDfTtBYptX+BAApg32CkxwNucNEi8WfWA8oKkW0y8YDuY6ORMo9FWNGiT/OTy0
 vyJrLocrpn86zwfjVp+eCrssPYh8eqJfnWqmYv6ACQtHPYzPZQ3mSo8H97Z01oUxITzCxpXm
 ZkLgPIqtDPcC2E3dPM/fVxcyowM8XsaMA9wcsaUYrta8toOq2b9tKcjleKMfMrm0gQ9u7wUc
 QbLkwj6TCLOwucb07GXzLTNF9PZmaDUpKAZjMjmrW+le+SFvQbhamx0rxLWPR0NWntXpbCn+
 +ACch03p/JyTBVktxFsFyCt7pTPE1kEaeuXBTe/a2D9iQvRxRW19LvuO2e59/u1wYUiH/orz
 wbIC2S4dBsPAPihL3ztOU1yE86GPyQtSE0kU+/7snnLt4QGi6PChf3t5gnNjAzjUUovO8rgI
 c+5yN5heq5loYHgK6OQ9OlHzsPHO9e9MOQcKlFycs1pyijFGzDwdNUm/SchK8iWT2QApTx4A
 K9bCVaboTA2T77QYkRcRJYSsO1alGX0ome/hMLD1daXlkrNUp1HWa3K4iytLRXjCSIorWiGs
 n+q3krnpXu3TFkA8qtOFZMdnIiFuiq1yLT8hptsV5xh1TA2nsVvSYiaCr3q4s4BKjS/KrLDb
 qoxzw8ISjdUp4pA85vb6YLCmb39NgidD+7PmAr65lBNveIFynTgsja1rRQ4=
In-Reply-To: <f40839d9-445e-4e48-ada9-97feb8e40584@ti.com>
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

On 02/07/2026 09:35, Gokul Praveen wrote:
> Hi Krzystof,
> 
> On 02/07/26 11:53, Krzysztof Kozlowski wrote:
>> On Wed, Jul 01, 2026 at 07:54:56PM +0530, Gokul Praveen wrote:
>>> Update maxItems value of "clocks" property to 3 as description of
>>> this parameter already indicates 3 clocks(refclk,pll1_refclk(optional)
>>> and phy_en_refclk(optional)).
>> But what if description is wrong? You need to provide rationale why you
>> are doing it and you cannot use existing code alone as that rationale,
>> because as you pointed out - existing code is not fully correct.
> 
> The description is correct because not all device may have 2 input  

I do not see how you proved it in the commit msg.

> reference clocks , hence keeping the requirement of the 2nd reference 
> clock(pll1_refclk) optional.
> 
> Just as a note: phy_en_refclk is an output clock.

output clocks do not go to input clocks property.

> 
> In those cases the multilink serdes configurations requiring 2 different 
> input reference clocks will not work due to the limitation of having 
> only 1 clock.
> 
> However, when it comes to devices where 2 different input reference 
> clocks are supported and a multilink serdes configuration is 
> needed(where the links require separate reference clocks for each 
> protocol so as to cater to the  different clocking speed requirements of 
> these links).
> 
> Hence, in this case ,2 different input clocks are needed so as to cater 
> to 2 different clock speeds.
> 
> For eg: In the USXGMII+SGMII multilink serdes configuration which I had 
> tested, it failed because
> 
> USXGMII requires an input clock speed of 156.25 Mhz and SGMII protocol 
> requires an input clock speed of 100 Mhz.
> 
> But, since there was only one input clock(refclk) mentioned in the 
> clocks and clock-name parameter , this multilink serdes configuration 
> failed.
> 
> Hence, to make it work, the pll1_refclk had to be added which provided a 
> clock speed of 156.25 Mhz for USXGMI and the refclk provided
> 
> a clock speed of 100 Mhz  for SGMII.
> 
>>> Update the maxItems and items value of "clock-names" property with multiple
>>> combination of clock-names possible since pll1_refclk and phy_en_refclk are
>>> optional clocks.
>> Why? You need to describe why you are doing this, not what you are
>> doing.
> Sure , Krzysztof, I will be careful about that and prioritize that in 
> the commit message.
>>> Signed-off-by: Gokul Praveen <g-praveen@ti.com>
>>> ---
>>>   .../bindings/phy/phy-cadence-torrent.yaml        | 16 ++++++++++++----
>>>   1 file changed, 12 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/phy/phy-cadence-torrent.yaml b/Documentation/devicetree/bindings/phy/phy-cadence-torrent.yaml
>>> index 9af39b33646a..96c664d50629 100644
>>> --- a/Documentation/devicetree/bindings/phy/phy-cadence-torrent.yaml
>>> +++ b/Documentation/devicetree/bindings/phy/phy-cadence-torrent.yaml
>>> @@ -34,7 +34,7 @@ properties:
>>>   
>>>     clocks:
>>>       minItems: 1
>>> -    maxItems: 2
>>> +    maxItems: 3
>>>       description:
>>>         PHY input reference clocks - refclk (for PLL0) & pll1_refclk (for PLL1).
>>>         pll1_refclk is optional and used for multi-protocol configurations requiring
>>> @@ -45,9 +45,17 @@ properties:
>>>   
>>>     clock-names:
>>>       minItems: 1
>>> -    items:
>>> -      - const: refclk
>>> -      - enum: [ pll1_refclk, phy_en_refclk ]
>>> +    maxItems: 3
>> Drop
> Sure, i will do that Krzysztof.
>>> +    oneOf:
>>> +      - items:
>>> +          - const: refclk
>>> +      - items:
>>> +          - const: refclk
>>> +          - enum: [ pll1_refclk, phy_en_refclk ]
>> Drop these, pointless. You were supposed to grow existing syntax.
>>
>>> +      - items:
>>> +          - const: refclk
>>> +          - const: pll1_refclk
>> So here is the enum.
>>
>>> +          - const: phy_en_refclk
>> And this stays.
>>
>> You make changes which do not make the binding better and are not
>> explained in commit msg. Focus on WHY you are doing things and also
>> explain WHY you did such complicated syntax (if you insist on rewriting
>> correct code into something odd we do not expect).
> 
> So, the reason I added the oneOf property is to support the following 
> combinations because pll1_refclk and phy_en_refclk are optional clocks. 
> With the earlier enum , only either of pll1_refclk or phy_en_refclk
> 
> can be used and both cannot be used at the same time.
> 
> Combination 1: refclk
> 
> Combination 2 : refclk, pll1_refclk
> 
> Combination 3: reclk, phy_en_refclk
> 
> Combination 4: refclk, pll1_refclk, phy_en_refclk
> 
> 
> Please feel free to suggest any alternative solution to support these 
> combinations .

I already did. Read the feedback carefully.

Best regards,
Krzysztof


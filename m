Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69E70C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 04:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dA3+qKTRUEu5/4yeTc3a9a8EHax1eGi/fCguPSTlip0=; b=xUeidpMG9H0N73lReF0uw9zThT
	eii6jjQmU0PP7kQt5jzSXN3RFCSYN0TirLx9MV7STQcaX/tQ7pnlNp+SPtxZbdzQu3d136ueBZr7Z
	GcrXUI1nWEr4DjN0zXwEFxcWtZ1icq4EtWypG7q7HoDkBMVEBfbm9sw8P+Ou+P7J6oAS5pcEQ2XpX
	mBrBf60+F+KpGYHGD9BbXvMSfZ12vrEyOU+GJP77LyhXS8QChzAQgWkEc2RIX9d0nMAnxl+Zh0UV3
	l2R/9BP6sBmptHeXfL1QsNBRi3HTTtqm2++LLgqT79Yn2QXa89mz9PdWQr3IiRIlE10I5YOfq3Twx
	JVOZemqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCWrl-0000000ED8B-2eAK;
	Wed, 07 May 2025 04:58:45 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCWpD-0000000ECtz-2pUg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 04:56:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AF8116116E;
	Wed,  7 May 2025 04:56:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D9E8C4CEE7;
	Wed,  7 May 2025 04:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746593766;
	bh=QCuW5NH1T2M/o6Jr1yHAeqbYOFeEHiPe4yZYKvfSHGo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WCJxrTDPUnAJFhAuHRhHtcLnLUT+xJ3eomn5H/uqToMWGhKchJzKROEVT+zjcHBFI
	 B8yOEYaRDvlInEiUibdo9Ax6X5/WBHVa+QDj/i23rDX6IiS4oZTVHALkRAylJm5PdR
	 Ho39ZHI+xQ5v/mpJ5l+8x27rz3gAh5ZFPDNksxRjbZoN7UcdWI3syxNT/qiTTQVFsH
	 Y380oBubxEkJ1GLOGAGzgF1CbMayWy8k/NtdyG2XSrhBHYat56syjg1dcixz621IDs
	 cAeSF9sei2jM9slPn6jOrTSchaXSjhRAFRznq0QlOKhGk/0t3FuTpPl/aytWBtTvJw
	 +Ggo+Ahk/4Q7g==
Message-ID: <128b0ef7-cf0f-41d6-855a-cb3ea70eca18@kernel.org>
Date: Wed, 7 May 2025 06:56:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] dt-bindings: mfd: add bindings for QIXIS CPLD
To: Ioana Ciornei <ioana.ciornei@nxp.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20250430153634.2971736-1-ioana.ciornei@nxp.com>
 <20250430153634.2971736-2-ioana.ciornei@nxp.com>
 <20250502-meticulous-bulky-wildebeest-c1a8b6@kuoka>
 <wna3loahthqbn5hnw2pbt3yznmzzv3zppi7f2nblvq3t22jdc2@7cse4r4p6q5z>
 <959b56f0-ff63-485b-86eb-96ae32bdeb88@kernel.org>
 <miuxxgv73fmsl5plcoso73dk6bnuwgmlydzupnb7fcz6ub72ra@dro4cqbn67jt>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <miuxxgv73fmsl5plcoso73dk6bnuwgmlydzupnb7fcz6ub72ra@dro4cqbn67jt>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 06/05/2025 16:16, Ioana Ciornei wrote:
> On Tue, May 06, 2025 at 04:05:46PM +0200, Krzysztof Kozlowski wrote:
>> On 06/05/2025 15:57, Ioana Ciornei wrote:
>>> On Fri, May 02, 2025 at 09:01:59AM +0200, Krzysztof Kozlowski wrote:
>>>> On Wed, Apr 30, 2025 at 06:36:29PM GMT, Ioana Ciornei wrote:
>>>>> This adds device tree bindings for the board management controller -
>>>>> QIXIS CPLD - found on some Layerscape based boards such as LX2160A-RDB,
>>>>> LX2160AQDS, LS1028AQDS etc.
>>>>>
>>>>> Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
>>>>> ---
>>>>>  .../bindings/mfd/fsl,qixis-i2c.yaml           | 65 +++++++++++++++++++
>>>>>  1 file changed, 65 insertions(+)
>>>>>  create mode 100644 Documentation/devicetree/bindings/mfd/fsl,qixis-i2c.yaml
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/mfd/fsl,qixis-i2c.yaml b/Documentation/devicetree/bindings/mfd/fsl,qixis-i2c.yaml
>>>>> new file mode 100644
>>>>> index 000000000000..562878050916
>>>>> --- /dev/null
>>>>> +++ b/Documentation/devicetree/bindings/mfd/fsl,qixis-i2c.yaml
>>>>
>>>> Filename matching compatible.
>>>
>>> How to choose one if there are multiple compatible strings?
>>
>> The fallback or the oldest or the lowest number or whichever you prefer
>> as a base.
>>
>>>
>>>>
>>>>> @@ -0,0 +1,65 @@
>>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>>>> +%YAML 1.2
>>>>> +---
>>>>> +$id: http://devicetree.org/schemas/mfd/fsl,qixis-i2c.yaml
>>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml
>>>>> +
>>>>> +title: NXP's QIXIS CPLD board management controller
>>>>> +
>>>>> +maintainers:
>>>>> +  - Ioana Ciornei <ioana.ciornei@nxp.com>
>>>>> +
>>>>> +description: |
>>>>> +  The board management controller found on some Layerscape boards contains
>>>>> +  different IP blocks like GPIO controllers, interrupt controllers, reg-muxes
>>>>> +  etc.
>>>>> +
>>>>> +properties:
>>>>> +  compatible:
>>>>> +    enum:
>>>>> +      - fsl,lx2160a-qds-qixis-i2c
>>>>> +      - fsl,lx2162a-qds-qixis-i2c
>>>>> +      - fsl,ls1028a-qds-qixis-i2c
>>>>
>>>> Keep alphabetical order.
>>>>
>>>> What is actual device name? I2C? Is this an I2C controller or device?
>>
>> I assume you will then drop the redundant part.
> 
> Ok, I will drop the i2c part. Are you ok with the below compatible
> strings?
> 
> 	- fsl,lx2160a-qds-qixis-cpld
> 	- fsl,lx2162a-qds-qixis-cpld
> 	- fsl,ls1028a-qds-qixis-cpld


Not really, because you keep ignoring comments. What is the device name?
Can qixis be anything else than i2c or cpld? Use that name for the
compatible.


Best regards,
Krzysztof


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7880C3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 14:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oKyoUSZQT5HcmgY7SRlLSLPsK035hiw7bCWhqsz4w9w=; b=dDuRfQ2w6CWp8NUAqLBps94awx
	HRrZMvTRc+1SemxsjLW08DKHzl1Qhj/BFTjp+HYCP0EOrXz1lspB+dfXHYZoyLfWboxzpdYOdYnRn
	vhCyQwW/MM7XP8CpaSaeXvjzN0pwLb1PlEkyJ5hciEcNZQ0dt89jc6fZN1awH1xYtX9ZO8gkKfZ0C
	P3Ho1ZAacK1IbGYEWDd7kQ8YTfcy5aRT1FqYnKu77X1FKkEaOIn6BNxoJ3LhDyqdNvU+OioM64Txt
	wgxczwtVJT3Z/p0yK7dYdCgHE3YN0DdQWkFzL8aezt4uDrxBGTTG+r2m00QEdxlWdJSLhbU+9mrhA
	56pfj72Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCftV-0000000FoFR-3Fbm;
	Wed, 07 May 2025 14:37:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCfG5-0000000Ff5K-0PN2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 13:56:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 92D9945211;
	Wed,  7 May 2025 13:56:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27F9BC4CEE2;
	Wed,  7 May 2025 13:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746626184;
	bh=kvthPf+4gKdZG+gHxAfQvinAstMqb7H75wdeTT0Fddc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=uPoo1FYnvvJRSTokGx9HrXzWTzGdi+zTI2oWPdd36Fl8qN2AWl9Snkn5OXBBy5Ism
	 UDlwWTEA08eAjj2wQ6Qg+beTqQ8zW8jRNJXxUy3mqRI07GHAl68iOCgaeK/Ub+4+Wi
	 YoJ8piOo8cL5y7lwZqsdw+HQaOFBZTwXZd9uWFDImO5YDziBN9UrrZySvuzoMhORKY
	 XS85U+AC6bN6Dt4LEHtktRCVqGnVnhpxjrJbgHwHpLDW4m0PbZlmblbqQy3Y6TXE93
	 SDGoVTWDn3XzDl5zxEPu7gbMZFt7tTPgXxdHslafOF1uJkampvfIF3H7xCIs/2b9JI
	 bRC4diXjwpq/g==
Message-ID: <7d6b529e-ab26-4efe-8b91-1facbd041ba3@kernel.org>
Date: Wed, 7 May 2025 15:56:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] arm64: dts: ls1028a-qds: make the QIXIS CPLD use the
 simple-mfd-i2c.c driver
To: Ioana Ciornei <ioana.ciornei@nxp.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Vladimir Oltean <vladimir.oltean@nxp.com>
References: <20250430153634.2971736-1-ioana.ciornei@nxp.com>
 <20250430153634.2971736-6-ioana.ciornei@nxp.com>
 <20250502-savvy-eccentric-hog-b4fed5@kuoka>
 <smfuskvhdhrfrgbpjflgymoadms6vfiwgjmipsmkrxldtor6we@tyvafv626bwr>
 <8ec115f7-1a35-4506-a20a-b4de27f10960@kernel.org>
 <z7knkmi7kjhwlqwokikozos7whwaj5vmseh7kjrdl2la3kmj5e@wwzlsxpq573v>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <z7knkmi7kjhwlqwokikozos7whwaj5vmseh7kjrdl2la3kmj5e@wwzlsxpq573v>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_065625_179648_9D1A3654 
X-CRM114-Status: GOOD (  31.02  )
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

On 07/05/2025 14:28, Ioana Ciornei wrote:
> On Wed, May 07, 2025 at 06:54:38AM +0200, Krzysztof Kozlowski wrote:
>> On 06/05/2025 16:21, Ioana Ciornei wrote:
>>> On Fri, May 02, 2025 at 09:04:03AM +0200, Krzysztof Kozlowski wrote:
>>>> On Wed, Apr 30, 2025 at 06:36:33PM GMT, Ioana Ciornei wrote:
>>>>> From: Vladimir Oltean <vladimir.oltean@nxp.com>
>>>>>
>>>>> The MDIO mux on the LS1028A-QDS never worked in mainline. The device
>>>>> tree was submitted as-is, and there is a downstream driver for the QIXIS
>>>>> FPGA:
>>>>>
>>>>> https://github.com/nxp-qoriq/linux/blob/lf-6.12.y/drivers/soc/fsl/qixis_ctrl.c
>>>>>
>>>>> That driver is very similar to the already existing drivers/mfd/simple-mfd-i2c.c,
>>>>> and the hardware works with the simple-mfd-i2c driver, so there isn't
>>>>> any reason to upstream the other one.
>>>>>
>>>>> Adapt the compatible string and child node format of the FPGA node, so
>>>>> that the simple-mfd-i2c driver accepts it.
>>>>
>>>> Why do you break the users based on some driver differences? Fix the
>>>> drivers, not the DTS.
>>>>
>>>>>
>>>>> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
>>>>> Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
>>>>> ---
>>>>>  arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dts | 9 +++++----
>>>>>  1 file changed, 5 insertions(+), 4 deletions(-)
>>>>>
>>>>> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dts b/arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dts
>>>>> index 0bb2f28a0441..58b54d521d75 100644
>>>>> --- a/arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dts
>>>>> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dts
>>>>> @@ -338,17 +338,18 @@ sgtl5000: audio-codec@a {
>>>>>  	};
>>>>>  
>>>>>  	fpga@66 {
>>>>> -		compatible = "fsl,ls1028aqds-fpga", "fsl,fpga-qixis-i2c",
>>>>> -			     "simple-mfd";
>>>>> +		compatible = "fsl,ls1028a-qds-qixis-i2c";
>>>>
>>>> This breaks all the existing users. NAK.
>>>
>>> Using a mainline kernel, this DT node was never used or probed by a
>>> driver since that driver was never submitted. I am not breaking any user
>>> of the mainline kernel.
>> 1. Users of DTS is plural, so what about all other projects and out of
>> tree users?

You still can have users in all possible projects. Dropping simple-mfd,
even though it is Linux thingy, is affecting users, potentially breaking
them. Exactly what we talked on last plumbers - don't do such changes.

I recall even warning from Rob for people adding simple-mfd: be careful
adding it, because dropping it creates compatibility issue.

This is not a fresh platform, where you do not care about users. It is
published to all users since ~2019.


>> 2. Did you remove simple-mfd from kernel or what? How can you claim
>> there is no driver for simple-mfd?
> 
> No, I did not remove simple-mfd from the kernel.
> 


...

> If, as you say, this works just by having the simple-mfd, I should have
> been able to see the enetc_port1 functional and the RGMII PHY be
> accesible on the MDIO bus which is behind the reg-mux. But this is not
> happening.
> 
> Instead, I get this:
> 
> 	[   17.635216] platform mdio-mux: deferred probe pending: mdio-mux-multiplexer: Failed to get mux
> 
> 	root@localhost:~# ip link set dev eno1 up
> 	[ 1155.190391] net eno1: could not attach to PHY
> 	root@localhost:~# uname -a
> 	Linux localhost 6.15.0-rc5-next-20250507 #112 SMP PREEMPT Wed May  7 15:21:14 EEST 2025 aarch64 aarch64 aarch64 GNU/Linux
> 
> From what I understand, even though the fpga@66 has the simple-mfd
> compatible, no entity initializes an I2C regmap (since this is an I2C
> device) for it so that it can be used by any child device.
> 
This sounds reasonable, thanks for providing context. Most of this (so a
summary) should be in the commit msg as the rationale for changing the
ABI, so please grow a bit the commit msg part:
"The MDIO mux on the LS1028A-QDS never worked in mainline because ...".

With all this I still do not get why do you need to affect the
compatibles. What is wrong with the actual compatibles?

Best regards,
Krzysztof


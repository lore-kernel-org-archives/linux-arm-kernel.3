Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0A3DD7830C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 11:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r2N5eJwKCAsANulMU1AAYfH9bvj8E5rzy6ckILQCOq4=; b=IzzEGc8YM4zkRCXxI/cPKJ2/IT
	kznTBvviQ/An1Ppnk6mwvqmdIctlPSR83k/VHPTIZ5tzWKI1OKGaCo6bYY7uBQJXUhD/3aYoUD1ph
	3q+gWbK5Bd9geatnqDIok/ol1R/l13wYyCApwgorej+oNFpdbjDj66if2LjZAzyCcP3bNYOS/Emrn
	SfVmkP+FeyKn5qvW/DkqaoMULgzehUZQIGEUcio5qvqbaCXWIHI8HI5bfYAINlWU2Y8qolATNU3FH
	pckk+1JLNl7l5xBSNkglwqfZ+ga7P9XgMgY1YSYwJCDuF+YISguGHWNbPtpZO8rRSm3rXcYN1B0iG
	CQJk8Zew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI4JX-00000005pJ6-0x74;
	Mon, 02 Dec 2024 11:10:03 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI4Gx-00000005oMt-3rDu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 11:07:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8C68BA40AE2;
	Mon,  2 Dec 2024 11:05:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B745C4CED1;
	Mon,  2 Dec 2024 11:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733137642;
	bh=HTnR6QNXRoEAw79Cedv/RZZNLWaGNO75PTZKzHXcD/g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=learJTxAmC0Jd8r+CT3JAmJ5qCKKgzwPfwAMTEFGSXebSeSlemY7c36lsGcTfsmfj
	 fFQD4/aOMcM3gtc/4PNQaY91XUVpA2eGk2ABLan/5YmR56rdwt1kTiqDrk87Ez7uIG
	 5l/LiT61oU4dc4MYQwRG+wIIkb9bdvauQBjrL6NumcV6CGwEkHbn4bNVvGLijixE0C
	 700BxjAL+9V9ysJ7ZjMVxhWtpvsS7Y5PyhRwO92pQsUzCQkqVXod4uXCFmja/8aQSX
	 hoSUpIKj+OA5tN91MLK4Hr7w8o1TwmYN97KrchDFE7kR71l+z1PCPTrqDTEv1qwFrP
	 NWy7cSgEolxpQ==
Message-ID: <abeb632b-9efc-48e5-a28a-a9d7c02e0a6e@kernel.org>
Date: Mon, 2 Dec 2024 12:07:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv2] arm64: dts: ti: k3-j721e-beagleboneai64: Enable ACSPCIE
 output for PCIe1
To: Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: Romain Naour <romain.naour@smile.fr>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
 conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org, kristo@kernel.org,
 vigneshr@ti.com, nm@ti.com, Romain Naour <romain.naour@skf.com>
References: <20241202101140.48778-1-romain.naour@smile.fr>
 <dabbad2b-f8a6-4ed7-86da-ec696cf67461@kernel.org>
 <k7udgqugqseweckb7hjniz3aops4kn35ttju2ju7f2pcbmndrg@dau5nr4leish>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <k7udgqugqseweckb7hjniz3aops4kn35ttju2ju7f2pcbmndrg@dau5nr4leish>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_030724_100778_4DC18545 
X-CRM114-Status: GOOD (  15.97  )
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

On 02/12/2024 11:58, Siddharth Vadapalli wrote:
> On Mon, Dec 02, 2024 at 11:14:46AM +0100, Krzysztof Kozlowski wrote:
> 
> Hello Krzysztof,
> 
>> On 02/12/2024 11:11, Romain Naour wrote:
>>> From: Romain Naour <romain.naour@skf.com>
>>>
>>> Unlike the SK-TDA4VM (k3-j721e-sk) board, there is no clock generator
>>> (CDCI6214RGET) on the BeagleBone AI-64 (k3-j721e-beagleboneai64) to
>>> provide PCIe refclk signal to PCIe Endponts. So the ACSPCIE module must
>>> provide refclk through PCIe_REFCLK pins.
>>>
>>> Use the new "ti,syscon-acspcie-proxy-ctrl" property to enable ACSPCIE
>>> module's PAD IO Buffers.
>>>
>>> Reuse the compatible "ti,j784s4-acspcie-proxy-ctrl" since the ACSPCIE
>>> buffer and its functionality is the same across all K3 SoCs.
>>>
>>> Cc: Siddharth Vadapalli <s-vadapalli@ti.com>
>>> Signed-off-by: Romain Naour <romain.naour@skf.com>
>>> ---
>>> With this patch, we can remove "HACK: Sierra: Drive clock out" patch
>>> applied on vendor kernel for BeagleBone AI-64:
>>> https://openbeagle.org/beagleboard/linux/-/commit/ad65d7ef675966cdbc5d75f2bd545fad1914ba9b
>>>
>>> v2:
>>>  - use generic style comments
>>>  - use "syscon" as generic node name for "acspcie0_proxy_ctrl" node
>>>  - Keep the compatible "ti,j784s4-acspcie-proxy-ctrl" since the
>>>    ACSPCIE buffer and its functionality is the same across all K3 SoCs.
>>>    (Siddharth Vadapalli)
>>>
>>>    "The compatible "ti,j784s4-acspcie-pcie-ctrl" should be reused for
>>>    J721E and all other K3 SoCs.
>>
>> No, it shouldn't and you got comment on this. You always need specific
>> compatible, see writing bindings doc.
> 
> Could you please clarify in which cases reusing the compatible is
> permissible? The list of compatibles at:

Never? You always need specific compatible. Did you read the writing
bindings document?

> https://github.com/torvalds/linux/blob/v6.12/Documentation/devicetree/bindings/mfd/syscon.yaml#L112
> namely,
>           - ti,am62-opp-efuse-table
>           - ti,am62-usb-phy-ctrl
>           - ti,am625-dss-oldi-io-ctrl
>           - ti,am62p-cpsw-mac-efuse
>           - ti,am654-dss-oldi-io-ctrl
>           - ti,j784s4-pcie-ctrl
> have all been reused for different TI SoCs since they all correspond to the
> device functionality enabled via the CTRL_MMR System Controller registers.

If you find a bug, does it mean you can send new patch introducing the
same bug?

> The compatible "ti,j784s4-acspcie-pcie-ctrl" has also been added to the
> list:
> https://github.com/torvalds/linux/blob/v6.12/Documentation/devicetree/bindings/mfd/syscon.yaml#L117
> with the intent of reusing it the same way that other compatibles have
> been reused.

And?

Best regards,
Krzysztof


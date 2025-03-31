Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2479C3600B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Mar 2025 13:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yNki/BaaXgqFuAU7Rhxq4DYyRe0qZNwLMs+MQ5hVwvM=; b=XGsNIo7JNivvH/2l0jFdd8ORuh
	nG3S8Qfc0BTmSy2Ymh8RqFM/oCq9HY79wzal9HgAMQrzrsF6z3y0nEjuNzH5SrqHEwptw3piojUCk
	lI9LEpgSkIp/aP1HdDbbY4ZCwFFE3In557cCMN6u9SkoT/mGK9MALEnYQJ3SQl+0seoxOPu2PhwIZ
	PTU4HcL7RQ/DVIOD607PbXZu4QwBR7F9EWbjdNEuQF8gCTSIzeml9LKDquZalekvry1XehM8NqkIr
	cV6pmbXeXhlr3wNd7JjyMgFURpJV/kAK4yhDdLqcPcOHu0UoqzBUD95RXThIN+rpAD4MrFxfaIwGz
	4TKZR9IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzFU3-00000000TsU-3tW1;
	Mon, 31 Mar 2025 13:47:23 +0000
Received: from mout-p-201.mailbox.org ([2001:67c:2050:0:465::201])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzFSL-00000000TaS-311Q
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Mar 2025 13:45:39 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4ZRC7S75H4z9v2m;
	Mon, 31 Mar 2025 15:45:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1743428725;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yNki/BaaXgqFuAU7Rhxq4DYyRe0qZNwLMs+MQ5hVwvM=;
	b=O6MG2TeioBcAI1Qnb54BydAhuwf7Sbw68IacAKC7rClD0YCZTkxWf+oANHet08+Q4rOb3R
	of0jNuOcN2rTJxe1WpK5J3ZVocemDBwGWUlGpft0fVQN7oElFkngn/CJO3Cujk/s7uOApj
	rXtfDcWpqazz3Fjb0n6pCkvas8UIh4i40VO8lqjO5bWo4S0XyZ2E0RzgQPNu8IJGJPJmDU
	QbIeQzaZ7uTSPQsEifpXENxQU1cD7sBJ3VbtXtBOshefcFPeHQaiKmSD+4X5RFHNysx8hP
	lNAg0ssWH1K9brcMEa9uCjOj5LFO3BQREHj/rjRSJgquUE9C5BzN6XYq5cHeBw==
Message-ID: <4b5fc903-f2c1-4e7e-8a4f-629566bff3ad@mailbox.org>
Date: Mon, 31 Mar 2025 15:45:18 +0200
MIME-Version: 1.0
Subject: Re: [PATCH 1/4] dt-bindings: PCI: rcar-gen4-pci-host: Document
 optional aux clock
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, =?UTF-8?Q?Krzysztof_Wilczy=C5=84sk?=
 =?UTF-8?Q?i?= <kw@linux.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>, Aradhya Bhatia <a-bhatia1@ti.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Heiko Stuebner <heiko@sntech.de>, Junhao Xie <bigfoot@classfun.cn>,
 Kever Yang <kever.yang@rock-chips.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Magnus Damm <magnus.damm@gmail.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20250330195715.332106-1-marek.vasut+renesas@mailbox.org>
 <20250330195715.332106-2-marek.vasut+renesas@mailbox.org>
 <20250331-excellent-nautilus-of-apotheosis-fbd30a@krzk-bin>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <20250331-excellent-nautilus-of-apotheosis-fbd30a@krzk-bin>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: 8qjyfopxbb8111g3aaicaxtrreq91134
X-MBO-RS-ID: a0dc09d5d8d0cbf734d
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_064537_945959_36FF21D4 
X-CRM114-Status: GOOD (  13.73  )
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

On 3/31/25 10:19 AM, Krzysztof Kozlowski wrote:
> On Sun, Mar 30, 2025 at 09:56:09PM +0200, Marek Vasut wrote:
>> diff --git a/Documentation/devicetree/bindings/pci/rcar-gen4-pci-host.yaml b/Documentation/devicetree/bindings/pci/rcar-gen4-pci-host.yaml
>> index bb3f843c59d91..5e2624d4c62c7 100644
>> --- a/Documentation/devicetree/bindings/pci/rcar-gen4-pci-host.yaml
>> +++ b/Documentation/devicetree/bindings/pci/rcar-gen4-pci-host.yaml
>> @@ -46,12 +46,14 @@ properties:
>>         - const: app
>>   
>>     clocks:
>> -    maxItems: 2
>> +    minItems: 2
>> +    maxItems: 3
>>   
>>     clock-names:
> 
> missing minItems: 2
> 
> (xxx and xxx-names are always synced in dimensions)

Fixed, noted, thanks !

> I understand that clock is optional? Your diagram in commit msg suggests
> that clock is there always.

The clocks which supply the PCIe controller ("ref" clock) and PCIe bus 
("aux" clock) can be modeled as either, single clock (one clock for both 
controller AND bus, i.e. single "ref" clock), or two separate clocks 
(one for controller AND one for bus, i.e. "ref" clock AND "aux" clock).

That depends on whether the clock generator (the 9FGV0441 brick in the 
ASCII schematic in the commit message in this case) has one flip switch 
to enable both clock (controller and bus, i.e. "ref" clock only), or has 
separate flip switches to enable the different outputs (controller or 
bus, i.e. "ref" and "aux" clock).

So yes, the "aux" is optional from the software side, but on the 
hardware side, the "aux" bus clock are always there. They however do not 
always have separate flip switch to enable/disable them.

-- 
Best regards,
Marek Vasut


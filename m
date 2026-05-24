Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 130B0CD5BAB
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 May 2026 18:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ti+0QCXGT7ETl1POeyETi1M8HN2lZW4xpw/OVCjE8eQ=; b=GDHzqH5rHS1L9jASwshV45IskW
	27JhiKMXUd2SAgfBg564cfQ6ccGAMK0FKImcQEnPuVPe1oWDwyhD2zgVhTgcj2G4O3qaGBW8PiwS0
	dkINL2VAChWp7OyQaDy8bfU+Nf3mWcVa8y2/9RDtDY7K7xaBYesQZSuTtuRKHZ6dk6mEVup/yw8ko
	LxtMM0NwPPz73tfV9KkLoyrV4fnKt6tiD04Bn1zzH3kB2gVIjBsjuDKa5s+2tYcTnSU8dOE4PL2O0
	e7KT+wjFUaBU2zmn2uhmT3Hx5Gbwq1RYVY/sotb0+Wadw1hbpjy/YUastBdtOM65bGBClub0MpBYi
	nu0K3WOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRDRb-0000000FPfD-1FED;
	Sun, 24 May 2026 18:20:59 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRDRa-0000000FPf2-0ZDX
	for linux-arm-kernel@lists.infradead.org;
	Sun, 24 May 2026 18:20:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 32254601F4;
	Sun, 24 May 2026 18:20:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3D8C1F000E9;
	Sun, 24 May 2026 18:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779646856;
	bh=ti+0QCXGT7ETl1POeyETi1M8HN2lZW4xpw/OVCjE8eQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=amOuWBZRkpbbzWRXSo0gLh2BW8aM/+huZFF2HgwpnPIrHiaifu58+cgFfxhkF4Yu9
	 4tjk0xP50i8CFEvfYatq3JDxwCU7iykVppJ/J1PD5sD7WMqceQ0YtJhWw36nQTdFxF
	 rEp77CXtuolc9w+Gcc+YkxFjC3WnAt0U9VWh5Y4QsOHBMryussGc2P09HAdmAuAM56
	 znOWGWHlv/Q9JcIRiqSdAUKHZFQUtaxuKOJLBjj4Q7YwRb4VYtWE8Seiu22Gqw0h2D
	 HVMbttNmUIiRokX5YHhFZLOoU6u0/5xCymzbnz+Wg4HV6KEh/c1PGtP1UXD/dNuFnz
	 OlRdFgjSuZykQ==
Message-ID: <74eb56fb-546d-4b2c-9bbc-01a40937f5d3@kernel.org>
Date: Sun, 24 May 2026 20:20:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] dt-bindings: connector: Add fsl,io-connector binding
To: Frank Li <Frank.li@nxp.com>
Cc: "Chancel Liu (OSS)" <chancel.liu@oss.nxp.com>,
 Chancel Liu <chancel.liu@nxp.com>, "robh@kernel.org" <robh@kernel.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "festevam@gmail.com" <festevam@gmail.com>,
 "mturquette@baylibre.com" <mturquette@baylibre.com>,
 "sboyd@kernel.org" <sboyd@kernel.org>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
References: <20260509024846.2094049-1-chancel.liu@nxp.com>
 <20260509024846.2094049-3-chancel.liu@nxp.com>
 <20260515-resourceful-singing-roadrunner-ce25ec@quoll>
 <AM9PR04MB8353FE81D06852D45514E460E3032@AM9PR04MB8353.eurprd04.prod.outlook.com>
 <d2b13e51-1684-4acb-a5ed-294c8aa95906@kernel.org>
 <AM9PR04MB83538C4A07A6835FF8A74793E3002@AM9PR04MB8353.eurprd04.prod.outlook.com>
 <20260519-macho-degu-from-nibiru-960af2@quoll>
 <AM9PR04MB8353B563519EBC1AD6C5BFE1E3012@AM9PR04MB8353.eurprd04.prod.outlook.com>
 <e23a610f-e1ad-4536-80fb-8b5707e77f39@kernel.org>
 <ag3GMdmxw60B15Oe@lizhi-Precision-Tower-5810>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <ag3GMdmxw60B15Oe@lizhi-Precision-Tower-5810>
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

On 20/05/2026 16:33, Frank Li wrote:
> On Wed, May 20, 2026 at 09:08:42AM +0200, Krzysztof Kozlowski wrote:
>> On 20/05/2026 07:02, Chancel Liu (OSS) wrote:
>>>>>>>>> +description:
>>>>>>>>> +  The NXP I/O connector represents a physically present I/O
>>>>>>>>> +connector on the
>>>>>>>>> +  base board. It acts as a nexus that exposes a constrained set
>>>> of
>>>>>>>>> +I/O
>>>>>>>>> +  resources, such as GPIOs, clocks, PWMs and interrupts, through
>>>>>>>>> +fixed
>>>>>>>>> +  electrical wiring. All actual hardware providers reside on the
>>>> base
>>>>>> board.
>>>>>>>>> +  The connector node only defines index-based mappings to those
>>>>>>>> providers.
>>>>>>>>> +
>>>>>>>>> +properties:
>>>>>>>>> +  compatible:
>>>>>>>>> +    const: fsl,io-connector
>>>>>>>>
>>>>>>>> Everything is IO. Everything is connector, so your compatible does
>>>>>>>> not match requirements from writing bindings.
>>>>>>>>
>>>>>>>
>>>>>>> Yes, this compatible is too generic. I will rename the compatible to
>>>>>>> fsl,aud-io-connector.
>>>>>>
>>>>>> aud is not much better. Which boards have it? What's the pinout?
>>>> What's
>>>>>> standard? Is it described anywhere? If so, provide reference to
>>>> spec/docs.
>>>>>>
>>>>>
>>>>> This is not an industry standard electrical interface. This connector
>>>>
>>>> Then if you do not have standard, then you have board specific layouts
>>>> thus you need board-specific compatibles. You can use fallbacks. Generic
>>>> fallback could work, but both io-connector and aud-io-connector are just
>>>> too generic. Every connector is "connector" and "io", thus absolutely
>>>> anything can be "io-connector". "aud" improves it only a bit, thus
>>>> honestly I would go with board specific fallback as well.
>>>>
>>>
>>> How about board specific + common fallback compatible like this:
>>>   compatible:
>>>     items:
>>>       - enum:
>>>           - fsl,imx95-19x19-evk-aud-io-connector
>>>           - fsl,imx952-evk-aud-io-connector
>>>       - const: fsl,imx-aud-io-connector
>>> Since the daughter board is named “IMX-AUD-IO” in publicly available
>>
>> I don't think it is named like that.
>>
>> git grep -i imx-aud-io
>>
>>> documentation, common compatible clearly indicates that this connector
>>> is intended for that.
>>>
>>> Also, I want to talk about the topic of generic connector. It's a common
>>> design that daughter board is connected to base board through a
>>> connector. This connector more often acts as a nexus that exposes a
>>> constrained subset of GPIO, clock, PWM and interrupt resources to the
>>> daughter board. Can we document this kind of connector as a generic
>>> binding?
>>
>> So this binding is the connector between carrier and some addon? Then
>> you don't get a compatible for that at all, because it is not necessary,
>> not useful and NEVER used. Do you see socket LGA "connector" bindings? No.
> 
> Not exactly. Any connector connects a carrier board with an add-on board.
> The key point here is that this connector type is reused across different
> boards, even though it is not an industry-standard connector. Both the
> signal definitions and the mechanical layout are defined.
> 
> The same add-on boards can therefore be reused across different base boards
> that use this type of connector.
> 
> There are also GPIO mappings involved. For example, pin 1 on the connector
> may represent reset-gpios, but it could be connected to GPIO0 on board A
> and GPIO1 on board B.
> 
> Without a connector definition layer, this would create an N × M
> combination problem. The Nexus node discussion already covered this topic:
> https://osseu2025.sched.com/event/25Vrw
> 
> An LGA socket is a CPU socket, where the signals are completely transparent
> to software, so it is not a good comparison. A PCIe M.2 Key-M/E connector
> would be a more appropriate comparison.
>

So the terminology of daughter and carrier boards was confusing. If this
is a hat, mezzanine or other addon, it's fine.

I still insist on board specific compatibles - fallback and specific.

Best regards,
Krzysztof


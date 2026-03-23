Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59D05EC01A2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 08:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NtvUonViPZ2neVYMdPIgOh7c2KeVT1f1948ksdv7mxQ=; b=JBcQmdqz4PtHOjizRhTUvmtTsO
	oVJ6EpsMWIMItIOmmg6kvvzGsZFUtR8QbOL5NeZmcVP5wpENQ34l7bvmEge39RxIy8oq+8PCsRlaV
	9Y7trpbQgjtZZgoiaRx3erqzho/+AnpwB/4wHCDsJpYsbJyxJKNIIYTuTMZ+8Im+y7OOXHxYvIjgy
	YGpyHchL3iZsZOTWABsKf9r1iAIdniZWWr5Y1pvP1vT8bIafngOIT2LQ6yIiCcdn4qm4MaxLCqffe
	QJrBJobqlsazaewIj2OZDk71uRNnrc9psP+azG4wSSvgK6ei9n0CUTspBQH6iClR03r/cqk84J1sa
	iLHZG1Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4aKZ-0000000GFy6-0Lfl;
	Mon, 23 Mar 2026 08:08:11 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4aKW-0000000GFxk-1Ks5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 08:08:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4724C43A6F;
	Mon, 23 Mar 2026 08:08:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 885BBC4CEF7;
	Mon, 23 Mar 2026 08:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774253285;
	bh=hEphEpC79ndJUN7KnbSaTRh3DIHeZPTh+GT9RZ+7GiY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mwi6aywpH240nnTboNmf+q/vOisXvvkBb7SU2xAEUlKLGNo0r+tEhtyeRDmvxKKdU
	 nJyPovzpp/KN7zDpfPN/wHjPNZamuE0bMBvRJLhbIerD/ks5xd0M8x/usQKyM3opt9
	 D0SH5zrAHQOlDkjgu3SiyxugyLuPu5K2+OmWtcrXXt2cvyy1j1TWxa0TBXedB70VhW
	 nI3tHxqllivN0XK70I8IxDDZvbWiy7IUFgrsWeDNEn6PlEbh3JWK46xpoPazqCujUg
	 jqBrorUBszXuM11LZsCPbsyNMAs+CE7HjIT9GZx9lZfgm1D6yAdMUzLMzpwCjPtArX
	 vR1jBCIo17xUg==
Message-ID: <f3ff461b-edd7-423a-ac99-e70145aaaaea@kernel.org>
Date: Mon, 23 Mar 2026 09:07:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 01/10] dt-bindings: mfd: add support for the NXP SIUL2
 module
To: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>,
 Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>,
 Larisa Grigore <larisa.grigore@nxp.com>, Lee Jones <lee@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Aisheng Dong <aisheng.dong@nxp.com>,
 Jacky Bai <ping.bai@nxp.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>,
 Alberto Ruiz <aruizrui@redhat.com>, Christophe Lizzi <clizzi@redhat.com>,
 devicetree@vger.kernel.org, Enric Balletbo <eballetb@redhat.com>,
 Eric Chanudet <echanude@redhat.com>, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 linux-kernel@vger.kernel.org, NXP S32 Linux Team <s32@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Vincent Guittot <vincent.guittot@linaro.org>, Rob Herring <robh@kernel.org>
References: <20260120115923.3463866-1-khristineandreea.barbulescu@oss.nxp.com>
 <20260120115923.3463866-2-khristineandreea.barbulescu@oss.nxp.com>
 <20260121021913.GA1704619-robh@kernel.org>
 <e956750b-0333-4465-b37e-5f460b5e092f@oss.nxp.com>
 <edc3a63a-8117-476f-9582-97ae31fefa96@kernel.org>
 <7d200097-51bc-4404-be8b-f536d0ecfc25@oss.nxp.com>
 <21531cdd-5ab9-493e-a722-61b98117e2c4@kernel.org>
 <22a5a072-847e-4cfd-8abd-e37163f73265@oss.nxp.com>
 <fe755e85-1558-4272-bdd4-af7a2038ab1f@kernel.org>
 <ba6140bf-237e-4099-af0c-ee404c1719cd@oss.nxp.com>
 <c7a59716-3d53-4787-b4ef-9674c2a4a9b5@kernel.org>
 <3c454da1-d949-4258-87ce-8b545000bf01@app.fastmail.com>
 <5f1b651b-1064-4280-a7e0-b7d66c396cde@oss.nxp.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <5f1b651b-1064-4280-a7e0-b7d66c396cde@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_010808_492946_7CD7AB85 
X-CRM114-Status: GOOD (  18.04  )
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

On 23/03/2026 08:57, Khristine Andreea Barbulescu wrote:
> On 3/14/2026 9:31 AM, Arnd Bergmann wrote:
>> On Fri, Mar 13, 2026, at 18:10, Krzysztof Kozlowski wrote:
>>> On 25/02/2026 10:40, Ghennadi Procopciuc wrote:
>>>> On 2/23/2026 3:14 PM, Krzysztof Kozlowski wrote:
>>>>>> there are no resources allocated specifically for nodes like
>>>>>> "nxp,s32g-siul2-syscfg". Their consumers are the pinctrl/gpio
>>>>>> driver and other drivers that read SoC‑specific information from
>>>>>> those shared registers.
>>>>>>  
>>>>>> My alternative is to keep two separate syscon providers for the
>>>>>
>>>>> You got review already.
>>>>>
>>>> I still believe that nvmem is a suitable and accurate mechanism for
>>>> describing SoC‑specific identification information, as originally
>>>> proposed in [0], assuming the necessary adjustments are made.
>>>>
>>>> More specifically, instead of modeling software-defined cells, the nvmem
>>>> layout would describe the actual hardware registers backing this
>>>> information. One advantage of this approach is that consumer nodes (for
>>>> example PCIe, Ethernet, or other IPs that need SoC identification data)
>>>> can reference these registers using the standard nvmem-cells /
>>>> nvmem-cell-names mechanism, without introducing custom, per-subsystem
>>>> bindings.
>>>
>>> nvmem is applicable only if this is NVMEM. Information about the soc is
>>> not NVMEM, unless this are blow out fuses / efuse. Does not look like,
>>> because SoC information is set probably during design phase, not board
>>> assembly.
>>
>> Agreed, nvmem clearly makes no sense here, the patch description
>> appears to accurately describe the MMIO area as hardware registers
>> with a fixed meaning rather than a convention for how the
>> memory is being used.
>>
>> That said, there is probably room for improvement, since some of
>> the register contents are read-only and could just be accessed
>> by the boot firmware in order to move the information into more
>> regular DT properties instead of defining bindings for drivers
>> to access the information in raw form.
>>
>>     Arnd
> 
> Hi Krzysztof & Arnd,
> 
> Assuming we drop the syscon approach entirely, for the SerDes
> presence information we could follow Arnd’s suggestion and have
> it provided by the boot firmware instead of exposing it through SIUL2.

I think there is misunderstanding. By dropping syscon nodes, I meant to
drop the nodes. Remove them. It implies that whatever their contain must
go somewhere, right? Because your hardware is fixed and you cannot drop
it from the hardware, right?

So their parent node is the syscon.

Best regards,
Krzysztof


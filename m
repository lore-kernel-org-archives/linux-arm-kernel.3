Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38A8FCAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Oct 2025 05:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/a1vtxWIgNLcFVPs8QwPqCeym869U4nlwPRqGB8TRiM=; b=cntNn8aplbDpNwjf3k3oN/CN30
	a1hs+A2O0UeCvlqN0EvM1BvEzyeM0FUFlMCIcSRUbAnU5VPuMh7sMs3KJgrmJFydtb7vJz4lOV9Lk
	xB/WmtGQ6hEVryU596of+fkMWk0wSjeOtJhWAdgdMsUoL9QJCEVgTqCahIYtv6IvReAZlYPxP7Pur
	rXGE/jmj/X51QRW8ubtRzdRm/n2i2KWZFkbEJOdG2akmbr07eksWBLrZBWeOeic32UWhnoBj0o9ob
	Qr5jxKrRvyi5YgTvFIPV1e1AruMNyTHtKg4mQjYrUtuVLwrLCFBHFpA7QALjUhrmHjmwGcnthElg8
	ki++E/5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4Bqv-00000009eFa-1GQw;
	Thu, 02 Oct 2025 05:27:41 +0000
Received: from freeshell.de ([116.202.128.144])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4Bqs-00000009eF4-0jHZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Oct 2025 05:27:39 +0000
Received: from [192.168.2.54] (unknown [98.97.27.149])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id 67423B22008E;
	Thu,  2 Oct 2025 07:27:28 +0200 (CEST)
Message-ID: <694a3d9e-4096-4782-a918-42d033737fbd@freeshell.de>
Date: Wed, 1 Oct 2025 22:27:26 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] dts: arm64: freescale: move imx9*-clock.h
 imx9*-power.h into dt-bindings
To: Peng Fan <peng.fan@nxp.com>, Marek Vasut <marek.vasut@mailbox.org>,
 "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Abel Vesa <abelvesa@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
References: <20250831200516.522179-1-e@freeshell.de>
 <20250901032203.GA393@nxa18884-linux.ap.freescale.net>
 <3a165d77-3e36-4c0d-a193-aa9b27e0d523@mailbox.org>
 <05f7d69a-9c05-4b47-ab04-594c37e975eb@kernel.org>
 <51daddc4-1b86-4688-98cb-ef0f041d4126@mailbox.org>
 <8920d24b-e796-4b02-b43b-8a5deed3e8fb@kernel.org>
 <be2fc937-b7a6-49a7-b57d-6e3f16f4ccc3@mailbox.org>
 <20250904093442.GA13411@nxa18884-linux.ap.freescale.net>
 <afe58aa6-0c3e-4508-8133-8e7621a0484a@mailbox.org>
 <PAXPR04MB845970863A16718967270D1A880EA@PAXPR04MB8459.eurprd04.prod.outlook.com>
Content-Language: en-US
From: E Shattow <e@freeshell.de>
In-Reply-To: <PAXPR04MB845970863A16718967270D1A880EA@PAXPR04MB8459.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_222738_377291_9CCEE1B2 
X-CRM114-Status: GOOD (  16.15  )
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



On 9/10/25 00:07, Peng Fan wrote:
> Hi Marek,
> 
>> Subject: Re: [PATCH v1] dts: arm64: freescale: move imx9*-clock.h
>> imx9*-power.h into dt-bindings
>>
>> On 9/4/25 11:34 AM, Peng Fan wrote:
>>
>> Hi,
>>
>> sorry for my late reply.
>>
>>>> Instead of playing this "I found this code somewhere, so I can do
>>>>> whatever the same" answer the first implied question - why these
>> are
>>>>> bindings? Provide arguments what do they bind.
>>>>
>>>> I am not sure how to answer this, but what I can write is, that if I
>>>> scramble these IDs in either the DT or the firmware (which provides
>>>> the SCMI clock service), then the system cannot work. I am not sure
>>>> if this is the answer you are looking for.
>>>
>>> Marek,
>>>    Some U-Boot code indeed directly use the IDs to configure the clock
>> without
>>>    relying on any drivers. Since the SCMI IDs could not be moved to
>>> dt-bindings,
>>
>> Why can they not be moved to DT bindings ?
> 
> DT maintainers suggested to keep the files under
> arch/arm64/boot/dts/freescale/
> 
> https://lore.kernel.org/all/75ab9162-ed02-479d-92a1-7cfabff6b32e@linaro.org/
> 
> Regards
> Peng

Follow up FYI to all this is resolved from U-Boot [1] as not using the
header and duplicating the information.

1:
https://lore.kernel.org/u-boot/20250923-imx94-v1-5-cb3b65169048@oss.nxp.com/

There was yet some IRC discussion about what justification can be for
avoiding this maintenance and duplication.

I am dropping this suggestion to move imx9*-clock.h imx9*-power.h into
dt-bindings. There is some better way of doing this, maybe a future
dt-firmware includes? That is not at all my area of interest or
expertise, however. I just noticed something out-of-place and bring it
to our attention.

My great appreciation is due for the reviews and discussion about this.
Thanks, everyone!

-E


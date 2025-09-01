Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67056CA0FF0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 13:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MgiWuP3c65bTZ9tE31AXzilEYTYL4Y/48lvTM7BOs+M=; b=KlDA8QQ1cEIHr1zXrsJ0UPDtrq
	QBOQtPjexWgFMOy+YlZLEz+tfeqhfBwzxN4dJt3n1CgS32Qwd4SP1S6V9JV+rzv/Tj2R4Y3vRO1ar
	zS8BV+gENtxqXhHGwMrbevZkVE99hnLeVHLwfuhjZEchq7HLcA/NnX7v6Nuh4lEh/m1pld4tQMesL
	qHaGQRSPB2aUMjM8sF8lkOrCqXFriEKxw3BANjLQr66sCSEbt+FT6kyOmgkmv7zTUznwyutmXXoUp
	jShbeXophTyM9dyVEr7nxR98uQgCAMHzRV0TmDHkpHYdjTv3GNA3nemDS2QEzAmHWA/6zkAdj75OW
	ZAfYSkEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut4gx-0000000ChP6-2F5y;
	Mon, 01 Sep 2025 13:35:27 +0000
Received: from freeshell.de ([2a01:4f8:231:482b::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut2Nt-0000000C08r-2x1i
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 11:07:39 +0000
Received: from [192.168.2.54] (unknown [216.234.200.243])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id 7297BB2202BC;
	Mon,  1 Sep 2025 13:07:31 +0200 (CEST)
Message-ID: <ef9dab99-f14a-4b1e-883f-d2086435b8d5@freeshell.de>
Date: Mon, 1 Sep 2025 04:07:29 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] dts: arm64: freescale: move imx9*-clock.h
 imx9*-power.h into dt-bindings
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Marek Vasut <marek.vasut@mailbox.org>, Peng Fan <peng.fan@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Abel Vesa <abelvesa@kernel.org>,
 Peng Fan <peng.fan@nxp.com>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
References: <20250831200516.522179-1-e@freeshell.de>
 <20250901032203.GA393@nxa18884-linux.ap.freescale.net>
 <3a165d77-3e36-4c0d-a193-aa9b27e0d523@mailbox.org>
 <05f7d69a-9c05-4b47-ab04-594c37e975eb@kernel.org>
 <51daddc4-1b86-4688-98cb-ef0f041d4126@mailbox.org>
 <8920d24b-e796-4b02-b43b-8a5deed3e8fb@kernel.org>
Content-Language: en-US
From: E Shattow <e@freeshell.de>
In-Reply-To: <8920d24b-e796-4b02-b43b-8a5deed3e8fb@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_040737_922796_9B4E228E 
X-CRM114-Status: GOOD (  24.91  )
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



On 9/1/25 03:54, Krzysztof Kozlowski wrote:
> On 01/09/2025 12:30, Marek Vasut wrote:
>> On 9/1/25 5:33 AM, Krzysztof Kozlowski wrote:
>>> On 01/09/2025 04:22, Marek Vasut wrote:
>>>> On 9/1/25 5:22 AM, Peng Fan wrote:
>>>>> On Sun, Aug 31, 2025 at 01:04:45PM -0700, E Shattow wrote:
>>>>>> Move imx9*-{clock,power}.h headers into
>>>>>> include/dt-bindings/{clock,power}/ and fix up the DTs
>>>>>
>>>>> No. The files should be under arch/arm64/boot/dts/freescale/
>>>> Why ? Linux already has include/dt-bindings/clock/ and
>>>> include/dt-bindings/power directories for exactly those headers , why
>>>> did iMX9 suddenly start conflating them into arch/arm64/boot/dts/freescale ?
>>>
>>>
>>> Because maybe these are not bindings?
>>
>> Please compare arch/arm64/boot/dts/freescale/imx95-clock.h and 
>> include/dt-bindings/clock/imx8mp-clock.h and clarify to me, why the 
>> imx95-clock.h is not bindings and the imx8mp-clock.h is bindings.
> 
> That's uno reverse card. I do not have to prove why these are different.
> You need to prove why imx95 are bindings.
> 
>>
>> Both files list clock IDs for the clock nodes, one clock one is SCMI 
>> clock (iMX95), the other clock node is CCM clock (iMX8MP), and they are 
> 
> Yeah, entirely different things. Like comparing apples and oranges.
> 
>> both (SCMI and CCM) clock nodes in DT. Both header files may have to be 
>> included in drivers, the iMX8MP headers already are, the iMX95 headers 
> 
> No, the SCMI cannot be used in the drivers, because these are not
> abstract IDs mapping between driver and DTS.
> 
>> currently are included only in U-Boot drivers.
>>
>> I really don't see the difference here, sorry.
> 
> You just pointed out difference - no usage in drivers, no ABI!
> 
> Instead of playing this "I found this code somewhere, so I can do
> whatever the same" answer the first implied question - why these are
> bindings? Provide arguments what do they bind.
> 
>>
>>> Regardless whether you agree or
>>> not, the commit should clearly explain the reason behind.
>> Which commit ?
> 
> This patch.
> 
> 
> Best regards,
> Krzysztof

Providing some clarification, the user of this (in U-Boot) via
devicetree-rebasing leads to some path gymnastics:

(U-Boot code base) arch/arm/mach-imx/imx9/scmi/clock.c:9:#include
"../../../../../dts/upstream/src/arm64/freescale/imx95-clock.h"

Compared to the patterns of what else is going on I would guess this
should instead be:

#include <dt-bindings/clock/imx95-clock.h>

which agrees with how it is done for all the other closely similar build
targets and is less fragile in that build context (although you may not
be interested in this since it's not Linux kernel code base). Ideally
I'm trying to make U-Boot flexible to build against different locations
of devicetree-rebasing or perhaps Linux kernel source tree. This is a
"one thing is not like the others" moment and it was suggested I send a
patch.

Whatever is best I'm open to improve the commit message, or take what
you think ought to be fixed in U-Boot there to improve.

What do we expect users of devicetree-rebasing to do, then?

Thanks,

E Shattow


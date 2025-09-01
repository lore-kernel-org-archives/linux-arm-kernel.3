Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4DA9CA0FF0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 14:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r4CalwfjLTJxuiF2W2dJO24Rj4ba4D4I6pADG4VU2Mw=; b=TNAXzjG+1WJU5CtL3RyRLxaR3s
	DEyNSrP3JeHaTBG4ZgdBHN5SaPLPr1FLT/Q8J/l0JFE56qhqmfZNG8T/LnsSCc+/4eOa17aKNRho+
	LMVGDHWMYvdE64hKLTIcePHBnv/eNBcNFlsHwc2r7G7i2NayeyOGqoWK9UqZ4FxzErEcgveVJ6VzX
	6Fdvsn9U4s0w1E+XsAxLU328xrN2IGRJXAi+OBy5WEiiJp/ydAQTWQC0EYU/13mC0xaax/FIMwxvg
	V9nEu2h/e5HfzCQIfKOamsqgX62gqdgrylcxy+X+pwLB7nvs7oCBKJgvxalVvGaMLP+5TkZ7bE3bx
	hg0oE5OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut5of-0000000CsuL-3O52;
	Mon, 01 Sep 2025 14:47:29 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut3RN-0000000CHtw-39xj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 12:15:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 13D5C43210;
	Mon,  1 Sep 2025 12:15:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49BCAC4CEF0;
	Mon,  1 Sep 2025 12:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756728916;
	bh=skHDzNJEFTT/0Ypk/P72ToCddkHEoyFaGuJsmERB+qY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=iT37ow95R4l8fVbcVebTqVRkO85m9r9Mk5KUDTVaZfcx+x21y80is6AMAtRBDulEF
	 VPIpIShg19Fmk8Com7Dbi9JqLW8p8MOLe6SOqly4Fg8fU0S7x4V1wiofIVf6o7n4Bw
	 LyH3HF9MrYi+JLTga2R64ibKkoZaRA05JWWWOatlfXPO3u/Kew7av8GhUEb9oVAPyZ
	 Lt7V9niO611rp0DcyNySKhvuBZW6OGrROZUuYrRAMFVSzLMpyyK/QVN7kZ1JUZXUrf
	 YZF8xCnfBdqpU4KBVRt3nDmIccqgmCcs+6A2X208pkqkVQL8zTKutBsVedGe8C1Z0j
	 1HZWdY6tuw13A==
Message-ID: <3fb8bf7d-a57a-47ac-b754-0e2bfe4a30d0@kernel.org>
Date: Mon, 1 Sep 2025 14:15:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] dts: arm64: freescale: move imx9*-clock.h
 imx9*-power.h into dt-bindings
To: E Shattow <e@freeshell.de>, Marek Vasut <marek.vasut@mailbox.org>,
 Peng Fan <peng.fan@oss.nxp.com>
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
 <ef9dab99-f14a-4b1e-883f-d2086435b8d5@freeshell.de>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <ef9dab99-f14a-4b1e-883f-d2086435b8d5@freeshell.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_051517_835925_A6D57C2A 
X-CRM114-Status: GOOD (  27.42  )
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

On 01/09/2025 13:07, E Shattow wrote:
> 
> 
> On 9/1/25 03:54, Krzysztof Kozlowski wrote:
>> On 01/09/2025 12:30, Marek Vasut wrote:
>>> On 9/1/25 5:33 AM, Krzysztof Kozlowski wrote:
>>>> On 01/09/2025 04:22, Marek Vasut wrote:
>>>>> On 9/1/25 5:22 AM, Peng Fan wrote:
>>>>>> On Sun, Aug 31, 2025 at 01:04:45PM -0700, E Shattow wrote:
>>>>>>> Move imx9*-{clock,power}.h headers into
>>>>>>> include/dt-bindings/{clock,power}/ and fix up the DTs
>>>>>>
>>>>>> No. The files should be under arch/arm64/boot/dts/freescale/
>>>>> Why ? Linux already has include/dt-bindings/clock/ and
>>>>> include/dt-bindings/power directories for exactly those headers , why
>>>>> did iMX9 suddenly start conflating them into arch/arm64/boot/dts/freescale ?
>>>>
>>>>
>>>> Because maybe these are not bindings?
>>>
>>> Please compare arch/arm64/boot/dts/freescale/imx95-clock.h and 
>>> include/dt-bindings/clock/imx8mp-clock.h and clarify to me, why the 
>>> imx95-clock.h is not bindings and the imx8mp-clock.h is bindings.
>>
>> That's uno reverse card. I do not have to prove why these are different.
>> You need to prove why imx95 are bindings.
>>
>>>
>>> Both files list clock IDs for the clock nodes, one clock one is SCMI 
>>> clock (iMX95), the other clock node is CCM clock (iMX8MP), and they are 
>>
>> Yeah, entirely different things. Like comparing apples and oranges.
>>
>>> both (SCMI and CCM) clock nodes in DT. Both header files may have to be 
>>> included in drivers, the iMX8MP headers already are, the iMX95 headers 
>>
>> No, the SCMI cannot be used in the drivers, because these are not
>> abstract IDs mapping between driver and DTS.
>>
>>> currently are included only in U-Boot drivers.
>>>
>>> I really don't see the difference here, sorry.
>>
>> You just pointed out difference - no usage in drivers, no ABI!
>>
>> Instead of playing this "I found this code somewhere, so I can do
>> whatever the same" answer the first implied question - why these are
>> bindings? Provide arguments what do they bind.
>>
>>>
>>>> Regardless whether you agree or
>>>> not, the commit should clearly explain the reason behind.
>>> Which commit ?
>>
>> This patch.
>>
>>
>> Best regards,
>> Krzysztof
> 
> Providing some clarification, the user of this (in U-Boot) via
> devicetree-rebasing leads to some path gymnastics:
> 
> (U-Boot code base) arch/arm/mach-imx/imx9/scmi/clock.c:9:#include
> "../../../../../dts/upstream/src/arm64/freescale/imx95-clock.h"

Why nothing like this was described in the commit msg? We really do not
need lengthy discussions to discover the basic needs why patch is being
sent.

Anyway, U-boot driver requesting clocks in C code not via DTS is the
culprit here and not necessarily right approach.

> 
> Compared to the patterns of what else is going on I would guess this
> should instead be:
> 
> #include <dt-bindings/clock/imx95-clock.h>
> 
> which agrees with how it is done for all the other closely similar build
> targets and is less fragile in that build context (although you may not
> be interested in this since it's not Linux kernel code base). Ideally
> I'm trying to make U-Boot flexible to build against different locations
> of devicetree-rebasing or perhaps Linux kernel source tree. This is a
> "one thing is not like the others" moment and it was suggested I send a
> patch.

Why instead not fixing U-boot and not taking these via DT property, like
every other case? see include/clk.h for the API.

> 
> Whatever is best I'm open to improve the commit message, or take what
> you think ought to be fixed in U-Boot there to improve.

You should rather align with other U-boot maintainers and contributors
how clock consumers should be written. Proposed patches depend on that
outcome. If you just ask me, then I am telling you the same - requesting
clocks by consumers should be via DT, not via C code. Someone just added
ABI for driver consumers, not even providers...

Best regards,
Krzysztof


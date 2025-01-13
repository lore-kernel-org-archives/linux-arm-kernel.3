Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9BBFE7719F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 11:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9ERGR8dP0B+c7V85+mnkhP0f9o6QzzMxgWRVM6WJHLU=; b=QFOiSnWg2DKbyhGLLGMzqa6YeU
	ExIOANxDTjxwzdf2qlG2uU/bIHDI8uLJ53mQqRcRRveaBCrAhnZ+aKjkTc9ZCls+sx9fGv2NT/Vxr
	cEG/Q8pDt5eMLyOvNQzzasgmaGaqxyWAY0q2FaPrl9XEO3vlNULZdXEkmew/vsuyP+eOiXBbEEssA
	ogenI+he8tkxYkRmhHz+rHZu14fE5hs/hWCz1n7z4IxOETF3wo9tgchqOlppxmmovsn+XFJn5WTL8
	0cBzoNkLTDV4w9FnXgiDhDQWq1zUTTWNUTnHhHr1h7gMIkhy0xQyibzMEoySpMrz94dMCI8oSOfsE
	qbs1ZrOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXIRH-00000004sGV-0JIR;
	Mon, 13 Jan 2025 11:16:59 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXIQ3-00000004sBE-1CgZ;
	Mon, 13 Jan 2025 11:15:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 44BB65C54D0;
	Mon, 13 Jan 2025 11:15:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26A53C4CED6;
	Mon, 13 Jan 2025 11:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736766941;
	bh=kiAl0Orq62GNHYsnLzi0tHTsX57qkEmoeq2JoqLDODA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CHLmBUpc9bFAia2rJKwJPFbR5eNafdTO1HJyQ5Rd7ruDrAMZ1omH3pUJBp8fanZ+x
	 xHH3WDt1s55oczPRUQzqs+uqJqWN/MrUwRIBp6KcugDXdCkCNdffa2cqE5DsX5vhtO
	 fADLe7cvT3lFu3P/txprfnrsGoCq9sxa8tL7rlCf4zAd7NiBn3b3vSUBLup932wd0I
	 06dIv4mgPw9G+jTreFd5ZQajgJYzOe3c5C+USNj7LoWjopgGUA0Vg5rCyxLXeiYVT5
	 xAa43H2ij5adFiVCvdIiY5bPiuK4dHXWm3dge9kLjqDSoWXk+vtJj7Y0KBxvGj4snM
	 zxBiVXjDMymjg==
Message-ID: <69b42fb4-75c7-478d-8c15-ba3eb287b136@kernel.org>
Date: Mon, 13 Jan 2025 12:15:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/12] dt-bindings: clk: sunxi-ng: add V853 CCU
 clock/reset
To: wens@csie.org
Cc: Andras Szemzo <szemzo.andras@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Maxime Ripard <mripard@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20250110123923.270626-1-szemzo.andras@gmail.com>
 <20250110123923.270626-7-szemzo.andras@gmail.com>
 <de280eed-bcc8-4802-9734-5e95ad1f6611@kernel.org>
 <CAGb2v65arvBMg+reReVqK-Y6dL+CSrSx4618msiRKcNf=Vk1=A@mail.gmail.com>
 <fef71e03-489f-4503-9d1b-d61051d45dde@kernel.org>
 <CAGb2v67_yMB_4SCjFOR5S6nDxX9=zbX-mDM6YjjL_NRxrEMUFg@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <CAGb2v67_yMB_4SCjFOR5S6nDxX9=zbX-mDM6YjjL_NRxrEMUFg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_031543_413654_2FF49278 
X-CRM114-Status: GOOD (  18.67  )
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

On 13/01/2025 09:45, Chen-Yu Tsai wrote:
> On Mon, Jan 13, 2025 at 4:21 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>
>> On 13/01/2025 09:06, Chen-Yu Tsai wrote:
>>> On Fri, Jan 10, 2025 at 9:56 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>>>
>>>> On 10/01/2025 13:39, Andras Szemzo wrote:
>>>>> As the device tree needs the clock/reset indices, add them to DT binding
>>>>> headers.
>>>>>
>>>>> Signed-off-by: Andras Szemzo <szemzo.andras@gmail.com>
>>>>
>>>> That's never a separate commit from the binding.
>>>>
>>>>
>>>> ...
>>>>
>>>>> --- /dev/null
>>>>> +++ b/include/dt-bindings/clock/sun8i-v853-r-ccu.h
>>>>> @@ -0,0 +1,16 @@
>>>>> +/* SPDX-License-Identifier: (GPL-2.0+ OR MIT) */
>>>>> +/* Copyright(c) 2020 - 2023 Allwinner Technology Co.,Ltd. All rights reserved.
>>>>> + *
>>>>> + * Copyright (C) 2023 rengaomin@allwinnertech.com
>>>>> + */
>>>>> +#ifndef _DT_BINDINGS_CLK_SUN8I_V85X_R_CCU_H_
>>>>> +#define _DT_BINDINGS_CLK_SUN8I_V85X_R_CCU_H_
>>>>> +
>>>>> +#define CLK_R_TWD            0
>>>>> +#define CLK_R_PPU            1
>>>>> +#define CLK_R_RTC            2
>>>>> +#define CLK_R_CPUCFG         3
>>>>> +
>>>>> +#define CLK_R_MAX_NO         (CLK_R_CPUCFG + 1)
>>>>
>>>> Nope, drop. Not a binding.
>>>>
>>>>> +
>>>>> +#endif
>>>>> diff --git a/include/dt-bindings/reset/sun8i-v853-ccu.h b/include/dt-bindings/reset/sun8i-v853-ccu.h
>>>>> new file mode 100644
>>>>> index 000000000000..89d94fcbdb55
>>>>> --- /dev/null
>>>>> +++ b/include/dt-bindings/reset/sun8i-v853-ccu.h
>>>>> @@ -0,0 +1,62 @@
>>>>> +/* SPDX-License-Identifier: (GPL-2.0+ OR MIT) */
>>>>
>>>> Odd license. Did you copy the file with such license from the downstream?
>>>
>>> AFAIK all the existing sunxi clock / reset binding header files are
>>> dual licensed. OOTH all the YAML files are GPL 2.0 only.
>>>
>>> IIRC we started out GPL 2.0 only, but then figured that the header files
>>> couldn't be shared with non-GPL projects, so we changed those to dual
>>> license.
>>>
>>> Hope that explains the current situation. Relicensing the whole lot
>>> to just MIT or BSD is probably doable.
>> That's not what the comment is about. Dual license, as expressed by
>> submitting bindings/patches and enforced by checkpatch are expected. But
>> not GPLv3, GPLv4 and GPLv10.
> 
> I take back my statement. It seems we have a lot of GPLv2 or later going on.

There are a lot of bugs, so we can add them as well?

> 
> include/dt-bindings/clock/sun20i-d1-ccu.h:/* SPDX-License-Identifier:
> (GPL-2.0+ OR MIT) */
> include/dt-bindings/clock/sun20i-d1-r-ccu.h:/*
> SPDX-License-Identifier: (GPL-2.0+ OR MIT) */
> include/dt-bindings/clock/sun50i-a100-ccu.h:/*
> SPDX-License-Identifier: (GPL-2.0+ OR MIT) */
> include/dt-bindings/clock/sun50i-a100-r-ccu.h:/*
> SPDX-License-Identifier: GPL-2.0 */
> include/dt-bindings/clock/sun50i-h6-ccu.h:/* SPDX-License-Identifier:
> (GPL-2.0+ OR MIT) */
> include/dt-bindings/clock/sun50i-h6-r-ccu.h:/*
> SPDX-License-Identifier: GPL-2.0 */
> include/dt-bindings/clock/sun50i-h616-ccu.h:/*
> SPDX-License-Identifier: (GPL-2.0+ OR MIT) */
> include/dt-bindings/clock/sun5i-ccu.h:/* SPDX-License-Identifier:
> GPL-2.0-or-later */
> include/dt-bindings/clock/sun6i-rtc.h:/* SPDX-License-Identifier:
> (GPL-2.0+ OR MIT) */
> include/dt-bindings/clock/sun8i-de2.h: * SPDX-License-Identifier:
> (GPL-2.0+ OR MIT)
> include/dt-bindings/clock/sun8i-tcon-top.h:/* SPDX-License-Identifier:
> (GPL-2.0+ OR MIT) */
> include/dt-bindings/clock/suniv-ccu-f1c100s.h:/*
> SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> include/dt-bindings/reset/sun20i-d1-ccu.h:/* SPDX-License-Identifier:
> (GPL-2.0+ OR MIT) */
> include/dt-bindings/reset/sun20i-d1-r-ccu.h:/*
> SPDX-License-Identifier: (GPL-2.0+ OR MIT) */
> include/dt-bindings/reset/sun50i-a100-ccu.h:/*
> SPDX-License-Identifier: (GPL-2.0+ OR MIT) */
> include/dt-bindings/reset/sun50i-a100-r-ccu.h:/*
> SPDX-License-Identifier: (GPL-2.0+ OR MIT) */
> include/dt-bindings/reset/sun50i-h6-ccu.h:/* SPDX-License-Identifier:
> (GPL-2.0+ OR MIT) */
> include/dt-bindings/reset/sun50i-h6-r-ccu.h:/*
> SPDX-License-Identifier: (GPL-2.0+ OR MIT) */
> include/dt-bindings/reset/sun50i-h616-ccu.h:/*
> SPDX-License-Identifier: (GPL-2.0+ OR MIT) */
> include/dt-bindings/reset/sun5i-ccu.h:/* SPDX-License-Identifier:
> GPL-2.0-or-later */
> include/dt-bindings/reset/sun8i-de2.h: * SPDX-License-Identifier:
> (GPL-2.0+ OR MIT)
> include/dt-bindings/reset/suniv-ccu-f1c100s.h:/*
> SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> 
> Is there a requirement that new files have to be GPL 2.0 only, not
> GPL 2.0 or later?

I think that's obvious preference and brought to the list multiple times
already. And that's easy to justify reversing the question: why would
GPLv4 be okay here? If you can find the reason, sure we can go with
2.0+. If you cannot find the reason, well, it's obvious, right?

Best regards,
Krzysztof


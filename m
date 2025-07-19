Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29656C83F27
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Jul 2025 13:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i1DpSAcRBpXsXHiMwXxELh7OdvhsQDwHWSJlfHQ2b+A=; b=Ryp55m8zNE9ZEhjJwQ/qEfXHWh
	h6531bJ7VBMqFs8m3JL5RReQxr+2dbS0SilUrjkr2DXKV3sXNBoY29ZjxQoxZsU5abHb/8KtBtU0Y
	VNEW/NdNB+qObR/l4nhVbT+Wzk37OktvlWS4w0HDPx+sWQ4vt1JUP/z8hH3ZaE0l4d7xU3Fa9M3xW
	0ZR6o9dnDjAWq0AIluTRiJrSwPyxWzYlGz9BHHBe7WMqiZGl6zhpXF2v+d11Lb85tMlI2dzGMvown
	7/VdAY+0KoBvMPBW0dUPIaH0mwHKTf1VKhj4Pl81h0dRYDqJu4tUvn523R+4zwhODa8BU5Mcwt+qc
	V4X4cpQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ud7Qq-0000000EIKn-1Fma;
	Sat, 19 Jul 2025 13:16:52 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ud78N-0000000EGhN-2b2h
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Jul 2025 12:57:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8ED0DA53990;
	Sat, 19 Jul 2025 12:57:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D56FC4CEE3;
	Sat, 19 Jul 2025 12:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752929866;
	bh=C37ie8I+20jkjConEf+5/eKxSa7Tx/KOav8UbMQf704=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jXg9BoHTkrXiMC1Pu4Xx63OY4txlLPVfqDoPW8+rAwgY4KYJ5FRtMkkCHC1gZ5G2J
	 Xrc/Q5JAA723pP0cTOovmNBwdENUYnElmVoX8GvqJY793dZYwUhJCXo/xa9lf4h3XY
	 ap2rFNFvAmSf2F3TBOpSuBNrzkQDz5wVuuT99uJwVC/3YNtQh1BYlvmtxkN/VjwEIM
	 ldnaIFVtbyDLvOrhyyQ9o5dpdzE5JZmvlxhyupDUriINIb3FkqhO3OwDdR3nvbBbNp
	 kpOdS4ojfgAqsOX+4U5Kz8nLwO/mGZ7pJqMcLmaBqZHTdXFaChaP8vSB1DDX54eUDa
	 p7CgfqmR7PvUQ==
Message-ID: <a67fcfc9-e708-47db-8605-e20a8b54b0d1@kernel.org>
Date: Sat, 19 Jul 2025 14:57:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 05/10] mfd: Add Apple Silicon System Management
 Controller
To: Lee Jones <lee@kernel.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
 Linus Walleij <linus.walleij@linaro.org>, Sebastian Reichel
 <sre@kernel.org>, Janne Grunau <j@jannau.net>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>,
 Hector Martin <marcan@marcan.st>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Marc Zyngier <maz@kernel.org>,
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org
References: <20250610-smc-6-15-v7-0-556cafd771d3@kernel.org>
 <20250610-smc-6-15-v7-5-556cafd771d3@kernel.org>
 <20250619114958.GJ587864@google.com>
 <f30406ae-90ed-4f81-9519-e6ae2dcc9e03@kernel.org>
 <20250624155340.GL795775@google.com>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <20250624155340.GL795775@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250719_055747_794020_14D726AF 
X-CRM114-Status: GOOD (  19.47  )
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

On 24.06.25 17:53, Lee Jones wrote:
> On Sat, 21 Jun 2025, Sven Peter wrote:
> 
>> On 19.06.25 13:49, Lee Jones wrote:
>>> On Tue, 10 Jun 2025, Sven Peter wrote:
>>>
>>>> The System Management Controller (SMC) on Apple Silicon machines is a
>>>> piece of hardware that exposes various functionalities such as
>>>> temperature sensors, voltage/power meters, shutdown/reboot handling,
>>>> GPIOs and more.
>>>>
>>>> Communication happens via a shared mailbox using the RTKit protocol
>>>> which is also used for other co-processors. The SMC protocol then allows
>>>> reading and writing many different keys which implement the various
>>>> features. The MFD core device handles this protocol and exposes it
>>>> to the sub-devices.
>>>>
>>>> Some of the sub-devices are potentially also useful on pre-M1 Apple
>>>> machines and support for SMCs on these machines can be added at a later
>>>> time.
>>>>
>>>> Co-developed-by: Hector Martin <marcan@marcan.st>
>>>> Signed-off-by: Hector Martin <marcan@marcan.st>
>>>> Reviewed-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
>>>> Reviewed-by: Neal Gompa <neal@gompa.dev>
>>>> Signed-off-by: Sven Peter <sven@kernel.org>
>>>> ---
>>>>    MAINTAINERS                |   2 +
>>>>    drivers/mfd/Kconfig        |  18 ++
>>>>    drivers/mfd/Makefile       |   1 +
>>>>    drivers/mfd/macsmc.c       | 498 +++++++++++++++++++++++++++++++++++++++++++++
>>>>    include/linux/mfd/macsmc.h | 279 +++++++++++++++++++++++++
>>>>    5 files changed, 798 insertions(+)
>>>
>>> This is ready.  Let me know when you have all of the other driver/* Acks.
>>>
>>
>> They've all been reviewed by the respective maintainers.
>>
>> I assume you want to take this all through the mfd tree and we'll need acks
>> from Sebastian for power/reset and either Linus or Bartosz for gpio then.
> 
> That's right.

Can you maybe comment on 
https://lore.kernel.org/asahi/20250610-smc-6-15-v7-0-556cafd771d3@kernel.org/T/#m25fe0bd8fe5fa47ed63f4238da80d7186a65450c?

A sub device declared with

MFD_CELL_OF("macsmc-reboot", NULL, NULL, 0, 0, "apple,smc-reboot")

is picked up even if there's no corresponding node in the device tree.
Is this expected behavior for mfd? There are some pre-M1 iDevices that 
also have a variant of SMC that doesn't have the reboot functionality.
We can always special case it with a different compatible but just 
dropping the sub-node from the device tree would've been neat.

> 
>> The one line change inside drivers/soc/apple would usually go through my
>> tree and I'm fine with taking that through mfd instead.
> 
> If there are no build-time dependencies on it, you can take it.

Okay, I've picked it up now.

> 
> I'm happy to take only the inter-dep ones or all (except the arch/ ones).
>

Sure, I'll take those as well once the dt-bindings are in.


Thanks,

Sven




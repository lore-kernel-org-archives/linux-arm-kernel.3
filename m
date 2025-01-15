Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B93FBC02183
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 09:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KX1cl8kFkV6v3FlomDcouieETC7cwlRt/6lNc9r/WBI=; b=haZ6A3MUCVoB01mRmhrWobGmy6
	sotu1pAkbVYQTm0e6UOpt/uyg9390NlqCImCBkdEjw++5Sup0YH69uGVryKCOORWqxREDOsF3xTqx
	XlWyev3tjpd2eXXDIFepYK1LUaOVdF9VbOFD+jheA0r5BAQ5NKYZBIlL4XLpswPMsV39Z7zply82+
	6/qC7/AtwOQg9QHvO+w0VGU5aSYoVTIwD13hZ6LbHmCKaHMpkvEliJ5vMVLVi9qgS6/E4QW0aDsQI
	mTlNI44T0wQb69WI9u5H2hCqWA0Sxbm1VzJJ2O9ZX/0WyeNa6pFhLz4ISk5KBHiQ5MrVf1oILLklT
	/6zBrdiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXzfk-0000000BJWf-0Roi;
	Wed, 15 Jan 2025 09:26:48 +0000
Received: from mx3.molgen.mpg.de ([141.14.17.11])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXzbu-0000000BILs-2GaS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 09:22:52 +0000
Received: from [192.168.0.2] (ip5f5af1b4.dynamic.kabel-deutschland.de [95.90.241.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 9D6D261E64783;
	Wed, 15 Jan 2025 10:22:10 +0100 (CET)
Message-ID: <990a3fc9-7fd6-49b6-8918-d5bf4ae48953@molgen.mpg.de>
Date: Wed, 15 Jan 2025 10:22:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v7 3/3] net: stmmac: dwmac-nuvoton: Add dwmac
 glue for Nuvoton MA35 family
To: Joey Lu <a0987203069@gmail.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, mcoquelin.stm32@gmail.com, richardcochran@gmail.com,
 devicetree@vger.kernel.org, ychuang3@nuvoton.com, netdev@vger.kernel.org,
 openbmc@lists.ozlabs.org, alexandre.torgue@foss.st.com,
 linux-kernel@vger.kernel.org, joabreu@synopsys.com,
 Andrew Lunn <andrew@lunn.ch>, schung@nuvoton.com, peppe.cavallaro@st.com,
 yclu4@nuvoton.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
References: <20250113055434.3377508-1-a0987203069@gmail.com>
 <20250113055434.3377508-4-a0987203069@gmail.com>
 <a30b338f-0a6f-47e7-922b-c637a6648a6d@molgen.mpg.de>
 <2cf758f2-529e-4ccd-9dc1-18fc29ad5ac0@gmail.com>
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <2cf758f2-529e-4ccd-9dc1-18fc29ad5ac0@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_012250_719054_1B9CD66A 
X-CRM114-Status: GOOD (  17.30  )
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

Dear Joey,


Thank you for your prompt reply.


Am 15.01.25 um 10:03 schrieb Joey Lu:

> Paul Menzel 於 1/14/2025 9:49 AM 寫道:

[…]

>> Am 13.01.25 um 00:54 schrieb Joey Lu:
>>> Add support for Gigabit Ethernet on Nuvoton MA35 series using dwmac 
>>> driver.

[…]

>> Also, please document how tested the driver. Maybe even paste new log 
>> messages.
> 
> These are the kernel configurations for testing the MA35D1 GMAC driver: 
> ARCH_MA35, STMMAC_PLATFORM, DWMAC_NUVOTON.
> 
> I'm not sure if this information is sufficient, so please provide some 
> guidance on what else I should include to meet your requirements.

I’d be interested on what hardware you tested it. Probably some 
evaluation or customer reference board.

> I will include the log messages at the end of the email.

Awesome. Thank you. Personally, I also like to see those in the commit 
message.

>>> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
>>> Signed-off-by: Joey Lu <a0987203069@gmail.com>
>>
>> As you use your company email address in the AUTHOR line below, please 
>> also add that email address to the commit message (and maybe even as 
>> the author).
>
> I will update the AUTHOR to use my personal email address instead of the 
> company email.

Understood. (yclu4@nuvoton.com is also personal, but the Gmail address 
is private, I guess. ;-)).

For statistics, how companies contribute to the Linux kernel, having the 
company address somewhere would be nice though, as you are doing this as 
your work at Nuvoton, right?

>>> ---
>>>   drivers/net/ethernet/stmicro/stmmac/Kconfig   |  11 ++
>>>   drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
>>>   .../ethernet/stmicro/stmmac/dwmac-nuvoton.c   | 179 ++++++++++++++++++
>>>   3 files changed, 191 insertions(+)
>>>   create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-nuvoton.c

[…]

> log:
> 
> [    T0] Booting Linux on physical CPU 0x0000000000 [0x411fd040]

Out of curiosity, how do you get these timestamps T0, T1, …?

[…]


Thank you and kind regards,

Paul


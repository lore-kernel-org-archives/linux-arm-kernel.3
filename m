Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B81A8C79FB7
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 15:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jiAuFX2yhbVwIrEUDOjZptkJ10gfAcRfLWBSK+Ulw8s=; b=XX0+tCjfg4JdYVY0/WK/5Le28z
	UQi1nIhrlXKbqRpQ9Whu3JoAuWboBlsN7loEsxW6uo8iEzwGGG93MmzO1hahbJiCX0xrThTu9t4J6
	LniEhxaeJV0NND/dPUWFNyfN7ViAl3ohwuffzZfINZUXrpebcRkiP0ecGX1YfTTQNwzWwHcS7JF+M
	4JfZ8Bong7MoZgG6gC8PIQ7w13pbbsgb2Xldpa5J36btt4AcTeKVrsy5O+MU4zkcjTfEyVM3jTsOd
	Wdu8JLWUtRr7+odWCVZzYlGRjGYCDDY8E8o12PJkdT98bL+x+wMptXvVYMmgPh7O+Hc4BiC5QLomE
	rPMIESNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4K2H-0000000C75c-08sd;
	Wed, 09 Sep 2026 15:16:29 +0000
Received: from mout-p-201.mailbox.org ([80.241.56.171])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4K2E-0000000C74s-2yem
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 15:16:28 +0000
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4hg4CC4vN5zMlBf;
	Wed, 09 Sep 2026 17:16:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1788966983;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jiAuFX2yhbVwIrEUDOjZptkJ10gfAcRfLWBSK+Ulw8s=;
	b=oHcGB58PEAY/eEODVUCOsfVRTJnW1I9HX6A3MoE/KJeN/ZmBVbQ8bA0IzGAcVvUZPevYaE
	Eky9UDQPE5GKe6hb8RcOWAJm1KjwmpRYw5wvwCi4VoEk5fQdf2/hTrVXQoXA96Iob42dmp
	g41jXMpQyzrA88r9qZwlrZd6uM1Y4f/mgtILMJa8wqtexLnBEQh/yuD8HUbS0jslls54uA
	dW51cgs5oX3ICW8H4AmygyrlnHYP41rz0aR1/aooKWTVEUiJ4+7RZvmn7FTgAvMjo2zRKz
	BcfUmOMlYHDN5u6sfSAOiSaOlmYF7TPSfkAbKMS6M0lQ9ledeviikUbZuqyjWw==
Message-ID: <c784aab5-c0c9-424f-9f9d-a0330f60a0ef@mailbox.org>
Date: Wed, 9 Sep 2026 17:16:21 +0200
MIME-Version: 1.0
Subject: Re: [PATCH] arm64: dts: renesas: sparrow-hawk: Add overlay for
 WaveShare 2CH CANFD HAT
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm
 <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
References: <20260808025724.131943-1-marek.vasut+renesas@mailbox.org>
 <CAMuHMdWvLX7OZSkfEBA34wKtnoZ4asB6rWFJiLa=2+=fezqsCA@mail.gmail.com>
 <f82ae578-fbe7-4834-bdde-d11e194a507f@mailbox.org>
 <CAMuHMdXQKL_srr80mUmsnznqJ_qxAoh0TdwyvJ41=CN=2pDjCQ@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <CAMuHMdXQKL_srr80mUmsnznqJ_qxAoh0TdwyvJ41=CN=2pDjCQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: yt4hfwetehfwg91nxg36oikoca5amr3u
X-MBO-RS-ID: 18cd9288ed520fa562f
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_081626_905866_7882CC06 
X-CRM114-Status: GOOD (  16.10  )
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

On 9/9/26 9:56 AM, Geert Uytterhoeven wrote:

Hello Geert,

> On Tue, 8 Sept 2026 at 19:02, Marek Vasut <marek.vasut@mailbox.org> wrote:
>> On 9/8/26 2:02 PM, Geert Uytterhoeven wrote:
>>>> +&pfc {
>>>> +       msiof0_pins: spi-ws-2ch-canfd0 {        /* SPI_0 */
>>>
>>> Node name should be "msiof0".
>>
>> Do we also have to fix up
>> arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts this:
>>
>> "
>>    755         msiof1_pins: sound {
>>                             ^^^^^
>> "
>> ?
> 
> Might be a good idea, to increase consistency.

Submitted as

[PATCH] arm64: dts: renesas: sparrow-hawk: Align MSIOF1 PFC node name 
with label

>> But I wonder, shouldn't the DTOs contain unique pinmux node names, which
>> cannot accidentally overlap with the base DT or other DTO node names ?
> 
> In general, the answer is yes.
> In this case it is about pin control subnodes. If the base DTS already
> uses msiof0, its original user needs to be disabled by the overlay
> anyway.

The original DTS does not use MSIOF0 .

I think the proper solution here would be DT connector ?

>>>> +               groups = "msiof0_clk", "msiof0_txd", "msiof0_rxd";
>>>> +               function = "msiof0";
>>>> +       };
>>>> +};
>>>> +
>>>> +/*
>>>> + * PWM1 uses PWM1_B pin configuration for pin GP2_13. This conflicts
>>>> + * with SPI_1 CE_1 signal which is also on pin GP2_13. Disable PWM1
>>>> + * in case this hat is in use.
>>>> + */
>>>> +&pwm1 {
>>>> +       status = "disabled";
>>>> +};
>>>
>>> Please move this node disabling pwm1 to the top, for compatibility
>>> with dynamic DT overlays.
>> Could you expand on that a bit ? What difference does the placement of
>> this node make within the DTSO ? Please pardon my ignorance.
> 
> In case of a dynamic overlay, pwm1 must be disabled before SPI_1 is
> probed.  Otherwise the latter will fail with -EBUSY due to the
> conflicting pin being still in use.

TIL, thank you.

-- 
Best regards,
Marek Vasut


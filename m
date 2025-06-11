Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE48CC71137
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 16:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gPwsajLBsNL8XA7/sk2C74g5jjpD7PSQHxW65bPJTD4=; b=J1EWf46Fe+YK/q16lOiBqKaegA
	vpvkU1KAM3PzJR7rQaIil37L3/o7cHGfl5MU/qiYa2uRzxEwViux6CfVXm75BF5h0f93BP+QN8yCD
	hpIkCOxfDmw5Cin2U+glfZPLU0bFsVpjvr2B2dGdmiVkiIKgKIAvDUCkP4RmnIAav56FzA1oV81JN
	1Q3RLjq+FeKfECY9Hoy0YhWWM4h7EDwa9sT4cHRKcxrcWr9wZTqursS74mwkUUast+Qip4NGdThzx
	H9Tt62cOLdl1pPc742Hg+Rw6s9Qi2Nq9VyeIWBnLr1I8W3PxiJTpQKjCn9taQ1fO2GxsehrtcAH+Y
	SY8bPWNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPORD-0000000Ad97-2hNY;
	Wed, 11 Jun 2025 16:36:31 +0000
Received: from out-69.smtpout.orange.fr ([193.252.22.69] helo=out.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPLKI-00000009w6e-2fhG;
	Wed, 11 Jun 2025 13:17:13 +0000
Received: from [172.16.82.72] ([124.33.176.97])
	by smtp.orange.fr with ESMTPA
	id PLK1uaf7zSZTqPLK3uQEoa; Wed, 11 Jun 2025 15:17:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1749647827;
	bh=gPwsajLBsNL8XA7/sk2C74g5jjpD7PSQHxW65bPJTD4=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=M17/FgXiTcdr7lS6G03JsO24EzLrPAbSaLdpabOS8KSO9ZEXvCwjxVSLQlhclwiey
	 GU56llktfNWO77AIbtJnO0IAiggrUGmaiUzv8Xmkw2DgB0RpdGc07IBsV0w1nsbXu8
	 fAXtlPWEo57EiI6hAVY6AQFCCwfdJ6BzRYW0kgC5C3yIIN6W5eFA9Fc3JLan2k8kHc
	 egUAG7bVTwa/EvSd4aaAKk/s2n6UNuFr5HTZgzxV3+RLRh3GYkYM20NYmhzLtOoyO6
	 HW0Pw9zzC3ok64XoPrHLF5ogesxujWXldaMR0SeWUqXPPz9UoJXWYF/7kr4W1ygWPl
	 fGi2IavEa67Cw==
X-ME-Helo: [172.16.82.72]
X-ME-Auth: bWFpbGhvbC52aW5jZW50QHdhbmFkb28uZnI=
X-ME-Date: Wed, 11 Jun 2025 15:17:07 +0200
X-ME-IP: 124.33.176.97
Message-ID: <e252f15f-ea80-4969-b754-82da5f9a7f56@wanadoo.fr>
Date: Wed, 11 Jun 2025 22:16:52 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] net: can: mcp251x: use new GPIO line value setter
 callbacks
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-can@vger.kernel.org,
 linux-arm-msm@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 "Chester A. Unal" <chester.a.unal@arinc9.com>,
 Daniel Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Marc Kleine-Budde <mkl@pengutronix.de>,
 Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>
References: <20250610-gpiochip-set-rv-net-v1-0-35668dd1c76f@linaro.org>
 <20250610-gpiochip-set-rv-net-v1-3-35668dd1c76f@linaro.org>
 <b2f87cff-3a81-482b-bfdd-389950b7ec8e@wanadoo.fr>
 <CAMRc=MfCwz3BV15aATr_5er7wU=AmKV=Z=sHJyrjEvLwx2cMjQ@mail.gmail.com>
 <b9ea7e0e-7dd1-460b-950a-083620dd52e9@wanadoo.fr>
 <CAMRc=Mf4qupdJEm9mWPF3-B3hprn6AvP7Po2=aQYbaSvFf8OeA@mail.gmail.com>
Content-Language: en-US
From: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Autocrypt: addr=mailhol.vincent@wanadoo.fr; keydata=
 xjMEZluomRYJKwYBBAHaRw8BAQdAf+/PnQvy9LCWNSJLbhc+AOUsR2cNVonvxhDk/KcW7FvN
 LFZpbmNlbnQgTWFpbGhvbCA8bWFpbGhvbC52aW5jZW50QHdhbmFkb28uZnI+wrIEExYKAFoC
 GwMFCQp/CJcFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AWIQTtj3AFdOZ/IOV06OKrX+uI
 bbuZwgUCZx41XhgYaGtwczovL2tleXMub3BlbnBncC5vcmcACgkQq1/riG27mcIYiwEAkgKK
 BJ+ANKwhTAAvL1XeApQ+2NNNEwFWzipVAGvTRigA+wUeyB3UQwZrwb7jsQuBXxhk3lL45HF5
 8+y4bQCUCqYGzjgEZx4y8xIKKwYBBAGXVQEFAQEHQJrbYZzu0JG5w8gxE6EtQe6LmxKMqP6E
 yR33sA+BR9pLAwEIB8J+BBgWCgAmFiEE7Y9wBXTmfyDldOjiq1/riG27mcIFAmceMvMCGwwF
 CQPCZwAACgkQq1/riG27mcJU7QEA+LmpFhfQ1aij/L8VzsZwr/S44HCzcz5+jkxnVVQ5LZ4B
 ANOCpYEY+CYrld5XZvM8h2EntNnzxHHuhjfDOQ3MAkEK
In-Reply-To: <CAMRc=Mf4qupdJEm9mWPF3-B3hprn6AvP7Po2=aQYbaSvFf8OeA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_061711_878181_6C65100F 
X-CRM114-Status: GOOD (  21.79  )
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

On 11/06/2025 at 01:05, Bartosz Golaszewski wrote:
> On Tue, Jun 10, 2025 at 5:48 PM Vincent Mailhol
> <mailhol.vincent@wanadoo.fr> wrote:
>>
>> On 10/06/2025 at 23:05, Bartosz Golaszewski wrote:
>>> On Tue, Jun 10, 2025 at 3:55 PM Vincent Mailhol
>>> <mailhol.vincent@wanadoo.fr> wrote:
>>>>
>>>> On 10/06/2025 at 21:37, Bartosz Golaszewski wrote:
>>>>> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>>>>
>>>>> struct gpio_chip now has callbacks for setting line values that return
>>>>> an integer, allowing to indicate failures. Convert the driver to using
>>>>> them.
>>>>>
>>>>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>>>                                       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>>>>
>>>> This does not match the address with which you sent the patch: brgl@bgdev.pl
>>>>
>>>>> ---
>>>>>  drivers/net/can/spi/mcp251x.c | 16 ++++++++++------
>>>>>  1 file changed, 10 insertions(+), 6 deletions(-)
>>>>>
>>>>> diff --git a/drivers/net/can/spi/mcp251x.c b/drivers/net/can/spi/mcp251x.c
>>>>> index ec5c64006a16f703bc816983765584c5f3ac76e8..7545497d14b46c6388f3976c2bf7b9a99e959c1e 100644
>>>>> --- a/drivers/net/can/spi/mcp251x.c
>>>>> +++ b/drivers/net/can/spi/mcp251x.c
>>>>> @@ -530,8 +530,8 @@ static int mcp251x_gpio_get_multiple(struct gpio_chip *chip,
>>>>>       return 0;
>>>>>  }
>>>>>
>>>>> -static void mcp251x_gpio_set(struct gpio_chip *chip, unsigned int offset,
>>>>> -                          int value)
>>>>> +static int mcp251x_gpio_set(struct gpio_chip *chip, unsigned int offset,
>>>>> +                         int value)
>>>>>  {
>>>>>       struct mcp251x_priv *priv = gpiochip_get_data(chip);
>>>>>       u8 mask, val;
>>>>> @@ -545,9 +545,11 @@ static void mcp251x_gpio_set(struct gpio_chip *chip, unsigned int offset,
>>>>>
>>>>>       priv->reg_bfpctrl &= ~mask;
>>>>>       priv->reg_bfpctrl |= val;
>>>>> +
>>>>> +     return 0;
>>>>
>>>> mcp251x_gpio_set() calls mcp251x_write_bits() which calls mcp251x_spi_write()
>>>> which can fail.
>>>>
>>>> For this change to really make sense, the return value of mcp251x_spi_write()
>>>> should be propagated all the way around.
>>>>
>>>
>>> I don't know this code so I followed the example of the rest of the
>>> codebase where the result of this function is never checked - even in
>>> functions that do return values. I didn't know the reason for this and
>>> so didn't want to break anything as I have no means of testing it.
>>
>> The return value of mcp251x_spi_write() is used in mcp251x_hw_reset(). In other
>> locations, mcp251x_spi_write() is only used in functions which return void, so
>> obviously, the return value is not checked.
>>
> 
> Wait, after a second look GPIO callbacks (including those that return
> a value like request()) use mcp251x_write_bits() which has no return
> value.

Yes. Read again my first message:

  mcp251x_gpio_set() calls mcp251x_write_bits() which calls mcp251x_spi_write()
  which can fail.

My point is that the grand father can fail.

> It probably should propagate what mcp251x_spi_write() returns

Exactly what I asked for :)

> but that's material for a different series.

Why? Are you going to do this other series?

If the answer is no, then please just do it here. Propagating the error in
mcp251x_write_bits() is a three line change. Am I asking for too much?

> The goal of this one is to
> use the new setters treewide and drop the old ones from struct
> gpio_chip.

Yours sincerely,
Vincent Mailhol


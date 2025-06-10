Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EC28C677C4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 19:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hLNYfBAm8Db4RivC9m4UtJY5EbKQApeN/nL5cCj0Ugs=; b=y6TgwGot16b8fsCEW2XCvu/3xD
	eUo1zLCVCHSRRKSKhCxq2P/8gSWMK+YX8RXlVbwexq0dXztvknJuAJDX2SEpcgJAfY5YCy4SjcijK
	H9R0NfelWAzjUcbfdlYfDatYDVYaFyz8yGXJUEqpKacPhAsLbkqzCF5z3njxFf5hYgykmWESd4lgz
	EdSgwRjt5oOdTsI3ixwggjE/rcQBMZv+BOpZ1HPEn/sHttsnY3RxQZg25wlPWX+HL6JSh8vYjfCu4
	LezHTmpi5tXGA8BSvzqG/V2JcVIbj4UxSGGOoYVFPNRAXummGyQpVVn0Y4ayPAW43fSa9dXp5L6xW
	aQT6wjWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP4dh-00000007v4z-0plx;
	Tue, 10 Jun 2025 19:28:05 +0000
Received: from out-71.smtpout.orange.fr ([193.252.22.71] helo=out.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP1DA-00000007NL7-0ZC7;
	Tue, 10 Jun 2025 15:48:30 +0000
Received: from [172.16.82.72] ([124.33.176.97])
	by smtp.orange.fr with ESMTPA
	id P1CsuQaoBVbicP1Cuu8707; Tue, 10 Jun 2025 17:48:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1749570505;
	bh=hLNYfBAm8Db4RivC9m4UtJY5EbKQApeN/nL5cCj0Ugs=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=EC83WCWq0Suc7xo7F75oL6tuLJhZcGgcA6T6SjE5M2HznAFXg+53/ja2YV2L9jlm4
	 67XAJYZjzNIulLfpR9HbVmuA69kx2uRbqwRC7P4itIvQxYL7jWvnqZIqoFwUBoyCaG
	 H3MPbtXKHrbdoEz3hjUlSsEwc2yUrPfZcdlFT5dWCWJJ/0qWSWULoXHqI8jwgTD9wt
	 +88473ymjTW0O1lA5aOjECvA7xFkyKjOqMpuNk4fIXCc5bKmdofVWaX8JRwPiGBEKr
	 AfmH/5enwlcQEMJBSCx3HPKFHMg8JhbUC/Q3N0I4p387Fb8+i1cIfr4CTBAhSvUx1/
	 QTmOlFNpa0KAw==
X-ME-Helo: [172.16.82.72]
X-ME-Auth: bWFpbGhvbC52aW5jZW50QHdhbmFkb28uZnI=
X-ME-Date: Tue, 10 Jun 2025 17:48:25 +0200
X-ME-IP: 124.33.176.97
Message-ID: <b9ea7e0e-7dd1-460b-950a-083620dd52e9@wanadoo.fr>
Date: Wed, 11 Jun 2025 00:48:09 +0900
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
In-Reply-To: <CAMRc=MfCwz3BV15aATr_5er7wU=AmKV=Z=sHJyrjEvLwx2cMjQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_084829_375568_03A08E86 
X-CRM114-Status: GOOD (  22.37  )
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

On 10/06/2025 at 23:05, Bartosz Golaszewski wrote:
> On Tue, Jun 10, 2025 at 3:55 PM Vincent Mailhol
> <mailhol.vincent@wanadoo.fr> wrote:
>>
>> On 10/06/2025 at 21:37, Bartosz Golaszewski wrote:
>>> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>>
>>> struct gpio_chip now has callbacks for setting line values that return
>>> an integer, allowing to indicate failures. Convert the driver to using
>>> them.
>>>
>>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>                                       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>>
>> This does not match the address with which you sent the patch: brgl@bgdev.pl
>>
>>> ---
>>>  drivers/net/can/spi/mcp251x.c | 16 ++++++++++------
>>>  1 file changed, 10 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/drivers/net/can/spi/mcp251x.c b/drivers/net/can/spi/mcp251x.c
>>> index ec5c64006a16f703bc816983765584c5f3ac76e8..7545497d14b46c6388f3976c2bf7b9a99e959c1e 100644
>>> --- a/drivers/net/can/spi/mcp251x.c
>>> +++ b/drivers/net/can/spi/mcp251x.c
>>> @@ -530,8 +530,8 @@ static int mcp251x_gpio_get_multiple(struct gpio_chip *chip,
>>>       return 0;
>>>  }
>>>
>>> -static void mcp251x_gpio_set(struct gpio_chip *chip, unsigned int offset,
>>> -                          int value)
>>> +static int mcp251x_gpio_set(struct gpio_chip *chip, unsigned int offset,
>>> +                         int value)
>>>  {
>>>       struct mcp251x_priv *priv = gpiochip_get_data(chip);
>>>       u8 mask, val;
>>> @@ -545,9 +545,11 @@ static void mcp251x_gpio_set(struct gpio_chip *chip, unsigned int offset,
>>>
>>>       priv->reg_bfpctrl &= ~mask;
>>>       priv->reg_bfpctrl |= val;
>>> +
>>> +     return 0;
>>
>> mcp251x_gpio_set() calls mcp251x_write_bits() which calls mcp251x_spi_write()
>> which can fail.
>>
>> For this change to really make sense, the return value of mcp251x_spi_write()
>> should be propagated all the way around.
>>
> 
> I don't know this code so I followed the example of the rest of the
> codebase where the result of this function is never checked - even in
> functions that do return values. I didn't know the reason for this and
> so didn't want to break anything as I have no means of testing it.

The return value of mcp251x_spi_write() is used in mcp251x_hw_reset(). In other
locations, mcp251x_spi_write() is only used in functions which return void, so
obviously, the return value is not checked.

> Can you confirm that you really want the result to be checked here?

That's the point of those new gpio setters, isn't it? If we do not check the
result, I do not understand the purpose of the migration.


Yours sincerely,
Vincent Mailhol



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F536C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jul 2025 15:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jd6WXK9KVAKuAai0Rlvgq64nX1IBqeA40jOYWtgY/NM=; b=NGR+AWaA5XpTXjAQ9xi7/wQrdi
	M7rboCr/732Z4v6/w4e7zbcCKT8peexXMzRxFWrovfiKAmOzqn1yE7736q447Oy9MIlSj1zB+Yrmd
	H2fPF8m8bMR3+sPawGkf08tWjBACFLmZ+KcRAwgEKtcrI9vNolufU7tf5Q3MLDNJmuYv46DB6zyhU
	xIqPcBv4I38OnJWW+rYWHl69YB675VbGnw4mow6F/J9OysnQKLiO5Jjk/QNlNNsfs4OlN3LEITk3p
	KF0UMsNg3x1BINROzWdRX9hHK1c8+lFit+ALRuRbCv7h8Ozq0ItAxzqFA5bGp5Y+LPLcpeNvxd/7l
	dxQtebkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugPlP-0000000EoEN-1x44;
	Mon, 28 Jul 2025 15:27:43 +0000
Received: from smtp.forwardemail.net ([121.127.44.73])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugPiv-0000000Engp-3HzF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Jul 2025 15:25:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1753716308;
 bh=jd6WXK9KVAKuAai0Rlvgq64nX1IBqeA40jOYWtgY/NM=;
 b=Ht7kIXTrzAxJ2XqdF69wQwLZgJrBtlTk7yG8eIu3q5XwBmRbFwIkNNsjuqdiXpzFRALbsl06r
 4yLLtXEzlevfBCzVIjm09v8JB2deuQQuvdqlT+mebKsMxWfJwPybzFY+jBa/1n2K3hGX7NjG9X8
 IiLjZbwEn2uZv/FldnlrIC6KrMeK/cdc+V166IM9kkzV5RbOc/tcyce4x/qNYKPzF0Ft9US4McL
 kN+1crFXN8NtCQe+6v6bkF6TlbWP6ae9aYd8Y/FYEt4tTiayST8h5W+TA4rDcczjyntmr3iZ9x7
 sQd3YVgZ3VJbqCX9hL6NJhVdwjV+AxLxxECrWhHU0soQ==
X-Forward-Email-ID: 68879630351ec66b15a1c462
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 1.1.8
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <1c639c62-cc07-4b3d-a18b-77f93668b88f@kwiboo.se>
Date: Mon, 28 Jul 2025 17:24:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 2/3] net: dsa: realtek: Add support for use of an
 optional mdio node
To: Andrew Lunn <andrew@lunn.ch>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 =?UTF-8?Q?Alvin_=C5=A0ipraga?= <alsi@bang-olufsen.dk>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Yao Zi <ziyao@disroot.org>, Chukun Pan <amadeus@jmu.edu.cn>,
 Heiko Stuebner <heiko@sntech.de>, netdev@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250727180305.381483-1-jonas@kwiboo.se>
 <20250727180305.381483-3-jonas@kwiboo.se>
 <2504b605-24e7-4573-bec0-78f55688a482@lunn.ch>
 <badef015-22ff-4232-a4d0-80d2034113ca@kwiboo.se>
 <9702f3da-f755-4392-bf2b-28814ee0a8c7@lunn.ch>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <9702f3da-f755-4392-bf2b-28814ee0a8c7@lunn.ch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_082509_906534_24B9A548 
X-CRM114-Status: GOOD (  21.04  )
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

Hi Andrew,

On 7/28/2025 12:09 AM, Andrew Lunn wrote:
>> Something like above does not seem to work, I get following:
>>
>>   mdio_bus stmmac-0: MDIO device at address 0 is missing.
>>   mdio_bus stmmac-0: MDIO device at address 1 is missing.
>>   mdio_bus stmmac-0: MDIO device at address 2 is missing.
>>   mdio_bus stmmac-0: MDIO device at address 3 is missing.
> 
> O.K, So i was wrong.
> 
>> And without an explicit 'mdio' child node the driver currently fails to
>> load and the switch is never registered:
>>
>>   rtl8365mb-mdio stmmac-0:1d: found an RTL8367RB-VB switch
>>   rtl8365mb-mdio stmmac-0:1d: no MDIO bus node
>>   rtl8365mb-mdio stmmac-0:1d: could not set up MDIO bus
>>   rtl8365mb-mdio stmmac-0:1d: error -ENODEV: unable to register switch
> 
> So, not having an MDIO node was a long time ago seen as a short cut
> for when there was a clear 1:1 mapping between port number and PHY bus
> address. It still works, but it is somewhat deprecated. It also seems
> like it is become more normal to need additional properties, like what
> interrupt the PHY is using, the LEDs it has, etc.

Sure, no problem to change to a more verbose DT even when there is a
clear 1:1 mapping between port, phy and interrupt here.

When it comes to having the switch being described as an interrupt
controller in the DT is also very wrong, the switch only consume a
single HW interrupt. The fact that the driver creates virtual irq for
each port is purely a software construct and is not something that
should be reflected in the DT.

Possible something for a future series to clean up.

> 
>>
>> With a 'mdio' child node 'make CHECK_DTBS=y' report something like:
>>
>>   rockchip/rk3528-radxa-e24c.dtb: ethernet-switch@1d (realtek,rtl8365mb): mdio: False schema does not allow { [snip] }
>>         from schema $id: http://devicetree.org/schemas/net/dsa/realtek.yaml#
>>
>> So something should probably be changed, the driver, dt-bindings or
>> possible both.
> 
> I think you should allow an MDIO node in DT. This is the only DSA
> driver that i know of which does not allow it.

Sure, I will drop this driver change and instead update the dt-binding
to allow use of a mdio node when the reg prop is defined.

Regards,
Jonas

> 
> 	Andrew



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82D31C83F26
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jul 2025 17:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yaCB5+6pv7RrcGxi0FU4X29YAIYEhab8mZkiMc3pGGo=; b=U7wBjXQc4ZyjK4ycWVKhaO60XQ
	AxVoy4gJISbKryOwHSYiJbwuFmQe6UEwjREQHfjHsJ7C+j5N4ZG2pSHXQRjBIciK7qvCJ5lkk72Zr
	WRUq54lK6wiRH3qT7yqn+PhkVWM1fLU4Guq5XAXd34rcCU362zt1mZO4YEqEhFet+QqaLtGYRa3U5
	ITQltO96RqTmjYLgIHx/I0XKzQr2Bo6nunMTcl+pu8WglIz2/EAl0U7rkL4uAaXIEeec+TsH8lg4V
	9eTsltHjL6uGGzDd6PcwhvL+NGaqdAys853NQg1+s73eFLvbFTb+xjn4+d2dUDWzZKzGhYPA47SCE
	v2wHBF5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugRSt-0000000F5Kj-1e1s;
	Mon, 28 Jul 2025 17:16:43 +0000
Received: from smtp.forwardemail.net ([121.127.44.73])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugQVW-0000000EwuQ-3TTY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Jul 2025 16:15:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1753719321;
 bh=yaCB5+6pv7RrcGxi0FU4X29YAIYEhab8mZkiMc3pGGo=;
 b=AeJ8famUKTS9+jjDD083tr8mImacSEVhvenCzuHluAR6YliMBcDmhBhSo+13LTk6JKUn8BQ5Q
 KPFpajS93GD3MTIockesXapOB2O/d7B+62w8zd8Klg8jwrkeI27DsM4gHgV4BhLqvsrzykUilqR
 sa9iwMoN9adR9i/QtD0UIF7//4rraXir+/q5y7PSeD+WLiec85GPG2oR6oKhCfprAOjO/9h7sTH
 esmsQQzW8v7oKWV+0bqV4iiwKyF8CHzDOA3Su0TZoAmQLOFfWiaOUDNThFw0rKNr59lnQV8g28+
 KN1gOgaZ3H5Nexysn092wwErTzUhmEW3DOaBebsn5IDQ==
X-Forward-Email-ID: 6887a1f2351ec66b15a23517
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 1.1.8
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <030aff6c-531b-4be3-9176-83fcff21d539@kwiboo.se>
Date: Mon, 28 Jul 2025 18:14:37 +0200
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
 <1c639c62-cc07-4b3d-a18b-77f93668b88f@kwiboo.se>
 <2f942223-8683-4808-8f7a-4f46e18f402d@lunn.ch>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <2f942223-8683-4808-8f7a-4f46e18f402d@lunn.ch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_091523_198596_7E9D6AB1 
X-CRM114-Status: GOOD (  15.44  )
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

On 7/28/2025 5:40 PM, Andrew Lunn wrote:
>> When it comes to having the switch being described as an interrupt
>> controller in the DT is also very wrong, the switch only consume a
>> single HW interrupt. The fact that the driver creates virtual irq for
>> each port is purely a software construct and is not something that
>> should be reflected in the DT.
> 
> I think that is not always clear cut. Switches can be considered SoC
> of their own. They have multiple hardware blocks, which can be
> described independent, just like a traditional SoC and its .dtsi
> file. The switch blocks can then be connected together in the same way
> SoCs are.

I guess you are correct, thanks for clarifying this :-)

> I've not looked at this particular switch driver, but the Marvell
> switches have a similar single interrupt output pin connected to the
> host SoC. Within the switch, there are at least two cascaded interrupt
> controllers. We implement standard Linux interrupt controllers for
> these. That allows us to use standard DT properties to link the
> internal PHY interrupts to these interrupt controllers.

Makes sense, I will describe the phy interrupts of the switch in a v2.

Regards,
Jonas

> 
> 	 Andrew



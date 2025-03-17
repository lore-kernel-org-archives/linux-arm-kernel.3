Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80900C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 19:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x7uD5anQxB6XbAyXnokdg7fGkN/BWmwgVtIghm68D1E=; b=Jfq4gm+0eB87yrVAyW/f66PJ0C
	pOxWo+Or+5k5UJnv4mb1NmJCOf7/GMTEJC+EIBbpb1fG+s3FQFMQIOjkARQGIlbQ/HRLlL5S5Gkhp
	WG7yO5VjT6DLD3V/y4s9QjDjo7bDsDVn+TOXO9TF/ZXcle9Cba4Kd2ToYxV2y3fNWB4IfMm97MgK+
	d7nEWqmXspo9fAnWjrlfAmv+Z6+QpTrogGm3blmwLq3oyybpSTe01HRnrehG3BW2x4Cp6bh430oCU
	mGYc4lbjIbGH/JxddESg1Ue1X3eDPtzghLVSDe1A5VZANG5XRvc1jc4lwYDXfu9Zn5DdI3/qIicnL
	QfhB6QCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuGVv-00000003rWB-3T26;
	Mon, 17 Mar 2025 19:52:43 +0000
Received: from smtp.forwardemail.net ([149.28.215.223])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuGUE-00000003rH2-31XE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Mar 2025 19:51:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1742241056;
 bh=x7uD5anQxB6XbAyXnokdg7fGkN/BWmwgVtIghm68D1E=;
 b=w21pZnkj/QKL1gNyW5j8lH6RQFOubEh+tQ2+1NYkUH7zJjtqxIqfxB1xRaELIHkuCeNfQuyyd
 XoVqP36WEWLKJ0/mnFSCK6n6n5W2KgQT8yuIhBZZtrvmetAm8MMwRVq8KnPp9ZY7kZsERp0wud0
 4r16w1ePFpsLtODqwZ3GaOb2GmDIFASmuXQo0KhRg07V4EFY3asru23CzjHw98r2uREJQv/u3pM
 svNrmn5lVln11j4hjxBb3x7EyPLaHtqQPEAbQGxps8Wb3YiWWFYVnEMQ2KYrZUR3gGiis057Q+K
 bw19+8SJoOb2nhOdWw00mXIdaA3ddaTGD83b7iIfb3PA==
X-Forward-Email-ID: 67d87d10eee8cc91c8429fed
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 0.4.40
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <db3bf1cb-3385-4676-8ba4-41fea0212bf2@kwiboo.se>
Date: Mon, 17 Mar 2025 20:50:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] net: stmmac: dwmac-rk: Add GMAC support for RK3528
To: Simon Horman <horms@kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, David Wu <david.wu@rock-chips.com>,
 Yao Zi <ziyao@disroot.org>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250309232622.1498084-1-jonas@kwiboo.se>
 <20250317194309.GL688833@kernel.org>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20250317194309.GL688833@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_125058_790547_BB00C708 
X-CRM114-Status: GOOD (  20.55  )
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

Hi Simon,

On 2025-03-17 20:43, Simon Horman wrote:
> On Sun, Mar 09, 2025 at 11:26:10PM +0000, Jonas Karlman wrote:
>> The Rockchip RK3528 has two Ethernet controllers, one 100/10 MAC to be
>> used with the integrated PHY and a second 1000/100/10 MAC to be used
>> with an external Ethernet PHY.
>>
>> This series add initial support for the Ethernet controllers found in
>> RK3528 and initial support to power up/down the integrated PHY.
>>
>> This series depends on v2 of the "net: stmmac: dwmac-rk: Validate GRF
>> and peripheral GRF during probe" [1] cleanup series.
>>
>>
>> Changes in v2:
>> - Restrict the minItems: 4 change to rockchip,rk3528-gmac
>> - Add initial support to power up/down the integrated PHY in RK3528
>> - Split device tree changes into a separate series
>>
>> [1] https://lore.kernel.org/r/20250308213720.2517944-1-jonas@kwiboo.se/
> 
> Hi Jonas,
> 
> This patchset looks reasonable to me. However it will need
> to be reposted once it's dependencies ([1]) are present in net-next.

The dependent series ([1]) has already been merged into net-next [2].

Do I still need to repost this series?

[2] https://lore.kernel.org/r/174186063226.1446759.12026198009173732573.git-patchwork-notify@kernel.org/

> 
> And on the topic of process:
> 
> * As this is a patch-set for net-next it would be best to
>   target it accordingly:
> 
>   Subject: [PATCH net-next] ...
> 
> * Please post patches for net/net-next which have dependencies as RFCs.
> 
> For more information on Netdev processes please take a look at
> https://docs.kernel.org/process/maintainer-netdev.html
> 

Thanks, I see, netdev seem to use a slight different process than what
I am familiar with compared to other Linux subsystems and U-Boot :-)

Regards,
Jonas



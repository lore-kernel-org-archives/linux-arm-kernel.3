Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A66FC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 23:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hK36UdkUAC80MW7rI32wQbKkvzzOhAooKnorAx3Xf5w=; b=yd+vIwtpcFY1kPG3o6s8G3Y68o
	wCmqcmmI3qb88rhth0H7HtJmcCpclrEsJEvd69qHhqlEZiklb7KBDsmDU2CQ8nK+yXIKB9K+0hFWI
	1V5oGBMXlUr+NxAj15ZUuS1ll06W1yZ0LJ8bxHqCbdxb3EdZS0OEAqy7sYTurZ+FqwtvmSHNq+Rcu
	YvviP01GpINEgOP2QvxLiObHqkJZJwg7xJ9mA8i9WTWw0bTARe/EB+D7HbN0DsvKdvjpItidG+uj7
	mhMAQWRvc9XGrUsDxHwI1et49CaS/0YuSJeavXTzLd0CMfVbXj3VMUb98GVcM6VZnRlsTHc3B7Ozo
	zrThUweQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqKvF-0000000CWgz-0z3E;
	Thu, 06 Mar 2025 23:46:37 +0000
Received: from smtp.forwardemail.net ([121.127.44.59])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqKrI-0000000CWCM-1CZS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 23:42:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1741304551;
 bh=hK36UdkUAC80MW7rI32wQbKkvzzOhAooKnorAx3Xf5w=;
 b=Lt15fiwjBjswc91p0Fjtw1IGvdbEqhjOtx6n9uWNFpc/4P6ZR1ZAhi2XQgVrJP6v2yAlUDN0V
 ehDuEXRHWpm97lu8IKMbdbUaE1ayvqEft2HAlQKI2GItfprmB4cPjYgRTXZ72xC9iRlhDx+8Iad
 4nTEs8HWW0UQnJEzF7atdyChHxlRtyxaT5lq8yZXGTUshBcW1AI+AyAWvK5tlSIOQBDbBEkWDoC
 BbJGoJEJKlZBBbRJM4LtciZUSCG0HN9xG4Lrp9X4kPB5QOuMbvSUKC7v1R40emGftzmYqm7dUwL
 gPTTNxkqeKO7PTagK/vRFoAzWiaiROh/NREXn8QqvBgA==
X-Forward-Email-ID: 67ca32e3c1763851c065d3ce
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.59
X-Forward-Email-Version: 0.4.40
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <3f341b96-1add-4eeb-b185-b4bfe0bf0250@kwiboo.se>
Date: Fri, 7 Mar 2025 00:42:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: net: rockchip-dwmac: Require
 rockchip,grf and rockchip,php-grf
To: Andrew Lunn <andrew@lunn.ch>
Cc: Heiko Stuebner <heiko@sntech.de>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, David Wu <david.wu@rock-chips.com>,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250306210950.1686713-1-jonas@kwiboo.se>
 <20250306210950.1686713-2-jonas@kwiboo.se>
 <5d69f4a2-511a-4e7e-bafe-5ce6171cb1d5@lunn.ch>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <5d69f4a2-511a-4e7e-bafe-5ce6171cb1d5@lunn.ch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_154232_429649_D0F89EC7 
X-CRM114-Status: GOOD (  14.41  )
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

On 2025-03-06 23:32, Andrew Lunn wrote:
> On Thu, Mar 06, 2025 at 09:09:45PM +0000, Jonas Karlman wrote:
>> All Rockchip GMAC variants require writing to GRF to configure e.g.
>> interface mode and MAC rx/tx delay.
>>
>> Change binding to require rockchip,grf and rockchip,php-grf to reflect
>> that GRF (and PHP-GRF for RK3576/RK3588) control part of GMAC.
> 
> It is pretty unusual to change the binding such that something
> optional becomes mandatory. I would expect a bit more of a comment
> explaining why this does not cause backwards compatibility
> issues. Have all the .dtsi files always had these properties?

rockchip,grf was listed under required properties prior to the commit
b331b8ef86f0 ("dt-bindings: net: convert rockchip-dwmac to json-schema"),
maybe this was just lost during the conversion to yaml schema.

The DT's I have managed to check all seem to have the rockchip,grf prop
and the old .txt schema listed "phandle to the syscon grf used to
control speed and mode".

Without the rockchip,grf the driver just logged an error and ignored
trying to configure speed or mode.

We could possible leave it as optional, but when it is missing speed and
mode cannot be configured by the driver. Today this just result in an
error message, after this series there will instead be a probe error.

Regards,
Jonas

> 
>     Andrew
> 
> ---
> pw-bot: cr



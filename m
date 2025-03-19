Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05C39C35FFA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 23:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v2ctdz7uayF07UCPNi//R/x3v+JmE0rED8OH/LNmzM8=; b=ZaL550ZBtlgPfv3kf7vot+gwR/
	cfr+YY10TpC/tRGwFP8EDg9oxJa/igVFv49tNtp9LzsIKqWAfkcdUXWN8C+pYUomyAynMIg7fgozy
	8SsUn/yhhY73UzKgKiYF7QxtkCk9wm5Ln+lkDjtkiLg89jSw42OTCJpx//zMOpYiRd8qK+QOxHCwh
	LlbYHtqQk0W2+jPtrQEtZiaGUG1usX0KKCNQ8z5tzWwckCJ3ZQmsFYAjZ5JcoR5PisrlT2GOyVMG8
	iBYlMGpp3oL/GOcK6QTAWhLhRia8RBX4EqW0rIqbNKhpyLOMLlGFgY/YWI+qzcQqIqE43XQ8tq7ma
	Tswz6gxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tv3F4-0000000AZSs-2weB;
	Wed, 19 Mar 2025 23:54:34 +0000
Received: from smtp.forwardemail.net ([121.127.44.73])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tv3DM-0000000AYuI-0FME
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Mar 2025 23:52:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1742428366;
 bh=v2ctdz7uayF07UCPNi//R/x3v+JmE0rED8OH/LNmzM8=;
 b=o+ujyX3ZkBJjZrwxuK2D3/jnytXNKlSfKPQkKP6535IT4WPtLyKUbFsbiHcRppWlqii2O5k0u
 XPQDbkaX5gUH4BpCyfJ0Ov9nVYA42cKeXKPL0VYaTWoKdxy26Dv0vK8EIsKMUsXdhf4U7lhS2CZ
 2C2yohko+t9ao9Y+iv3L4LCD17mwOdN1q5h+nt/hko6HpTd85iy/+jswZvSV2+uZHRrOErpnS2E
 M7nCvaSPT5dBUDyJY4BIizv4sDZM7iEgM00N5lWJsSzijjP//jvX1SDYKR436Si68ycVNZvQv1K
 RoQFgbYfKQ7gBQhcIg7v1UAFzGes6GIy351X3/58jhbg==
X-Forward-Email-ID: 67db58c827ee59b783a8734c
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 0.4.40
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <eabc0fb8-10cc-465c-9434-b0804418dcb6@kwiboo.se>
Date: Thu, 20 Mar 2025 00:52:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 5/5] net: stmmac: dwmac-rk: Add initial
 support for RK3528 integrated PHY
To: Andrew Lunn <andrew@lunn.ch>
Cc: Heiko Stuebner <heiko@sntech.de>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, David Wu <david.wu@rock-chips.com>,
 Yao Zi <ziyao@disroot.org>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20250319214415.3086027-1-jonas@kwiboo.se>
 <20250319214415.3086027-6-jonas@kwiboo.se>
 <d53a2119-2650-4a87-af94-1b9c2297cf72@lunn.ch>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <d53a2119-2650-4a87-af94-1b9c2297cf72@lunn.ch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_165248_194092_873CDAD0 
X-CRM114-Status: GOOD (  13.17  )
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

On 2025-03-20 00:27, Andrew Lunn wrote:
> On Wed, Mar 19, 2025 at 09:44:09PM +0000, Jonas Karlman wrote:
>> Rockchip RK3528 (and RV1106) has a different integrated PHY compared to
>> the integrated PHY on RK3228/RK3328.
> 
> What ID does this PHY have? Is it just the reset which is different,
> or is it actually a different PHY, and the rockchip PHY driver needs
> additions?

Sorry, look like I missed to include the phy-id reported in this patch
and only included that detail in the related device tree patch [1].

This PHY seem to be different compared to the PHY used in older SoCs.

The PHY identified on addr 0x2 as 0044.1400 and in vendor kernel this
relate to the Rockchip RK630 PHY [2].

  #define RK630_PHY_ID				0x00441400

  /*
   * Fixed address:
   * Addr: 1 --- RK630@S40
   *       2 --- RV1106@T22
   */
  #define PHY_ADDR_S40				1
  #define PHY_ADDR_T22				2

[1] https://lore.kernel.org/all/20250310001254.1516138-2-jonas@kwiboo.se/
[2] https://github.com/armbian/linux-rockchip/blob/rk-6.1-rkr5/drivers/net/phy/rk630phy.c

Regards,
Jonas

> 
> 	Andrew



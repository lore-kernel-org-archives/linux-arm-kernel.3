Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAEBCC3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 23:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q/4hTUTysjyHMdWQYAFUoh8JWnAIFyUM8sIjXoykTqA=; b=Pt5CgTdnXlyYOoz8DzyebrnSSC
	R4Gzdskn2BVuYb8sRW1zaxyzsx4XtCrahRr1iDKiKBYRUFs0KNiOsCx8O7uzIjMc+V9fNoCewqKXT
	0RuDTVv0tlwYzkybhI+0ZXuCBuLeSnweMmBz+B+6RvxF3s3PyAqKQ0Kd/kKl4X9Y+SYWq2IS90txp
	DXH9wcZrl/t0K0ODGZktDQjdpPqXwjMdCm6lOcmn+zaGJI2BFbUg6S91rPopww845wva2dXDBRtYK
	eQjHvR1xzBi9pyAxqEoV2Fl1qr85fkHNq9tOZFVZUs3Pbq4S17lsIrhM5JppVwiInA0T45yFHU4ly
	PX2xbttQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDWiw-00000005775-3Rdt;
	Fri, 09 May 2025 23:01:47 +0000
Received: from smtp.forwardemail.net ([149.28.215.223])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDVbx-000000050Uw-0UnH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 21:50:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1746827427;
 bh=Q/4hTUTysjyHMdWQYAFUoh8JWnAIFyUM8sIjXoykTqA=;
 b=ezGd+8745Z54pj62MI/5RhoGOro6ubeTyIBI630OZ3HAAs2bt55GRtnJg70Fb6/eqJC+c1hVF
 4MfbgdlY36ZMO0eRnNnhdv4YAXJNECYa79qFDZGKF9rW7RE2hQwHOXqMndDeYo5C72PQaGzLvol
 YjX/sZa70aqoSf8hGkJpcRoUW00fYdCxoSagBNWPkPtArc0rgznzF1iZZKJbb7OoxAUP9vUYjNO
 AJMSptOWV3njUphVpeNw9xzeFuZLkRljeaTX1/U0qG8tRuFp1CqKdM25Sb8EPtUToE7MYar5T9y
 9cmhIxJdO9SPw42RBEcpwgNiScpsJAME3oEKQhtbDgrA==
X-Forward-Email-ID: 681e789856028bab66256880
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 1.0.2
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <36fb3b11-9a1d-4849-9333-5ef26a217106@kwiboo.se>
Date: Fri, 9 May 2025 23:50:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] rockchip: Enable Ethernet controller on Radxa E20C
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yao Zi <ziyao@disroot.org>,
 Chukun Pan <amadeus@jmu.edu.cn>, linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250509202402.260038-1-jonas@kwiboo.se>
 <2728051.BddDVKsqQX@diego>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <2728051.BddDVKsqQX@diego>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_145029_472761_58A0C5B4 
X-CRM114-Status: GOOD (  16.68  )
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

Hi Heiko,

On 2025-05-09 23:40, Heiko Stübner wrote:
> Am Freitag, 9. Mai 2025, 22:23:56 Mitteleuropäische Sommerzeit schrieb Jonas Karlman:
>> The Rockchip RK3528 has two Ethernet controllers, one 100/10 MAC to be
>> used with the integrated PHY and a second 1000/100/10 MAC to be used
>> with an external Ethernet PHY.
>>
>> This series add device tree nodes for the Ethernet controllers found in
>> RK3528 and enable the LAN interface on Radxa E20C.
>>
>> This include a gmac0 node for the 100/10 MAC and its related integrated
>> PHY node that only have recived limited testing. I have no board that
>> expose an Ethernet port for the gmac0 and the integrated PHY. However,
>> the PHY can be identified on addr 0x2 as 0044.1400 and in vendor kernel
>> this relate to the Rockchip RK630 PHY. A proper PHY driver will be
>> needed to support any real use of gmac0.
>>
>> Changes in v3:
>> - Rebase on top of latest mmind/for-next
>>
>> Changes in v2:
>> - Split from the "Add GMAC support for RK3528" driver series [1]
> 
> split from ... was that series merged already?

Yes, sorry for not being more clear, the dt-bindings and driver has been
merged and is already included in v6.15-rc1.

https://lore.kernel.org/r/174291544076.609648.8594782943472190694.git-patchwork-notify@kernel.org

Regards,
Jonas

> 
> The linked lore-thread only talks about the series needing to be reposted.
> 
> 
> Heiko
> 
>> - Add ethernet-phy@2 for the integrated PHY
>> - Rebase on top of the "Support I2C controllers in RK3528" series [2]
>>
>> [1] https://lore.kernel.org/r/20250309232622.1498084-1-jonas@kwiboo.se
>> [2] https://lore.kernel.org/r/20250309070603.35254-1-ziyao@disroot.org
>>
>> Jonas Karlman (2):
>>   arm64: dts: rockchip: Add GMAC nodes for RK3528
>>   arm64: dts: rockchip: Enable Ethernet controller on Radxa E20C
>>
>>  .../boot/dts/rockchip/rk3528-radxa-e20c.dts   |  30 +++++
>>  arch/arm64/boot/dts/rockchip/rk3528.dtsi      | 105 ++++++++++++++++++
>>  2 files changed, 135 insertions(+)




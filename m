Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C0E3C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 22:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0HCYfVxow/nYeBfs/TuiH44ZuKNSPm8doYeM7l980w8=; b=p/LYgg3XVEnB5HH/kHIXSuSsu7
	rK5mNXlx1wDJdyLVgGgHXQmd2OvQoNpRGl/IFbmT3GSBTUl7fb46nyKvXPt86IJc3UuYpmGXmMEud
	7ISL+uF4xR+dpRt+dRLAFRePmq5t0gdDhPLcG8PQimTKa3SyZ2xSHRDfLSBnEBGQgc++lH8KNqONh
	uj7KgmGcugUHMCfOPmBDz/kkxlCal4EqTiBrca8xVIErlpFVMNI/+2sYP5lInZqFGzw1r2TJz0eIM
	p8v1JqbxQ8hBb1nU2vn0E6SpGYyMbkMi+752KrHPckEKut8dfPs2fyZnhqKVaQW50t2dBVKJzxeOq
	C8XH0CHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqJPo-0000000CKgK-1hE2;
	Thu, 06 Mar 2025 22:10:04 +0000
Received: from smtp.forwardemail.net ([121.127.44.73])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqJNO-0000000CKNg-2cGy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 22:07:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1741298852;
 bh=0HCYfVxow/nYeBfs/TuiH44ZuKNSPm8doYeM7l980w8=;
 b=sp9YrLg2EM0PwLVK2AlT4Ifh4Yj6OYK+cUZlI8g5XlO2xZob1AIWY+9mBz6/qxYu0Y/ncuk7e
 ep2HnscwpIg5cMnM434OldoT1y/Rqu92zs0GUcFoUOqByBjx/hcKnourlanznsezI/Mw+NYSTKr
 hCtvZaj+ljYi/XPUOUzneawMhaTWSUKD8gs709G335h6RooKfXGk9h1/nDo97rPJGvxoYZRSh2T
 QaX1l6kozcdXupZ1LAmWWDAMU+Fa8s2tv5NudL8coeawuPja2AFVPukRGFPGG+gSgFaEZQ9r40p
 b2nGkkOenv9+1q0vZz35vnJMXEFmoywExs/gSnfnAdXw==
X-Forward-Email-ID: 67ca1ca0c1763851c065bef2
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 0.4.40
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <3ab13afd-0a9f-485e-bdf2-7b413d418065@kwiboo.se>
Date: Thu, 6 Mar 2025 23:07:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] Use DELAY_ENABLE macro for RK3328, RK3566/RK3568 and
 RK3588
To: Dragan Simic <dsimic@manjaro.org>
Cc: Heiko Stuebner <heiko@sntech.de>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250306203858.1677595-1-jonas@kwiboo.se>
 <41bb2c8d963e890768bceb477488250e@manjaro.org>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <41bb2c8d963e890768bceb477488250e@manjaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_140734_748088_FA9F31C6 
X-CRM114-Status: GOOD (  18.64  )
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

Hi Dragan,

On 2025-03-06 22:41, Dragan Simic wrote:
> Hello Jonas,
> 
> On 2025-03-06 21:38, Jonas Karlman wrote:
>> Almost all Rockchip GMAC variants use the DELAY_ENABLE macro to help
>> enable or disable use of MAC rx/tx delay. However, RK3328, 
>> RK3566/RK3568
>> and RK3588 GMAC driver does not.
>>
>> Use of the DELAY_ENABLE macro help ensure the MAC rx/tx delay is
>> disabled, instead of being enabled and using a zero delay, when
>> RGMII_ID/RXID/TXID is used.
>>
>> RK3328 driver was merged around the same time as when DELAY_ENABLE was
>> introduced so it is understandable why it was missed. Both 
>> RK3566/RK3568
>> and RK3588 support were introduced much later yet they also missed 
>> using
>> the DELAY_ENABLE macro (so did vendor kernel at that time).
>>
>> This series fixes all these cases to unify how GMAC delay feature is
>> enabled or disabled across the different GMAC variants.
>>
>> Jonas Karlman (3):
>>   net: stmmac: dwmac-rk: Use DELAY_ENABLE macro for RK3328
>>   net: stmmac: dwmac-rk: Use DELAY_ENABLE macro for RK3566/RK3568
>>   net: stmmac: dwmac-rk: Use DELAY_ENABLE macro for RK3588
>>
>>  .../net/ethernet/stmicro/stmmac/dwmac-rk.c    | 19 ++++++++++---------
>>  1 file changed, 10 insertions(+), 9 deletions(-)
> 
> As far as I can tell, the RV1126 GMAC should also be converted to use
> the DELAY_ENABLE macro, which the vendor kernel already does. [*]  
> Perhaps
> that could be performed in new patch 4/4 in this series?

Good catch, the RV1126 seem to use a slight different M0/M1 variant and
unfortunately I do not have access to any RV1126 board to do any runtime
testing. For RK3328, RK356x and RK3588 I could at least do runtime
testing.

I can add an untested patch for RV1126 in a v2 if needed :-)

> 
> BTW, it would be quite neat to introduce the DELAY_VALUE macro, which
> makes the function calls a bit more compact. [*]

Personally, I do not see a real need for the DELAY_VALUE macro, current
use of the soc_GMAC_CLK_yX_DL_CFG() macro is readable enough.

The ENABLE_DELAY at least helps remove an otherwise more complex enable
or disable conditional handling.

Regards,
Jonas

> 
> [*] 
> https://raw.githubusercontent.com/rockchip-linux/kernel/refs/heads/develop-5.10/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c



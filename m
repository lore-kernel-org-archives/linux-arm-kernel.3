Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A5E7C28B23
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 16:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aCrPvOluCec+vwfJ2dRCW1m+hFa1hc7eEdH3qmC/0uk=; b=pmXZKfV8tVxaWa6KUKPux/mU+1
	l0wkKjeYfXRKVu+9ZGHW+ADtqsMu6iOLIhUv0TbpiKkfDPefAHbpjOtS/40qtbCKKF+2OMQls27Qf
	FYxSC4+tk0/48BWthJ+g9sFNLCM1mFIEziw2vp85V5ffagGYoNhUFCJwbiKr3OejdGJWYQKPjQu2M
	wiL3te6Q+eLaXKLlqV7KmbHogCp0QvuRRCgJtNWa/3gTZJF3287/6NxphTrO806h5gGKjiF0F1kbC
	ol2C+N4Jt4cvNklVpEPO0rv1Yprf6SNPLRqqFA1n2fXKAyq6MJMaf332lpj9VElu9lRRTV9d9r3Xk
	6T92zzuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqaCg-0000000Eody-3fv5;
	Fri, 07 Mar 2025 16:05:38 +0000
Received: from smtp.forwardemail.net ([149.28.215.223])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqa9T-0000000Eo4X-2cxx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 16:02:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1741363338;
 bh=aCrPvOluCec+vwfJ2dRCW1m+hFa1hc7eEdH3qmC/0uk=;
 b=nz3s4TS/YyiLlyFw7HTOI6xOUNvRxLTEEf2XiihY3MnekLHkGhLWoJBi81Cx2fWkB5mPFsomg
 kEzkBPaxhU3kKxQypxcI+s6Rgtfy1MFGWJ7kIlKzmhwNAk24optMF7wF5jCvvzx+fuCU5kMgVmI
 AA4QC5Y+TfQpwNbtRdQMm9GsvoOxInZL3UXEeGYDI5CKpKZAp/+s/sjbqVHAjr9FcQOzrYkQwn3
 t2LRwnUCccyKh8MERX4SoPEh5nMcgdRowctmuRgz0CJWLSgK72NjKkszEuT5/Kdo5zuhNJnkJuO
 IM5Rj2VzxMV+BzT6xZo/Po9a9WwZQoyqcK86TUh1KtOg==
X-Forward-Email-ID: 67cb18782ea74034f8b964f0
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 0.4.40
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <de2fb6c6-b053-4be9-8c44-2476c5eb26a6@kwiboo.se>
Date: Fri, 7 Mar 2025 17:01:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: net: rockchip-dwmac: Add compatible
 string for RK3528
To: Conor Dooley <conor@kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, David Wu <david.wu@rock-chips.com>,
 Yao Zi <ziyao@disroot.org>, linux-rockchip@lists.infradead.org,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250306221402.1704196-1-jonas@kwiboo.se>
 <20250306221402.1704196-2-jonas@kwiboo.se>
 <20250307-tipping-womanlike-a1ce2370d8d3@spud>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20250307-tipping-womanlike-a1ce2370d8d3@spud>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_080220_009614_38045E5C 
X-CRM114-Status: GOOD (  17.40  )
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

Hi Conor,

On 2025-03-07 16:42, Conor Dooley wrote:
> On Thu, Mar 06, 2025 at 10:13:54PM +0000, Jonas Karlman wrote:
>> Rockchip RK3528 has two Ethernet controllers based on Synopsys DWC
>> Ethernet QoS IP.
>>
>> Add compatible string for the RK3528 variant.
>>
>> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
>> ---
>> I was not able to restrict the minItems change to only apply to the new
>> compatible, please advise on how to properly restrict the minItems
>> change if needed.
> 
> What do you mean by that? As in, what did you try and did not work?
> Usually you do something like
> if:
>   not:
>     compatible:
>       contains:
>         rockchip,rk3528-gmac
> then:
>   properties:
>     clocks:
>       minItems: 5
> 

Thanks, this seem to work, will use in a v2.

I tried to do something opposite and instead set minItems: 4 when
compatible contains rockchip,rk3528-gmac:

if:
  compatible:
    contains:
      rockchip,rk3528-gmac
then:
  properties:
    clocks:
      minItems: 4

but that resulted in something like:

  rockchip/rk3528-radxa-e20c.dtb: ethernet@ffbe0000: clocks: [[7, 173], [7, 172], [7, 171], [7, 170]] is too short

Regards,
Jonas

>>
>> Also, because snps,dwmac-4.20a is already listed in snps,dwmac.yaml
>> adding the rockchip,rk3528-gmac compatible did not seem necessary.
>> ---
>>  Documentation/devicetree/bindings/net/rockchip-dwmac.yaml | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml b/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
>> index 05a5605f1b51..3c25b49bd78e 100644
>> --- a/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
>> +++ b/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
>> @@ -24,6 +24,7 @@ select:
>>            - rockchip,rk3366-gmac
>>            - rockchip,rk3368-gmac
>>            - rockchip,rk3399-gmac
>> +          - rockchip,rk3528-gmac
>>            - rockchip,rk3568-gmac
>>            - rockchip,rk3576-gmac
>>            - rockchip,rk3588-gmac
>> @@ -49,6 +50,7 @@ properties:
>>                - rockchip,rv1108-gmac
>>        - items:
>>            - enum:
>> +              - rockchip,rk3528-gmac
>>                - rockchip,rk3568-gmac
>>                - rockchip,rk3576-gmac
>>                - rockchip,rk3588-gmac
>> @@ -56,7 +58,7 @@ properties:
>>            - const: snps,dwmac-4.20a
>>  
>>    clocks:
>> -    minItems: 5
>> +    minItems: 4
>>      maxItems: 8
>>  
>>    clock-names:
>> -- 
>> 2.48.1
>>


